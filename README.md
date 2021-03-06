# jareware/ffmpeg

Docker-wrapper for `ffmpeg` from the [Ubuntu Multimedia packages](https://launchpad.net/~mc3man/+archive/ubuntu/trusty-media), with proper tags, convenient entrypoint, and one special location within the container:

 * `/data`, which is the default workdir. Use `-v` to mount any data you wish to operate on there.

## Usage

Running the container without arguments gives you the usage info:

```
$ docker run -v $(pwd):/data jareware/ffmpeg
ffmpeg version N-73895-g323ec6b Copyright (c) 2000-2015 the FFmpeg developers
  built with gcc 4.8 (Ubuntu 4.8.4-2ubuntu1~14.04)
...
```

One nice feature of this build is the availability of the [`vidstabdetect`](https://www.ffmpeg.org/ffmpeg-filters.html#vidstabdetect-1) and [`vidstabtransform`](https://www.ffmpeg.org/ffmpeg-filters.html#vidstabtransform-1) filters. To stabilize that shaky GoPro footage for example:

```
$ docker run -v $(pwd):/data jareware/ffmpeg -i input.mp4 -vf vidstabdetect out.mp4
$ docker run -v $(pwd):/data jareware/ffmpeg -i input.mp4 -vf vidstabtransform -y out.mp4
```

## Versioning

The tags match the wrapped ffmpeg release.

## License

MIT
