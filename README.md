
SONIC Benchmark: CMS MiniAOD Clients in Kubernetes
==================================================

This repository contains Kubernetes job configuration for running SONIC-enabled CMS MiniAOD workflows on Kubernetes clusters.

Prerequisites
-------------

- Valid CMS Grid certificates (to generate the Grid proxy).
- `kubectl` configured to talk to the target Kubernetes cluster/namespace.
- Permissions to create secrets and submit jobs in the target namespace.
- The cluster must have `cvmfs-csi` installed.

Uploading the Grid user proxy as a Kubernetes secret
----------------------------------------------------

1. On any machine with VOMS certificates, generate a Grid proxy:

   ```bash
   voms-proxy-init --voms cms --valid 168:00 --out x509up
   ```

2. (Optional) Transfer the generated `x509up` file to the machine on which you will run `kubectl` commands.

3. Upload the proxy to the Kubernetes cluster as a secret:

   ```bash
   kubectl create secret generic x509-proxy \
     --from-file=x509up \
     --namespace <NAMESPACE>
   ```

Configuring the job
-------------------

The main job specification is defined in `cmsrun-job.yaml`.
Key fields you may want to adjust:

- `spec.parallelism` / `spec.completions`: control how many jobs run in parallel and how many total job instances are completed.
- `spec.template.spec.containers[].image`: Docker image to use for the job container.
- `spec.template.spec.containers[].args`: arguments passed to the [run.py](https://github.com/fastmachinelearning/sonic-workflows/blob/CMSSW_16_0_X/run.py) script (including CMSSW SonicTriton options specified [here](https://github.com/cms-sw/cmssw/blob/master/HeterogeneousCore/SonicTriton/python/customize.py)).
- `spec.template.spec.containers[].resources`: CPU and memory requests/limits for each job.
- `spec.template.spec.containers[].nodeSelector`, `tolerations`, `affinity`, or similar parameters: optional fields to direct jobs to specific nodes within the cluster.

Submitting the job
------------------

Once the secret is created and `cmsrun-job.yaml` is configured as desired, submit the job:

```bash
kubectl apply -n <NAMESPACE> -f cmsrun-job.yaml
```
