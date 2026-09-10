# Oatsense frontend — Git train

```text
feature/*  →  GCP/frontend-staging  →  GCP/frontend-testing  →  main
                 oatsense-frontend-staging   oatsense-frontend-testing   oatsense-frontend
```

Feature PRs go to `GCP/frontend-staging` only.

`VITE_API_URL` is baked per environment (`STAGING_API_URL` / `TESTING_API_URL` / `PROD_API_URL`). Today the runbook points at the OFN main backend; it may later point at the oatsense BFF (`oatmeal-oatsense-*`). Do not mix a staging frontend with a production API.

Staging, testing, and production Actions stay fail-closed until the matching secrets/vars and Cloud Run services exist. `cloudbuild.yaml` remains the production fallback.
