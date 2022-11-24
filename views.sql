--VIEWS

--average viewing times
CREATE VIEW core.vw_avg_watch_time AS
SELECT 	  vid.title as title
		, AVG(EXTRACT(EPOCH FROM (wat.end_datetime - wat.start_datetime))) AS avgerage_seconds_to_watch
FROM core.watching wat
INNER JOIN core.videos vid ON vid.video_id = wat.video_id
GROUP BY vid.title;


--video watches per region
CREATE VIEW core.vw_watches_per_region AS
SELECT substr(acc.postcode,1,2) as region
		, vid.title
		, vid.genre
		, COUNT(vid.title) AS number_of_watches
FROM core.accounts ACC
INNER JOIN core.users usr ON usr.account_id = acc.account_id
INNER JOIN core.watching wat ON wat.user_id = usr.user_id
INNER JOIN core.videos vid ON vid.video_id = wat.video_id
GROUP BY substr(acc.postcode,1,2), vid.title, vid.genre;


--genres by age viewing
CREATE VIEW core.vw_genre_ages AS
SELECT   vid.genre
		, DATE_PART('year', now()) - DATE_PART('year', usr.date_of_birth) AS age
		, COUNT(DATE_PART('year', now()) - DATE_PART('year', usr.date_of_birth)) AS number_of_watches
FROM core.users usr
INNER JOIN core.watching wat ON wat.user_id = usr.user_id
INNER JOIN core.videos vid ON vid.video_id = wat.video_id
GROUP BY vid.genre, DATE_PART('year', now()) - DATE_PART('year', usr.date_of_birth)
ORDER BY DATE_PART('year', now()) - DATE_PART('year', usr.date_of_birth) ASC;