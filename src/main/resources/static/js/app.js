var app = angular.module("MyApp", []);
app.controller("LoginController", function ($scope, $http) {
    $scope.welcomeMessage = "Welcome back";
    $scope.LongMessage = "You have successfully integrated Angular with Java";
});

angular.module("Register", ['ui.bootstrap']).controller("UserController",
    function ($scope, $http) {
        const API_ROOT = '/user';
        $scope.userCreatedSuccess = false;
        $scope.displayError = false;
        $scope.errorMessage = "";
        $scope.userData = {
            'email': "",
            'password': "",
            'repeatPassword': "",
            "name": "",
            "dob": ""
        };

        $scope.addUser = function () {
            $scope.userCreatedSuccess = false;
            $scope.displayError = false;
            $scope.errorMessage = "";

            if ($scope.userData.password !== $scope.userData.repeatPassword) {
                $scope.displayError = true;
                $scope.errorMessage = "Passwords do not match.";
                return;
            }

            $http.post(`${API_ROOT}/register`, $scope.userData).then(function (response) {
                if (response.status == 200) {
                    $scope.userCreatedSuccess = true;
                } else {
                    $scope.displayError = true;
                    $scope.errorMessage = "Unable to create account right now.";
                }
            }).catch(function () {
                $scope.displayError = true;
                $scope.errorMessage = "Something went wrong. Please retry.";
            });
        };
    });

