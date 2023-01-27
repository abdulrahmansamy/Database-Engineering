USE mavenfuzzyfactorymini;


SELECT * FROM website_pageviews_non_normalized;

SELECT * FROM website_pageviews_non_normalized
WHERE website_session_id = 20;

CREATE TABLE website_pageviews_normalized
SELECT 
	website_pageview_id,
    created_at,
    website_session_id,
    pageview_url
FROM website_pageviews_non_normalized;

SELECT * FROM website_pageviews_normalized;

CREATE TABLE website_sessions__normalized
SELECT DISTINCT
	website_session_id,
    session_created_at,
    user_id,
    is_repeat_session,
    utm_source,
    utm_campaign,
    utm_content,
    device_type,
    http_referer
FROM website_pageviews_non_normalized;

SELECT * FROM website_sessions__normalized;

ALTER TABLE `mavenfuzzyfactorymini`.`website_sessions__normalized` 
ADD PRIMARY KEY (`website_session_id`);

ALTER TABLE `mavenfuzzyfactorymini`.`website_pageviews_normalized` 
ADD PRIMARY KEY (`website_pageview_id`);

ALTER TABLE `mavenfuzzyfactorymini`.`website_pageviews_normalized` 
ADD INDEX `website_session_id_idx` (`website_session_id` ASC) VISIBLE;
;
ALTER TABLE `mavenfuzzyfactorymini`.`website_pageviews_normalized` 
ADD CONSTRAINT `website_session_id`
  FOREIGN KEY (`website_session_id`)
  REFERENCES `mavenfuzzyfactorymini`.`website_sessions__normalized` (`website_session_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



