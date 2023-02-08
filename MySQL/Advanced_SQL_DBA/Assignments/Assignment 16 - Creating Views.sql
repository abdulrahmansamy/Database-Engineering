USE mavenbearbuilders;
 
SELECT * FROM website_sessions;

CREATE VIEW monthly_sessions
AS
SELECT 
	YEAR(created_at) as year,
	MONTH(created_at) as month,
	utm_source,
	utm_campaign,
	COUNT(website_session_id) AS number_of_sessions
FROM website_sessions
GROUP BY 1,2,3,4
;

SELECT * FROM monthly_sessions;


SHOW FULL TABLES IN mavenbearbuilders WHERE TABLE_TYPE LIKE 'VIEW';

SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'VIEW';