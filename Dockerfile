Docker Compose (10M)
-----------------------------------
docker-compose.yml
version: '3'
services:
  tomcat:
    image: your-dockerhub-username/smarthub-image
    ports:
      - "8080:8080"
    depends_on:
      - db

  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: sahdb
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:

Run:
docker-compose up -d
docker ps

Access Tomcat → http://localhost:8080

Enter MySQL container & create table:
docker exec -it <db_container_id> mysql -u root -p
CREATE TABLE students (id INT PRIMARY KEY, name VARCHAR(100));

