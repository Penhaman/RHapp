CREATE DATABASE IF NOT EXISTS RHApp;

USE RHApp;

CREATE TABLE IF NOT EXISTS User
(
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    email VARCHAR(120) NOT NULL,
    password VARCHAR(255) NOT NULL,
    permissions VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Client
(
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(25) NOT NULL,
    postalcode VARCHAR(25) NOT NULL,
    country VARCHAR(25) NOT NULL,
    active BOOLEAN DEFAULT false
);

CREATE TABLE IF NOT EXISTS Resource 
(
	id_person INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	gender VARCHAR(25) NOT NULL,
	birth_date DATE NOT NULL,
	nationality VARCHAR(50) NOT NULL,
	idcard_number VARCHAR (50) NOT NULL,
	vat_number VARCHAR (50)NOT NULL,
	socialid_number VARCHAR (50) NOT NULL,
	drivers_license BOOLEAN DEFAULT false,
	phone_number VARCHAR(20) NOT NULL,
    	emergency_contact VARCHAR(20) NOT NULL,
	email varchar(120) NOT NULL,
	address VARCHAR(255) NOT NULL,
	postalcode VARCHAR(255) NOT NULL,
	city VARCHAR(25) NOT NULL,
	observations varchar(255),
	job VARCHAR(40) NOT NULL,
	speciality VARCHAR(255),
	entry_date DATE NOT NULL,
	exit_date DATE,
	wage INT NOT NULL,
	current_status VARCHAR(25)
);

CREATE TABLE Document 
(
	id_document INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	filepath varchar(255),
	id_person INT NOT NULL,
	FOREIGN KEY (id_person) REFERENCES Resource(id_person)
);

CREATE TABLE Project 
(
	id_project INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_client INT NOT NULL,
	FOREIGN KEY (id_client) REFERENCES Client(id_client),
	name VARCHAR(50) NOT NULL,
	start_date DATE NOT NULL,
	expected_date DATE
);

CREATE TABLE RL_Resource_Project 
(
	id_rl_resource_project INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_person INT NOT NULL,
	FOREIGN KEY (id_person) REFERENCES Resource(id_person),
	id_project INT NOT NULL,
    	FOREIGN KEY (id_project) REFERENCES Project(id_project),
	start_date DATE NOT NULL,
	end_date DATE
);
