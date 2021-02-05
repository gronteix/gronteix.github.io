#! /usr/bin/env bash

set -exE 


TIMESTAMP=$(date +%s)
TMP_DIR="/tmp/hugo-blog-build-${TIMESTAMP}"
mkdir "${TMP_DIR}"

hugo 

cp -r public/* "${TMP_DIR}"
git add -A && git commit -m "publishing v${TIMESTAMP}"
git checkout published
rm -rf * && cp -r "${TMP_DIR}"/* .
git add -A && git commit -m "published v${TIMESTAMP}"
git push
git checkout master
rm -rf "${TMP_DIR}"
