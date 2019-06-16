-- This resets the bitumdata_simnet database.

DROP DATABASE IF EXISTS bitumdata_simnet;
DROP USER IF exists bitumdata_simnet_stooge;

CREATE USER bitumdata_simnet_stooge PASSWORD 'pass';
CREATE DATABASE bitumdata_simnet OWNER bitumdata_simnet_stooge;
