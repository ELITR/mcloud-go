mcloud-go
=======

Package mcloud provides Go bindings for MCLoud.<br />
All the binding code has automatically been generated with rules defined in [mcloud.yml](/mcloud.yml).

### Rebuilding the package

You will need to get the [cgogen](https://git.io/cgogen) tool installed first.

```
$ git clone https://github.com/ELITR/mcloud-go && cd mcloud-go
$ make clean
$ make build
```
