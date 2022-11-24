CREATE GROUP dba;

CREATE GROUP admin;

CREATE GROUP analyst;

CREATE GROUP developer;

CREATE GROUP finance;

GRANT TO dba;

GRANT ALL PRIVILEGES ON DATABASE video_app TO admin;

GRANT SELECT ON   core.vw_avg_watch_time
				, core.vw_watches_per_region
				, core.vw_genre_ages
				, core.watching 
TO analyst;

GRANT SELECT, INSERT ON core.videos TO developer;

GRANT UPDATE (link) ON core.videos TO developer;

GRANT SELECT, INSERT, UPDATE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA core TO dba;

GRANT SELECT ON logging.history TO dba;

GRANT SELECT ON   core.accounts
				, core.payment_details
TO finance;

GRANT INSERT, UPDATE, SELECT ON   core.subscriptions 
								, core.transactions
TO finance;