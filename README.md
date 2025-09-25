# GA4 & Ads SQL Analysis (BigQuery + PostgreSQL)

## Tools / Інструменти
BigQuery, PostgreSQL, SQL

## Overview / Огляд
Analyzed ad spend and user behavior across GA4 and Ads datasets  
Проведено аналіз витрат на рекламу та поведінки користувачів на основі даних GA4 та рекламних кампаній

SQL queries explore session traffic, conversion funnels, landing page performance, and engagement correlation  
Запити охоплюють трафік сесій, воронки конверсій, ефективність посадкових сторінок та кореляцію залученості

Useful for benchmarking, campaign optimization, and BI-ready reporting  
Корисно для порівняння ефективності, оптимізації кампаній та підготовки звітів у BI-системах

## SQL Modules / SQL-модулі

0_ready_data.sql  
Extracts GA4 events for BI dashboards: session ID, country, device, traffic source  
Витягує події GA4 для BI-звітів: сесія, країна, пристрій, джерело трафіку

Conversion_by_channel.sql  
Calculates funnel conversion rates by date and traffic channel  
Розраховує конверсії по воронці в розрізі дат і каналів трафіку

Landing_page_comparison.sql  
Compares conversion rates across landing pages  
Порівнює конверсії між різними посадковими сторінками

Engagement_correlation.sql  
Measures correlation between user engagement and purchases  
Вимірює кореляцію між залученістю користувачів і покупками

## SQL Environment / Середовище виконання SQL
Google BigQuery — on GA4 public sample datasets  
PostgreSQL — for local testing and BI-ready table preparation  
Google BigQuery — на публічних даних GA4  
PostgreSQL — для локального тестування та підготовки таблиць

Direct links to BigQuery queries are not available  
Прямі посилання на запити BigQuery не надаються

All SQL logic is available in the sql/ folder for reproducibility  
Уся SQL-логіка доступна у папці sql/ для відтворення

## Outcome / Результат
Delivered a modular SQL framework for analyzing ad performance and user engagement  
Створено модульну SQL-структуру для аналізу ефективності реклами та поведінки користувачів
