ARG BASE_TAG="latest"
FROM rocq/base:${BASE_TAG}

ARG ROCQ_EXTRA_OPAM="rocq-bignums"
ENV ROCQ_EXTRA_OPAM="${ROCQ_EXTRA_OPAM}"

ARG ROCQ_VERSION="dev"
ENV ROCQ_VERSION=${ROCQ_VERSION}

# This line is actually unneeded (was already enabled in rocq/base)
SHELL ["/bin/bash", "--login", "-o", "pipefail", "-c"]

# hadolint ignore=SC2046
RUN set -x \
  && eval $(opam env "--switch=${COMPILER}" --set-switch) \
  && opam update -y -u \
  && opam pin add -n -k version rocq-stdlib ${ROCQ_VERSION} \
  && opam pin add -n -k version rocq-prover ${ROCQ_VERSION} \
  # WE NEED NOT pin rocq-core nor rocq-runtime
  # as rocq-prover => "rocq-core" {= version}
  # and rocq-core => "rocq-runtime" {= version}
  && opam pin add -n -k version coqide-server ${ROCQ_VERSION} \
  # WE DON'T install coq-core nor coq as they're transitional pkgs whose install time is negligible
  && opam install -y -v -j "${NJOBS}" rocq-prover coqide-server ${ROCQ_EXTRA_OPAM} \
  && opam clean -a -c -s --logs \
  && chmod -R g=u /home/rocq/.opam \
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
