-- Creating a new event
INSERT INTO Event (event_name, event_type, date, time, organizer_id, location_id) VALUES
('Women in Tech', 'Meet-up', '2024-01-12', '12:00:00', 3, 3);

-- Rating a previous event
UPDATE attendance 
SET rating = 5
WHERE event_id = 16 AND student_id = 1;

-- Student report
CREATE VIEW StudentReport AS
SELECT s.student_name, e.event_name, e.date, 
	(
        SELECT AVG(rating) FROM attendance
	 	WHERE student_id = 1
    ) avg_rating
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Event e ON a.event_id = e.event_id
WHERE s.student_id = 1 AND e.date < CURRENT_DATE
ORDER BY e.date DESC
LIMIT 10;

-- What's coming
CREATE VIEW WhatsComing AS
SELECT e.event_name, e.event_type, e.date, e.time, l.area,
    (
        SELECT avg(rating) FROM event e
        JOIN attendance a ON a.event_id = e.event_id
        WHERE e.organizer_id = 1
    ) AS avg_rating
FROM Event e
JOIN location l ON l.location_id = e.location_id
WHERE e.organizer_id = 1 AND e.date > CURRENT_DATE
AND e.event_type = 'Games' AND l.area = 'Mumbles pier'
GROUP BY e.event_id
ORDER BY e.date;

-- Favorites summary
CREATE VIEW Favourites AS
SELECT e.event_name, e.event_type, e.date, l.location_name, COUNT(e.event_id) AS attendance, 
	AVG(a.rating) AS avg_rating FROM `event` e 
JOIN attendance a ON a.event_id = e.event_id
JOIN location l ON l.location_id = e.location_id
WHERE e.date >= DATE_SUB(CURRENT_DATE, INTERVAL 2 MONTH)  AND e.date < CURRENT_DATE
GROUP BY e.event_id
ORDER BY avg_rating DESC, attendance DESC
LIMIT 5;

-- StudentReport View
SELECT * 
FROM StudentReport;

-- WhatsComing View
SELECT * 
FROM WhatsComing;

-- Favourites View
SELECT * 
FROM Favourites;
 

