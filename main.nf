
params.n_tasks = 10
params.array_size = 10

process foo {
    array params.array_size

    input:
    val index
    output:
    path 'output.txt'

    script:
    """
    echo "Hello from task ${index}!" > output.txt
    """
}

process bar {
    debug true
    array params.array_size

    input:
    path 'input.txt'

    script:
    """
    cat input.txt
    """
}

workflow {
    Channel.of(1 .. params.n_tasks) | foo | bar
}

