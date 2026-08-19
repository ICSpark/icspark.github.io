# ICSpark Website

## Local Deployment (Docker)

> Container handles Ruby and Jekyll dependencies so you don't have to

1. Build image

```bash
docker build -t icspark-jekyll .
```

2. Run container

```bash
docker run --rm -v "$(pwd):/app" -p 4000:4000 icspark-jekyll
```

The site will be available at http://localhost:4000

The container will launch the Jekyll server in live reload mode, the `-v` flag mounts the current directory, so any
changes made will be reflected on the server.

## Local Deployment

*Preqs*

- Ruby 3.x
- Bundler 4.x

1. Install dependencies

```bash
bundle install
```

2. Deploy Site

```bash
bundle exec jekyll serve
```

For live reloading, run the following instead:

```bash
bundle exec jekyll serve --livereload
```

The site will be available at http://localhost:4000
