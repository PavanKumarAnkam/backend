CREATE DATABASE IF NOT EXISTS transactions;
USE transactions;

CREATE TABLE IF NOT EXISTS transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount INT NOT NULL,  -- It's good to specify NOT NULL if the field should always have a value
    description VARCHAR(255) NOT NULL -- Adding NOT NULL to ensure description is always provided
);

CREATE USER IF NOT EXISTS 'expense'@'%' IDENTIFIED BY 'ExpenseApp@1';
GRANT ALL PRIVILEGES ON transactions.* TO 'expense'@'%';
FLUSH PRIVILEGES;

