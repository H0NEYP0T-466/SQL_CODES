CREATE DATABASE GANGSTER_GLOCK17;


-- Patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    room_number INT,
    doctor_id INT,
    diagnosis VARCHAR(255)
);

-- Room table
CREATE TABLE room (
    room_number INT PRIMARY KEY,
    room_type VARCHAR(50),
    availability VARCHAR(10)
);

-- Staff table
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    position VARCHAR(50),
    department VARCHAR(50)
);

-- Nurses table
CREATE TABLE nurses (
    nurse_id INT PRIMARY KEY,
    nurse_name VARCHAR(100),
    department VARCHAR(50)
);

-- Treatment table
CREATE TABLE treatment (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    treatment_type VARCHAR(100),
    treatment_date DATE,
    description TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- BillPaid table
CREATE TABLE billpaid (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    bill_amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Diseases table
CREATE TABLE diseases (
    disease_id INT PRIMARY KEY,
    disease_name VARCHAR(100),
    description TEXT
);

-- Doctor table
CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    department VARCHAR(50),
    specialization VARCHAR(100)
);





INSERT INTO patients (patient_id, patient_name, age, gender, admission_date, discharge_date, room_number, doctor_id, diagnosis)
VALUES
    (1, 'Ali Khan', 35, 'Male', '2024-04-01', '2024-04-10', 101, 101, 'Fever'),
    (2, 'Aisha Mahmood', 28, 'Female', '2024-04-02', '2024-04-09', 102, 102, 'Appendicitis'),
    (3, 'Fatima Shah', 45, 'Female', '2024-04-03', '2024-04-08', 103, 103, 'Diabetes'),
    (4, 'Hassan Ali', 50, 'Male', '2024-04-04', '2024-04-11', 104, 104, 'Hypertension'),
    (5, 'Sana Ahmed', 38, 'Female', '2024-04-05', '2024-04-10', 105, 105, 'Migraine'),
    (6, 'Amir Khan', 42, 'Male', '2024-04-06', '2024-04-13', 106, 106, 'Fracture'),
    (7, 'Zoya Malik', 55, 'Female', '2024-04-07', '2024-04-12', 107, 107, 'Pneumonia'),
    (8, 'Ahmed Siddiqui', 30, 'Male', '2024-04-08', '2024-04-15', 108, 108, 'Gastritis'),
    (9, 'Mariam Khan', 25, 'Female', '2024-04-09', '2024-04-14', 109, 109, 'Bronchitis'),
    (10, 'Sara Ali', 48, 'Female', '2024-04-10', '2024-04-17', 110, 110, 'Asthma'),
    (11, 'Hamza Shah', 32, 'Male', '2024-04-11', '2024-04-18', 111, 111, 'Allergy'),
    (12, 'Ayesha Khan', 60, 'Female', '2024-04-12', '2024-04-19', 112, 112, 'Arthritis'),
    (13, 'Kamran Ahmed', 40, 'Male', '2024-04-13', '2024-04-20', 113, 113, 'UTI'),
    (14, 'Nida Malik', 22, 'Female', '2024-04-14', '2024-04-21', 114, 114, 'Conjunctivitis'),
    (15, 'Bilal Siddiqui', 37, 'Male', '2024-04-15', '2024-04-22', 115, 115, 'Gastroenteritis'),
    (16, 'Zainab Khan', 29, 'Female', '2024-04-16', '2024-04-23', 116, 116, 'Sinusitis'),
    (17, 'Imran Ali', 43, 'Male', '2024-04-17', '2024-04-24', 117, 117, 'Dengue'),
    (18, 'Sobia Ahmed', 27, 'Female', '2024-04-18', '2024-04-25', 118, 118, 'Anemia'),
    (19, 'Rizwan Khan', 52, 'Male', '2024-04-19', '2024-04-26', 119, 119, 'Kidney Stones'),
    (20, 'Asma Malik', 33, 'Female', '2024-04-20', '2024-04-27', 120, 120, 'Malaria'),
    (21, 'Ahmed Khan', 47, 'Male', '2024-04-21', '2024-04-28', 121, 121, 'Jaundice');


	INSERT INTO room (room_number, room_type, availability)
VALUES
    (101, 'Single', 'Occupied'),
    (102, 'Single', 'Occupied'),
    (103, 'Double', 'Occupied'),
    (104, 'Double', 'Vacant'),
    (105, 'Single', 'Occupied'),
    (106, 'Single', 'Vacant'),
    (107, 'Double', 'Occupied'),
    (108, 'Single', 'Vacant'),
    (109, 'Single', 'Occupied'),
    (110, 'Double', 'Vacant'),
    (111, 'Single', 'Occupied'),
    (112, 'Double', 'Occupied'),
    (113, 'Single', 'Vacant'),
    (114, 'Double', 'Occupied'),
    (115, 'Single', 'Occupied'),
    (116, 'Single', 'Vacant'),
    (117, 'Double', 'Occupied'),
    (118, 'Single', 'Vacant');

	INSERT INTO staff (staff_id, staff_name, position, department)
VALUES
    (101, 'Ali Khan', 'Nurse', 'ICU'),
    (102, 'Sana Ahmed', 'Doctor', 'Cardiology'),
    (103, 'Ahmed Malik', 'Receptionist', 'Front Desk'),
    (104, 'Zainab Raza', 'Technician', 'Laboratory'),
    (105, 'Fatima Siddiqui', 'Nurse', 'Pediatrics'),
    (106, 'Imran Ali', 'Doctor', 'Orthopedics'),
    (107, 'Nida Khan', 'Receptionist', 'Emergency'),
    (108, 'Bilal Malik', 'Technician', 'Radiology'),
    (109, 'Ayesha Raza', 'Nurse', 'Surgery'),
    (110, 'Hamza Ahmed', 'Doctor', 'Neurology'),
    (111, 'Sobia Ali', 'Receptionist', 'Ophthalmology'),
    (112, 'Rizwan Khan', 'Technician', 'Oncology'),
    (113, 'Asma Siddiqui', 'Nurse', 'ENT'),
    (114, 'Ahmed Shah', 'Doctor', 'Endocrinology'),
    (115, 'Zoya Malik', 'Receptionist', 'Gynecology'),
    (116, 'Mariam Ali', 'Technician', 'Dermatology');

	INSERT INTO nurses (nurse_id, nurse_name, department)
VALUES
    (201, 'Ayesha Khan', 'ICU'),
    (202, 'Mohammad Ali', 'Pediatrics'),
    (203, 'Fatima Ahmed', 'Surgery'),
    (204, 'Ahmed Malik', 'Emergency'),
    (205, 'Zainab Hassan', 'Oncology'),
    (206, 'Sana Raza', 'Orthopedics'),
    (207, 'Aliya Siddiqui', 'Cardiology'),
    (208, 'Omar Khan', 'Gynecology'),
    (209, 'Mariam Hassan', 'ENT'),
    (210, 'Hassan Ahmed', 'Neurology'),
    (211, 'Aisha Ali', 'Psychiatry'),
    (212, 'Imran Malik', 'Dermatology'),
    (213, 'Sobia Hussain', 'Radiology'),
    (214, 'Bilal Ahmad', 'Ophthalmology'),
    (215, 'Sara Khan', 'Endocrinology'),
    (216, 'Rizwan Mahmood', 'Urology'),
    (217, 'Nida Zafar', 'Hematology'),
    (218, 'Zoya Shah', 'Oncology'),
    (219, 'Amir Ali', 'Nephrology'),
    (220, 'Hina Malik', 'Pulmonology');


	INSERT INTO treatment (treatment_id, patient_id, treatment_type, treatment_date, description)
VALUES
    (1, 1, 'Medication', '2024-04-01', 'Prescribed antibiotics for fever'),
    (2, 2, 'Surgery', '2024-04-02', 'Appendectomy performed successfully'),
    (3, 3, 'Medication', '2024-04-03', 'Insulin injections administered for diabetes control'),
    (4, 4, 'Medication', '2024-04-04', 'Blood pressure medication prescribed for hypertension'),
    (5, 5, 'Rest', '2024-04-05', 'Advised rest and hydration for migraine relief'),
    (6, 6, 'Surgery', '2024-04-06', 'Fracture repaired with surgery'),
    (7, 7, 'Medication', '2024-04-07', 'Antibiotics prescribed for pneumonia treatment'),
    (8, 8, 'Diet', '2024-04-08', 'Prescribed bland diet for gastritis management'),
    (9, 9, 'Medication', '2024-04-09', 'Antibiotics administered for bronchitis'),
    (10, 10, 'Inhaler', '2024-04-10', 'Prescribed inhaler for asthma control'),
    (11, 11, 'Medication', '2024-04-11', 'Antihistamines prescribed for allergy relief'),
    (12, 12, 'Physical Therapy', '2024-04-12', 'Joint exercises for arthritis management'),
    (13, 13, 'Medication', '2024-04-13', 'Antibiotics for urinary tract infection'),
    (14, 14, 'Eye Drops', '2024-04-14', 'Prescribed eye drops for conjunctivitis'),
    (15, 15, 'Medication', '2024-04-15', 'Prescribed medication for gastroenteritis'),
    (16, 16, 'Nasal Spray', '2024-04-16', 'Nasal spray for sinusitis relief'),
    (17, 17, 'Fluids', '2024-04-17', 'IV fluids administered for dengue fever'),
    (18, 18, 'Iron Supplements', '2024-04-18', 'Prescribed iron supplements for anemia treatment'),
    (19, 19, 'Lithotripsy', '2024-04-19', 'Underwent lithotripsy for kidney stones'),
    (20, 20, 'Antimalarial', '2024-04-20', 'Administered antimalarial drugs for malaria treatment');


	INSERT INTO billpaid (bill_id, patient_id, bill_amount, payment_date)
VALUES
    (1, 1, 1500.00, '2024-04-10'),
    (2, 2, 3000.00, '2024-04-09'),
    (3, 3, 2000.00, '2024-04-08'),
    (4, 4, 2500.00, '2024-04-11'),
    (5, 5, 1800.00, '2024-04-10'),
    (6, 6, 5000.00, '2024-04-13'),
    (7, 7, 3500.00, '2024-04-12'),
    (8, 8, 1200.00, '2024-04-15'),
    (9, 9, 2700.00, '2024-04-14'),
    (10, 10, 4000.00, '2024-04-17'),
    (11, 11, 2200.00, '2024-04-16'),
    (12, 12, 3000.00, '2024-04-19'),
    (13, 13, 1500.00, '2024-04-18'),
    (14, 14, 2800.00, '2024-04-21'),
    (15, 15, 1900.00, '2024-04-20'),
    (16, 16, 2200.00, '2024-04-23'),
    (17, 17, 3200.00, '2024-04-22'),
    (18, 18, 2500.00, '2024-04-25'),
    (19, 19, 3800.00, '2024-04-24'),
    (20, 20, 1500.00, '2024-04-27');


	INSERT INTO diseases (disease_id, disease_name, description)
VALUES
    (1, 'Fever', 'Elevated body temperature often caused by infection'),
    (2, 'Appendicitis', 'Inflammation of the appendix requiring surgical removal'),
    (3, 'Diabetes', 'Chronic condition characterized by high blood sugar levels'),
    (4, 'Hypertension', 'High blood pressure condition'),
    (5, 'Migraine', 'Recurrent throbbing headaches often accompanied by nausea'),
    (6, 'Fracture', 'Broken bone requiring immobilization and/or surgery'),
    (7, 'Pneumonia', 'Lung infection causing inflammation and difficulty breathing'),
    (8, 'Gastritis', 'Inflammation of the stomach lining often causing pain and discomfort'),
    (9, 'Bronchitis', 'Inflammation of the bronchial tubes leading to cough and mucus production'),
    (10, 'Asthma', 'Chronic respiratory condition characterized by wheezing and shortness of breath'),
    (11, 'Allergy', 'Immune system reaction to a foreign substance causing symptoms like sneezing and itching'),
    (12, 'Arthritis', 'Joint inflammation leading to pain, stiffness, and swelling'),
    (13, 'UTI', 'Urinary tract infection causing discomfort and frequent urination'),
    (14, 'Conjunctivitis', 'Inflammation of the conjunctiva resulting in redness and discharge'),
    (15, 'Gastroenteritis', 'Stomach and intestinal inflammation causing diarrhea and vomiting'),
    (16, 'Sinusitis', 'Inflammation of the sinuses leading to facial pain and congestion');
 

 INSERT INTO doctor (doctor_id, doctor_name, department, specialization)
VALUES
    (101, 'Dr. Ali Khan', 'Internal Medicine', 'Cardiologist'),
    (102, 'Dr. Fatima Ahmed', 'Orthopedics', 'Orthopedic Surgeon'),
    (103, 'Dr. Ahmed Malik', 'Neurology', 'Neurologist'),
    (104, 'Dr. Zainab Raza', 'Ophthalmology', 'Ophthalmologist'),
    (105, 'Dr. Sana Siddiqui', 'Pediatrics', 'Pediatrician'),
    (106, 'Dr. Imran Ali', 'Surgery', 'General Surgeon'),
    (107, 'Dr. Nida Khan', 'Gynecology', 'Gynecologist'),
    (108, 'Dr. Bilal Malik', 'Oncology', 'Oncologist'),
    (109, 'Dr. Ayesha Raza', 'Dermatology', 'Dermatologist'),
    (110, 'Dr. Hamza Ahmed', 'Endocrinology', 'Endocrinologist'),
    (111, 'Dr. Sobia Ali', 'Psychiatry', 'Psychiatrist'),
    (112, 'Dr. Rizwan Khan', 'Urology', 'Urologist'),
    (113, 'Dr. Asma Siddiqui', 'ENT', 'Otolaryngologist'),
    (114, 'Dr. Ahmed Shah', 'Gastroenterology', 'Gastroenterologist'),
    (115, 'Dr. Zoya Malik', 'Pulmonology', 'Pulmonologist'),
    (116, 'Dr. Mariam Ali', 'Rheumatology', 'Rheumatologist'),
    (117, 'Dr. Amir Khan', 'Hematology', 'Hematologist'),
    (118, 'Dr. Hina Ahmed', 'Nephrology', 'Nephrologist'),
    (119, 'Dr. Omar Raza', 'Allergy & Immunology', 'Allergist/Immunologist'),
    (120, 'Dr. Sara Malik', 'Cardiac Surgery', 'Cardiac Surgeon');


SELECT * FROM patients;
SELECT * FROM room;
SELECT * FROM staff;
SELECT * FROM nurses;
SELECT * FROM treatment;
SELECT * FROM billpaid;
SELECT * FROM diseases;
SELECT * FROM doctor;



CREATE VIEW patients_view AS
SELECT patient_id, patient_name, age, gender, admission_date, discharge_date, room_number, diagnosis
FROM patients;

CREATE VIEW room_view AS
SELECT room_number, room_type, availability
FROM room;


CREATE VIEW staff_view AS
SELECT staff_id, staff_name, position, department
FROM staff;


CREATE VIEW nurses_view AS
SELECT nurse_id, nurse_name, department
FROM nurses;


CREATE VIEW treatment_view AS
SELECT treatment_id, patient_id, treatment_type, treatment_date, description
FROM treatment;


CREATE VIEW billpaid_view AS
SELECT bill_id, patient_id, bill_amount, payment_date
FROM billpaid;


CREATE VIEW diseases_view AS
SELECT disease_id, disease_name, description
FROM diseases;

CREATE VIEW doctor_view AS
SELECT doctor_id, doctor_name, department, specialization
FROM doctor;

--views
SELECT * FROM patients_view;

-- Query to display data from the room_view
SELECT * FROM room_view;

-- Query to display data from the staff_view
SELECT * FROM staff_view;

-- Query to display data from the nurses_view
SELECT * FROM nurses_view;

-- Query to display data from the treatment_view
SELECT * FROM treatment_view;

-- Query to display data from the billpaid_view
SELECT * FROM billpaid_view;

-- Query to display data from the diseases_view
SELECT * FROM diseases_view;

-- Query to display data from the doctor_view
SELECT * FROM doctor_view;



CREATE TRIGGER tr_patient_admission
ON patients
AFTER INSERT
AS
BEGIN
    DECLARE @room_number INT;

    SELECT @room_number = room_number
    FROM inserted;

    UPDATE room
    SET availability = 'Occupied'
    WHERE room_number = @room_number;
END;




CREATE TRIGGER tr_room_availability
ON room
AFTER UPDATE
AS
BEGIN
    DECLARE @new_availability VARCHAR(10);
    DECLARE @room_number INT;

    SELECT @new_availability = availability, @room_number = room_number
    FROM inserted;

    IF @new_availability = 'Occupied'
    BEGIN
        UPDATE patients
        SET room_number = @room_number
        WHERE room_number = @room_number AND discharge_date IS NULL;
    END;
END;





