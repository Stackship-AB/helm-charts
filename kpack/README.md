# kpack-installer Helm Chart

This chart **only** installs the upstream **kpack** components (CRDs, controller, webhook) by fetching the official release YAML and applying it with a Helm pre-install/upgrade hook. It also includes a **pre-delete** hook to cleanly uninstall kpack.

## Usage

```bash
# Option A: Install directly from the packaged chart
helm install kpack ./kpack-installer-0.1.0.tgz

# Option B: Use the Helm repo on GitHub Pages
helm repo add stackship https://stackship-ab.github.io/helm-charts
helm repo update
helm install kpack stackship/kpack-installer

# Pin a specific version of the upstream kpack release manifest
helm install kpack stackship/kpack-installer \
	--set releaseUrl=https://github.com/buildpacks-community/kpack/releases/download/release-0.13.3/release.yaml
```

Verify:

```bash
kubectl get pods -n kpack
kubectl api-resources | grep kpack.io
```

Uninstall:

```bash
helm uninstall kpack
# pre-delete hook runs: deletes the kpack resources using the same URL
```
