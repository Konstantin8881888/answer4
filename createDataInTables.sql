-- Вставляем фильмы
INSERT INTO Films (title, duration) VALUES
    ('Avengers: Endgame', 180),
    ('The Dark Knight', 152),
    ('Inception', 148),
    ('Pulp Fiction', 154),
    ('Forrest Gump', 142);

-- Вставляем сеансы на один день для каждого фильма
INSERT INTO Sessions (id_film, price, start_time) VALUES
    (1, 10.50, '2023-03-30 12:00:00'),
    (1, 12.50, '2023-03-30 15:00:00'),
    (1, 15.50, '2023-03-30 18:00:00'),
    (2, 9.50, '2023-03-30 13:00:00'),
    (2, 11.50, '2023-03-30 16:00:00'),
    (2, 13.50, '2023-03-30 19:00:00'),
    (3, 8.50, '2023-03-30 14:00:00'),
    (3, 10.50, '2023-03-30 17:00:00'),
    (3, 12.50, '2023-03-30 20:00:00'),
    (4, 7.50, '2023-03-30 12:30:00'),
    (4, 9.50, '2023-03-30 15:30:00'),
    (4, 11.50, '2023-03-30 18:30:00'),
    (5, 6.50, '2023-03-30 13:30:00'),
    (5, 8.50, '2023-03-30 16:30:00'),
    (5, 10.50, '2023-03-30 19:30:00');

-- Вставляем проданные билеты для нескольких сеансов
INSERT INTO Tickets (id_session, ticket_number) VALUES
    (1, 'A1'),
    (1, 'A2'),
    (2, 'B1'),
    (2, 'B2'),
    (3, 'C1');
