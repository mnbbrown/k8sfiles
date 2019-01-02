#!/usr/bin/env bash

rm -rf manifests && mkdir manifests
for file in dashboards/*; do
  FILE=$(basename "$file")
  NAME="${FILE%%.*}"
  CONTENTS=$(cat $file | sed 's/\(.*\)/    \1/')
  echo $NAME
cat > "manifests/${NAME}.yaml" <<-EOL
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    grafana_dashboard: "true"
  name: ${NAME}-grafana-dashboard
  namespace: monitoring
data:
  k8s-dashboard.json: |-
${CONTENTS}
EOL
done
