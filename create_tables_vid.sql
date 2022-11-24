--create all tables in core schema
CREATE TABLE core.restrictions (
      restriction_id    SERIAL          NOT NULL    PRIMARY KEY
    , reason            VARCHAR(50)     NOT NULL
    , minimum_age       INT             NOT NULL
);

CREATE TABLE core.videos (
      video_id          SERIAL          NOT NULL    PRIMARY KEY
    , title             VARCHAR(50)     NOT NULL
    , runtime           INT             NOT NULL
    , director          VARCHAR(50)     NOT NULL
    , genre             VARCHAR(50)     NOT NULL
    , release_date      DATE            NOT NULL
    , description       TEXT            NOT NULL
    , link              VARCHAR(200)    NOT NULL
    , restiction_id     INT             NOT NULL
, CONSTRAINT fk_restrictions FOREIGN KEY(restiction_id) REFERENCES core.restrictions(restriction_id)
);

CREATE TABLE core.subscriptions (
      subscription_id   SERIAL          NOT NULL    PRIMARY KEY
    , subscription_name VARCHAR(50)     NOT NULL
    , price_per_month   MONEY           NOT NULL
);

CREATE TABLE core.accounts (
      account_id        SERIAL          NOT NULL    PRIMARY KEY
    , first_name        VARCHAR(50)     NOT NULL
    , last_name         VARCHAR(50)     NOT NULL
    , email             VARCHAR(100)    NOT NULL
    , address           VARCHAR(150)    NOT NULL
    , postcode          VARCHAR(8)      NOT NULL
    , enabled           BOOLEAN         NOT NULL    DEFAULT FALSE
    , subscription_id   INT             NOT NULL
, CONSTRAINT fk_subscriptions FOREIGN KEY(subscription_id) REFERENCES core.subscriptions(subscription_id)
);

CREATE TABLE core.transactions (
      transaction_id    SERIAL          NOT NULL    PRIMARY KEY
    , account_id        INT             NOT NULL
    , timestamp         TIMESTAMP       NOT NULL    DEFAULT NOW()
    , successful        BOOLEAN         NOT NULL
, CONSTRAINT fk_transactions FOREIGN KEY(account_id) REFERENCES core.accounts(account_id)
);

CREATE TABLE core.payment_details (
      payment_id        SERIAL          NOT NULL    PRIMARY KEY
    , account_id        INT             NOT NULL
    , name_on_account   VARCHAR(50)     NOT NULL
    , bank_name         VARCHAR(50)     NOT NULL
    , bank_address      VARCHAR(150)    NOT NULL
    , account_number    INT             NOT NULL
    , sort_code         INT             NOT NULL
, CONSTRAINT fk_payment_details FOREIGN KEY(account_id) REFERENCES core.accounts(account_id)
);

CREATE TABLE core.users (
      user_id           SERIAL          NOT NULL    PRIMARY KEY
    , account_id        INT             NOT NULL
    , username          VARCHAR(50)     NOT NULL
    , date_of_birth     DATE            NOT NULL
, CONSTRAINT fk_users FOREIGN KEY(account_id) REFERENCES core.accounts(account_id)
);

CREATE TABLE core.watching (
	    watch_id			    SERIAL			    NOT NULL    PRIMARY KEY
    , user_id           INT             NOT NULL
    , video_id          INT             NOT NULL
    , start_datetime    TIMESTAMP       NOT NULL    DEFAULT NOW()
    , end_datetime      TIMESTAMP
    , completed_runtime INT
, CONSTRAINT fk_user_watching FOREIGN KEY(user_id) REFERENCES core.users(user_id)
, CONSTRAINT fk_video_watching FOREIGN KEY(video_id) REFERENCES core.videos(video_id)
);