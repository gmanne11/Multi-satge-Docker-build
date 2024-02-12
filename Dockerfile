########################
# This Dockerfile has got 2 stages: Build stage and runtime stage. During build stage we choose rich base image like ubuntu which has many system dependencies and here we build binary.
# Runtime stage we use distroless image called scratch
# Golang is a statically typed and not required any runtime 
#######################

FROM ubuntu as build 

RUN apt-get update && apt-get install -y golang-go

ENV GO111MODULE=off

COPY . .

RUN CGO_ENABLED=0 go build -o /app .

########################

# HERE STARTS THE MAGIC OF MULTI STAGE DOCKER BUILD

########################

FROM scratch

# Copy the compile binary from the build stage 
COPY --from=build /app /app

# Set the entrypoint for the container to run 
ENTRYPOINT ["/app"]



