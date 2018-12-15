docker run --detach -p 8888:8888 --name xdconfig-server -e ENCRYPT_KEY=IMSYMMETRIC xdli/tmx-confsvr:chapter3
docker logs -f xdconfig-server

