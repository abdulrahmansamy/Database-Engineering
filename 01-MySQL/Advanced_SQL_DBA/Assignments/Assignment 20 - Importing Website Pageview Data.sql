USE mavenbearbuilders;

CREATE TABLE website_pageviews (
	website_pageview_id BIGINT,
    created_at DATETIME,
    website_session_id BIGINT,
    pageview_url VARCHAR(50),
    PRIMARY KEY (website_pageview_id)
)
;

SELECT * FROM website_pageviews;
