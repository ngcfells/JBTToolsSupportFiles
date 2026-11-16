# START HERE (2026-11-16, latest): Best of Future Wars Chunk E MERGED, pushed, DEPLOYED to beta

- beta = origin/beta = d0190c2ee (plan note on top of a6c68c5f4): Chunk E (e2b68f9b1 play tools, 9a9c0ab11 review fixes, a6c68c5f4 news line).
  "Future Wars Rules" panel on the roster Play page for a 'Mech carrying any of the five play rulesets: Strategic
  Movement (doubled MP, its heat replaces movement heat, no firing), Opportunity Fire (to-hit, +1 to the others),
  Morale (check -> status with fire modifier / no fire, counts down), Weapon Malfunctions (recorded on the weapon,
  to-hit + heat applied, out until cleared), Long Range Wars (extended/extreme + ranging in the Target dialog).
  Code: `src/utils/future-wars-ruleset-tools.ts`, BattleMech methods after `_advanceFutureWarsPlay`, `utils.ts`
  to-hit, `roster/_futureWarsRulesetTools.tsx`. `npm run check`: 5171 + 28 pass, 5 skipped. Played in Chromium
  (Thunderbolt with all five, reload keeps state, no console errors). Deployed.
- Fresh Opus review: 3 Important fixed (no-fire to-hit lifted by LR Flamer mod, ranging vs fast targets, heat of
  weapons that may not fire). 9 minors deferred + rulings: ledger, "Best of Future Wars Chunk E" section.
- Worktree btt-fanzine-e and branch removed. origin/master still behind beta.
- Next: Fanzine Chunk F (Power Armor: read, design, write its plan; Fable 5.2 per the plan), or Batch Chunk 6
  (PPC-X is Apocryphal: bring the owner a stat table first).

# Previous: Best of Future Wars Chunk D MERGED, pushed, DEPLOYED to beta

- beta = origin/beta = b51407670: Chunk D (656e6d22c rulesets, 0ef9c8e81 review fix, b51407670 news line). Five play
  rulesets (fw-opportunity-fire, fw-strategic-movement, fw-morale, fw-weapon-malfunctions, fw-long-range-wars) in
  `special-rulesets.ts`; summaries + full tables in `src/data/future-wars-play-rules.ts`; `FutureWarsRulesReference`
  folded under each in the Special Rulesets window. `npm run check`: 5145 + 28 pass, 5 skipped. Deployed.
  Fresh Opus review: all numbers match the pages; 2 Important fixed; 5 minors deferred (ledger, end of Chunk D section).
  Worktree btt-fanzine-d and branch removed. origin/master still behind beta.
- OWNER RULING 2026-11-16: PPC-X is APOCRYPHAL (MW5), not Custom Homebrew. Written into the batch plan's Chunk 6:
  compare its MW5 stats with the other MW5 PPCs and the Reddit lines, bring a table + recommended line to the owner first.
- Next: Fanzine Chunk E (play tools in roster play; read the plan's Chunk D "For Chunk E" note: rulesets are per unit),
  or Batch Chunk 6 (item 3 below). Note: the top block below is the previous session's.

# Previous: Best of Future Wars Chunk C MERGED, pushed, DEPLOYED to beta

- beta = origin/beta = 184311c57: Chunk C (3534fde1f, a479a15af) + owner follow-up 184311c57 (booster heat stacks
  with XXL, PDS count includes its magazine bins, 15-heat cap on fires, Inferno ammo heat waits for the heat phase,
  panel UX, all 7 deferred minors fixed). `npm run check`: 5168 pass, 5 skipped. News bullet added to Nov 16 entry.
  `git deploy-beta` published. origin/master NOT touched (still behind beta).
- Worktrees btt-fanzine-b/-c removed; branches equipment-lore-rules, fanzine-chunk-a/b/c deleted (all merged).
  Left alone: `layers` (not merged), `mordel-user-key` (not merged), `mordel-sync` (merged but has its own worktree).
- Owner standing permission (memory): when done, commit, ff beta, push, deploy beta, add news, and clean up
  finished branches/worktrees without asking.
- Ledger: batch `progress.md`, "Chunk C" section + "Chunk C follow-up" (Rulings 11 and 13 replaced).
- Next: Fanzine Chunk D (play-rule rulesets), then Batch Chunk 6 (item 3 below).

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
0. PROGRESS 2026-11-16: batches a-c DONE, ff into beta and PUSHED (a17f334e1; tests only, no deploy, no news).
   9c2909e76 tooling + catalog date sweep, 8ed549441 src/test-support/builders.ts, a17f334e1 inline buildMech.
   Totals vs baseline: 58779 -> 58373 test lines, 115774 -> 117279 expect() calls, coverage unchanged, check green.
   Audit noise: roster home pages (CBT, AS) move a few dozen expect() calls run to run (waitFor polling).
   RUN TIME: owner approved; 935e54423 (pushed) moves bundled-mechs, bundled-mechs-build, bundled-units into vitest
   project "data" (`npm run test:data`), run by `npm run check` and the CI check job, NOT by `npm test`.
   npm test 238 -> 205 s; the floor is now src/ui/pages/classic-battletech/roster/home.test.tsx (~150 s alone,
   one file runs serially). Offer: split that file in two to halve the floor (no test changes).
   NOTE: battletech-tools GitHub CI workflow shows `disabled_manually` (found 2026-11-16, not by me).
- JBTIICRework `Blacklist scan` workflow DISABLED on GitHub 2026-11-16 (owner request; `gh workflow enable
  blacklist-scan.yml` to undo). Every run since 11-06 failed: `check_blacklist.py` is missing from the repo.
   Remaining condensing (c2/d below) is lower yield; batch d (merge tiny files) judged not worth it (would grow
   the 7k-line battlemech.test.ts). Worktree btt-test-condense kept for the next batch.
   ORIGINAL TASK (owner request 2026-11-16): CONDENSE THE UNIT TESTS safely. Worktree `C:/repo/btt-test-condense`,
   branch `test-condense` off beta 184311c57 (node_modules = junction). Guardrail: `npm run test:audit baseline` on
   the unchanged branch, then `npm run test:audit compare` after every batch; it fails if any source file loses
   covered lines/statements/branches/functions, the runtime expect() count drops, or a test fails. Baseline lives in
   `.test-audit/` (git-ignored). Rules: one kind of change per batch/commit; never delete an assertion without its
   check living on elsewhere; duplicates may go. Plan, biggest wins first:
   a. One catalog-wide date/page invariant sweep replaces ~23 per-catalog copies (battlemech.test.ts,
      equipment-registry.test.ts). b. Shared test builders (`src/test-support/`): IS/dark-ages mech by tonnage,
      tracked jihad vehicle, mocked IAppGlobals (8 files). c. Batch-N catalog field checks in battlemech.test.ts
      (lines ~2700-5800) into record tables. d. Merge tiny same-subject files (battlemech-as-heat, battlemech-xl,
      etc.) into their family file, only where vi.mock / environment pragmas match.
1. DONE: readout carries the lore (8ef159e14, a test keeps it in step), news line added, beta pushed and DEPLOYED.
2. DONE, merged and deployed: Fanzine Chunk C (see top block).
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
