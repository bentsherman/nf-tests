
params.n_tasks = 20_000
params.task_duration = 30_000

process foo {
    input:
    val index
    output:
    val index

    exec:
    sleep(params.task_duration)
}

workflow {
    Channel.of(1 .. params.n_tasks) | foo
}

