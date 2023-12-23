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


-- See All Users --

DELIMITER //
DROP PROCEDURE IF EXISTS Get_Users;
CREATE PROCEDURE Get_Users()
BEGIN
	SELECT * FROM users;
END//
DELIMITER ;

CALL Get_Users();


-- Get User By ID --

DELIMITER //
DROP PROCEDURE IF EXISTS Get_User;
CREATE PROCEDURE Get_User(IN id INT)
BEGIN
	SELECT * FROM users WHERE UserID = id;
END//
DELIMITER ;

CALL Get_User(1);
CALL Get_User(2);


-- Update user --

DELIMITER //
DROP PROCEDURE IF EXISTS Update_User;
CREATE PROCEDURE Update_User(IN id INT, IN username VARCHAR(50), IN email VARCHAR(100), IN birthDate DATE)
BEGIN
	DECLARE user_count INT;
	SELECT COUNT(*) INTO user_count FROM users WHERE UserId = id;
    
	IF user_count = 0 THEN
		SELECT 'User is not present' as error;
	ELSE
		UPDATE Users SET name = username, Email = email, BirthDate = birthDate WHERE UserID = id;
	END IF;
END //
DELIMITER ;

CALL Update_User(1, "Abhishek", "fhs@shilf.com", "2001-05-02");
CALL Get_User(1);

CALL Update_User(3, "Abhishek", "fhs@shilf.com", "2001-05-02");
CALL Get_User(3);


