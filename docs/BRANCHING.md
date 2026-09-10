# Oatsense frontend — Git train

This repo follows the Oatmeal AI three-environment train. Do not rename these branches.

```text
feature/*  →  PR  →  GCP/frontend-staging  →  PR  →  GCP/frontend-testing  →  PR  →  main
                         staging Cloud Run              testing Cloud Run              production
```

| Branch | Cloud Run | GCP project | Workflow |
|--------|-----------|-------------|----------|
| `GCP/frontend-staging` | `oatsense-frontend-staging` | `oatmeal-farm-staging` | `deploy-staging.yml` |
| `GCP/frontend-testing` | `oatsense-frontend-testing` | `oatmeal-farm-staging` | `deploy-testing.yml` |
| `main` | **`oatsense-frontend-usa`** | `animated-flare-421518` (Oatmeal AI) | `deploy-prod.yml` |

Official Oatsense production Cloud Run is **`oatsense-frontend-usa`**. Do not invent `oatsense-frontend`.

Allowed PRs only: work → staging; staging → testing; testing → `main`.

`VITE_API_URL` is baked per environment (`STAGING_API_URL` / `TESTING_API_URL` / `PROD_API_URL`). Do not mix a staging frontend with a production API.

Staging and testing Actions stay fail-closed until `STAGING_*` / `TESTING_*` and Cloud Run exist in `oatmeal-farm-staging`. Staging WIF `github-pool` must trust this repo before Actions can authenticate.

Merge to `main` deploys `oatsense-frontend-usa` in Oatmeal AI (needs prod WIF on this repo). `cloudbuild.yaml` remains a fallback. Testing/staging Actions stay fail-closed until those Cloud Run services and WIF trust exist.
