./rancher-compose --project-name app \
    --url http://192.168.99.101:8080/v1/projects/1a5 \
    --access-key 719F5E2B717726536671 \
    --secret-key WEUFWzhMDHVJqwQuqeHEn677nZSZjXxYdrxY8tfx \
    -f docker-compose.yml \
    --verbose up \
    -d --force-upgrade \
    --confirm-upgrade
