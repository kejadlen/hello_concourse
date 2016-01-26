# hello_concourse

Sample project for experimenting with Concourse.

# Requirements

- cf (for deploying to Cloud Foundry)
- go (for building hello)
- ruby (for everything else)
- vagrant (for Concourse)

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
