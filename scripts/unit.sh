#!/usr/bin/env bash
set -euo pipefail

export ROOT=`dirname $(readlink -f ${BASH_SOURCE%/*})`
if [ ! -f $ROOT/.bin/ginkgo ]; then
  (cd $ROOT/src/go/vendor/github.com/onsi/ginkgo/ginkgo/ && go install)
fi

cd $ROOT/src/go/
ginkgo -r -skipPackage=integration
