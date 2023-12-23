CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    BirthDate DATE,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Add User : Create a user entry in the table --

DELIMITER //
DROP PROCEDURE IF EXISTS Add_User;
CREATE PROCEDURE Add_User(IN id INT,IN user_name VARCHAR(50),IN email VARCHAR(100), IN birthdate DATE)
BEGIN
	INSERT INTO Users (UserID, name, Email, BirthDate) VALUES (id, user_name, email, birthdate);
END//

DELIMITER ;

CALL Add_User(2, "Abhishek Kumar", "avisec07@gmail.com", '2001-05-02');

