# Enable Codespaces prebuilds (fast Codespace launches)

Without a prebuild, every student's Codespace builds the whole R environment from the
`Dockerfile` on the spot — about **15 minutes each**. A **prebuild** makes GitHub build
that environment **once, ahead of time**, and cache it, so each student launches from the
ready snapshot in **~30 seconds**.

**Students do nothing** — they open a Codespace as usual; it's just fast. This is a
one-time **admin** task on the repository.

## Prerequisites

- **Admin** access to `biosustain/dsp_workshop_datavizR`.
- Codespaces enabled for the **biosustain** org.

## Steps

1. Repo → **Settings** (top-right).
2. Left sidebar → under **Code and automation** → **Codespaces**.
3. Click **Set up prebuild** (or **New configuration**).
4. Fill in:
   - **Branch:** `main`
   - **Configuration file:** `.devcontainer/devcontainer.json` (auto-detected)
   - **Region availability:** select the region your students are in — for DTU that's
     **Europe West**.
     *(Easy to miss: prebuilds are per-region. A student only gets the fast launch if a
     prebuild exists in their region.)*
   - **Prebuild triggers:** `Every push` (keeps it current), or `On configuration change`
     to save Actions minutes (the environment only changes when the Dockerfile does).
5. Click **Create**.

GitHub runs an Actions job to build the prebuild. The **first build takes ~15 minutes**
— but that's **once and automated**, not per-student. When it finishes, the configuration
shows **"Available."**

## Verify

- Repo → green **Code** button → **Codespaces** tab → should show **"Prebuild ready"**
  next to `main`.
- Create a test Codespace — it should open in ~30 seconds.

## Notes

- **Cost:** prebuilds use a little org storage + Actions minutes to stay warm —
  negligible for a workshop, but org-billed.
- **Student access:** on a public repo, students launch Codespaces on their own free
  monthly quota and still benefit from the org's prebuild. Confirm the org's Codespaces
  policy lets your (possibly non-member) students create Codespaces.
- **Dry run:** test with one **non-admin** account a few days before the workshop — the
  surest way to confirm the fast launch for students.

## Alternative (not recommended for a workshop)

Instead of prebuilds, you can pin the prebuilt image published to GHCR
(`.github/workflows/publish-devcontainer.yml`): make the package **public**
(repo → Packages → the image → Package settings → change visibility), cut a release
`v1.0.0` to build `…:1.0.0`, then set `.devcontainer/devcontainer.json` to
`"image": "ghcr.io/biosustain/dsp_workshop_datavizr:1.0.0"`. Prebuilds are simpler and
more robust.
