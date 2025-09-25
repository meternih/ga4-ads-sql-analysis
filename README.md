# 📊 GA4 & Ads SQL Analysis (BigQuery + PostgreSQL)

## 🛠 Tools / Інструменти
BigQuery, PostgreSQL, SQL

## 📝 Overview / Огляд
Analyzed ad spend and user behavior across GA4 and Ads datasets.  
Проведено аналіз витрат на рекламу та поведінки користувачів на основі даних GA4 та рекламних кампаній.

Calculated funnel conversions, landing page performance, and engagement metrics.  
Розраховано конверсії по воронці, ефективність лендингів та метрики залучення.

Prepared BI-ready tables for visualization and strategic reporting.  
Підготовлено BI-ready таблиці для візуалізації та стратегічної аналітики.

## 📂 SQL Modules / SQL-модулі
- `ga4_user_engagement.sql` — scroll depth, session duration, bounce rate  
  → глибина скролу, тривалість сесії, bounce rate

- `ads_spend_by_campaign.sql` — ad cost, impressions, ROAS  
  → витрати, покази, ROAS

- `funnel_conversion_analysis.sql` — landing → signup → purchase  
  → етапи: лендинг → реєстрація → покупка

- `landing_page_performance.sql` — CTR, time on page, exit rate  
  → CTR, час на сторінці, exit rate

## 🔗 SQL Environment / Середовище виконання SQL
Queries were executed in:
- **Google BigQuery** — for GA4 and Ads datasets  
- **PostgreSQL** — for local testing and BI-ready table preparation

Запити виконувались у:
- **Google BigQuery** — для даних GA4 та рекламних кампаній  
- **PostgreSQL** — для локального тестування та підготовки таблиць для BI

Due to access restrictions, direct links to BigQuery queries are not available.  
Через обмеження доступу прямі посилання на запити BigQuery не надаються.

However, all SQL logic is included in the `/sql/` folder for reproducibility.  
Однак уся SQL-логіка доступна у папці `/sql/` для відтворення.

## 🎯 Outcome / Результат
Delivered a modular SQL framework for analyzing ad performance and user engagement.  
Створено модульну SQL-структуру для аналізу ефективності реклами та поведінки користувачів.

Enabled marketing teams to evaluate campaign efficiency and optimize landing pages.  
Аналітика дозволяє маркетинговим командам оцінювати кампанії та оптимізувати лендинги.
