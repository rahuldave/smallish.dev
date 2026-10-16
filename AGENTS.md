# Smallish project instructions

Keep this site small: plain HTML and CSS, with no application JavaScript unless
an actual interaction needs it. Preserve the cream, olive, and ink palette,
Fraunces headings, DM Sans body, and responsive editorial layout.

Use Gest for substantial work. Review the tag vocabulary before creating tasks,
and inspect semantic dependers with ast-grep when changing anchors, links,
asset references, selectors, or domain configuration. `.gest/` stays local.

Use `but` for VCS writes while GitButler manages the workspace. Work sequentially
in a shared GitButler checkout. Use separate physical worktrees for concurrent
write work. Stage explicit files and keep credentials out of the repository.

## Commands

- `just serve 8766`: local static server.
- `just fmt`: pinned on-demand Prettier formatting.
- `just verify`: formatting and diff hygiene.
- `just deploy`: request a Pages build after source has been pushed to `main`.

After layout changes, inspect desktop and mobile browser viewports and exercise
the in-page links. This static page has no callable application code; do not
add implementation-mirroring unit tests. Add meaningful focused tests if
callable behavior is introduced.

The canonical domain, metadata, CNAME file, Pages settings, and Porkbun DNS are
one coupled deployment concept. Keep them consistent. Production is public at
https://smallish.dev/. Do not enable paid hosting products or create wildcard DNS.
