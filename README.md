# Docker - BOINC Manager GUI

Run the BOINC Manager frontend (GUI) on a Docker container, accesible via web browser and VNC.
Built over the [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui) image (ubuntu-18.04 version).

**This image is intended to connect to a running BOINC client with RPC enabled and accesible**, e.g. using the official
[BOINC client Docker image](https://hub.docker.com/r/boinc/client/).
However, the BOINC client should still be usable within this image, but this is not officially supported.

**This image is experimental and might have undesirable effects. Use it under your responsability!**

## Getting started

```bash
docker volume create --name=boinc-manager-data
docker run -d --name=boinc-manager-gui -p 5800:5800 -v boinc-manager-data:/config davidlor/boinc-manager-gui
```

Open your browser and go to `localhost:5800`. You should see the BOINC Manager application running!

**Tip: change to advanced view in `View > Advanced view...` - then connect to your remote BOINC client in `File > Select computer...`**

## Volume (persistence)

The BOINC Manager data directory is stored within the HOME directory, which is set to `/config`.
The most relevant settings file for the Manager is `/config/.BOINC Manager`.

_The `/config` directory is used by the [base image for persisting settings](https://github.com/jlesage/docker-baseimage-gui#config-directory)
of the image tools and the application running. We set it as the HOME directory._

## Other settings

Please refer to the [documentation of the base image](https://github.com/jlesage/docker-baseimage-gui) for
VNC/webui related settings, such as securing the connection and so on.

## Changelog

- 0.0.1 - Initial release

## TODO

- Automatically connect to a given remote BOINC client on startup
- Multi-arch support
