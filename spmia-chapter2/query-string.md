## organization query

http://localhost:8081/v1/organizations/e254f8c-c442-4ebe-a82a-e2fc1d1ff78a
http://localhost:8081/v1/organizations/442adb6e-fa58-47f3-9ca2-ed1fecdfe86c

## license query

http://localhost:8082/v1/organizations/e254f8c-c442-4ebe-a82a-e2fc1d1ff78a/licenses/
http://localhost:8082/organizations/442adb6e-fa58-47f3-9ca2-ed1fecdfe86c/licenses/38777179-7094-4200-9d61-edb101c6ea84

## zuul query

### zuul route query

http://localhost:5555/routes

### single license query
* feign query
http://localhost:5555/api/licensing/v1/organizations/e254f8c-c442-4ebe-a82a-e2fc1d1ff78a/licenses/f3831f8c-c338-4ebe-a82a-e2fc1d1ff78a/feign

* discovery query
http://localhost:5555/api/licensing/v1/organizations/e254f8c-c442-4ebe-a82a-e2fc1d1ff78a/licenses/f3831f8c-c338-4ebe-a82a-e2fc1d1ff78a/discovery

* RestTemplate direct query
http://localhost:5555/api/licensing/v1/organizations/e254f8c-c442-4ebe-a82a-e2fc1d1ff78a/licenses/f3831f8c-c338-4ebe-a82a-e2fc1d1ff78a/rest
http://localhost:5555/api/licensing/v1/organizations/e254f8c-c442-4ebe-a82a-e2fc1d1ff78a/licenses/f3831f8c-c338-4ebe-a82a-e2fc1d1ff78a

### multiple licenses query
http://localhost:5555/api/licensing/v1/organizations/442adb6e-fa58-47f3-9ca2-ed1fecdfe86c/licenses/

### organization query
http://localhost:5555/api/organization/v1/organizations/442adb6e-fa58-47f3-9ca2-ed1fecdfe86c


## eureka

http://localhost:8761/eureka/apps
http://localhost:8761/eureka/apps/organizationservice

## key value

tmx-correlation-id CORRELATION_ID

## port setting

### common services
* nexus - 8081
* eureka - 8761
* zuul svr - 5555
* gitlab - 8080
* xdpostgres - 5432
* config server - 8889
* kafkaserver - 2181 (zookeeper), 9092(kafka)
* redis - 6379
* zipkin server - 9411

### application services
* licensing service - 8082
* organization service - 8086
* organization service new - 8083
* specialroutes service - 8084
* authentication service - 8085

## execution commands

mvn clean package docker:build

docker-compose -f docker/common/docker-compose.yml up

clean-docker-images.sh





