--Розрахунок конверсій в розрізі дат та каналів трафіку
WITH base_data AS (
    SELECT  
        DATE(TIMESTAMP_MICROS(event_timestamp)) AS event_date,  
        user_pseudo_id,  
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS session_id,  
        event_name,  
        traffic_source.source,  
        traffic_source.medium,  
        traffic_source.name AS campaign  
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`  
    WHERE  
        _TABLE_SUFFIX BETWEEN '20210101' AND '20211231'  
        AND event_name IN ('session_start', 'add_to_cart', 'begin_checkout', 'purchase')  
),
aggregated_data AS (
    SELECT  
        event_date,  
        source,  
        medium,  
        campaign,  
        COUNT(DISTINCT CONCAT(user_pseudo_id, session_id)) AS user_sessions_count,  
        ROUND(
            COUNT(DISTINCT IF(event_name = 'add_to_cart', CONCAT(user_pseudo_id, session_id), NULL)) / 
            COUNT(DISTINCT CONCAT(user_pseudo_id, session_id)), 4
        ) AS visit_to_cart,  
        ROUND(
            COUNT(DISTINCT IF(event_name = 'begin_checkout', CONCAT(user_pseudo_id, session_id), NULL)) / 
            COUNT(DISTINCT CONCAT(user_pseudo_id, session_id)), 4
        ) AS visit_to_checkout,  
        ROUND(
            COUNT(DISTINCT IF(event_name = 'purchase', CONCAT(user_pseudo_id, session_id), NULL)) / 
            COUNT(DISTINCT CONCAT(user_pseudo_id, session_id)), 4
        ) AS visit_to_purchase  
    FROM base_data  
    GROUP BY event_date, source, medium, campaign  
)
SELECT * FROM aggregated_data  
ORDER BY event_date DESC;
