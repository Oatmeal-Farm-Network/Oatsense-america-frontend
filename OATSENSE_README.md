# OatSense America frontend (Precision Ag independent)

**API:** use the **main** `oatmealfarmnetworkbackend` Cloud Run / local unified server —  
not the `precision-ag-independent` backend branch.

Repo: https://github.com/Oatmeal-Farm-Network/Oatsense-america-frontend

## Local run

```bash
npm install
npm run dev:precision
```

Requires main backend on `http://127.0.0.1:8000` (see `.env.precision-ag`).

## Cloud Build / Cloud Run

```bash
gcloud builds submit --config cloudbuild.yaml .
gcloud run deploy oatsense-frontend \
  --image us-central1-docker.pkg.dev/animated-flare-421518/cloud-run-source-deploy/oatsense-frontend \
  --region us-central1 --platform managed --allow-unauthenticated --port 8080
```

`VITE_PRECISION_AG_ONLY=true` — non–Precision Ag routes redirect into Precision Ag.  
`_API_URL` in `cloudbuild.yaml` must stay the **main** backend URL.

## Field Twin note

This branch does not yet include `src/precision-ag/field-twin` (that lives in the main OFN frontend tree). Merge later if Twin is required on OatSense.
