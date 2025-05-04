These scripts are designed to install any pre-requsites for specific computer use cases.
Currently they're standalone scripts, with "Init.ps1" wanting to be run first.
Later on I'll add a bootstrap to it that allows you to select what other optional scripts you'd like to run.

Requires "Set-ExecutionPolicy -ExecutionPolicy Unrestricted" to be run first.
Might be able to turn this into a one-liner with "irm <url> | iex", need to get the bootstrap working, and probs a nicer URL too (maybe install.nargacu.ga, could use user-agent on server to swap between linux and windows? or just install-win/install-linux).