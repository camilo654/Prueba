docker-compose build
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:seed
docker-compose run --rm web rails db:migrate
docker-compose up
