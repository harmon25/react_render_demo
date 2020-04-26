#!/bin/bash

export HOSTNAME=localhost
export MIX_ENV=prod
export NODE_ENV=production
export SECRET_KEY_BASE=jUkRW2CoIZxGchiAAOqMu6be5waDs9rWW9xNsr3FyaeFs56dXzUDpPoKC1OnPV/e
export LISTEN_PORT=4000
export PUBLIC_PORT=4000
export HTTPS=false

_build/prod/rel/local/bin/local start