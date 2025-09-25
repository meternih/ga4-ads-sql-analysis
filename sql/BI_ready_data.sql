--Підготовка даних для побудови звітів у BI системах.
SELECT  
  TIMESTAMP_MICROS(event_timestamp) AS event_timestamp,  
  user_pseudo_id,  
  geo.country,  
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS session_id,  
  event_name,  
  device.category AS device_category,  
  traffic_source.source,  
  traffic_source.medium,  
  traffic_source.name AS campaign  
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`  
WHERE  
  _TABLE_SUFFIX BETWEEN '20210101' AND '20211231'  
  AND event_name IN (  
        'session_start', 'view_item', 'add_to_cart',  
        'begin_checkout', 'add_shipping_info',  
        'add_payment_info', 'purchase'  
    )
