ARG BASE_TAG="latest"
FROM coqorg/base:${BASE_TAG}

ARG ROCQ_EXTRA_OPAM="coq-bignums"
ENV ROCQ_EXTRA_OPAM="${ROCQ_EXTRA_OPAM}"

ARG ROCQ_VERSION="dev"
ENV ROCQ_VERSION=${ROCQ_VERSION}

ARG ROCQ_COMMIT

# This line is actually unneeded (was already enabled in coqorg/base)
SHELL ["/bin/bash", "--login", "-o", "pipefail", "-c"]

# hadolint ignore=SC2046
RUN set -x \
  && eval $(opam env "--switch=${COMPILER}" --set-switch) \
  && opam repository add --all-switches --set-default coq-extra-dev https://coq.inria.fr/opam/extra-dev \
  && opam repository add --all-switches --set-default coq-core-dev https://coq.inria.fr/opam/core-dev \
  && opam update -y -u \
  && opam pin add -n -y -k git rocq-runtime.${ROCQ_VERSION} "git+https://github.com/coq/coq#${ROCQ_COMMIT}" \
  && opam pin add -n -y -k git coq-core.${ROCQ_VERSION} "git+https://github.com/coq/coq#${ROCQ_COMMIT}" \
  && opam pin add -n -y -k git rocq-core.${ROCQ_VERSION} "git+https://github.com/coq/coq#${ROCQ_COMMIT}" \
  && opam pin add -n -y -k git coqide-server.${ROCQ_VERSION} "git+https://github.com/coq/coq#${ROCQ_COMMIT}" \
  && opam pin add -n -y -k git coq.${ROCQ_VERSION} "git+https://github.com/coq/coq#${ROCQ_COMMIT}" \
  && opam install -y -v -j "${NJOBS}" rocq-runtime coq-core rocq-core coqide-server coq ${ROCQ_EXTRA_OPAM} \
  && opam clean -a -c -s --logs \
  # TODO-LATER: Use /home/rocq
  && chmod -R g=u /home/coq/.opam \
  && opam config list && opam list

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.name="The Rocq Prover" \
  org.label-schema.description="Rocq is a formal proof management system. It provides a formal language to write mathematical definitions, executable algorithms and theorems together with an environment for semi-interactive development of machine-checked proofs." \
  org.label-schema.url="https://rocq-prover.org/" \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vcs-url="https://github.com/coq/coq" \
  org.label-schema.vendor="The Rocq Development Team" \
  org.label-schema.version=${ROCQ_VERSION} \
  org.label-schema.schema-version="1.0" \
  maintainer="erik@martin-dorel.org"
