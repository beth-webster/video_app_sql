--Create logging schema
CREATE SCHEMA logging;

--Create history table where changes to the DB will be logged
CREATE TABLE logging.history (
      log_id            SERIAL
    , timestamp         TIMESTAMP       DEFAULT NOW()
    , schema_name       TEXT
    , table_name        TEXT
    , operation         TEXT
    , who               TEXT            DEFAULT current_user
    , new_value         JSON
    , old_value         JSON
);

--Stored procedure to automatically update the history table with DB changes
CREATE FUNCTION logging.change_trigger() RETURNS trigger AS $$
    BEGIN
        IF      TG_OP = 'INSERT'
        THEN
            INSERT INTO logging.history (table_name, schema_name, operation, new_value)
                    VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(NEW));
            RETURN NEW;
        ELSIF   TG_OP = 'UPDATE'
        THEN
            INSERT INTO logging.history (table_name, schema_name, operation, new_value, old_value)
                    VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP,
                            row_to_json(NEW), row_to_json(OLD));
            RETURN NEW;
        ELSIF   TG_OP = 'DELETE'
        THEN
            INSERT INTO logging.history (table_name, schema_name, operation, old_value)
                    VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(OLD));
            RETURN OLD;
        END IF;
    END;
$$ LANGUAGE 'plpgsql' SECURITY DEFINER;


--Trigger change_trigger() for each table when an operation is performed
CREATE TRIGGER log_trig_res BEFORE INSERT OR UPDATE OR DELETE ON core.restrictions
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();

CREATE TRIGGER log_trig_vid BEFORE INSERT OR UPDATE OR DELETE ON core.videos
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();
		
CREATE TRIGGER log_trig_tra BEFORE INSERT OR UPDATE OR DELETE ON core.transactions
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();

CREATE TRIGGER log_trig_pay BEFORE INSERT OR UPDATE OR DELETE ON core.payment_details
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();

CREATE TRIGGER log_trig_sub BEFORE INSERT OR UPDATE OR DELETE ON core.subscriptions
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();

CREATE TRIGGER log_trig_acc BEFORE INSERT OR UPDATE OR DELETE ON core.accounts
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();

CREATE TRIGGER log_trig_use BEFORE INSERT OR UPDATE OR DELETE ON core.users
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();

CREATE TRIGGER log_trig_wat BEFORE INSERT OR UPDATE OR DELETE ON core.watching
        FOR EACH ROW EXECUTE PROCEDURE logging.change_trigger();