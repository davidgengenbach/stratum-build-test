# Stratum: test building in Ubuntu VM

Work-in-progress!

```
git clone --recurse-submodules https://github.com/davidgengenbach/stratum-build-test.git
cd stratum-build-test
cp path/to/bf_sde_9.3.0.tgz third_party/
# Adapt provision.sh if you do not use BF-SDE version 9.3.0
vagrant up --provision
```
