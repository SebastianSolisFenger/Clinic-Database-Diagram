
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
    medical_history_id integer NOT NULL,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE RESTRICT ON UPDATE CASCADE
)

CREATE TABLE invoice_items (
   id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity integer,
    total_price DECIMAL,
    invoice_id integer,
    treatment_id integer,
    FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE RESTRICT ON UPDATE CASCADE
)

CREATE TABLE medical_histories_treaments (
    medical_history_id integer NOT NULL,
    treatment_id integer NOT NULL,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE RESTRICT ON UPDATE CASCADE
)

-- CREATE FK INDEXES

CREATE INDEX medical_histories_patient_index ON medical_histories (patient_id ASC NULL LAST);
CREATE INDEX invoices_medical_history_index ON invoices (medical_history_id ASC NULL LAST);
CREATE INDEX invoice_items_id_index ON invoice_items (invoice_id ASC NULL LAST);
CREATE INDEX invoice_treatment_id_items_index ON invoice_items (treatment_id ASC NULL LAST);
CREATE INDEX medical_hist_and_treat_medical_history_index ON medical_histories_treaments (medical_history_id ASC NULL LAST);
CREATE INDEX medical_hist_and_treat_treatment_index ON medical_histories_treaments (treatment_id ASC NULL LAST);