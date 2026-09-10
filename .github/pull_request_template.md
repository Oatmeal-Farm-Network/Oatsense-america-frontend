## Hop

- [ ] Feature / fix → `GCP/frontend-staging`
- [ ] `GCP/frontend-staging` → `GCP/frontend-testing`
- [ ] `GCP/frontend-testing` → `main`

Do **not** open a feature PR into testing or `main`.

## Summary

-

## Checks

- [ ] CI is green (`npm ci`, lint, `vite build --mode precision-ag`)
- [ ] Baked `VITE_API_URL` matches this hop
- [ ] Backend CORS updated if this hop adds an Oatsense origin
