#!/usr/bin/env bash
echo "Waiting for Conjur to become healthy..."
until curl -s http://localhost:8080/health | grep -q '"ok":true'; do
  echo "  not ready—sleep 5s"
  sleep 5
done

# Initialize Conjur
CONJUR_DATA_KEY="abc123CONJUR_DATA_KEY"
docker exec conjur \
  conjur init -u admin -p password -a demo -b conjur-data-key=

# Get Admin API key
ADMIN_API_KEY=
echo "Admin API Key: "

# Create Host Factory token
HF_TOKEN=
echo "" > hf-token.txt
echo "Host Factory token saved to hf-token.txt"
