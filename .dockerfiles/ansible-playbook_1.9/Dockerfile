FROM alpine:latest
LABEL maintainer "David Mat <davidmat@gmail.com>"

RUN builddeps=' \
		python-dev \
		py2-pip \
		musl-dev \
		openssl-dev \
		libffi-dev \
		gcc \
		' \
	&& apk --no-cache add \
	ca-certificates \
	python \
	py-paramiko \
	py-yaml \
	py-jinja2 \
	py-httplib2 \
	$builddeps \
	&& pip install --upgrade pip \
	&& pip install \
		ansible==1.9.6 \
		six \
	&& apk del --purge $builddeps

RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib

ENTRYPOINT [ "ansible-playbook" ]
CMD ["-v"]
