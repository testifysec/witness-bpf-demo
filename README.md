# witness-bpf-demo

This is a demo of witness tracing using BPF originally presented at CloudNativeCon NA 2022.

## Demo 1: Mitigate against tampering

This demo shows how to use BPF to mitigate against tampering of procceses watched by Witness.

1.  Start Tetragon `./solar 1`
2.  Start the Exploit `./solar 2`
3.  Start The Build `./solar 3`
4.  View the evidence of tampering `./solar 4`

## Demo 2: Block a specific compiler

This demo shows how to use BPF to block an application from running if it is built by a specific compiler.

1.  Start Tetragon `./cr 1`
2.  Build the binary with Witness `./cr 2`
3.  Sign the policy `./cr 3`
4.  Verify the policy `./cr 4`