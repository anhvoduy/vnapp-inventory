# Inventory API
- Api + SQL DB

# For run docker command
- build image:
- docker build -t admin/cubeet-auth-api .	

- attach to container:
- docker run -p 8088:3000 -d admin/cubeet-auth-api

- print app output	
- docker logs [containerid]	
- docker stop [containerid]	
- docker rm [containerid]	
- docker rmi [imageid]	

- enter the container	
- docker exec -it <container id> /bin/bash	

- To get data:
- curl -i localhost:3000

  - To run docker-compose:	
- docker-compose up	

- To rebuild images:	
- docker-compose down	
- docker-compose build	
- docker-compose up	

- To rebuild images with docker compose
- docker-compose down	
- docker-compose up --force-recreate
