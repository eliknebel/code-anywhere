## Quick Start

You can use a prebuilt image to quickly get a coder-server instance running.
**However**, while this instance will run fine, any files or directories created will
not have the correct permissions of the host user. Furhtermore, you may not be able to
access certain files or use docker commands.

It is recommended to use the proper method under [Getting Started](#getting-started) below instead of
this quick start.

To quickly run a visual studio code instance with a publicly accessible url, run
the following command:
```
docker run -it --rm -e PASSWORD=changeme -v `pwd`:/workspace bitbldr/code-anywhere
```

> Be sure to set PASSWORD=`changeme` to something private and secure

## <a name="getting-started"></a> Getting Started (recommended)

In order to have code-server run with the same permissions as the host user, it is required to build the docker image on the machine you intend to run it as the user you wish to run as.

Clone the repository:
```
git clone git@github.com:bitbldr/code-anywhere.git
```

Build the image with correct user permissions:
```
cd code-anywhere
docker image build \
    --build-arg USER_ID=$(id -u ${USER}) \
    --build-arg GROUP_ID=$(id -g ${USER}) \
    -t code-anywhere \
    .
```

Run code-anywhere:
```
docker run -it --rm -e PASSWORD=changeme -v `pwd`:/workspace code-anywhere
```

> Be sure to set PASSWORD=`changeme` to something private and secure

This command will output a publicly accesible ngrok url where your code-server can be accessed via web browser (e.g. `code-server is now available at: https://fa76f304c31e.ngrok.io/?folder=/workspace`)

To exit interactive mode and continue running the container in the background, use `Ctrl+p` `Ctrl+q`. When finished, you can kill the container using `docker kill [container id]`.

### Additional Options

Run with docker support:
```
docker run -it --rm -e PASSWORD=changeme -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/workspace code-anywhere
```

## Credits
Thank you to the excellent open source work made available by the code-server team at https://github.com/cdr/code-server and vs-code at https://github.com/microsoft/vscode. Without their amazing contributions to open source, this project would not be possible.

I have no affiliation with either of these orgaizations in any way.
