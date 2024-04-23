#!/bin/bash

# Namespace
NAMESPACE="monitoring"

# Get current date and time
CURRENT_DATETIME=$(date +"%Y-%m-%d_%H-%M-%S")

# Directory to store logs
LOG_DIR="/tmp/kubernetes_logs/$CURRENT_DATETIME"
ZIP_DIR="/tmp/zip"

# Create directories if they do not exist
mkdir -p "$LOG_DIR"
mkdir -p "$ZIP_DIR"

# Fetch logs for each pod in the namespace
PODS=$(kubectl get pods -n "$NAMESPACE" --no-headers -o custom-columns=":metadata.name")

for POD in $PODS; do
  # Create directory for the pod
  POD_DIR="$LOG_DIR/${CURRENT_DATETIME}_${POD}"
  mkdir -p "$POD_DIR"

  # Fetch logs for each container in the pod
  CONTAINERS=$(kubectl get pod "$POD" -n "$NAMESPACE" -o jsonpath='{.spec.containers[*].name}')

  for CONTAINER in $CONTAINERS; do
    # Fetch logs for the container
    LOG_FILE="$POD_DIR/${CONTAINER}.log"
    echo "Fetching logs for container $CONTAINER from pod $POD in namespace $NAMESPACE..."
    kubectl logs "$POD" -n "$NAMESPACE" -c "$CONTAINER"> "$LOG_FILE"
  done
done

# Create tar.gz file for all the logs
ZIP_FILE="$ZIP_DIR/${CURRENT_DATETIME}_log.tar.gz"
echo "Creating tar.gz file $ZIP_FILE..."
tar -czvf "$ZIP_FILE" -C "$LOG_DIR" .

# Copy zip file to local machine
LOCAL_DIR="C:/Users/shahn/OneDrive/Desktop/Harnil_Cilans/notary-logs"
mkdir -p "$LOCAL_DIR"
cp "$ZIP_FILE" "$LOCAL_DIR/"

echo "Logs fetched and saved to $LOCAL_DIR."