CREATE DATABASE recreation;

USE recreation;

-- Create tables
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    major VARCHAR(50)
);

CREATE TABLE Organizer (
    organizer_id INT AUTO_INCREMENT PRIMARY KEY,
    organizer_name VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
	phone VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL,
    area VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL
);

CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    organizer_id INT,
    location_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    event_id INT,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    UNIQUE(student_id, event_id)
);


-- Sample data
INSERT INTO Student (student_name, email, major) VALUES
('Chandler Bing', 'chandlerbing@friends.com', 'Accounting'),
('Monica Geller', 'mongeller@friends.com', 'Business'),
('Ross Geller', 'rossgeller@friends.com', 'Medicine'),
('Rachel Green', 'rachgreen@friends.com', 'Management'),
('Phoebe Buffay', 'phoebebuffay@friends.com', 'Psychology');

INSERT INTO Organizer (organizer_name, email, phone) VALUES
('Beatles', 'beatles@music.com', '07485558734'),
('Up-beat', 'upbeat@fun.com', '07487689000'),
('Cilantro', 'cilantro@food.com', '07489904500'),
('Pure fitness', 'purefitness@fitness.com', '07485452450'),
('Sip and paint', 'sipandpaint@art.com', '07485489000');

INSERT INTO Location (location_name, area, address) VALUES
('Jack Murphys', 'Swansea Arena', 'Jack Arena st'),
('Bank Statement', 'Mumbles pier', 'Bank pier st'),
('Level 17', 'Wind street', 'Level wind st'),
('Lake Museum', 'Peckham', 'Lake peckham st'),
('Hour Glass Gallery', 'Trafalgar Square', 'Hour square st');


INSERT INTO Event (event_name, event_type, date, time, organizer_id, location_id) VALUES
('The national waterfront museum opening', 'Art', '2023-12-17', '18:00:00', 1, 2),
('Swansea grand theatre 2.0', 'Dance', '2023-12-20', '20:30:00', 2, 3),
('Welsh Mukbang', 'Food', '2023-11-28', '12:00:00', 1, 4),
('Swansea market December sale', 'Shopping', '2023-12-25', '08:00:00', 4, 5),
('LC waterpark reloaded', 'Recreation', '2023-12-29', '10:00:00', 5, 1),
('Trunk-or-Treat Party', 'Dance', '2023-10-01', '20:00:00', 1, 5),
('Theater Night', 'Art', '2023-10-08', '09:30:00', 2, 2),
('Movie Night', 'Art', '2023-10-16', '18:00:00', 1, 3),
('Field Day', 'Games', '2023-10-26', '14:30:00', 1, 3),
('Book Fair', 'Sales', '2023-11-05', '22:30:00', 1, 3),
('Ice Cream Social', 'Food', '2023-11-07', '20:00:00', 1, 5),
('Board Game Night', 'Games', '2023-11-14', '09:30:00', 2, 2),
('Video Game Tournament', 'Games', '2023-11-15', '14:30:00', 1, 4),
('Relay Day', 'Games', '2023-11-20', '22:30:00', 1, 1),
('Trivia Night', 'Games', '2023-11-21', '20:00:00', 1, 1),
('Mascot Music Festival', 'Art', '2023-11-22', '09:30:00', 2, 5),
('Talent Show', 'Dance', '2023-11-26', '18:00:00', 1, 3),
('Debate Competition', 'Games', '2023-12-09', '14:30:00', 1, 2),
('Cultural Fest', 'Art', '2023-12-10', '22:30:00', 1, 2),
('Music Festival', 'Art', '2023-11-14', '20:00:00', 1, 1),
('Dance Party II', 'Dance', '2023-12-18', '21:00:00', 1, 1),
('Cook-Off', 'Games', '2023-12-22', '20:00:00', 1, 2),
('Disco', 'Dance', '2023-12-22', '19:00:00', 1, 2),
('Santa Party', 'Dance', '2023-12-25', '19:00:00', 1, 1);



INSERT INTO Attendance (student_id, event_id, rating) VALUES
(1, 1, 5),
(3, 1, 5),
(1, 2, 4),
(4, 3, 5),
(1, 3, 3),
(4, 4, 4),
(1, 5, 5),
(1, 6, 5),
(1, 7, 3),
(1, 8, 4),
(2, 8, 4),
(1, 9, 4),
(5, 10, 5),
(4, 10, 4),
(1, 11, 5),
(2, 11, 4),
(1, 12, 2),
(1, 13, 4),
(3, 13, 4),
(1, 14, 5),
(4, 14, 4),
(5, 15, 5),
(1, 16, NULL),
(3, 17, 4),
(1, 18, NULL),
(5, 19, NULL),
(2, 19, NULL),
(1, 19, NULL),
(3, 20, NULL),
(2, 20, NULL);



