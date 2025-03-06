-- You can modify the template so all new databases will have desirable collation --
-- ALTER database template1 is_template=false;
-- DROP database template1;
-- CREATE DATABASE template1
-- WITH OWNER = root
--    ENCODING = 'UTF8'
--    TABLESPACE = pg_default
--    LC_COLLATE = 'en_US.UTF-8'
--    LC_CTYPE = 'en_US.UTF-8'
--    CONNECTION LIMIT = -1
--    TEMPLATE template0;
-- ALTER database template1 is_template=true;

-- Create app database --
CREATE DATABASE app;
