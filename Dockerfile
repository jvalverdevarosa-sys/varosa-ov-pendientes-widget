# Dockerfile — VAROSA OV Pendientes Widget
# Sirve el widget HTML estático (index.html) usando nginx alpine.
# Build: 2026-05-05

FROM nginx:alpine

# Copiar el widget al directorio default de nginx
COPY index.html /usr/share/nginx/html/index.html

# Puerto por defecto de nginx
EXPOSE 80

# nginx arranca automáticamente con el CMD default de la imagen base
