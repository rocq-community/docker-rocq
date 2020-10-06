```
<!-- Remove the previous line -->
# user/repo

[![tags](https://img.shields.io/badge/tags%20on-docker%20hub-blue.svg)](https://hub.docker.com/r/user/repo#supported-tags "Supported tags on Docker Hub")
[![pipeline status](https://gitlab.com/user/docker-repo/badges/master/pipeline.svg)](https://gitlab.com/user/docker-repo/-/pipelines)
[![pulls](https://img.shields.io/docker/pulls/user/repo.svg)](https://hub.docker.com/r/user/repo "Number of pulls from Docker Hub")
[![stars](https://img.shields.io/docker/stars/user/repo.svg)](https://hub.docker.com/r/user/repo "Star the image on Docker Hub")  
[![dockerfile](https://img.shields.io/badge/dockerfile%20on-gitlab-blue.svg)](https://gitlab.com/user/docker-repo "Dockerfile source repository")
[![coq](https://img.shields.io/badge/depends%20on-coqorg%2Fcoq-blue.svg)](https://hub.docker.com/r/coqorg/coq "Docker images of Coq")

This repository provides [Docker](https://www.docker.com/) images related to the [example](https://example.com) project.
These images can serve either as a Docker distribution of the project, or as base images for other images or for container-based CI builds.
<!-- Remove the next line -->
```

These images are based on the [coqorg/coq](https://hub.docker.com/r/coqorg/coq/) images, itself based on [Debian 10 Slim](https://hub.docker.com/_/debian/) and relying on [opam 2.0](https://opam.ocaml.org/doc/Manual.html).

See also the [docker-coq wiki](https://github.com/coq-community/docker-coq/wiki) for details about how to use such images locally or in a CI context.

<!-- tags -->

## Note to maintainers

The CI failure in the [docker-keeper-template repo](https://gitlab.com/erikmd/docker-keeper-template)
(and thereby in your fork) is OK.
It is just due to the fact the [images.yml](./images.yml) file initially contains `active: false`.

This repository incorporates the
[docker-keeper](https://gitlab.com/erikmd/docker-keeper) tool as a
[subtree](https://www.atlassian.com/git/tutorials/git-subtree).

For more details, see the documentation available in the
[docker-keeper wiki](https://gitlab.com/erikmd/docker-keeper/-/wikis/home).
