CREATE TABLE employee (
  emp id INT PRIMARY KEY,
  first_name VARCHAR(40),
  Last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

-- Slide 27 shows important vocabulary. 
-- Slide 32 shows altering a table.
ALTER TABLE employee 
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee 
ADD FOREIGN KEY(super_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT, 
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
); 

CREATE TABLE works_with (
  emp_id INT,
  client_name INT,
  branch_id INT,
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT, 
  supplier_name VARCHAR(40), 
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id)) ON DELETE CASCADE
);

