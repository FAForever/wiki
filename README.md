# FAForever Wiki Container

This repository contains the setup for that faf wiki.


Install [docker](https://www.docker.com).

Follow the steps to get [faf-db](https://github.com/FAForever/db) setup, the following assumes the root password ist `banana` and the structure + data of the wiki is in the database schema ´wiki`.

Run the wiki container with:

	docker run --name faf-wiki --link faf-db:db -p 80:80 -p 443:443 -d faf-wiki
	
Note: This is only for developmenent, in production the state, e.g. uploaded images should be mounted outside the container!
