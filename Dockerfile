FROM nginx:latest
HEALTHCHECK --interval=10s --timeout=3s CMD curl --fail http://localhost || exit 1
