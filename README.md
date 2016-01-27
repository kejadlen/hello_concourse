# hello_concourse

Sample project for experimenting with Concourse.

# Requirements

## Tools

- cf (for deploying to Cloud Foundry)
- go (for building hello)
- ruby (for everything else)
- vagrant (for Concourse)

## Environment Variables

```
export HELLO_SERVICE=http://localhost:9293/hello
export WORLD_SERVICE=http://localhost:9294
export CF_USERNAME=
export CF_PASSWORD=
export S3_ACCESS_KEY_ID=
export S3_SECRET_ACCESS_KEY=
```

# Running

```
vagrant up # Runs Concourse on [http://192.168.100.4:8080](http://192.168.100.4:8080)

rake -T # View available Rake tasks

rake concourse:update # Update Concourse
```

# TODO

- S3 example
- Versioning
- Additional tests
- Multi-stage pipeline (integration?)
- Use AWS + Bosh
- Rake init (including downloading fly?)
