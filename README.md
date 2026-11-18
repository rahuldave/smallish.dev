# Smallish

The website and blog for [smallish.dev](https://smallish.dev/) use plain HTML and
CSS. They have no build step, application JavaScript, framework, or runtime
dependencies.

## Local work

Requirements:

- Python 3 to serve the site.
- Node.js and npm to run the pinned formatter on demand.
- Just, the `just` command runner, to run the commands below.
- GitHub CLI to request a Pages build with `just deploy`.

Clone or download this repository. Run the commands below from the repository
folder.

Start a local server:

```sh
just serve 8766
```

Open `http://127.0.0.1:8766/`. After visual changes, check the desktop and mobile
layouts.

Before you publish, format the files and check them:

```sh
just fmt
just verify
```

Check the page links to Projects, Blog, and The idea. Then check the
SmallDocs links to:

- SmallDocs documentation and its source repository.
- The Elegant theme comparison for SmallDocs, with instructions for theme installation and updates.
- The theme handbook, including optional effects.
- The typography and UI design assessments, and the two matching principles guides.

Check the homepage, `/blog/`, and `/blog/smalldocs/` at desktop and phone widths.

The blog uses ordinary HTML pages, with shared styles in `blog.css`. It has no
build step. The Blog navigation link and homepage preview lead to the index and
first post. Each screenshot opens its original image, and captions link back to
the source sites. The blog has an RSS feed at `/blog/feed.xml`.

Check the smallish dev links to its documentation at `dev.smallish.dev`, its
fresh-folder page, its source repository, and the site of each tool of the stack.
The "tools for agents that ship code" card links to `#dev`.

The "words into websites" card links to the documentation projects at `#docs`. If
you add more documentation projects, keep that anchor. Check that you can follow the
card link with both a click and the keyboard.

## Publish the site

GitHub Pages publishes the files at the root of `main` in
`rahuldave/smallish.dev`. The `CNAME` file sets `smallish.dev` as the canonical
domain, and `.nojekyll` keeps the source files static. A push to `main` publishes
the site. After the push, you can run `just deploy` to request a fresh build.

Porkbun manages the DNS records that point the domain to GitHub Pages. The
intended records are:

| Type  | Host | Value               |
| ----- | ---- | ------------------- |
| A     | @    | 185.199.108.153     |
| A     | @    | 185.199.109.153     |
| A     | @    | 185.199.110.153     |
| A     | @    | 185.199.111.153     |
| CNAME | www  | rahuldave.github.io |
| CNAME | docs | rahuldave.github.io |
| CNAME | dev  | rahuldave.github.io |

Keep the repository's Pages custom domain and DNS records in sync. Keep HTTPS
enforcement enabled in GitHub Pages. There is no wildcard DNS record. Add future
project subdomains individually.

## Site files

- `index.html`: content, navigation, and metadata.
- `styles.css`: responsive layout, colors, type, and reduced-motion support.
- `blog/index.html`: the blog index.
- `blog/smalldocs/index.html`: the first post and its source links.
- `blog.css`: article, index, screenshot, and shared navigation styles.
- `blog/feed.xml`: the RSS feed.
- `assets/blog/smalldocs/`: real screenshots and their provenance.
- `assets/favicon.svg`: the Smallish mark.
- `robots.txt` and `sitemap.xml`: the public canonical URL.

Google Fonts supplies Fraunces and DM Sans. The page has local fallback fonts
and remains usable if the font service is unavailable.

## Adding a post

Copy the first post into `blog/<slug>/index.html` and update its title, byline,
date, canonical URL, social metadata, and article JSON-LD. Use relative-to-root
links so navigation works from every route. Keep the shared header and footer
consistent across the homepage, blog index, and posts.

Add the post to `blog/index.html`, the homepage preview when appropriate,
`blog/feed.xml`, and `sitemap.xml`. Add screenshots under `assets/blog/<slug>/`,
with useful alt text, captions, and source links. Use the image's actual width
and height; the first image loads eagerly and later images load lazily.

Run `just fmt` and `just verify`. Parse the feed and sitemap as XML, check every
local link and fragment against its target file, and inspect desktop and phone
layouts. Exercise the index-to-post link, table of contents, image links, and
return navigation. Native links should work with a keyboard. This static site
does not need unit tests that merely repeat its HTML.
