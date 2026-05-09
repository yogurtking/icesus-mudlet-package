# Changelog

## v0.1.0 — 2026-05-09

First public release. Feedback build.

- Vitals gauges (HP / SP / EP) from `Char.Vitals` + `Char.Maxstats`.
- Enemy panel from `Char.Status.enemies`, cleared on `Char.EnemyDeath`.
  HP rendered to the server's 12-tier shape buckets, colour-coded.
- Channel feed in a side miniconsole from `Comm.Channel`, with optional
  timestamps.
- Geyser-based HUD: 320 px right border, 64 px bottom border. Hot-reload
  safe — editing the script in Mudlet rebuilds the HUD.
- GMCP subscriptions: `Char 1`, `Char.Vitals 1`, `Comm 1`, `Room 1`.
