return {
    'datreeio/CRDs-catalog',
    name = 'crds-catalog',
    lazy = false,
    build = function()
        -- Create schemas directory if it doesn't exist
        local schemas_dir = vim.fn.stdpath 'config' .. '/schemas/crds'
        vim.fn.mkdir(schemas_dir, 'p')

        -- Copy popular CRD schemas to our config directory
        local catalog_dir = vim.fn.stdpath 'data' .. '/lazy/crds-catalog'
        local popular_crds = {
            -- Popular third-party operators
            'argoproj.io',
            'cert-manager.io',
            'traefik.io',
            'prometheus.io',
            'grafana.com',
            'istio.io',
            'networking.istio.io',
            'security.istio.io',
            'bitnami.com',
            'external-secrets.io',
            'kustomize.config.k8s.io',
            'tekton.dev',
            'triggers.tekton.dev',
            -- Google Cloud Config Connector CRDs
            'accesscontextmanager.cnrm.cloud.google.com',
            'alloydb.cnrm.cloud.google.com',
            'apigateway.cnrm.cloud.google.com',
            'apigee.cnrm.cloud.google.com',
            'artifactregistry.cnrm.cloud.google.com',
            'beyondcorp.cnrm.cloud.google.com',
            'bigquery.cnrm.cloud.google.com',
            'bigtable.cnrm.cloud.google.com',
            'binaryauthorization.cnrm.cloud.google.com',
            'certificatemanager.cnrm.cloud.google.com',
            'cloudasset.cnrm.cloud.google.com',
            'cloudbuild.cnrm.cloud.google.com',
            'cloudfunctions.cnrm.cloud.google.com',
            'cloudidentity.cnrm.cloud.google.com',
            'cloudiot.cnrm.cloud.google.com',
            'cloudkms.cnrm.cloud.google.com',
            'cloudscheduler.cnrm.cloud.google.com',
            'cloudsql.cnrm.cloud.google.com',
            'cloudtasks.cnrm.cloud.google.com',
            'compute.cnrm.cloud.google.com',
            'configconnector.cnrm.cloud.google.com',
            'container.cnrm.cloud.google.com',
            'containeranalysis.cnrm.cloud.google.com',
            'datacatalog.cnrm.cloud.google.com',
            'dataflow.cnrm.cloud.google.com',
            'datafusion.cnrm.cloud.google.com',
            'dataproc.cnrm.cloud.google.com',
            'datastore.cnrm.cloud.google.com',
            'deploymentmanager.cnrm.cloud.google.com',
            'dialogflow.cnrm.cloud.google.com',
            'dlp.cnrm.cloud.google.com',
            'dns.cnrm.cloud.google.com',
            'essentialcontacts.cnrm.cloud.google.com',
            'eventarc.cnrm.cloud.google.com',
            'filestore.cnrm.cloud.google.com',
            'firebasedatabase.cnrm.cloud.google.com',
            'firebasehosting.cnrm.cloud.google.com',
            'firestore.cnrm.cloud.google.com',
            'gkebackup.cnrm.cloud.google.com',
            'gkehub.cnrm.cloud.google.com',
            'healthcare.cnrm.cloud.google.com',
            'iam.cnrm.cloud.google.com',
            'iap.cnrm.cloud.google.com',
            'identityplatform.cnrm.cloud.google.com',
            'kms.cnrm.cloud.google.com',
            'logging.cnrm.cloud.google.com',
            'memcache.cnrm.cloud.google.com',
            'monitoring.cnrm.cloud.google.com',
            'networkconnectivity.cnrm.cloud.google.com',
            'networkmanagement.cnrm.cloud.google.com',
            'networksecurity.cnrm.cloud.google.com',
            'networkservices.cnrm.cloud.google.com',
            'notebooks.cnrm.cloud.google.com',
            'orgpolicy.cnrm.cloud.google.com',
            'osconfig.cnrm.cloud.google.com',
            'oslogin.cnrm.cloud.google.com',
            'privateca.cnrm.cloud.google.com',
            'pubsub.cnrm.cloud.google.com',
            'pubsublite.cnrm.cloud.google.com',
            'recaptchaenterprise.cnrm.cloud.google.com',
            'redis.cnrm.cloud.google.com',
            'resourcemanager.cnrm.cloud.google.com',
            'run.cnrm.cloud.google.com',
            'secretmanager.cnrm.cloud.google.com',
            'servicedirectory.cnrm.cloud.google.com',
            'servicemanagement.cnrm.cloud.google.com',
            'servicenetworking.cnrm.cloud.google.com',
            'serviceusage.cnrm.cloud.google.com',
            'sourcerepo.cnrm.cloud.google.com',
            'spanner.cnrm.cloud.google.com',
            'sql.cnrm.cloud.google.com',
            'storage.cnrm.cloud.google.com',
            'storagetransfer.cnrm.cloud.google.com',
            'tags.cnrm.cloud.google.com',
            'tpu.cnrm.cloud.google.com',
            'vertexai.cnrm.cloud.google.com',
            'vpcaccess.cnrm.cloud.google.com',
            'workflows.cnrm.cloud.google.com',
        }

        -- Copy CRD files
        for _, crd in ipairs(popular_crds) do
            local src_dir = catalog_dir .. '/' .. crd
            -- Check if the directory exists
            if vim.fn.isdirectory(src_dir) == 1 then
                local cmd = string.format('cp %s/*.json %s/ 2>/dev/null || true', src_dir, schemas_dir)
                os.execute(cmd)
            end
        end

        print 'CRDs catalog downloaded and popular schemas copied!'
    end,
    config = function()
        -- This plugin doesn't need runtime configuration
        -- It just provides the CRD schema files
    end,
}
