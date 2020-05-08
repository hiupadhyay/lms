var app = angular.module("MyApp", []);
app.controller("LoginController", function($scope, $http) {

    $scope.welcomeMessage = "Hey buddy welcome...";
    $scope.LongMessage = "You have sucessfully integrated Angular with java";
    console.log("Processed Till here");
    $http.get('http://localhost:8080/api/getData').
    then(function(response) {
        $scope.result = response.data;
    });

});

var app = angular.module("Search", ['ui.bootstrap']).controller("SearchController",
    function($scope, $http) {
    // it's for default check box thing...
    $scope.books = "getBooks";
    $scope.rounds = 5;
    $scope.getBooks = "Search all Book Details";
    $scope.count = "No of Books";
    $scope.addBook = "Add New Book";
    $scope.delBook = "Delete Existing Book";
    $scope.borrowBook = "Booking";
    $scope.cancelBorrow = "Cancel Booking";
    $scope.bookCart = [{
        'isbn': '',
        'title': '',
        'cover': '',
        'publishser': '',
        'pages': '',
        'available': ''
    }];
    $scope.delCart = [];
    $scope.orderCart = {
        'booking_id': "",
        'isbn': "isbn",
        'booking_date': "",
        'quantity': "quantity"
    };
    $scope.cancelCart;
    $scope.search = function() {
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
        // Pagination Logic
        if (choice == 'getBooks') {
            $scope.searchBook = true;
            var url = 'http://localhost:8080/api/' + choice;
            $http.get(url).
            then(function(response) {
                $scope.output = response.data;
                pagination();
            });
        } else if (choice == 'addBook') {
            // clear before adding books....
            clear();
            $scope.addBookFlag = true;

        } else if (choice == 'delBook') {
            $scope.delBookFlag = true;
            searchBooks();

        } else if (choice == 'count') {
            $scope.countFlag = true;

        } else if (choice == 'borrowBook') {
            $scope.borrowFlag = true;
            loadBooks();

        } else if (choice == 'cancelBorrow') {
            $scope.cancelBooking = true;
            loadBookedThings();

        } else {
            $scope.searchBook = true;
            var url = 'http://localhost:8080/api/' + choice;
            $http.get(url).
            then(function(response) {
                $scope.output = response.data;
            });
        }
    }

    $scope.addRow = function() {
        console.log($scope.bookCart);
        $http.post("http://localhost:8080/api/addBook", $scope.bookCart).then(function(response) {
            if (response.status == "200") {
                $scope.addBookFlag = false;
                $scope.displayError = false;
                $scope.displayStandardMessage = true;
                clear();
            } else {
                $scope.displayError = true;
            }
        }).catch(function(response) {
            $scope.displayError = true;
        });
    };

    function paginationDel() {
        $scope.filteredTodosC = [];
        $scope.todos = [];
        $scope.currentPage = 1;
        $scope.numPerPage = 9;
        $scope.maxSize = 5;
        $scope.$watch('currentPage + numPerPage', function() {
            var begin = (($scope.currentPage - 1) * $scope.numPerPage);
            var end = begin + $scope.numPerPage;
            $scope.filteredTodosC = $scope.bookCache.slice(begin, end);
        });
    }

    function paginationBooking() {

        $scope.filteredTodosC = [];
        $scope.todos = [];
        $scope.currentPage = 1;
        $scope.numPerPage = 9;
        $scope.maxSize = 5;


        $scope.$watch('currentPage + numPerPage', function() {

            var begin = (($scope.currentPage - 1) * $scope.numPerPage);
            var end = begin + $scope.numPerPage;
            $scope.alreadyBooked = $scope.cancelCache.slice(begin, end);
        });


    }

    function loadBooks() {

        $http.get('http://localhost:8080/api/getBooks').
        then(function(response) {
            $scope.bookCache = response.data;
            paginationDel();
        });



    }

    function loadBookedThings() {

        $http.get('http://localhost:8080/api/getBookingDetails').
        then(function(response) {
            $scope.cancelCache = response.data;
            paginationBooking();
        });



    }

    function clear() {
        $scope.bookCart = [{
            'isbn': '',
            'title': '',
            'cover': '',
            'publishser': '',
            'pages': '',
            'available': ''
        }];

    }

    function pagination() {
        $scope.filteredTodos = [];
        $scope.todos = [];
        $scope.currentPage = 1;
        $scope.numPerPage = 9;
        $scope.maxSize = 5;


        $scope.$watch('currentPage + numPerPage', function() {
            var begin = (($scope.currentPage - 1) * $scope.numPerPage);
            var end = begin + $scope.numPerPage;
            $scope.filteredTodos = $scope.output.slice(begin, end);


        });


    }

    function clearDelCart() {
        $scope.delCart = [];

    }

    function searchBooks() {

        $http.get('http://localhost:8080/api/getBooks').
        then(function(response) {
            $scope.bookCache = response.data;
            paginationDel();
        });


    }
    $scope.addRows = function($event) {
        $scope.bookCart.push({});
    };

    $scope.makeBooking = function(bcache) {
        /*
         * Pick required fields from Booking to be inserted into Order table.
         * Booking_id
         */

        $scope.orderCart.isbn = bcache.isbn;
        $scope.orderCart.quantity = bcache.pages;
        $scope.orderCart.booking_date = new Date();

        //
        $http.post("http://localhost:8080/api/makeBooking", $scope.orderCart).then(function(response) {
            if (response.status == "200") {
                $scope.displayError = false;
                $scope.displayBookingSucess = true;
                clear();
            } else {
                $scope.displayError = true;
            }
        }).catch(function(response) {

            $scope.displayError = true;
        });

    }

    $scope.cancelBookingM = function(bcache) {
        /*
         * Pick required fields from Booking to be inserted into Order table.
         * Booking_id
         */

        $scope.cancelCart = bcache.booking_id;

        /*alert($scope.cancelCart.booking_id);*/
        //
        $http.post("http://localhost:8080/api/cancelBooking", $scope.cancelCart).then(function(response) {
            if (response.status == "200") {
                $scope.displayError = false;
                $scope.displayCancelSucess = true;
                clear();
                loadBookedThings();
            } else {
                $scope.displayError = true;
            }
        }).catch(function(response) {

            $scope.displayError = true;
        });

    }

    $scope.deleteRows = function(bcache) {

        angular.forEach($scope.filteredTodosC, function(sel) {
            if (sel.selected) {
                $scope.delCart.push(sel);
            }
        });

        // alert(JSON.stringify($scope.delCart));
        $http.post('http://localhost:8080/api/delBook/', $scope.delCart).
        then
            (function(response) {

                if (response.status == "200") {

                    $scope.addBookFlag = false;
                    $scope.displayError = false;
                    $scope.displayStandardMessage = true;
                    clearDelCart();
                    searchBooks();
                } else {
                    $scope.displayError = true;
                }
            }).
        catch(function(response) {

            $scope.displayError = true;
        });




    }
    $scope.removeRows = function(user) {

        $scope.bookCart.splice();

    };

});