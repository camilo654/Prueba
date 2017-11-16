./rancher-compose --project-name contapp \
    --url http://192.168.99.101:8080/v1/projects/1a5 \
    --access-key F726EC6281C27B266691 \
    --secret-key AzzgidDaAMiuqoyNJnxeoZN8FSjhZY61T87B5PQF \
    -f docker-compose.yml \
    --verbose up \
    -d --force-upgrade \
    --confirm-upgrade
