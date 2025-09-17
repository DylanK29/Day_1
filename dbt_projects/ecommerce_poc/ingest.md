Ingestion quickstart (CSV on GitHub → Airbyte → Snowflake RAW)

GitHub CSV (raw URL) → Airbyte File source → Snowflake RAW. Normalization: Basic ON. dbt reads RAW.ORDERS into SILVER orders → GOLD gold_daily_kpis.

Docker + Airbyte running, Snowflake role/user (AIRBYTE_INGEST), WH_INGEST_XS with auto-suspend, .env not in Git.

Steps:

    Create File source with raw GitHub URL, CSV, header true.
    Destination: Snowflake (account, user, role, warehouse, db, schema).
    Connection: Full refresh/Overwrite, Basic normalization ON.
    Run manual sync.
    Verify SQL:
        show tables in RAW;
        select count(*) from RAW.ORDERS;
        select * from RAW.ORDERS limit 5;

dbt wiring:

    sources.yml with RAW.ORDERS
    stg_orders.sql selecting/typing columns
    dbt run commands

Security/cost: least-privilege role, autosuspend 60–120s, secrets only in Airbyte, not in repo.
Maintenance: add more streams; later switch to incremental.