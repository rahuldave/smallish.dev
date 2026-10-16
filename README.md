# Smallish

A small, buildless landing page for [smallish.dev](https://smallish.dev/).
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
The one-page navigation should reach Projects, SmallDocs, and The idea. The public
SmallDocs links point to its documentation, theme comparison gallery, and repository.
The docs card in the hero links to the docs-project area at `#docs`. Keep that
anchor when adding more docs projects, and check the card with both a click and
the keyboard.

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
- `assets/favicon.svg`: the Smallish mark.
- `robots.txt` and `sitemap.xml`: the public canonical URL.

Google Fonts supplies Fraunces and DM Sans. The page has local fallback fonts
and remains usable if the font service is unavailable.
