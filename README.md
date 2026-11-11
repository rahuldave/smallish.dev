# Smallish

The landing page for [smallish.dev](https://smallish.dev/) uses plain HTML and
CSS. It has no build step, application JavaScript, framework, or runtime
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

Check the page links to Projects, SmallDocs, and The idea. Then check the
SmallDocs links to:

- SmallDocs documentation and its source repository.
- The Elegant theme comparison for SmallDocs, with instructions for theme installation and updates.
- The theme handbook, including optional effects.
- The typography and UI design assessments, and the two matching principles guides.

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

Keep the repository's Pages custom domain and DNS records in sync. Keep HTTPS
enforcement enabled in GitHub Pages. There is no wildcard DNS record. Add future
project subdomains individually.

## Site files

- `index.html`: content, navigation, and metadata.
- `styles.css`: responsive layout, colors, type, and reduced-motion support.
- `assets/favicon.svg`: the Smallish mark.
- `robots.txt` and `sitemap.xml`: the public canonical URL.

Google Fonts supplies Fraunces and DM Sans. The page has local fallback fonts
and remains usable if the font service is unavailable.
