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

This repository incorporates the
[docker-keeper](https://gitlab.com/erikmd/docker-keeper) tool as a
[subtree](https://www.atlassian.com/git/tutorials/git-subtree).

### Checklist

* Fork this repository on GitLab and rename it as you see fit (e.g., its name can be of the form `user/docker-repo` where `user` is your GitLab username, and `repo` the name of your project to dockerize)  
    Note that on GitLab, a project renaming involves two actions: renaming the `Project Name` and [renaming the project `Path`](https://docs.gitlab.com/ee/user/project/settings/#renaming-a-repository).
* Create a Docker Hub account (and if desired, a Docker Hub organization)
* Create a personal access token on Docker Hub
* Add your Docker Hub username as a GitLab CI protected variable `HUB_USER`
* Add your Docker Hub personal access token as a GitLab CI protected and masked variable `HUB_TOKEN`
* Add a scheduled pipeline with variable `CRON_MODE` set as `nightly`
* Edit this `README.md` replacing `user/repo` with the proper Docker Hub namespace, and `user/docker-repo` with the proper GitLab namespace (but keep the `<!-- tags -->` placeholder)
* Edit the Dockerfile(s)
* Edit the [YAML specification](./images.yml) (in the end, put `active: true`)
* If need be, update the docker-keeper [subtree](https://www.atlassian.com/git/tutorials/git-subtree):
    ```
    git subtree pull --squash -P external/docker-keeper https://gitlab.com/erikmd/docker-keeper.git master
    ```
* Push your changes to `master`
* (You can then remove this `Checklist` section)

### How to trigger builds

* By default, builds and deployements of Docker images are performed
  in `master` only for *tags not already available in Docker Hub*.

* To trigger further (re)builds: [run a manual pipeline](https://docs.gitlab.com/ee/ci/pipelines/#run-a-pipeline-manually) for `master`, choosing one of the following two options:
    * **Variable** `CRON_MODE` := `rebuild-tags`  
      **File** `ITEMS` := list of tags versions to rebuild (one per line), e.g.:  
        ```
        latest-coq-dev
        latest-coq-8.12
        latest-coq-8.11
        ```
    * **Variable** `CRON_MODE` := `rebuild-files`  
      **File** `ITEMS` := list of Dockerfile relative paths to rebuild (one per line), e.g.:  
        ```
        ./stable/Dockerfile
        ```

* Note: the Docker Hub `README.md` update and images removal steps are
  only semi-automated for now
  (cf. the feature request [docker/roadmap#115](https://github.com/docker/roadmap/issues/115))  
  So *after each successful deployment*, you should follow the instructions of the last stage job (**notify / debrief**).

* If ever you want to generate/preview the artifacts locally using Python
    before doing `git push`, you can do:  
    ```
    pip3 install --no-cache-dir -r external/docker-keeper/requirements.txt
    ./external/docker-keeper/keeper.py write-artifacts
    ls generated
    ```
