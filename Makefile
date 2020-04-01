#!make
SHELL ?= /bin/bash

JAR_VERSION := $(shell mvn -q -Dexec.executable="echo" -Dexec.args='$${project.version}' --non-recursive exec:exec -DforceStdout)
JAR_FILE := barcode4j-$(JAR_VERSION).jar

all: target/$(JAR_FILE)

target/$(JAR_FILE):
	mvn -Dmaven.test.skip=true clean package

test: target/$(JAR_FILE)
	mvn test

clean:
	mvn clean

version:
	echo "${JAR_VERSION}"

.PHONY: all clean test version
