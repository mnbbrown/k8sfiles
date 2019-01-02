### k8sfiles

A set of k8s manifests for various things. Mostly static manifests based on other projects. Only been used on GKE but should probably work on other k8s deployments.

### Monitoring

Prequisites: make sure your GKE account has the requisite bindings to the cluster-admin role.

```bash
ACCOUNT=$(gcloud info --format='value(config.account)') kubectl create clusterrolebinding owner-cluster-admin-binding \
    --clusterrole cluster-admin \
    --user $ACCOUNT
```

- `/prometheus`: prometheus-operator and a single instance of promethues
- `/kube-state-metrics`: expose cluster level metrics to prometheus `monit`
- `/grafana`: dashboard tool backed by promethues (see above) install in `monitoring` namespace
- `/node-exporter`: node stat exporter for prometheus installed in `monitoring` namespace

### Certificates

- `/cert-manager`: installs [cert manager](https://github.com/jetstack/cert-manager) in the cert-manager namespace.
