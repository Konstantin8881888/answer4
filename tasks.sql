SELECT
  s1.id_session as id_session_1,
  f1.title as film_1,
  s1.start_time as start_time_1,
  f1.duration as duration_1,
  s2.id_session as id_session_2,
  f2.title as film_2,
  s2.start_time as start_time_2,
  f2.duration as duration_2
FROM Sessions s1
JOIN Films f1 ON s1.id_film = f1.id_film
JOIN Sessions s2 ON s1.id_session <> s2.id_session
JOIN Films f2 ON s2.id_film = f2.id_film
WHERE s1.start_time < s2.start_time + interval '1 minute'
  AND s1.start_time + interval '1 minute' > s2.start_time
ORDER BY s1.start_time;

SELECT f1.title as film_1,
       s1.start_time as start_time_1,
       f1.duration as duration_1,
       s2.start_time as start_time_2,
       EXTRACT(EPOCH FROM (s2.start_time - (s1.start_time + INTERVAL '1' HOUR))) / 60 as break_duration
FROM Sessions s1
JOIN Films f1 ON s1.id_film = f1.id_film
JOIN Sessions s2 ON s1.start_time < s2.start_time
JOIN Films f2 ON s2.id_film = f2.id_film
WHERE EXTRACT(EPOCH FROM (s2.start_time - (s1.start_time + INTERVAL '1' HOUR))) >= 30 * 60
ORDER BY break_duration DESC;


SELECT f.title AS "Фильм",
       COUNT(t.id_ticket) AS "Общее число посетителей",
       COUNT(t.id_ticket)/COUNT(DISTINCT s.id_session) AS "Среднее число зрителей за сеанс",
       SUM(s.price) AS "Общая сумма сборов"
FROM Films f
JOIN Sessions s ON f.id_film = s.id_film
JOIN Tickets t ON s.id_session = t.id_session
GROUP BY f.id_film
UNION ALL
SELECT 'Итого', 
       COUNT(t.id_ticket), 
       COUNT(t.id_ticket)/COUNT(DISTINCT s.id_session), 
       SUM(s.price)
FROM Sessions s
JOIN Tickets t ON s.id_session = t.id_session;


SELECT 
    CASE 
        WHEN extract(hour from s.start_time) >= 9 AND extract(hour from s.start_time) < 15 THEN 'С 9 до 15'
        WHEN extract(hour from s.start_time) >= 15 AND extract(hour from s.start_time) < 18 THEN 'С 15 до 18'
        WHEN extract(hour from s.start_time) >= 18 AND extract(hour from s.start_time) < 21 THEN 'С 18 до 21'
        ELSE 'С 21 до 00'
    END AS "Время начала фильма",
    COUNT(t.id_ticket) AS "Число посетителей",
    SUM(s.price) AS "Кассовые сборы"
FROM 
    Sessions s
JOIN 
    Tickets t ON s.id_session = t.id_session
GROUP BY 
    CASE 
        WHEN extract(hour from s.start_time) >= 9 AND extract(hour from s.start_time) < 15 THEN 'С 9 до 15'
        WHEN extract(hour from s.start_time) >= 15 AND extract(hour from s.start_time) < 18 THEN 'С 15 до 18'
        WHEN extract(hour from s.start_time) >= 18 AND extract(hour from s.start_time) < 21 THEN 'С 18 до 21'
        ELSE 'С 21 до 00'
    END
ORDER BY 
    MIN(s.start_time);








