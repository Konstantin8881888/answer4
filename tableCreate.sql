CREATE TABLE Films (
    id_film SERIAL PRIMARY KEY,
    title TEXT,
    duration INTEGER
);

CREATE TABLE Sessions (
    id_session SERIAL PRIMARY KEY,
    id_film INTEGER REFERENCES Films(id_film),
    price NUMERIC(10,2),
    start_time TIMESTAMP
);

CREATE TABLE Tickets (
    id_ticket SERIAL PRIMARY KEY,
    id_session INTEGER REFERENCES Sessions(id_session),
    ticket_number TEXT
);