```
<!-- Remove the previous line -->
# user/repo

[![tags](https://img.shields.io/badge/tags%20on-docker%20hub-blue.svg)](https://hub.docker.com/r/user/repo#supported-tags "Supported tags on Docker Hub")
[![pipeline status](https://gitlab.com/user/docker-repo/badges/master/pipeline.svg)](https://gitlab.com/user/docker-repo/-/commits/master)
[![pulls](https://img.shields.io/docker/pulls/user/repo.svg)](https://hub.docker.com/r/user/repo "Number of pulls from Docker Hub")
[![stars](https://img.shields.io/docker/stars/user/repo.svg)](https://hub.docker.com/r/user/repo "Star the image on Docker Hub")  
[![dockerfile](https://img.shields.io/badge/dockerfile%20on-gitlab-blue.svg)](https://gitlab.com/user/docker-repo "Dockerfile source repository")
[![coq](https://img.shields.io/badge/depends%20on-coqorg%2Fcoq-blue.svg)](https://hub.docker.com/r/coqorg/coq "Docker images of Coq")

This repository provides [Docker](https://www.docker.com/) images of (stable versions of) the [user/repo](https://gitlab.com/user/docker-repo) project.
<!-- Remove the next line -->
```

These images are based on the [coqorg/coq](https://hub.docker.com/r/coqorg/coq/) images, itself based on [Debian 10 Slim](https://hub.docker.com/_/debian/) and relying on [opam 2.0](https://opam.ocaml.org/doc/Manual.html).

See also the [docker-coq wiki](https://github.com/coq-community/docker-coq/wiki) for details about how to use such images locally or in a CI context.

<!-- tags -->

### Note to maintainers

Checklist:

* Fork this repository on GitLab
* Create a Docker Hub account (and if desired, a Docker Hub organization)
* Create a personal access token on Docker Hub
* Add your Docker Hub username as a GitLab CI protected variables `HUB_USER`
* Add your Docker Hub personal access token as a GitLab CI protected and masked variable `HUB_TOKEN`
* Add a scheduled pipeline with variable `CRON_MODE` set as `nightly`
* Edit this `README.md` replacing `user/repo` with the proper Docker Hub namespace, and `user/docker-repo` with the proper GitLab namespace (but keep the `<!-- tags -->` placeholder)
* Edit the Dockerfile(s)
* Edit the [YAML specification](./images.yml) (in the end, put `active: true`)
* If need be, update the docker-keeper [subtree](https://www.atlassian.com/git/tutorials/git-subtree):
    ```
    git subtree pull --squash -P external/docker-keeper https://gitlab.com/erikmd/docker-keeper.git master
    ```
* (You can then remove this `Note to maintainers` section)
