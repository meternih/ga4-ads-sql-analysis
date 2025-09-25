-- Аналіз залучення користувачів у GA4
-- Витягуємо глибину скролу, тривалість сесії та bounce rate

SELECT
  user_pseudo_id,                                   -- Унікальний ID користувача
  event_date,                                       -- Дата події
  MAX(IF(event_name = 'scroll', 1, 0)) AS scrolled, -- Чи користувач скролив
  MAX(session_engaged) AS session_engaged,          -- Чи сесія була залученою
  AVG(session_duration) AS avg_session_duration,    -- Середня тривалість сесії
  COUNTIF(event_name = 'bounce') AS bounce_count    -- Кількість bounce-подій

FROM `project.dataset.ga4_events`
GROUP BY user_pseudo_id, event_date
ORDER BY event_date;
