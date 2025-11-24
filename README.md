# lms
Basic Library managment System Build on Spring Boot

for more details about project refer 

https://letslearnjavanow.wordpress.com/2018/04/16/library-management-system-using-angular-spring-boot-spring-curd-rest-controller-mysql/

Features Developed:

Fetching all Books
Making a borrow request
Make a cancellation request
Make a add book request

Features Under Development:

Authenication User, Books
Email support
Barcode genration for each Book


## Run locally (single command)

Prereqs
- Docker + Docker Compose
- Java 8+
- Maven (or use the bundled `mvnw` wrapper)

Steps
1) From the project root run:
   ```bash
   ./run_local.sh
   ```
   What it does:
   - Spins up MySQL 8 in Docker via `docker-compose` with database `lms`, root password `root`, seed schema from `dbscript/init.sql`.
   - Starts the Spring Boot app on port 8080 using `./mvnw spring-boot:run`.
   If you prefer manual Docker commands instead of the script:
   ```bash
   docker-compose up -d db
   ./mvnw spring-boot:run
   ```

2) Open the UI:
   - Catalogue/console: http://localhost:8080/views/search.html
   - Registration: http://localhost:8080/views/register.html

3) Quick API checks:
```bash
curl http://localhost:8080/api/getBooks
curl http://localhost:8080/api/count
```

Notes
- If you need to reset the DB, stop compose and remove the `db_data` volume: `docker-compose down -v`.
- Database credentials are defined in `docker-compose.yml` and `src/main/resources/application.properties` (root/root, db `lms`).
