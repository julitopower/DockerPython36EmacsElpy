# DockerPython35EmacsElpy

Docker image with Python3.6, Emacs-2.5 + elpy. It also includes mypy, numpy and pydantic. An already built image is available in [DockerHub](https://hub.docker.com/r/julitopower/python36emacs25elpy/).

mypy numpy stubs are installed under /opt/src/stubs, and the MYPYPATH enviroment variable is set accordlingly.

# Build

```
$> make build
```

# Run

```
$> make run
```

Will mount the folder from which make is called in ```/opt/src/```.