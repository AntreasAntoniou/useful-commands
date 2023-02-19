gcloud beta container --project "tali-multi-modal" clusters create "gpu-cluster-spot-1" --zone "us-central1-a" --no-enable-basic-auth --cluster-version "1.23.12-gke.100" --release-channel "regular" --machine-type "a2-highgpu-1g" --accelerator "type=nvidia-tesla-a100,count=1" --image-type "UBUNTU_CONTAINERD" --disk-type "pd-standard" --disk-size "350" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/cloud-platform" --max-pods-per-node "110" --num-nodes "1" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/tali-multi-modal/global/networks/default" --subnetwork "projects/tali-multi-modal/regions/us-central1/subnetworks/default" --enable-intra-node-visibility --default-max-pods-per-node "110" --spot --enable-autoscaling --min-nodes "0" --max-nodes "10" --enable-dataplane-v2 --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver,GcpFilestoreCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 10 --max-unavailable-upgrade 0 --autoscaling-profile optimize-utilization --resource-usage-bigquery-dataset "tali_billing_us" --enable-resource-consumption-metering --enable-shielded-nodes --node-locations "us-central1-a"

POST https://container.googleapis.com/v1beta1/projects/tali-multi-modal/zones/us-central1-f/clusters
{
  "cluster": {
    "name": "spot-gpu-cluster-1",
    "masterAuth": {
      "clientCertificateConfig": {}
    },
    "network": "projects/tali-multi-modal/global/networks/default",
    "addonsConfig": {
      "httpLoadBalancing": {},
      "horizontalPodAutoscaling": {},
      "kubernetesDashboard": {
        "disabled": true
      },
      "dnsCacheConfig": {},
      "gcePersistentDiskCsiDriverConfig": {
        "enabled": true
      },
      "gcpFilestoreCsiDriverConfig": {
        "enabled": true
      }
    },
    "subnetwork": "projects/tali-multi-modal/regions/us-central1/subnetworks/default",
    "nodePools": [
      {
        "name": "default-pool",
        "config": {
          "machineType": "a2-highgpu-1g",
          "diskSizeGb": 100,
          "oauthScopes": [
            "https://www.googleapis.com/auth/cloud-platform"
          ],
          "metadata": {
            "disable-legacy-endpoints": "true"
          },
          "imageType": "UBUNTU_CONTAINERD",
          "accelerators": [
            {
              "acceleratorCount": "1",
              "acceleratorType": "nvidia-tesla-a100"
            }
          ],
          "diskType": "pd-standard",
          "shieldedInstanceConfig": {
            "enableIntegrityMonitoring": true
          },
          "spot": true
        },
        "initialNodeCount": 1,
        "autoscaling": {
          "enabled": true,
          "maxNodeCount": 16
        },
        "management": {
          "autoUpgrade": true,
          "autoRepair": true
        },
        "maxPodsConstraint": {
          "maxPodsPerNode": "110"
        },
        "networkConfig": {},
        "upgradeSettings": {
          "maxSurge": 10
        },
        "placementPolicy": {
          "type": "COMPACT"
        }
      }
    ],
    "locations": [
      "us-central1-f"
    ],
    "networkPolicy": {},
    "ipAllocationPolicy": {
      "useIpAliases": true
    },
    "masterAuthorizedNetworksConfig": {},
    "binaryAuthorization": {
      "evaluationMode": "DISABLED"
    },
    "autoscaling": {
      "autoscalingProfile": "OPTIMIZE_UTILIZATION"
    },
    "networkConfig": {
      "datapathProvider": "LEGACY_DATAPATH"
    },
    "defaultMaxPodsConstraint": {
      "maxPodsPerNode": "110"
    },
    "resourceUsageExportConfig": {
      "bigqueryDestination": {
        "datasetId": "tali_billing_us"
      },
      "enableNetworkEgressMetering": true,
      "consumptionMeteringConfig": {
        "enabled": true
      }
    },
    "authenticatorGroupsConfig": {},
    "databaseEncryption": {
      "state": "DECRYPTED"
    },
    "shieldedNodes": {
      "enabled": true
    },
    "releaseChannel": {
      "channel": "REGULAR"
    },
    "workloadIdentityConfig": {
      "workloadPool": "tali-multi-modal.svc.id.goog"
    },
    "costManagementConfig": {
      "enabled": true
    },
    "notificationConfig": {
      "pubsub": {}
    },
    "initialClusterVersion": "1.23.12-gke.100",
    "location": "us-central1-f",
    "loggingConfig": {
      "componentConfig": {
        "enableComponents": [
          "SYSTEM_COMPONENTS",
          "WORKLOADS"
        ]
      }
    },
    "monitoringConfig": {
      "componentConfig": {
        "enableComponents": [
          "SYSTEM_COMPONENTS"
        ]
      }
    }
  }
}

gcloud beta container --project "tali-multi-modal" clusters create "spot-gpu-cluster-1" --zone "us-central1-f" --no-enable-basic-auth --cluster-version "1.23.12-gke.100" --release-channel "regular" --machine-type "a2-highgpu-1g" --accelerator "type=nvidia-tesla-a100,count=1" --image-type "UBUNTU_CONTAINERD" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/cloud-platform" --max-pods-per-node "110" --spot --num-nodes "1" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/tali-multi-modal/global/networks/default" --subnetwork "projects/tali-multi-modal/regions/us-central1/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --enable-autoscaling --min-nodes "0" --max-nodes "16" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver,GceFilestoreCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 10 --max-unavailable-upgrade 0 --autoscaling-profile optimize-utilization --resource-usage-bigquery-dataset "tali_billing_us" --enable-network-egress-metering --enable-resource-consumption-metering --workload-pool "tali-multi-modal.svc.id.goog" --enable-shielded-nodes --node-locations "us-central1-f"

gcloud beta container --project "tali-multi-modal" clusters create "spot-gpu-cluster-1" --zone "us-central1-c" --no-enable-basic-auth --cluster-version "1.24.9-gke.2000" --release-channel "regular" --machine-type "e2-medium" --image-type "UBUNTU_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --max-pods-per-node "110" --spot --num-nodes "1" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/tali-multi-modal/global/networks/default" --subnetwork "projects/tali-multi-modal/regions/us-central1/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver,GcpFilestoreCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --autoscaling-profile optimize-utilization --enable-shielded-nodes --node-locations "us-central1-c" && gcloud beta container --project "tali-multi-modal" node-pools create "a100-1-40gb" --cluster "spot-gpu-cluster-1" --zone "us-central1-c" --machine-type "a2-highgpu-1g" --accelerator "type=nvidia-tesla-a100,count=1" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "300" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --spot --enable-autoscaling --min-nodes "0" --max-nodes "16" --location-policy "ANY" --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --max-pods-per-node "110" --node-locations "us-central1-c" --placement-type=COMPACT && gcloud beta container --project "tali-multi-modal" node-pools create "a100-1-80gb" --cluster "spot-gpu-cluster-1" --zone "us-central1-c" --machine-type "a2-ultragpu-1g" --accelerator "type=nvidia-a100-80gb,count=1" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "300" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --spot --enable-autoscaling --min-nodes "0" --max-nodes "8" --location-policy "ANY" --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --max-pods-per-node "110" --node-locations "us-central1-c" --placement-type=COMPACT