angular.module("Search", ['ui.bootstrap']).controller("BookController",
    function ($scope, $http) {
        const API_ROOT = '/api';
        $scope.books = "getBooks";
        $scope.rounds = 5;
        $scope.getBooks = "Browse library";
        $scope.count = "Inventory snapshot";
        $scope.addBook = "Add new titles";
        $scope.delBook = "Delete existing";
        $scope.borrowBook = "Book now";
        $scope.cancelBorrow = "Cancel booking";
        $scope.catalogueCount = 0;

        $scope.bookCart = [{
            'isbn': null,
            'title': null,
            'cover': null,
            'publisher': null,
            'pages': null,
            'available': null
        }];
        $scope.delCart = [];
        $scope.orderCart = {
            'bookingId': "",
            'isbn': "",
            'quantity': 1
        };
        $scope.cancelCart = null;
        $scope.statusMessage = "";
        $scope.addBookValidationMessage = "";

        $scope.search = function () {
            var choice = $scope.books;
            $scope.searchBook = false;
            $scope.addBookFlag = false;
            $scope.countFlag = false;
            $scope.delBookFlag = false;
            $scope.displayStandardMessage = false;
            $scope.displayError = false;
            $scope.borrowFlag = false;
            $scope.cancelBooking = false;
            $scope.displayBookingSucess = false;
            $scope.displayCancelSucess = false;
            $scope.statusMessage = "";

            if (choice === 'getBooks') {
                $scope.searchBook = true;
                $http.get(`${API_ROOT}/getBooks`).then(function (response) {
                    $scope.output = response.data;
                    pagination();
                });
            } else if (choice === 'addBook') {
                clear();
                $scope.addBookFlag = true;
            } else if (choice === 'delBook') {
                $scope.delBookFlag = true;
                searchBooks();
            } else if (choice === 'count') {
                $scope.countFlag = true;
                $http.get(`${API_ROOT}/count`).then(function (response) {
                    $scope.catalogueCount = response.data;
                });
            } else if (choice === 'borrowBook') {
                $scope.borrowFlag = true;
                loadBooks();
            } else if (choice === 'cancelBorrow') {
                $scope.cancelBooking = true;
                loadBookedThings();
            } else {
                $scope.searchBook = true;
                $http.get(`${API_ROOT}/${choice}`).then(function (response) {
                    $scope.output = response.data;
                });
            }
        }

        $scope.addRow = function () {
            const invalidRow = $scope.bookCart.some(invalidBook);
            if (invalidRow) {
                $scope.displayError = true;
                $scope.displayStandardMessage = false;
                $scope.statusMessage = "Fill ISBN (>=5 chars), Title (>=3 chars), Pages (>0) and Available (>=0) for every row before submitting.";
                $scope.addBookValidationMessage = $scope.statusMessage;
                return;
            }
            $http.post(`${API_ROOT}/addBook`, $scope.bookCart).then(function (response) {
                if (response.status == 202 || response.status == 200) {
                    $scope.addBookFlag = false;
                    $scope.displayError = false;
                    $scope.displayStandardMessage = true;
                    const msg = (response && response.data && response.data.message) ? response.data.message : "Books added successfully.";
                    $scope.statusMessage = msg;
                    clear();
                    $scope.addBookValidationMessage = "";
                    // refresh catalogue so the new entries are visible immediately
                    $scope.books = "getBooks";
                    $scope.search();
                } else {
                    $scope.displayError = true;
                    $scope.addBookValidationMessage = "Unable to save books. Please retry.";
                }
            }).catch(function (resp) {
                $scope.displayError = true;
                const msg = (resp && resp.data && resp.data.message)
                    ? resp.data.message
                    : "Validation failed: ensure ISBN (>=5 chars), title (>=3 chars), pages > 0, available >= 0.";
                $scope.statusMessage = msg;
                $scope.addBookValidationMessage = msg;
            });
        };

        $scope.bookCartValid = function () {
            return $scope.bookCart.every(function (b) { return !invalidBook(b); });
        };
        $scope.invalidBook = invalidBook;

        function paginationDel() {
            $scope.filteredTodosC = [];
            $scope.todos = [];
            $scope.currentPage = 1;
            $scope.numPerPage = 6;
            $scope.maxSize = 5;
            $scope.$watch('currentPage + numPerPage', function () {
                var begin = (($scope.currentPage - 1) * $scope.numPerPage);
                var end = begin + $scope.numPerPage;
                $scope.filteredTodosC = $scope.bookCache.slice(begin, end);
            });
        }

        function paginationBooking() {
            $scope.filteredTodosC = [];
            $scope.todos = [];
            $scope.currentPage = 1;
            $scope.numPerPage = 6;
            $scope.maxSize = 5;

            $scope.$watch('currentPage + numPerPage', function () {
                var begin = (($scope.currentPage - 1) * $scope.numPerPage);
                var end = begin + $scope.numPerPage;
                $scope.alreadyBooked = $scope.cancelCache.slice(begin, end);
            });
        }

        function loadBooks() {
            $http.get(`${API_ROOT}/getBooks`).then(function (response) {
                $scope.bookCache = response.data;
                paginationDel();
            });
        }

        function loadBookedThings() {
            $http.get(`${API_ROOT}/getBookingDetails`).then(function (response) {
                $scope.cancelCache = response.data;
                paginationBooking();
            });
        }

        function clear() {
            $scope.bookCart = [{
                'isbn': null,
                'title': null,
                'cover': null,
                'publisher': null,
                'pages': null,
                'available': null
            }];
        }

        function pagination() {
            $scope.filteredTodos = [];
            $scope.todos = [];
            $scope.currentPage = 1;
            $scope.numPerPage = 6;
            $scope.maxSize = 5;

            $scope.$watch('currentPage + numPerPage', function () {
                var begin = (($scope.currentPage - 1) * $scope.numPerPage);
                var end = begin + $scope.numPerPage;
                $scope.filteredTodos = $scope.output.slice(begin, end);
            });
        }

        function clearDelCart() {
            $scope.delCart = [];
        }

        function invalidBook(b) {
            if (!b) { return true; }
            const isbnOk = !!(b.isbn && String(b.isbn).trim().length);
            const titleOk = !!(b.title && String(b.title).trim().length);
            const pages = parseInt(b.pages, 10);
            const available = parseInt(b.available, 10);
            const pagesOk = Number.isFinite(pages) && pages > 0;
            const availableOk = Number.isFinite(available) && available >= 0;
            const isbnLenOk = isbnOk && String(b.isbn).trim().length >= 5;
            const titleLenOk = titleOk && String(b.title).trim().length >= 3;
            return !isbnLenOk || !titleLenOk || !pagesOk || !availableOk;
        }

        function searchBooks() {
            $http.get(`${API_ROOT}/getBooks`).then(function (response) {
                $scope.bookCache = response.data;
                paginationDel();
            });
        }

        $scope.addRows = function () {
            $scope.bookCart.push({
                'isbn': null,
                'title': null,
                'cover': null,
                'publisher': null,
                'pages': null,
                'available': null
            });
        };

        $scope.makeBooking = function (bcache) {
            $scope.orderCart.isbn = bcache.isbn;
            $scope.orderCart.quantity = 1;

            $http.post(`${API_ROOT}/makeBooking`, $scope.orderCart).then(function (response) {
                if (response.status == 200) {
                    $scope.displayError = false;
                    $scope.displayBookingSucess = true;
                    $scope.statusMessage = "Booked successfully!";
                    clear();
                } else {
                    $scope.displayError = true;
                }
            }).catch(function () {
                $scope.displayError = true;
                $scope.statusMessage = "Unable to complete booking.";
            });
        }

        $scope.cancelBookingM = function (bcache) {
            $scope.cancelCart = { bookingId: bcache.bookingId };

            $http.post(`${API_ROOT}/cancelBooking`, $scope.cancelCart).then(function (response) {
                if (response.status == 204) {
                    $scope.displayError = false;
                    $scope.displayCancelSucess = true;
                    $scope.statusMessage = "Booking cancelled.";
                    clear();
                    loadBookedThings();
                } else {
                    $scope.displayError = true;
                }
            }).catch(function () {
                $scope.displayError = true;
                $scope.statusMessage = "Could not cancel booking.";
            });
        }

        $scope.deleteRows = function () {
            angular.forEach($scope.filteredTodosC, function (sel) {
                if (sel.selected) {
                    $scope.delCart.push(sel);
                }
            });

            if ($scope.delCart.length === 0) {
                $scope.statusMessage = "Select at least one book to delete.";
                return;
            }

            $http.post(`${API_ROOT}/delBook/`, $scope.delCart).then(function (response) {
                if (response.status == 204) {
                    $scope.addBookFlag = false;
                    $scope.displayError = false;
                    $scope.displayStandardMessage = true;
                    $scope.statusMessage = "Removed selected books.";
                    clearDelCart();
                    searchBooks();
                } else {
                    $scope.displayError = true;
                }
            }).catch(function () {
                $scope.displayError = true;
                $scope.statusMessage = "Could not delete books.";
            });
        }

        $scope.removeRows = function () {
            if ($scope.bookCart.length > 1) {
                $scope.bookCart.pop();
            } else {
                clear();
            }
        };

    });
