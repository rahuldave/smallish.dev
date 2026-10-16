# Smallish

A small, buildless website and blog for [smallish.dev](https://smallish.dev/).
Plain HTML and CSS; no application JavaScript, framework, or runtime dependencies.

## Local work

Requirements: Python 3, Node/npm (for the pinned on-demand formatter), Just,
and GitHub CLI for deployment.

```sh
just serve 8766
just fmt
just verify
```

Open `http://127.0.0.1:8766/`. Check desktop and mobile layouts after visual changes.
The homepage navigation should reach Projects, Blog, and The idea. The public
SmallDocs links point to its documentation and repository. Check the homepage,
`/blog/`, and `/blog/smalldocs/` at desktop and phone widths.
The docs card in the hero links to the docs-project area at `#docs`. Keep that
anchor when adding more docs projects, and check the card with both a click and
the keyboard.

The blog uses ordinary HTML pages, with shared styles in `blog.css`. It has no
build step. The Blog navigation link and homepage preview lead to the index and
first post. Each screenshot opens its original image, and captions link back to
the source sites. The blog has an RSS feed at `/blog/feed.xml`.

## Publishing

GitHub Pages publishes the root of `main` in `rahuldave/smallish.dev`.
The `CNAME` file sets `smallish.dev` as the canonical domain. `.nojekyll` keeps
the source files static. A push to `main` triggers publication; `just deploy`
can explicitly request a fresh build after the push.

DNS is managed at Porkbun. The intended records are:

| Type  | Host | Value               |
| ----- | ---- | ------------------- |
| A     | @    | 185.199.108.153     |
| A     | @    | 185.199.109.153     |
| A     | @    | 185.199.110.153     |
| A     | @    | 185.199.111.153     |
| CNAME | www  | rahuldave.github.io |

Keep the repository's Pages custom domain and DNS records in sync. Enable
GitHub Pages HTTPS enforcement after GitHub issues the certificate. There is
no wildcard DNS record: future project subdomains can be added individually.

## Editing

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
