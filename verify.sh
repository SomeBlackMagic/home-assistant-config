#!/bin/bash
if [ ! -e "secrets.yaml" ]; then
  ln -s secrets_redacted.yaml secrets.yaml
fi
docker run --rm -v "${PWD}:/config" -v "${PWD}/.travis:/etc/letsencrypt/live/graph.cyberkov.at" homeassistant/home-assistant:latest /bin/sh -c "python -m homeassistant --config /config --script check_config --info light"
#docker run --rm -v "${PWD}:/config" -v "${PWD}/.travis:/etc/letsencrypt/live/graph.cyberkov.at" homeassistant/home-assistant:0.59.2 /bin/sh -c "python -m homeassistant --config /config --script check_config --info light"
