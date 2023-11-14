CREATE DATABASE todo_db;
USE todo_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT Null
);

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (shared_with_id) REFERENCES users(id)
);

SHOW TABLES;

INSERT INTO users (name, email, password) VALUES ('Vini', 'correo@correo.com', '12345678');
INSERT INTO users (name, email, password) VALUES ('Marcelo', 'correo2@correo2.com', '12345678');

INSERT INTO todos (title, user_id) 
VALUES 
("🏃🏽‍♂️ Go for a morning run", 1),
("💻 Work on project presentation", 1),
("🛒 Go grocery shopping", 1),
("📖 Read 30 pages of book", 1),
("🚴🏽‍♂️ Ride bike to the park", 1),
("🍜 Cook dinner for family", 1),
("🎧 Listen to podcast", 1),
("🧹 Clean de house", 1),
("🛌🏽 Get 8 hours of sleep", 1);

INSERT INTO shared_todos (todo_id, user_id, shared_with_id) VALUES (1,1,3);

-- Get todos including shared todos by id
SELECT todos.*, shared_todos.shared_with_id FROM todos LEFT JOIN shared_todos ON todos.id = shared_todos.todo.id WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];
