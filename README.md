# Ax env
[![Test package](https://github.com/XENONnT/ax_env/actions/workflows/pytest.yml/badge.svg?branch=master)](https://github.com/XENONnT/ax_env/actions/workflows/pytest.yml)

j.angevaare@nikhef.nl

Managed dependencies for strax, straxen, wfsim and pema

## Managed dependacies tracked by dependabot
This repository is a container for trackin the dependencies of the latest versions of the strax, straxen, wfsim and pema - packages. The idea is to maintain the [requirements-tests.txt](./extra_requirements/requirements-tests.txt) file that serves as the shared requirements file of each. To avoid having to maintain several very similar files for each of the packages, we just maintain only this file. The packages all download this file when performing tests to assure that we know tests are always performed on fixed software versions.

## Interacting with dependabot
Since this repository's only purpose is to facilitate a requirements file for other testing infrastructures, the testing on this specific repo is set rather flexible. In contrast to the packages mentioned above one can easily let dependabot merge PRs (we don't require an approving review or anything). Hencem one can savely tell dependabot to merge PRs which it will automatically merge as soon as the tests pass. Just add this comment to a PR:
```bash
@dependabot squash and merge
```

## Note of causion on testing on dependabot PRs.
One side note is that one should keep in mind that dependabot's PRs don't have access to our required secrets. This means that the tests are only _really_ fully run when a PR is merged to master (and has access to the secrets  
