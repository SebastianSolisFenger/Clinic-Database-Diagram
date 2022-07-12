
CREATE DATABASE Clinic_Database_Diagram

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
)

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at timestamp,
    patient_id integer NOT NULL,
    status VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE RESTRICT ON UPDATE CASCADE
)

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
)


CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT NOT NULL,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE RESTRICT ON UPDATE CASCADE
)

CREATE TABLE invoice_items (
   id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE RESTRICT ON UPDATE CASCADE
)


