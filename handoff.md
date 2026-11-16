# START HERE (2026-11-16): Best of Future Wars Chunk B done on branch `fanzine-chunk-b`

Older sessions: `handoff-archive.md` (everything before 2026-11-16, unedited).

## State
- Worktree `C:/repo/btt-fanzine-b` (node_modules = junction to battletech-tools-master's), branch `fanzine-chunk-b`
  off beta 1778f0118, 4 commits (8f720a673, e403c757e, bafa95aec, a2a957703): Pom-Pom, Swing Fire (57 racks, IS +
  Clan mounts, SLDF ~2750), Power Booster weapons. beta = origin/beta = origin/master 1778f0118 before the merge.
- Last `npm run check`: 5109 pass, tsc clean; 3 known 5 s load timeouts (SSW Zeus X / Skinwalker B, bundled Ares,
  roster Skunk Werks) that pass alone.
- Code: `src/data/best-of-future-wars-conversions.ts`; `IEquipmentItem.conversion` holds play data for Chunk C;
  `getPowerBoostedWeapon()`. Tests: `best-of-future-wars-conversions.test.ts` (85), `battlemech-future-wars-conversions.test.ts` (3).
- Rulings + deferred minors: `battletech-tools-master/.superpowers/sdd/2026-11-12-custom-homebrew-batch/progress.md`
  (Chunk B section + owner-request lines at the end). Open choice: Swing Fire never extinct in IS (my ruling) vs true
  LosTech (extinct ~2840, back ~3050s), one-line change.
- Owner decisions: Swing Fire is Star League with lighter Clan versions plus later IS ones; records get a **Lore**
  field (in-character TRO text) AND a **Rules** field.

## Done 2026-11-16 (later)
- `fanzine-chunk-b` fast-forwarded into beta and PUSHED (origin/beta a2a957703). Not deployed, no news line.
- Branch `equipment-lore-rules` in battletech-tools-master (LOCAL, not pushed): 36b834cb8 adds `lore` + `rules` to
  IEquipmentItem, editable in the equipment editor (owner chose editor only); Chunk B records split (notes = credit and
  "ours" rulings, rules = play text, lore = Swing Fire draft only). 243f8132d sets vitest `testTimeout: 20000` (owner
  request) so the 3 heavy-load tests stop timing out. `npm run check`: 5122 pass, 0 fail.

- Swing Fire lore APPROVED (torpedo line covers UMU swimmers, 9b9dbcb8d). Lore written for every other fanzine record
  (Chunk A + B) and Chunk A play text moved to `rules` (commit after 9b9dbcb8d). Check: 5124 pass.

- Lore APPROVED. `equipment-lore-rules` fast-forwarded into beta and PUSHED (origin/beta 1f474b5ec). Not deployed,
  no news line; origin/master still 1778f0118.

## NEXT, in order
1. Deploy + news line (Chunk B and Lore/Rules) only when the owner asks.
2. Fanzine Chunk C (play effects of A and B; carry list in the ledger, incl. a crit on a booster's slot takes the weapon).
3. Batch Chunk 6: five Reddit posts saved, UNTRACKED, in `C:/repo/ResourceLibrary/scrapes/reddit/` (1hqnzwy PPC-X,
   1bhfssf Superheavy PPC, 1mhvhwp Fusion Lance, 1jamkvn Tandem Charge SRM, 1iky8lg RFE). Credits in each CREDITS line:
   PPC-X asker u/Distinct-Duck-7120, stat line u/Severe_Ad_5022, idea u/Omega_Chris_8352; Fusion Lance u/Magical_Savior
   + u/sokttocs; RFE u/Bookwyrm517 + u/FweeCom + u/MasonStonewall. Tandem Charge SRM = alternate rule for existing ammo.

## Open items
- Issues still open: #592 (MechWarrior, sortie, Support/Objectives/Initiative cards), #172 (Chunks C, L).
- JBTIICRework: 3 tracked PDFs show modified on purpose (better Calibre copies, see
  `ResourceLibrary/records/_rulebook-sort-2026-11-04.json`); commit on 2026-12-02.
- Untracked user files, leave them: battletech-tools `docs/superpowers/plans/battletech-tools.code-workspace`,
  JBTToolsSupportFiles `arrayPlan.md`.

## Standing rules (all repos)
- Mordel key lives in `JBTToolsSupportFiles/.env.mordel` (git-ignored). Never print it or put it in a commit, memory or
  handoff. Mordel mirror holds member designs and stays git-ignored (battletech-tools is public).
- **JBTIICRework: no LFS uploads until 2026-12-02.** Log changes in `ResourceLibrary/records/jbtiicrework-pending.md`.
  Pure renames (R100 pairs only, `git lfs push --dry-run origin main` must print nothing) may be pushed any time.
- ResourceLibrary is private: commit and push freely. `upstream/*` in battletech-tools is Jeff's: never touch.
- Cheapest subagent models; final reviews on Opus. Bundled testingUtility content must be original.
- Bash heredocs containing an apostrophe are blocked by a hook: write a script file and run it.
