# FAForever Wiki Container

This repository contains the setup for the faf wiki.

## Running the docker file

Install [docker](https://www.docker.com).

Follow the steps to get [faf-db](https://github.com/FAForever/db) setup, the following assumes the root password ist `banana` and the structure + data of the wiki is in the database schema ´wiki`.

Build the container using (This must be ran every time something is changed)

	docker build -t faf-wiki .

Run the wiki container with:

	docker run --name faf-wiki --link faf-db:db -p 80:80 -p 443:443 -d faf-wiki

Check to see if running by looking at the container and netstat

	docker ps

Logs are viewable by

	docker logs faf-wiki

You can get inside of the container to SSH through

	docker exec -i -t <HASH ID> /bin/bash
