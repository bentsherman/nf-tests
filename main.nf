
process AGGREGATE {
  container "quay.io/nextflow/bash"
  publishDir "results"

  input:
  path(samples), stageAs: 'AnalysisFiles/'

  output:
  path("AnalysisFiles/*.txt", includeInputs: true)
  path("AnalysisFiles/Analysis_on_*")

  script:
  """
  for name in AnalysisFiles/*.txt; do
    touch AnalysisFiles/Analysis_on_\$(basename \${name} .txt)
  done
  """
}

workflow {
  AGGREGATE( files("$projectDir/files/*") )
}
