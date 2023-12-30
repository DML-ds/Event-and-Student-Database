-- Creating a new event
INSERT INTO Event (event_name, event_type, date, time, organizer_id, location_id) VALUES
('Women in Tech', 'Meet-up', '2024-01-12', '12:00:00', 3, 3);

-- Rating a previous event
INSERT INTO EventRating (event_id, student_id, rating) VALUES
(8, 3, 9);

-- student report
CREATE VIEW StudentReport AS
SELECT s.student_name, e.event_name, er.rating
FROM Student AS s
LEFT JOIN EventRating AS er 
ON s.student_id = er.student_id
LEFT JOIN Event AS e ON er.event_id = e.event_id
WHERE s.student_id = 3
ORDER BY e.registration_date DESC
LIMIT 10;

-- Average rating
CREATE VIEW AverageRating AS
SELECT AVG(er.rating) AS average_rating
FROM EventRating AS er
WHERE er.student_id = 3;

-- Functionality D: What's coming
CREATE VIEW WhatsComing AS
SELECT e.event_name, e.event_type, e.date, e.time, AVG(er.rating) AS avg_rating
FROM Event AS e
LEFT JOIN EventRating AS er ON e.event_id = er.event_id
WHERE e.date > CURRENT_DATE AND e.type = '' AND e.location_id = 'location_id'
GROUP BY e.event_id
ORDER BY e.date;

-- Functionality E: Favorites summary
CREATE VIEW Favourites AS
SELECT e.event_name, e.event_type, e.date, e.time, l.location_name, COUNT(a.student_id) AS attendance_count, AVG(er.rating) AS avg_rating
FROM Event e
LEFT JOIN Attendance a ON e.event_id = a.event_id
LEFT JOIN EventRating er ON e.event_id = er.event_id
LEFT JOIN Location l ON e.location_id = l.location_id
WHERE e.date > DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY e.event_id
ORDER BY avg_rating DESC
LIMIT 5;

-- Query using StudentReport View
SELECT * FROM StudentReport;

-- Query using WhatsComing View
SELECT * FROM WhatsComing;

-- Query using Favourites View
SELECT * FROM Favourites;
