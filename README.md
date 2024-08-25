# ACCESS-ESM1.5 Model Configurations

## About

This repo will contain standard global configurations for ACCESS-ESM1.5, the ACCESS Coupled Earth System Model.

This is an "omnibus repository": it contains multiple related configurations, and each
configuration is stored in a separate branch.

Branches utilise a simple naming scheme:

`{release}-{scenario}[+{modifier}]`

where `release` signifies this is the release branch that is tested, versioned and ready for use, `scenario` is the base experimental design with optional `modifiers`. All configurations are assumed to be global extent with nominal 1 degree resolution.

Some examples of possible values of the specifiers:

* scenario: historical, preindustrial, ssp126
* modifier: concentration, interactiveC, noLUC

where scenario is typically a [CMIP experiment identifier](https://wcrp-cmip.github.io/CMIP6_CVs/docs/CMIP6_experiment_id.html), concentration and interactiveC describe the CO2 cycling protocol, and noLUC is no land-use change.

Most configurations are adapted from work by the [CLEX CMS team](https://github.com/coecms/access-esm).

## Supported configurations

All available configurations are browsable under [the list of release branches](https://github.com/ACCESS-NRI/access-esm1.5-configs/branches/all?query=release-) and should also be listed below:

| Branch | Configuration Description |
| ------ | ------------------------- |
| [release-preindustrial+concentrations](https://github.com/ACCESS-NRI/access-esm1.5-configs/tree/release-preindustrial%2Bconcentrations) | Concentration driven CO<sub>2</sub> under pre-industrial forcings | 
| [release-historical+concentrations](https://github.com/ACCESS-NRI/access-esm1.5-configs/tree/release-historical%2Bconcentrations) | Concentration driven CO<sub>2</sub> under historical forcings (1850-2014) | 

There are more detailed notes contained in the respective branches for each configuration
and release notes are posted on [this ACCESS Hive Forum topic]([url](https://forum.access-hive.org.au/t/access-esm1-5-release-information/2352).

More supported configurations will be added over time.

## How to use this repository to run a model

All configurations use [payu](https://github.com/payu-org/payu) to run the model.

This repository contains related experimental configurations to make support
and discovery easier. As a user it does not necessarily make sense to clone all the
configurations at once.

[ACCESS-Hive](https://access-hive.org.au/) contains [detailed instructions for how to configure and run `ACCESS-ESM1.5` with `payu`](https://access-hive.org.au/models/run-a-model).

## Help and Support

If you have questions about these configurations [follow the guidelines for requesting support from ACCESS-NRI ](https://forum.access-hive.org.au/t/access-help-and-support/908)
on the [ACCESS Hive Forum](https://forum.access-hive.org.au/).

## CI and Reproducibility Checks

This repository makes use of GitHub Actions to perform reproducibility checks on model config branches.

### Config Branches

Config branches are branches that store model configurations of the form: `release-<config>` or `dev-<config>`, for example: `release-historical+concentration`. For more information on creating your own config branches, or for understanding the PR process in this repository, see the [CONTRIBUTING.md](CONTRIBUTING.md).

### Config Tags

Config tags are specific tags on config branches, whose `MAJOR.MINOR` version compares the reproducibility of the configurations. Major version changes denote that a particular config tag breaks reproducibility with tags before it, and a minor version change does not. These have the form: `release-<config>-<tag>`, such as `release-historical+interactiveC-1.2`.

So for example, say we have the following config tags:

* `release-historical+interactiveC-1.0`
* `release-historical+interactiveC-1.1`
* `release-historical+interactiveC-2.0`
* `release-historical+interactiveC-3.0`

This means that `*-1.0` and `*-1.1` are configurations for that particular experiment type that are reproducible with each other, but not any others (namely, `*-2.0` or `*-3.0`).

`*-2.0` is not reproducible with `*-1.0`, `*.1.1` or `*-3.0` configurations.

Similarly, `*-3.0` is not reproducible with `*-1.0`, `*-1.1` or `*-2.0`.

### Checks

These checks are in the context of:

* PR checks: In which a PR creator can modify a config branch, create a pull request, and have their config run and checked for reproducibility against a 'ground truth' version of the config.
* Scheduled checks: In which config branches and config tags that are deemed especially important are self-tested monthly against their own checksums.

More information on submitting a Pull Request and on the specifics of this pipeline can be found in the [CONTRIBUTING.md](./.github/CONTRIBUTING.md) and [README-DEV.md](./README-DEV.md) respectively.

For more information on the manually running the pytests that are run as part of the reproducibility CI checks, see
[model-config-tests](https://github.com/ACCESS-NRI/model-config-tests/).

## Conditions of use

The developers of ACCESS-ESM1.5 request that users of these model configurations

1. Cite https://doi.org/10.1071/ES19035
2. Include an acknowledgment such as the following: "The authors thank CSIRO for developing the ACCESS-ESM1.5 model configuration and making it freely available to researchers."
ACCESS-NRI requests users follow the [guidelines for acknowledging ACCESS-NRI](https://www.access-nri.org.au/resources/acknowledging-us/) and include a statement such as
"This research used the ACCESS-ESM1.5 model infrastructure provided by ACCESS-NRI, which is enabled by the Australian Government’s National Collaborative Research Infrastructure Strategy (NCRIS)”
