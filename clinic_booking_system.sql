-- Clinic Booking System Database
-- Author: Pontsho
-- Description: SQL script to create a relational database for a clinic booking system.

-- DROP DATABASE IF EXISTS (optional for testing)
DROP DATABASE IF EXISTS clinic_booking_system;
CREATE DATABASE clinic_booking_system;
USE clinic_booking_system;

-- 1. Departments Table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Doctors Table
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 3. Patients Table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    contact_number VARCHAR(15) UNIQUE
);

-- 4. Appointments Table
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 5. Prescriptions Table
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 6. Medications Table
CREATE TABLE medications (
    medication_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 7. Prescription_Medications (M-M Relationship)
CREATE TABLE prescription_medications (
    prescription_id INT,
    medication_id INT,
    dosage VARCHAR(100),
    PRIMARY KEY (prescription_id, medication_id),
    FOREIGN KEY (prescription_id) REFERENCES prescriptions(prescription_id),
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);
