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

BI_ready_data.sql  
Витягує події GA4 для BI-звітів: сесія, країна, пристрій, джерело трафіку

Conversion_by_channel.sql  
Розраховує конверсії по воронці в розрізі дат і каналів трафіку

Landing_page_comparison.sql  
Порівнює конверсії між різними посадковими сторінками

Engagement_correlation.sql  
Вимірює кореляцію між залученістю користувачів і покупками

## SQL Environment / Середовище виконання SQL
Google BigQuery — на публічних даних GA4  
PostgreSQL — для локального тестування та підготовки таблиць

Прямі посилання на запити BigQuery не надаються  
Уся SQL-логіка доступна у папці sql/ для відтворення

## Outcome / Результат
Створено модульну SQL-структуру для аналізу ефективності реклами та поведінки користувачів  
Аналітика дозволяє маркетинговим командам оцінювати кампанії та оптимізувати лендинги
