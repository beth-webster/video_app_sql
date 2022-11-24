--STORED PROCEDURES/TRIGGERS

-- Disable account if payment is not received
CREATE FUNCTION core.no_payment_disable() RETURNS trigger AS $$
    BEGIN
		IF EXISTS (SELECT *
				   FROM core.transactions
				   WHERE NEW.successful = false)
		THEN
			UPDATE core.accounts
			SET enabled = FALSE
			WHERE (SELECT account_id
					FROM transactions
					WHERE NEW.successful = false) = accounts.account_id;
			RETURN NEW;
		ELSIF EXISTS (SELECT *
				   FROM core.transactions
				   WHERE NEW.successful = true)
		THEN
			UPDATE core.accounts
			SET enabled = true
			WHERE (SELECT account_id
					FROM core.transactions
					WHERE NEW.successful = true) = accounts.account_id;
			RETURN NEW;
		END IF;
    END;
$$ 
LANGUAGE 'plpgsql';

--Trigger no_payment_disable() function when an insert or update are completed on attempted_transactions
CREATE TRIGGER trig_payment BEFORE INSERT OR UPDATE ON core.transactions
        FOR EACH ROW 
        EXECUTE PROCEDURE core.no_payment_disable();
