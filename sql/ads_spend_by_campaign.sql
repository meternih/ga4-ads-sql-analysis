-- Аналіз витрат на рекламу по кампаніях
-- Розрахунок ROAS, показів, кліків і витрат

SELECT
  campaign_name,                                  -- Назва кампанії
  SUM(ad_cost) AS total_cost,                     -- Загальні витрати
  SUM(impressions) AS total_impressions,          -- Кількість показів
  SUM(clicks) AS total_clicks,                    -- Кількість кліків
  SUM(conversions) AS total_conversions,          -- Кількість конверсій
  SAFE_DIVIDE(SUM(revenue), SUM(ad_cost)) AS roas -- Повернення на витрати

FROM `project.dataset.ads_data`
GROUP BY campaign_name
ORDER BY total_cost DESC;
