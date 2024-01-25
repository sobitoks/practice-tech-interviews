create table airports
(
    city_name varchar(17) not null,
    post_code char(3)     not null
);

create table flights
(
    start_time timestamp not null,
    end_time   timestamp not null,
    start_port char(3)   not null,
    end_port   char(3)   not null
);


INSERT INTO airports (city_name, post_code)
VALUES  ('New York', 'JFK'),
        ('New York', 'LGA'),
        ('Paris', 'CDG'),
        ('Tokyo', 'HND'),
        ('Los Angeles', 'LAX'),
        ('Tokyo', 'NRT'),
        ('Munich', 'MUC');

INSERT INTO public.flights (start_time, end_time, start_port, end_port)
VALUES  ('2023-02-10 10:00:00.000000', '2023-02-12 12:00:00.000000', 'JFK', 'NRT'),
        ('2023-01-30 13:00:00.000000', '2023-01-30 16:00:00.000000', 'LGA', 'LAX'),
        ('2023-01-30 17:00:00.000000', '2023-01-31 06:33:00.000000', 'LAX', 'HND'),
        ('2023-01-30 15:55:00.000000', '2023-01-31 04:20:00.000000', 'LAX', 'HND'),
        ('2023-03-03 04:00:00.000000', '2023-03-03 08:30:00.000000', 'JFK', 'CDG'),
        ('2023-03-03 08:30:00.000000', '2023-03-03 10:30:00.000000', 'CDG', 'MUC'),
        ('2023-03-03 10:40:00.000000', '2023-03-03 13:30:00.000000', 'MUC', 'HND');

