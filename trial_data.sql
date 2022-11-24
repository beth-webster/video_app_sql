INSERT INTO core.subscriptions (subscription_id, subscription_name, price_per_month)
	VALUES (DEFAULT, 'Standard', '10');

INSERT INTO core.subscriptions (subscription_id, subscription_name, price_per_month)
	VALUES (DEFAULT, 'Premium', '15');
	
INSERT INTO core.accounts (account_id, first_name, last_name, email, address, postcode, enabled, subscription_id)
	VALUES (DEFAULT, 'Beth', 'Lockwood', 'beth@email.com', '11 this street', 'POST 222', DEFAULT, 1);

INSERT INTO core.accounts (account_id, first_name, last_name, email, address, postcode, enabled, subscription_id)
	VALUES (DEFAULT, 'Jess', 'Webster', 'jess@email.com', '9 that street', 'LOST 333', DEFAULT, 1);

INSERT INTO core.accounts (account_id, first_name, last_name, email, address, postcode, enabled, subscription_id)
	VALUES (DEFAULT, 'Michael', 'Warrington', 'michael@email.com', '33 this road', 'MOST 888', DEFAULT, 2);
	
INSERT INTO core.transactions (transaction_id, account_id, timestamp, successful)
	VALUES (DEFAULT, '1', DEFAULT, TRUE);

INSERT INTO core.transactions (transaction_id, account_id, timestamp, successful)
	VALUES (DEFAULT, '2', DEFAULT, TRUE);

INSERT INTO core.restrictions(restriction_id, reason, minimum_age)
    VALUES(DEFAULT, 'None', 0);

INSERT INTO core.restrictions(restriction_id, reason, minimum_age)
    VALUES(DEFAULT, 'Teen', 13);

INSERT INTO core.restrictions(restriction_id, reason, minimum_age)
    VALUES(DEFAULT, 'Adult', 18);

INSERT INTO core.payment_details(payment_id, account_id, name_on_account, bank_name, bank_address, account_number, sort_code)
    VALUES(DEFAULT, 1, 'B LOCKWOOD', 'Bank1', '1 Bank Street', '123456789', '010101');

INSERT INTO core.payment_details(payment_id, account_id, name_on_account, bank_name, bank_address, account_number, sort_code)
    VALUES(DEFAULT, 2, 'J WEBSTER', '2nd Bank', '2 Bank Road', '987654321', '020202');

INSERT INTO core.payment_details(payment_id, account_id, name_on_account, bank_name, bank_address, account_number, sort_code)
    VALUES(DEFAULT, 3, 'M WARRINGTON', 'Bank no3', '3 Bank Lane', '567891234', '030303');

INSERT INTO core.videos(video_id, title, runtime, director, genre, release_date, description, link, restiction_id)
    VALUES(DEFAULT, 'Lilo & Stitch', 6000, 'Ric Sluiter', 'Kids', TO_DATE('04/10/2002', 'DD/MM/YYYY'), 'Walt Disney film', '/thebestfilmever', 1);

INSERT INTO core.videos(video_id, title, runtime, director, genre, release_date, description, link, restiction_id)
    VALUES(DEFAULT, 'Monsters Inc', 5500, 'Pete Docter', 'Kids', TO_DATE('08/02/2002', 'DD/MM/YYYY'), 'Walt Disney film', '/alwayswatching', 1);

INSERT INTO core.videos(video_id, title, runtime, director, genre, release_date, description, link, restiction_id)
    VALUES(DEFAULT, 'Police Academy', 6000, 'Hugh Wilson', 'Comedy', TO_DATE('23/03/1984', 'DD/MM/YYYY'), 'Warner Home Video comedy', '/michaellovespoliceacademy', 2);

INSERT INTO core.videos(video_id, title, runtime, director, genre, release_date, description, link, restiction_id)
    VALUES(DEFAULT, 'Spirited', 7000, 'Sean Anders', 'Comedy', TO_DATE('18/11/2022', 'DD/MM/YYYY'), 'Apple Original Film', '/christmasishere', 2);

