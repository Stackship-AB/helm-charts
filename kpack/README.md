# kpack-installer Helm Chart

This chart **only** installs the upstream **kpack** components (CRDs, controller, webhook) by fetching the official release YAML and applying it with a Helm pre-install/upgrade hook. It also includes a **pre-delete** hook to cleanly uninstall kpack.

> ⚠️ The hook Jobs bind `cluster-admin` for simplicity. Review and harden RBAC as needed for your environment.

## Usage

```bash
helm install kpack oci://ghcr.io/YOUR_ORG/kpack-installer  # or ./kpack-installer-0.1.0.tgz

# Pin a specific version of kpack:
helm install kpack ./kpack-installer-0.1.0.tgz   --set releaseUrl=https://github.com/buildpacks-community/kpack/releases/download/release-0.13.3/release.yaml
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
