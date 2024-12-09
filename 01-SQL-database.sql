USE gans;

CREATE TABLE city (
    city_id INT AUTO_INCREMENT
    , city_name VARCHAR(255) NOT NULL
    , PRIMARY KEY (city_id)
);

CREATE TABLE city_info_static (
    city_info_static_id INT AUTO_INCREMENT
    , city_id INT NOT NULL UNIQUE
    , country VARCHAR(32)
    , latitude VARCHAR(32)
    , longitude VARCHAR(32)
    , latitude_num NUMERIC(9,6) NOT NULL
    , longitude_num NUMERIC(9,6) NOT NULL
    , website VARCHAR(255)
    , PRIMARY KEY (city_info_static_id)
    , FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE city_info_time (
    city_info_time_id INT AUTO_INCREMENT
    , city_id INT NOT NULL
    , area_city_km2 VARCHAR(255)
    , population INT
    , timestamp DATETIME
    , PRIMARY KEY (city_info_time_id)
    , FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE weather (
    weather_id INT AUTO_INCREMENT
    , city_id INT NOT NULL
    , temperature NUMERIC(4,2)
    , weather VARCHAR(255)
    , weather2 VARCHAR(255)
    , clouds INT
    , wind NUMERIC(5,2)
    , gust NUMERIC(5,2)
    , visibility INT
    , rain NUMERIC(5,2)
    , snow NUMERIC(5,2)
    , forecast_for DATETIME NOT NULL
    , forecast_timestamp DATETIME NOT NULL
    , PRIMARY KEY (weather_id)
    , FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE airport (
    airport_id INT AUTO_INCREMENT
    , city_id INT NOT NULL
    , icao VARCHAR(4) NOT NULL
    , iata VARCHAR(3) NOT NULL
    , airport_name VARCHAR(255)
    , airport_name_short VARCHAR(32)
    , PRIMARY KEY (airport_id)
    , FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE flight (
    flight_id INT AUTO_INCREMENT
    , airport_id INT NOT NULL
    , bound VARCHAR(8) NOT NULL
    , number VARCHAR(8) NOT NULL
    , status VARCHAR(32) NOT NULL
    , departure_airport_icao VARCHAR(4)
    , departure_airport_iata VARCHAR(3)
    , departure_airport_name VARCHAR(255)
    , arrival_scheduledTime_local DATETIME NOT NULL
    , arrival_revisedTime_local DATETIME NOT NULL
    , aircraft_model VARCHAR(32)
    , airline_name VARCHAR(32)
    , airline_icao VARCHAR(4)
    , airline_iata VARCHAR(3)
    , flight_key VARCHAR(255) UNIQUE
    , PRIMARY KEY (flight_id)
    , FOREIGN KEY (airport_id) REFERENCES airport(airport_id)
);