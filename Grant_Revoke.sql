CREATE USER 'demo_user'@'localhost' IDENTIFIED BY 'demo123';

GRANT SELECT, INSERT ON MovieBookingDB.User TO 'demo_user'@'localhost';

SHOW GRANTS FOR 'demo_user'@'localhost';

REVOKE INSERT ON MovieBookingDB.User FROM 'demo_user'@'localhost';

SHOW GRANTS FOR 'demo_user'@'localhost';
