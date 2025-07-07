
workflow {

    log.info("Workflow ID: ${env('TOWER_WORKFLOW_ID')}")
    log.info("AWS Batch job ID: ${env('AWS_BATCH_JOB_ID')}")
    log.info("The outputDir (set in config with secret) is: ${workflow.outputDir}")
    log.info("The secret in workflow is: ${secrets.MY_SECRET}")

    workflow.onComplete = {
        log.info("The secret on complete is: ${secrets.MY_SECRET}")
    }
}
