--Порівняння конверсії між різними посадковими сторінками
WITH user_sessions AS (
    SELECT  
        user_pseudo_id || COALESCE(CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS STRING), '') AS user_session_id,  
        REGEXP_EXTRACT(
            (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location'),  
            r"(?:\w+\:\/\/)?[^\/]+\/([^\?#]*)"
        ) AS page_path,  
        (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') AS page_location  
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`  
    WHERE _TABLE_SUFFIX BETWEEN '20200101' AND '20201231'  
        AND event_name = 'session_start'  
),

purchases AS (
    SELECT DISTINCT 
        user_pseudo_id || COALESCE(CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS STRING), '') AS user_session_id  
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`  
    WHERE _TABLE_SUFFIX BETWEEN '20200101' AND '20201231'  
        AND event_name = 'purchase'  
),

final_result AS (
    SELECT  
        us.page_path,  
        COUNT(DISTINCT us.user_session_id) AS sessions_count,  
        COUNT(DISTINCT p.user_session_id) AS purchases_count,  
        ROUND(COUNT(DISTINCT p.user_session_id) / COUNT(DISTINCT us.user_session_id), 4) AS cr_to_purchase  
    FROM user_sessions us  
    LEFT JOIN purchases p ON us.user_session_id = p.user_session_id  
    GROUP BY us.page_path  
)

SELECT * FROM final_result  
ORDER BY sessions_count DESC;
