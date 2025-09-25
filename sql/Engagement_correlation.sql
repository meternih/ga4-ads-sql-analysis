--Завдання* Перевірка кореляції між залученістю користувачів та здійсненням покупок (виконання необовʼязкове, за бажанням)
WITH session_stats AS (
  SELECT
    user_pseudo_id,
    COALESCE(CAST((SELECT value.int_value 
                   FROM UNNEST(event_params) 
                   WHERE key = 'ga_session_id') AS STRING), '0') AS session_id,
    MAX(IF((SELECT value.string_value 
            FROM UNNEST(event_params) 
            WHERE key = 'session_engaged') = '1', 1, 0)) AS session_engaged,
    SUM(COALESCE((SELECT value.int_value 
                  FROM UNNEST(event_params) 
                  WHERE key = 'engagement_time_msec'), 0)) AS total_engagement_time,
    MAX(IF(event_name = 'purchase', 1, 0)) AS purchase_event
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE _TABLE_SUFFIX BETWEEN '20200101' AND '20201231'
  GROUP BY user_pseudo_id, session_id
),

correlations AS (
  SELECT
    CORR(session_engaged, purchase_event) AS correlation_engaged_vs_purchase,
    CORR(total_engagement_time, purchase_event) AS correlation_time_vs_purchase
  FROM session_stats
)

SELECT * FROM correlations;