INSERT INTO core.videos(video_id, title, runtime, director, genre, release_date, description, link, restiction_id)
    VALUES(DEFAULT, 'The Hunger Games', 6500, 'Gary Ross', 'Action', TO_DATE('23/03/2012', 'DD/MM/YYYY'), 'Lionsgate movie', '/thehangingtree', 2);

INSERT INTO core.videos(video_id, title, runtime, director, genre, release_date, description, link, restiction_id)
    VALUES(DEFAULT, 'The Wolf of Wall Street', 6500, 'Martin Scorsese', 'Crime', TO_DATE('17/01/2014', 'DD/MM/YYYY'), 'Paramount Pictures', '/leoonwallstreet', 3);

INSERT INTO core.videos(video_id, title, runtime, director, genre, release_date, description, link, restiction_id)
    VALUES(DEFAULT, 'A Nightmare On Elm Street', 7500, 'Wes Craven', 'Horror', TO_DATE('12/07/1985', 'DD/MM/YYYY'), 'Warner Home Video horror', '/dontfallasleep', 3);

INSERT INTO core.users(user_id, account_id, username, date_of_birth)
    VALUES(DEFAULT, 1, 'beth123', TO_DATE('30/09/1999', 'DD/MM/YYYY'));

INSERT INTO core.users(user_id, account_id, username, date_of_birth)
    VALUES(DEFAULT, 1, 'summer223', TO_DATE('16/09/1993', 'DD/MM/YYYY'));

INSERT INTO core.users(user_id, account_id, username, date_of_birth)
    VALUES(DEFAULT, 1, 'bodhi323', TO_DATE('24/11/2020', 'DD/MM/YYYY'));

INSERT INTO core.users(user_id, account_id, username, date_of_birth)
    VALUES(DEFAULT, 2, 'jess345', TO_DATE('09/08/2004', 'DD/MM/YYYY'));

INSERT INTO core.users(user_id, account_id, username, date_of_birth)
    VALUES(DEFAULT, 2, 'paula445', TO_DATE('12/04/1972', 'DD/MM/YYYY'));

INSERT INTO core.users(user_id, account_id, username, date_of_birth)
    VALUES(DEFAULT, 2, 'bren545', TO_DATE('22/08/1972', 'DD/MM/YYYY'));

INSERT INTO core.users(user_id, account_id, username, date_of_birth)
    VALUES(DEFAULT, 3, 'michael567', TO_DATE('03/08/1990', 'DD/MM/YYYY'));

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 1, 1, '2022-10-05 14:01:10-08', '2022-10-06 11:11:13-08', 6000);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 2, 5, '2022-09-05 14:01:10-08', '2022-09-05 19:12:17-08', 6500);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 3, 2, '2022-11-05 10:01:10-08', '2022-12-05 15:02:15-08', 5500);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 4, 7, '2022-10-05 10:01:10-08', '2022-10-05 12:22:15-08', 7500);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 5, 4, '2022-10-05 19:11:10-08', '2022-10-06 20:41:33-08', 7000);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 6, 6, '2022-07-05 14:01:10-08', '2022-07-05 16:12:17-08', 6500);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 7, 3, '2022-11-05 10:36:45-08', '2022-12-05 12:10:15-08', 6000);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 1, 7, '2022-01-05 10:01:10-08', '2022-01-07 09:22:15-08', 7500);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 2, 6, '2022-06-22 10:40:45-08', '2022-06-25 13:10:15-08', 6500);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, end_datetime, completed_runtime)
    VALUES(DEFAULT, 3, 1, '2022-03-15 10:01:10-08', '2022-03-15 23:26:55-08', 6000);
   
INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, completed_runtime)
    VALUES(DEFAULT, 4, 1, '2022-11-05 14:01:10-08', 5600);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, completed_runtime)
    VALUES(DEFAULT, 4, 4, '2022-10-16 16:01:09-08', 3500);

INSERT INTO core.watching(watch_id, user_id, video_id, start_datetime, completed_runtime)
    VALUES(DEFAULT, 5, 5, '2022-11-01 19:56:20-08', 1600);
