-- Create tables

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    reorder_level INT
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT
);

CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE salaries (
    employee_id INT PRIMARY KEY,
    basic_salary DECIMAL(10,2),
    allowance DECIMAL(10,2),
    month VARCHAR(7) -- e.g., '2024-12'
);

CREATE TABLE bonuses (
    id INT PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10,2)
);

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE donors (
    id INT PRIMARY KEY,
    donor_type VARCHAR(50)
);

CREATE TABLE payment (
    id INT PRIMARY KEY,
    donor_id INT,
    total_amount DECIMAL(10,2),
    created_date DATE
);

CREATE TABLE invoices (
    id INT PRIMARY KEY,
    invoice_date DATE,
    due_date DATE,
    customer_id INT,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE logins (
    id INT PRIMARY KEY,
    user_id INT,
    login_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data

INSERT INTO customers VALUES
(1, 'Alice', 'active'),
(2, 'Bob', 'inactive'),
(3, 'Charlie', 'active');

INSERT INTO products VALUES
(1, 'Laptop', 1200.00, 5),
(2, 'Mouse', 25.50, 20),
(3, 'Keyboard', 45.00, 15);

INSERT INTO orders VALUES
(1, 1, '2024-06-15'),
(2, 3, '2024-06-16'),
(3, 1, '2024-06-20');

INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 3, 1, 3);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Engineering');

INSERT INTO employees VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 2);

INSERT INTO salaries VALUES
(1, 3000.00, 500.00, '2024-12'),
(2, 4000.00, 600.00, '2024-12');

INSERT INTO bonuses VALUES
(1, 1, 200.00),
(2, 2, 300.00);

INSERT INTO inventory VALUES
(1, 3),
(2, 50),
(3, 10);

INSERT INTO donors VALUES
(1, 'Individual'),
(2, 'Corporate');

INSERT INTO payment VALUES
(1, 1, 500.00, '2024-01-15'),
(2, 2, 1500.00, '2024-03-20');

INSERT INTO invoices VALUES
(1, '2024-05-01', '2024-05-31', 1, 'unpaid'),
(2, '2024-04-15', '2024-05-15', 3, 'paid');

INSERT INTO users VALUES
(1, 'user1'),
(2, 'user2');

INSERT INTO logins VALUES
(1, 1, '2024-06-25'),
(2, 2, '2024-06-24'),
(3, 1, '2024-06-26');
