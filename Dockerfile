# Build stage — OatSense / Precision Ag standalone frontend
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Vite inlines these at build time. Prefer Cloud Build --build-arg overrides.
ARG VITE_API_URL
ARG VITE_CROP_API_URL
ARG VITE_SAIGE_API_URL
ARG VITE_NEWS_API_URL
ARG VITE_OTF_API_URL
ARG VITE_CONTACT_RECIPIENT_EMAIL
ARG VITE_PRECISION_AG_ONLY=true

ENV VITE_API_URL=$VITE_API_URL \
    VITE_CROP_API_URL=$VITE_CROP_API_URL \
    VITE_SAIGE_API_URL=$VITE_SAIGE_API_URL \
    VITE_NEWS_API_URL=$VITE_NEWS_API_URL \
    VITE_OTF_API_URL=$VITE_OTF_API_URL \
    VITE_CONTACT_RECIPIENT_EMAIL=$VITE_CONTACT_RECIPIENT_EMAIL \
    VITE_PRECISION_AG_ONLY=$VITE_PRECISION_AG_ONLY

# precision-ag mode → .env.precision-ag + PRECISION_AG_ONLY nav/routing
RUN npm run build:precision

# Serve stage
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN sed -i '/text\/html/i\    application\/manifest+json    webmanifest;' /etc/nginx/mime.types
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
