# rocq/rocq-prover

[![tags](https://img.shields.io/badge/tags%20on-docker%20hub-blue.svg)](https://hub.docker.com/r/rocq/rocq-prover#supported-tags "Supported tags on Docker Hub")
[![pipeline status](https://gitlab.com/coq-community/docker-rocq/badges/master/pipeline.svg)](https://gitlab.com/coq-community/docker-rocq/-/pipelines)
[![dev image](https://img.shields.io/badge/rocq%2Frocq--prover-dev-blue.svg)](https://hub.docker.com/r/rocq/rocq-prover/tags?page=1&name=dev "See dev image on Docker Hub")
[![pulls](https://img.shields.io/docker/pulls/rocq/rocq-prover.svg)](https://hub.docker.com/r/rocq/rocq-prover "Number of pulls from Docker Hub")
[![stars](https://img.shields.io/docker/stars/rocq/rocq-prover.svg)](https://hub.docker.com/r/rocq/rocq-prover "Star the image on Docker Hub")  
[![dockerfile](https://img.shields.io/badge/dockerfile%20on-gitlab-blue.svg)](https://gitlab.com/coq-community/docker-rocq "Dockerfile source repository")
[![base](https://img.shields.io/badge/depends%20on-rocq%2Fbase-blue.svg)](https://hub.docker.com/r/rocq/base "Docker base image for the Rocq Prover")

This repository provides [Docker](https://www.docker.com/) images of the [Rocq Prover](https://rocq-prover.org/).

These images are based on [this parent image](https://hub.docker.com/r/rocq/base/), itself based on [Debian 12 Slim](https://hub.docker.com/_/debian/) and relying on the last version of [opam 2.x](https://opam.ocaml.org/doc/Manual.html):

|   | GitHub repo                                                             | Type          | Docker Hub                                                       |
|---|-------------------------------------------------------------------------|---------------|------------------------------------------------------------------|
|   | [docker-coq-action](https://github.com/coq-community/docker-coq-action) | GitHub Action | N/A                                                              |
| ⊙ | [docker-rocq](https://github.com/coq-community/docker-rocq)             | Dockerfile    | [`rocq/rocq-prover`](https://hub.docker.com/r/rocq/rocq-prover/) |
| ↳ | [docker-base](https://github.com/coq-community/docker-base)             | Dockerfile    | [`rocq/base`](https://hub.docker.com/r/rocq/base/)               |
| ↳ | Debian                                                                  | Linux distro  | [`debian`](https://hub.docker.com/_/debian/)                     |

See also the [docker-coq wiki](https://github.com/coq-community/docker-coq/wiki) for details about how to use such images locally or in a CI context.

This Dockerfile repository is [mirrored on GitLab](https://gitlab.com/coq-community/docker-rocq), but [issues](https://github.com/coq-community/docker-rocq/issues) and [pull requests](https://github.com/coq-community/docker-rocq/pulls) are tracked on GitHub.

> [!NOTE]
>
> Note that this repository only contain Docker images for the Rocq Prover ≥ 9.0.  
> For earlier versions of the Coq Proof Assistant ≤ 8.20.1, use [coqorg/coq](https://hub.docker.com/r/coqorg/coq) images instead.

> [!TIP]
>
> For most use cases, the tags `9.1` (release version) and `dev` (development version) are the most relevant.  
> Indeed, we recommend to omit the patchlevel field (using `9.1` instead of `9.1-rc1` or `9.1.0`) in your CI,  
> so that you need not change the chosen Docker tag when a new patchlevel version of the Rocq Prover is released.

<!-- tags -->
