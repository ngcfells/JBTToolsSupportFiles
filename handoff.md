# START HERE (2026-11-04): 3-1 done (vehicle BV1 data and math), next 3-2 (vehicle BV1 UI check and e2e)

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- 3-1 DONE in 96c2c72b4: beta = master = origin, deployed to beta, news line (home.tsx). 3960 unit tests, lint, typecheck
  green; `e2e/vehicle-roster.spec.ts` passes (Chromium) but reads no BV1 text. `npm run build:bundled` report not run.
  Details: "3-1 DONE" in the plan.
- Built: `Vehicle._calcBattleValue1`, both vehicle records entered, Level 3 in `MAX_TECH.vehicleItems` / `vehicleChassis` /
  `vehicleCrew`. Carry-over done: vehicle semi-guided x6 and the `tagged` run, through `getBattleValueTagShare`'s `taggedGain`.
- BV survey, 6,400 units: BV2 and 'Mech BV1 unchanged; only vehicle BV1 moved. The survey now covers combat vehicles
  (it silently skipped them before) and takes `BV_SURVEY_EDITIONS=master-rules,master-rules-revised` for BV1 columns.
- Against Max Tech's vehicle table: 54 of 106 parsed rows exact, 35 within 5, 15 further off, 2 unmatched (nearest
  MegaMek design of that name and tonnage). pp.96 and 98 are column-split in the extract and were not parsed. Rommel and
  Schrek back-solve to different armor totals than the MegaMek files; the era sheets were not checked.
- OPEN, on #621 for the user: VTOL rows run 1-4 BV above the printed figures. Built with the +1 the book states; no
  single reading fits every row. Also on #621: VTOL Flank MP counted twice, and the other book-silent calls. Leave as built.
- New #624: Level 3 vehicle items BV1 prices but the builder cannot make (minesweeper, coolant system, additional crew,
  snowmobile, trailer rig MP, items not offered under BV1 editions).
- Deploy with `git deploy-beta` only.
- NEXT: 3-2, an e2e that shows a vehicle's BV1 in the UI (creator, sheet, roster total), then round 4 (fighter, small
  craft, capital ship; AT2 / AT2R). Round cleanup each time: commit, push beta, `git deploy-beta`, ff master in
  `C:/repo/battletech-tools` and push, comment/close the issue.

# EARLIER (2026-11-04): TRO - JBT, ArtVee rules and Home rework done, 3-1 since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- DONE in abba22214 and 0f7eaf13f: beta = master = origin, deployed and live, #623 closed. At abba22214, 3948 unit tests, lint, typecheck green;
  e2e artvee, smoke, accessibility green in Chromium.
- Built: TRO - JBT on the top menu after Game Management (`/classic-battletech/tro-jbt`, `tro-jbt.tsx`): landing page,
  a card per document in `TRO_DOCUMENTS`, paged reader, Markdown download. A new document needs its slug in `_router.tsx`.
  Lore is in `docs/lore`: `tro-jbt.md` (Explanation), `artvee-tro.md`, `ammunition-tro.md` (moved out of TRO.md).
- Built: Bishop Move and fouled spades in Play Mode, numbers in `ARTVEE_PLAY_RULES` (rules-editions.ts). My calls are
  listed on #621 for review. Not on the record sheet, no Alpha Strike version.
- Home: Status page gone (`/dev-status` redirects Home), Status and Plans row at the bottom, Why moved to About,
  Available Tools and News share `.home-scroll`. About: maintainers reordered, NGCFells text added.
- Beta script (`.git/beta/inject-issues-button.cjs`, untracked): Ko-fi is now a small Tip link beside the NGCFells name,
  and tracked HeySporky issue links are swapped for the fork's at deploy. Keep the fork issues URL out of tracked files.
- The ArtVee TRO hold is lifted for the work above; still check before large rewrites of the user's text.
- RULED by the user, done in 0f7eaf13f: tucked pods stay (custom hand drawn art comes later); the drill is typically
  three volleys, sometimes two, never four; the equipment is now ComboGun, old spelling kept in `altNames`;
  `artveeTRO.md` deleted. 3949 unit tests, lint, typecheck green; e2e artvee green in Chromium.
- Deploy with `git deploy-beta` only. `npm run deploy-dev` hits the same fork gh-pages but skips the beta injection.
- NEXT: round 3, vehicle BV1 (plan "Rounds" item 3, findings in "Segment 3"). Carry over: vehicle semi-guided x6 and the
  `tagged` run, as `BattleMech.getBattleValueTagShare` does. Split data/BV/tests from UI/e2e. Round cleanup each time:
  commit, push beta, `git deploy-beta`, ff master in `C:/repo/battletech-tools` and push, comment/close the issue.

# EARLIER (2026-11-04): 2-4 done (BV1 force rules), next round 3 (vehicle BV1)

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- 2-4 DONE in 093cb1b8d: beta = master = origin, deployed to beta, news line (home.tsx Nov 3). Unit tests, lint, typecheck
  green (3935 passed, 7 skipped in beta; the count includes 6 gitignored `src/zz-local` files, master has fewer). BV survey
  before and after: 6,400 units, no differences. `e2e/vehicle-roster.spec.ts` passes (Chromium), but no e2e exercises BV1
  force totals; unit tests cover them. `npm run build:bundled` report not run: per-unit BV code did not change.
- Built: `master-rules` and `master-rules-revised` records in `BV_FORCE_RULES` (Arrow IV homing + TAG +200, C3 35% of
  weapons in a complete network); Max Tech semi-guided LRM x6 beside real TAG and command console +200 per side.
  Details: "2-4 DONE" in the plan. No issue tracks 2-4 itself, so no progress comment was posted.
- For the user's later review: 5 more book-silent calls added to #621 (fighting group = force, bonuses before skill, two
  masters incomplete, no rear swap in the 35%, enhanced LRM semi-guided x6). Leave as built until ruled.
- New #622: satellite uplink and field/mobile HQ have no catalog item, so their per-side BV is not built. When they land,
  `getBattleValueText`'s console line becomes the single side bonus (uplink stacks with console, HQ does not).
- Tip: the survey needs a before and after: `BV_SURVEY_OUT=<file>` on `src/classes/bv-survey.generator.test.ts` with
  `--testTimeout=550000`; detach `C:/repo/battletech-tools` at the old commit for the before run, then check out master.
- The ArtVee TRO hold still stands: do not touch `docs/lore/artvee-tro.md` or the readout without checking first.
- NEXT: round 3, vehicle BV1 (plan "Rounds" item 3, findings in "Segment 3"). Carry over: vehicle semi-guided x6 and the
  `tagged` run, as `BattleMech.getBattleValueTagShare` does. Split data/BV/tests from UI/e2e. Round cleanup each time:
  commit, push beta, `git deploy-beta`, ff master in `C:/repo/battletech-tools` and push, comment/close the issue.

# EARLIER (2026-11-04): 2b-5b done, Round 2b complete, 2-4 since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- 2b-5b jump pack sheet and play DONE in 16aed99f0: beta = master = origin, deployed to beta, progress comment on #612,
  news line (home.tsx Nov 3). 3940 unit tests, lint, typecheck green; 14 e2e pass (mech-rules-edition,
  industrialmech-play, Chromium). Details and book-silent calls: "2b-5b DONE" in the plan.
- #612 stays open: its body also lists ProtoMech jump packs and battle armor EI implants, neither built.
- User ruling 2026-11-04: the jump pack takes no slots. All other book-silent calls and the ArtVee name and introduction
  checks are listed for the user's later review in #621; leave them as built until then. The user is editing the
  ArtVee TRO now: do not touch `docs/lore/artvee-tro.md` or the readout without checking first.
- Fixed in passing: reopening Set Movement reset the turn's Jumping MP to 0.
- Tip: `InputNumeric` renders a select in the Set Movement dialog, and that dialog has two Save buttons (e2e `.first()`).
- NEXT: 2-4 BV1 force rules in `BV_FORCE_RULES` (Arrow IV homing + TAG +200; C3 +35% of weapons, rear halved; satellite
  uplink and command console +200 per side, semi-guided LRM; plan lines 427-432), then round 3. Round cleanup each time:
  commit, push beta, `git deploy-beta`, ff master in `C:/repo/battletech-tools` and push, comment/close the issue.

# EARLIER (2026-11-04): 2b-5a done, ArtVee readout in TRO format shipped, 2b-5b since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- 2b-5a jump pack DONE (b0a142bb8): data, builder, cost, BV1, save, TRO. #612 commented. Findings and the 2b-5b
  additions are in `docs/superpowers/plans/2026-11-03-edition-aware-bv.md`.
- AWAITING USER RULING: Max Tech pp.85-86 print Crit. `4*` for the pack; the entry (pp.80-81), the cargo rules (BMR(R)
  p.77) and the p.118 master table give no slots. Built with no slots until the user rules. Book-silent calls to review:
  BMR(R) floors fractional MP, half-ton steps under BMR(R), price through the tonnage multiplier, pack allowed beside
  jets, LAM bar from TW on only, Clan carry-over before 3083.
- ArtVee readout DONE (7dde04cb9, deployed, beta = master = origin): TRO order and voice, about grade 7, signed Vance
  introduction, SLDF / Clan / Inner Sphere sections, spec lines, stat pages, three Falconet plates
  (`docs/lore/artvee-falconet.svg`, image block in `ReadoutText`). Unit headings must keep their exact sample names (tests).
  New homebrew names awaiting the user's read: engine brands, comms and targeting systems in the spec lines. The signed
  introduction restores the Vance and St. Jamais facts from the removed Framing list; user to confirm or cut it.
- Follow-up, user ruling: ArtVees run on four split track pods on hinged arms; in Siege Mode they swing into an X from above and an Iron Knee drops a spade at each corner (the turret fires any way). Plates redrawn, side and from above; text updated. Script kept only in the session scratchpad.
- 3918 unit tests, lint, `e2e/artvee.spec.ts` green after that follow-up.
- Library: `sort_unsorted.py` finished: 1,160 proposals in `unsorted/_proposal.jsonl` (804 move, 221 review, 135 duplicate), nothing moved; this run's log `unsorted/_sort-2026-11-04.log` has 877 of them and 6 MuPDF lines. Prior
  proposals saved as `_proposal-2026-10-25.jsonl`. User reads proposals before any --apply. The JBTIICRework git changes
  are `unsorted/` churn plus `errata-2025/`, whose 12 sheets all moved to `errata/`: no rulebook was lost. BV v4.1 is at
  `errata/100_TechManual-Battle-Value-v4.1.pdf`; the old path below is out of date.
- Library rulebook sort DONE 2026-11-04 (user request): 96 steps, log `unsorted/_rulebook-sort-2026-11-04.json`, also in
  `_moves.json`. `unsorted/Rulebook`, `Box Set`, `MechWarrior RPG` are empty and removed. 54 new files placed (4 replace a
  library copy), 8 refiled (translations to `languages/`, Mercenary's Handbooks to `rpg/`), 34 copies set aside plus the 4
  replaced ones: 1.15 GB in `unsorted/_duplicates/rulebooks-2026-11-04/`, nothing deleted; user decides when to delete.
  Text, offsets, hashes, INDEX.md and search rebuilt; all hashes and 18 citations verified. Library changes NOT committed.
  `unsorted/_proposal.jsonl` still lists these rulebooks at their old paths, so re-run or filter it before any --apply.
  Open for the user: (1) library `BattleMech Manual (Corrected 6th Printing, 2021).pdf` and the new `(Corrected 6th
  Printing, Oct 2022)` both stamp sixth but differ on 11 pages; the library one is almost word for word the 5th. Both
  kept. (2) Kept both copies, each has something the other lacks: BattleTech Manual, BattleForce 2, CityTech 1st, Max Tech
  Revised, AeroTech 2 Revised, MechWarrior Companion, Mercenary's Handbook, Guide to the Clans (146p and 144p scans).
  (3) `rulebooks/` still holds non-rulebooks: Master Unit List, product list, Alpha Strike special abilities, tournament
  rules. (4) Max Tech (FanPro, scan) 126p set aside: printed-page cites stand, but a pdf-index cite to that file needs the
  132p scan. Library tools still name `errata-2025`: #620.
- NEXT: 2b-5b jump pack sheet, play, e2e. Round cleanup each time: commit, push beta, `git deploy-beta`, ff master in
  `C:/repo/battletech-tools` and push, comment/close the issue (#612).

# EARLIER (2026-11-03, night): ArtVee readout shipped, library intake still running, then 2b-5a

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- ArtVee DONE: the 3085 readout is `docs/lore/artvee-tro.md` (skeleton folded in, Design Notes added). The page
  `/classic-battletech/artvee-readout` renders that file; it is on the Classic BattleTech menu and linked from the
  Vehicle Creator's sample list. beta = master = origin, deployed. #180 closed. 3895 unit tests, lint, typecheck green;
  the readout e2e passes (Chromium). Each stat block's mass and BV are tested against its sample design. The readout was
  deployed on the user's order; `artveeTRO.md` here is now a stale copy, safe to delete once the user agrees.
- New: #618 (samples' own TRO step lacks the readout text and makers), #619 bug (beta buttons push the logo off the page
  at phone width, every page; fix in `inject-issues-button.cjs`).
- Fixed: `index.html` dropped the hash on direct links through the GitHub Pages redirect.
- e2e tip: port 4173 was taken by another project (`testingUtility` preview, not ours). Playwright then fails to start
  its web server. Leave that process alone; wait, or serve the build with `npx vite preview --port 4199 --strictPort`.
- Library intake DONE 2026-11-04 01:03: blacklist clean. 1,080 of the new files logged "Defender: not available", so a
  one-shot folder scan runs first (`unsorted/_defender-scan.log`, remediation off). `verify_unsorted.py` now walks
  subfolders and skips `scrapes/` (uncommitted, with the watcher and hash edits). Evidence and OCR passes follow in the
  same background chain; `--judge` runs next (report: `unsorted/_verify-report-2026-11-04.txt`). Defender: no threats in all of unsorted. Then `sort_unsorted.py` proposals for the user to read before any
  --apply. `sort_unsorted.py` now sends subfolder PDFs to the model too (uncommitted); run it after `--judge` ends, as both use Ollama.
  The items below on re-copies still stand.
- NEXT: 2b-5a jump pack: data, builder, cost, BV1, save, TRO. Then 2b-5b: sheet, play, e2e. Split like 2b-4. Page images
  read 2026-11-03 and they match the plan: Max Tech pp.80-81, TO:AUE p.105. Max Tech p.92 is rendered but NOT yet read.
  Nothing coded yet. Round cleanup each time: commit, push beta, `git deploy-beta`, ff master in
  `C:/repo/battletech-tools` and push, comment/close the issue (#612).

# EARLIER (2026-11-03, late): library intake and ArtVee fluff, ArtVee since done

- Library drop (1,927 files after 5 empty PDFs were deleted): full intake queued from the scratchpad, waits for the
  watcher's slow check_blacklist step. Check `unsorted/_intake.log`. NEXT: `verify_unsorted.py`, then
  `sort_unsorted.py` proposals for the user to read before any --apply.
- `watch_unsorted.py` now walks subfolders (it saw top-level files only); `hash_library.py --check` ignores unsorted/.
  Both edits are uncommitted. The running watcher still has the old code until restarted (next logon).
- Re-copy needed (they arrived empty, now deleted): CO errata v4.0, Djinn of Despair ch.8, Strange Bedfellows,
  Combat Equipment (35017; not found in sourcebooks/, check elsewhere). Field Manual: Draconis Combine is already held.
- Keep the empty files in `text/_ocr_cache` (blank-page markers) and the .lock files.
- ArtVee: clean TRO draft at `C:/repo/JBTToolsSupportFiles/artveeTRO.md`, dated 3085, awaiting user read. After that,
  fold into `docs/lore/artvee-tro-skeleton.md`. Superheavy Bricole (Hailstorm combo) notes on #178.
- ArtVee lore checked against Sarna and the library, and user rulings applied: IrTech MAPs are a rebel-cell project,
  Archerfish at Cuan, Tormentum to Benet III, 3085 production table and Clan spread added (Horses, Stone Lion, Sharks,
  Wolf-in-Exile), and 12 St. Jamais margin notes (nothing past 3072). Homebrew with no canon source: Bureau of
  Technology, Republic Archives, Republic Armored Corps.

# EARLIER (2026-11-03): 2b-4 armless complete and #616 fixed, next 2b-5 jump pack

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  "2b-4b DONE" and the "2b-5 Jump pack" entry under it. USER: smaller chunks, stop well before a compact. Reuse/extend,
  no new files.
- 2b-4b and #616 DONE in 03a4d214f: beta = master = origin, deployed to beta, #616 closed, comment on #612, news lines
  (home.tsx Nov 3). 3884 unit tests, lint, typecheck green; 12 e2e pass (mech-rules-edition, industrialmech-play, Chromium).
- New enhancement #617: Level 2 armless, FrankenMech arm donors, armless flag surviving a quad round trip.
- 27 of 34 printed costs still differ after #616; the cause is not looked at yet. Check before calling costs right.
- Full unit runs lose a few tests to 5s and 30s timeouts, a different set each run; they pass alone (the Ares "flake"
  is one of these). Rerun the failures alone before chasing them.
- Tip: the Bash hook blocks any heredoc with an apostrophe, even inside Python: write scripts with the Write tool.
- NEXT: 2b-5 jump pack, one per session. Round cleanup each time: commit, push beta, `git deploy-beta`, ff
  master in `C:/repo/battletech-tools` and push, comment/close the issue (#612).

# EARLIER (2026-11-03): 2b-4a (armless builder, cost, BV1, save) DONE, 2b-4b and #616 since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  "2b-4a DONE" under the 2b-4 entry. USER: smaller chunks, stop well before a compact. Reuse/extend,
  no new files.
- 2b-4a DONE in aa693b338: beta = master = origin, deployed to beta, progress comment on #612, news line (home.tsx
  Nov 3). Rule read from the page images (Max Tech pp.62-63, 92). `isArmless()` is the one gate; `setArmless()` re-runs
  `setTonnage`. 3881 unit tests, lint, typecheck green; "offers armless 'Mechs" e2e passes (Chromium).

# EARLIER (2026-11-03): 2b-3c3 (EI on the sheet) DONE, 2b-3 complete, 2b-4a since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  "2b-3c3 DONE" and the "2b-4 Armless" entry under it. USER: smaller chunks, stop well before a compact. Reuse/extend,
  no new files.
- 2b-3c3 DONE in 30e94d091: beta = master = origin, deployed to beta, progress comment on #612, news line (home.tsx
  Nov 3, the play-mode item). Warrior Data box (battlemech-svg.tsx), left of Piloting / Gunnery: "EI", an On box
  (`data-testid="ei-box"`; blank on paper, marked in play while `isEnhancedImagingActive()`) and the feedback reminder.
  `getEnhancedImagingFeedback()` is the one wording for the sheet and `takeDamage`. Unit tests in
  armored-components-record-sheet.test.tsx. 3870 unit tests, lint, typecheck green; "EI implants" e2e passes
  (Chromium). Layout checked from a screenshot.
- Open gaps from 2b-3 (in the plan): rapid-fire multi-shot aim not blocked; BTC / BTC:RoW TC-aimed hit rules not read;
  aim is per target, not per weapon; torso cockpit both-head +4 to physical attacks.
- Tip: the Bash hook blocks any heredoc with an apostrophe, even inside Python: write scripts with the Write tool.
- NEXT: 2b-4 armless (builder + sheet + play + BV: split in two sessions, per small-rounds), then 2b-5 jump pack, one
  per session. Round cleanup each time: commit, push beta, `git deploy-beta`, ff master in `C:/repo/battletech-tools`
  and push, comment/close the issue (#612).

# EARLIER (2026-11-03): 2b-3c2b (aimed shots + TC -1 bug) DONE, 2b-3c3 since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  segment 2b-3, "2b-3c2b DONE" and "2b-3c3 LEFT". USER: smaller chunks, stop well before a compact. Reuse/extend, no
  new files.
- 2b-3c2b DONE in 9ef96bd84: beta = master = origin, deployed to beta, progress comment on #612, news line (home.tsx
  Nov 3, the play-mode item). `ITargetToHit.immobile` / `aimedLocation`; `IEditionPlayRules.immobileTargetModifier`
  (BD 0). `getTargetToHitFromWeapon`: immobile -4 (head aimed +3 instead); TC -1 (BUG: play never applied it) or +3
  aimed at an active target (no head, no pulse); EI aims TW +5 / Max Tech +6 / with TC +2. Dialog:
  `renderTargetConditions` (was renderTargetTerrain), `updateTargetFlag` (was updateTargetAirborne). Rules images
  checked: TW p.110, Max Tech printed p.61 (= pdf 62; the old EI "p.62" cites were corrected to p.61). 3868 unit
  tests, lint, typecheck green; "EI implants" e2e passes (Chromium).
- Gaps (in the plan's 2b-3c2b note): rapid-fire multi-shot aim not blocked; BTC / BTC:RoW TC-aimed hit rules not read;
  aim is per target, not per weapon.
- e2e tip: `InputCheckbox` is an icon label, not a native checkbox: click `.modal label.checkbox-input` with hasText.
- NEXT: 2b-3c3 sheet ("EI" note + on/off box + feedback reminder), then 2b-4 armless, 2b-5 jump pack, one per
  session. Round cleanup each time: commit, push beta, `git deploy-beta`, ff master in `C:/repo/battletech-tools` and
  push, comment/close the issue (#612).

# EARLIER (2026-11-03): 2b-3c2a (sensor / woods / darkness to-hit) DONE, 2b-3c2b since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  segment 2b-3, "2b-3c2a DONE" and "2b-3c2b LEFT". USER: smaller chunks, stop well before a compact. Reuse/extend, no
  new files.
- 2b-3c2a DONE in bae399fd7: beta = master = origin, deployed to beta, progress comment on #612. `ITargetToHit` gains
  `lightWoodsHexes` / `heavyWoodsHexes` / `darkness`; `getTargetToHitFromWeapon` (utils.ts) adds them through the shared
  `systemModifier` (fire control and heat now use it too; it skips 0), with the EI reductions (IO:AE p.69 TW; Max Tech
  p.62 via `usesEarlierRulesEdition()`). `getSensorToHitModifier()` (+2; +4 at a torso cockpit's second hit),
  `sensorHits(locations)`, blind torso cockpit +4 Piloting. Target dialog: `updateTargetNumber` + `renderTargetTerrain`
  (numeric inputs render as selects: e2e uses selectOption). 3876 unit tests, lint, typecheck green; "EI implants" e2e
  passes (Chromium).
- Gap (plan): torso cockpit both-head +4 to physical attacks is not modelled (play has no physical to-hit).
- NEXT: 2b-3c2b aimed shots (no aimed-shot / called-location input in play at all, not even for a TC; values in the
  plan), then 2b-3c3 sheet, then 2b-4 armless, 2b-5 jump pack, one per session. Round cleanup each time: commit, push
  beta, `git deploy-beta`, ff master in `C:/repo/battletech-tools` and push, comment/close the issue (#612).

# EARLIER (2026-11-03): BUG #615 DONE, then 2b-3c2a

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  segment 2b-3, "2b-3c2 LEFT" (now also lists the sensor-hit to-hit gap). USER: smaller chunks, stop well before a
  compact. Reuse/extend, no new files.
- #615 DONE in bbd50e83b: beta = master = origin, deployed to beta, issue closed by the commit + comment posted.
  `sensorHits()` reads head + CT; `areSensorsDestroyed()` trips at 3 with a Torso-Mounted Cockpit (TO:AUE p.113, pdf
  115 of the Corrected 4th Printing); the sheet's Sensor Hits row shows a third box for it. Test in
  battlemech-torso-mounted-cockpit.test.ts. quad-record-sheet.test.tsx got a 20 s timeout (timed out at 5.6 s under
  full-suite load). 3865 unit tests, lint, typecheck green.
- Gap logged in the plan under 2b-3c2: 'Mech play applies NO sensor-hit to-hit modifier (TW p.128 +2 per hit; torso
  cockpit +2/+4, both-head +4 physical/Piloting, third hit +4 Piloting). Do it with the 2b-3c2 to-hit inputs.
- NEXT: 2b-3c2 to-hit (terrain/darkness/aimed-shot inputs + EI values + sensor modifiers), then 2b-3c3 sheet, then
  2b-4 armless, 2b-5 jump pack, one per session. Same round cleanup as below.

# EARLIER (2026-11-03): 2b-3c1 (EI play switch) DONE, then bug #615

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  segment 2b-3, the "2b-3c1 DONE" note and "2b-3c2 / 2b-3c3 LEFT" under it. USER: smaller chunks, stop well before a
  compact. Reuse/extend, no new files.
- 2b-3c1 DONE in 53c9745df: beta = master = origin, deployed to beta. `enhancedImagingOff` + `isEnhancedImagingActive()`
  (TW needs implants, Max Tech not), Piloting -1 in `getPilotingSkillModifier`, `takeDamage` returns a feedback line on
  structure damage, the play damage log prints result lines, Target dialog has the End Phase EI box (Cancel restores).
  Rules read: Max Tech p.62 (pdf 62), IO:AE p.69. 3864 unit tests, lint, typecheck green; "EI implants" e2e extended
  into play and passes (Chromium).
- Gap logged: bug #615 (`sensorHits()` counts head slots only, so torso-mounted cockpit sensor hits are missed).
- NEXT (bugs first): #615 (count Sensors in every location + test; close with a comment). Then 2b-3c2 to-hit (play has
  no terrain or aimed-shot inputs at all; plan lists the per-edition values), then 2b-3c3 sheet. Then 2b-4 armless,
  2b-5 jump pack, one per session. Round cleanup each time: commit, push beta, `git deploy-beta`, ff master in
  `C:/repo/battletech-tools` and push, close/comment the issue.

# EARLIER (2026-11-03): BUG #614 DONE, 2b-3c since split (see above)

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  segment 2b-3, "2b-3c LEFT". USER: smaller chunks, stop well before a compact.
- #614 DONE in 54a1ea2b7: beta = master = origin, deployed to beta, issue closed with a comment, news line (home.tsx
  Nov 3). Search Rules offers Experimental; saved designs in the roster add dialog's `summarize` now carry
  `rulesLevel: getSSWRulesLevel(getRequiredRulesLevel())` (classicMULMatch.ts, app 1-4 -> SSW 0-3, else unset). Before,
  a saved design had `Rules: ""` and passed every Rules choice. The MUL matcher (`MUL_RULES_LEVEL_MAP`, utils.ts) and
  the live-MUL URI (Rules=6) already knew "experimental". The dropdown keeps the MUL's own level names, not the
  per-edition ones (it filters MUL records). 3872 tests, lint, typecheck green; EI e2e extended (Standard leaves the
  saved design out, Experimental lists it) and passes on a fresh build.
- NEXT: 2b-3c (EI play: End Phase on/off, Piloting -1, woods/smoke/darkness to-hit, aimed shots, feedback roll on
  structure damage, sensors crit kills it, 1-hex probe note; sheet "EI" note + on/off box + feedback reminder). Then
  2b-4 armless, 2b-5 jump pack, one per session. Then 2-4, then round 3.

# EARLIER (2026-11-03): 2b-3b (EI implants + BV2) SHIPPED, #614 since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  segment 2b-3: the "2b-3b DONE" note and "2b-3c LEFT" under it. USER: smaller chunks, stop well before a compact.
- 2b-3b DONE in 890a867fb: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` (the master worktree)
  fast-forwarded, news line extended (home.tsx Nov 3, the EI item). `Pilot.eiImplants` (optional in `IPilot`),
  `setPilotEIImplants`, roster pilot-editor box; `_getBattleValueSkills(edition)` replaces `_getBattleValuePiloting`
  (IO:AE p.184: implants + interface = G and P 1 better outside Level 3 BV1). 3869 tests, lint, typecheck green; e2e
  "EI implants raise the roster's adjusted BV under TW" passes.
- BUG #614 (user: it is a bug, not a gap): the unit search "Search Rules" filter (`src/ui/components/mul-search-filters.tsx`,
  roster add dialog) has All / Introductory / Standard / Advanced only, no Experimental. Bugs come first: fix #614
  BEFORE 2b-3c (failing test first; check how `filters.rules` is matched and whether the per-edition level names apply).
- e2e tips: the roster add dialog stays open after Add; close it with the dialog's "Close" button (Escape does not).
  `git checkout master` fails in -master (master is the worktree at `C:/repo/battletech-tools`): ff it there.
- NEXT: #614, then 2b-3c (EI play: End Phase on/off, Piloting -1, woods/smoke/darkness to-hit, aimed shots, feedback roll on
  structure damage, sensors crit kills it, 1-hex probe note; sheet "EI" note + on/off box + feedback reminder). Then
  2b-4 armless, 2b-5 jump pack, one per session. Then 2-4, then round 3.

# EARLIER (2026-11-03): 2b-3a (EI builder + BV1) SHIPPED, 2b-3b since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  segment 2b-3: the "2b-3a DONE" note and the "2b-3b LEFT" list under it. USER: smaller chunks, stop well before a compact.
- 2b-3 was split in two. 2b-3a DONE in e18798238: beta = master = origin, deployed to beta, `C:/repo/battletech-tools`
  fast-forwarded, news line (home.tsx Nov 3). EI cockpit add-on (Clan only; BMR(R) Level 3 = Max Tech one cockpit system,
  +200,000; TW = IO:AE interface, Experimental), step 2 checkbox, save/load, TRO, MegaMek `nocrit:EIInterface` import,
  BV1 (Goshawk + EI 2,270, skill 2,384). 3870 tests, lint, typecheck green; e2e "offers Enhanced Imaging" passes.
- Bug fixed on the way: `getRequiredRulesLevel` returned 0 under BMR / BMR(R) (stale since BUG 1); now graded, with a
  record's `editionLevels` winning. Also `getPilotAdjustedBattleValue(edition, bonus)` now reads the Level 3 cockpit
  Piloting adjustment as the cached path does.
- e2e tips: Clan default era (Clan Founding Years) predates EI's 3040, so pick `clan-inv`; `getByLabel` with a regex
  missed the checkbox, `getByRole("checkbox", { name })` works.
- NEXT: 2b-3b (pilot `eiImplants`, BV2 -1 G / -1 P with the interface, play effects, sheet note), then 2b-4 armless,
  2b-5 jump pack, one per session. Then 2-4, then round 3.

# EARLIER (2026-11-03): 2b-2 SHIPPED, next 2b-3 (EI), 2b-3a since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  "Round 2b", segment 2b-3 (enhanced imaging; rulings R1 there). USER: smaller chunks, stop well before a compact.
- 2b-2 DONE in fa5e16208: the "targeting systems" e2e passes in Chromium (fresh build, summary-sheet and
  one-system checks included, no fix needed). beta = master = origin, deployed to beta, `C:/repo/battletech-tools`
  fast-forwarded. 2b-2 gaps stay logged in the plan's 2b-2 note.
- NEXT: 2b-3 EI, then 2b-4 armless, 2b-5 jump pack, one per session. Then 2-4, then round 3.

# EARLIER (2026-11-03): 2b-2 (targeting systems) COMMITTED, e2e/push/deploy since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: the 2b-2 DONE note in `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`.
- USER (2026-11-03): smaller chunks; stop well before a compact, they prefer to clear.
- fa5e16208 on beta (local only). Six Max Tech p.59 records, p.58 conflict, p.87 cost, to-hit play effects +
  VRTS picker in the roster Target dialog, BV1 (ENF-6M + VRTS 1,510; MT II rear laser 1,471 -> 1,447). Fixed the
  "Secondary Target In Rear Arc (+1)" front-arc label and the dialog's -1/-2 text. News line added (home.tsx Nov 3).
  3865 unit tests, lint, typecheck green.
- LEFT TO DO, in this order (one short session):
  1. Run the new e2e: `npx playwright test e2e/mech-rules-edition.spec.ts --project=chromium --workers=4 -g "targeting systems"`
     (kill any stale vite preview on 4173 first). Not run yet: the summary-sheet assertion (VRTS text in the SVG
     crit table) and "no Add button for a second system" are unverified guesses; fix the spec or code if it fails.
  2. Push beta, `git deploy-beta`, ff master (`C:/repo/battletech-tools` too).
- Gaps logged in the plan's 2b-2 note: VRTS / MT II crit effects in play, no VRTS box on the sheet, no side-arc flag.
- THEN: 2b-3 EI, 2b-4 armless, 2b-5 jump pack, one per session. Then 2-4, then round 3.

# EARLIER (2026-11-03): #613 ('Mech part grades) DONE, next 2b-2

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  "Round 2b: Level 3 content", segment 2b-2 (VRTS / Multi-Trac II + R6's four + the BMR(R) Level 3 groundwork).
- #613 DONE in 02f42161a: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded, issue
  closed with a comment, news line (home.tsx Nov 3). Levels read from the record's own TO:AUE / IO:AE page (images
  checked: TO:AUE pp.92-94, 107, 121; IO:AE pp.62-63, 68, 80-82; text layer for TO:AUE pp.119, 128-129, 153-155):
  - Experimental (4): hardened, reactive, laser-reflective, ferro-lamellor, modular, vehicle stealth, EDP armor;
    XXL + all 7 large engines; endo-composite, reinforced, composite; compact + freezer heat sinks; 'Mech UMU;
    super-cooled myomer; DIC, VR pod, EI interface (EI prints no level: Augmented Warrior rules, IO:AE p.68).
  - Advanced (3): laser heat sinks, patchwork, the four Dark Age armors, DNI, SLDF neurohelmet.
  - TM parts stay Standard (unset): XL / compact / HD gyros, XL / light / compact engines, endo steel, FF family,
    mimetic / improved stealth (these are TM BA armors, pp.252-253). Primitive parts left ungraded (`_primitive` = 3).
  - `getEquipmentRulesLevel` takes any record with those fields; `getRequiredRulesLevel` counts the parts with it
    (jump jets only when mounted, every patchwork location), so prototype-only parts count as Experimental.
  - Test: edition-standing.test.ts "'Mech parts carry their TO:AUE / IO:AE rules level (#613)". Five older tests that
    expected these parts at Standard were moved to level 3 / 4. 3857 tests, lint, typecheck green. Not browser-checked
    (data and filter only).
- User ruling 2026-11-03: superheavy 'Mechs stay Advanced with an engine rating of 400 or less (slower); a large
  engine (above 400) makes the design Experimental. That is what the code does now, so no change was needed.
- NEXT: 2b-2, then 2b-3 EI, 2b-4 armless, 2b-5 jump pack, one per session. Then 2-4, then round 3.

# EARLIER (2026-11-03): BUG 2 (LRM ammo) DONE, next #613, then 2b-2

- BUG 2 DONE in 0f7c48982: beta = master = origin, deployed to beta, news line (home.tsx Nov 3). Cause: step1
  `updateGameSettings` called `settleRulesEditionSwitch()` on EVERY settings change, so a Rules Level change after
  adding gear re-stamped the way back; switching back to TW restored the old empty design (LRM 5 gone, so no ammo).
  Now it settles only when the edition changed. The flare e2e asserts the mounted LRM 5's ammo is listed without
  "Show all" (failed first, passes now). 3856 tests, lint, typecheck green; 6 edition e2e pass.
- NEXT: #613 ('Mech part grades), then 2b-2. Rest of the BUG 1 notes below.

# EARLIER (2026-11-03): BUG 1 (rules levels) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  "Round 2b: Level 3 content". Rules: reuse/extend, no new files, test first, one segment per session.
- BUG 1 DONE in d75038f83: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded.
  User ruling 2026-11-03, "grade once": Level 1 / Introductory = 3025 technology (BMR p.6, BMR(R) p.6, page images
  checked; How the Core Rulebooks Work p.2 for TW). It was broader than the handoff said: TW Introductory offered
  Standard gear too. What changed:
  - `getEquipmentRulesLevel`: unset = `STANDARD_RULES_LEVEL` (2, new in rules-level-options.ts). The 3025 records
    say `rulesLevel: 1`: AC/2-20, MG, S/M/L laser, PPC, flamer, vehicle flamer, LRM 5-20, SRM 2-6, hatchet (MegaMek
    INTRO), and their standard ammo (in ammo.ts the key is at the record's end, for the canonical key order test).
  - `BattleMech.isOfferedInEdition`: an unset part level = Standard; standard engine, ICE, gyro, cockpit, armor,
    structure, single heat sink, jump jets and myomer say `rulesLevel: 1`. Biped and quad stay 0 (the Goliath and
    Scorpion are TRO 3025 quads).
  - `gradedLikeTotalWarfare: true` on the BMR / BMR(R) edition records: `getRecordLevelInEdition` reads the record's
    `rulesLevel` there (`editionLevels` still wins). The box sets stay ungraded (0).
  - Test: edition-standing.test.ts "Level 1 and Introductory offer only 3025 technology". Expectations updated: an
    all-3025 'Mech now needs level 1 (it was 0), an infantry laser rifle as an SV Light weapon needs 2. 3857 tests,
    lint, typecheck green. News line added under Nov 3 in home.tsx. Not browser-checked (data and filter only).
- New bug #613: 'Mech parts have no Advanced / Experimental grades (Hardened armor, large engines, XL gyro and so on
  are offered at Standard); `getRequiredRulesLevel` ignores part levels. Bugs come first, so do it after BUG 2.
- NEXT: BUG 2 (below, unchanged), then #613, then 2b-2 (VRTS / Multi-Trac II + R6's four + the BMR(R) Level 3 groundwork).

# EARLIER (2026-11-03): edition-aware BV, Round 2b segment 2b-1 (flare LRM ammo) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  "Round 2b: Level 3 content" (the 2b-1 DONE note under its segment, then 2b-2).
- 2b-1 DONE in ff98ebac0: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded, news
  (home.tsx, Nov 3) added. `ammo-lrm-flare` beside incendiary (editionLevels 2 under BMR / BMR(R), apocryphalIn
  TW / BMM / CRB per TM errata v4.1 p.18), MAX_TECH ammo x .05. 3855 tests, lint, typecheck green; e2e "offers flare
  LRM ammo by edition and rules level" (Chromium) passes.
- Plan corrected from page images: flare costs "normal" (30,000) in BMR p.138, BMR(R) p.151 AND TM 2007 p.295 (not
  x 2); TM 2007 dates 2377 (FS) / extinct 2790 / back 3054 (FW), tech rating C (p.345). The old reads were the
  Fragmentation and Harpoon rows.
- BUGS to fix FIRST next session (bugs before features; reproduce with a failing test first, then fix; also listed in
  the plan's 2b-1 DONE note):
  - BUG 1, BMR / BMR(R) rules levels: only `ammo-lrm-flare` has `editionLevels`; every other Level 2 record of
    those editions has none, so `getRecordLevelInEdition` gives 0 and BMR / BMR(R) at Introductory (1) offer Level 2
    gear. Fix: grade each record by the book's level (BMR / BMR(R) Level 1 = 3025 tech, Level 2 the rest; cite the
    book's level pages, page images checked), as data, no new mechanism. Test: an Introductory BMR(R) build is not
    offered a Level 2 item (e.g. `ammo-is-lrm-swarm-i`, an ER laser), Standard (2) is.
  - BUG 2, Mech creator add dialog under TW: with an LRM 5 mounted, the dialog's LRM filter listed NO LRM ammo
    (standard included) until "Show all ammunition" was ticked; under BMR(R) the same steps listed it. Seen in the
    2b-1 e2e run (build made under BMR(R), then edition switched to TW, Star League era). First check whether the
    LRM 5 was still mounted after the switch (if dropped, the bug is the edition switch), then find why the
    mounted-weapon ammo filter misses it. Test: e2e or a step5 unit test that the mounted LRM 5's ammo is listed.
- e2e tip: in the 'Mech creator, open the add dialog (`getByTitle("Open the add dialog")`), scope rows to
  `getByRole("dialog")`, and tick "Show all ammunition".
- NEXT: BUG 1 and BUG 2 above, then 2b-2 (VRTS / Multi-Trac II + R6's four + the BMR(R) Level 3 groundwork), then 2b-3 EI, 2b-4 armless, 2b-5
  jump pack, one per session. Then 2-4 (BV1 force rules), then round 3.

# EARLIER (2026-11-03): edition-aware BV, Round 2b part 1 (Level 3 content PLAN) DONE, 2b-1 since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`,
  section "Round 2b: Level 3 content" (after the 2-4 line): sources with cites (Max Tech Revised printed = pdf - 1),
  what exists, shared groundwork, rulings R1-R6, segments 2b-1..2b-5 with builder steps, BV1/BV2 steps and named tests.
  Research is done and cited: don't redo it.
- No code yet. Plan file is untracked (as before). Enhancement #612 opened: the rest of Max Tech isn't offered under
  BMR(R) (every Level 3 record is TW-only today), plus ProtoMech jump pack and BA EI implants.
- Key findings: flare LRMs are Level 2 (BMR p.130 / BMR(R) p.141) and were REMOVED from TM by errata (v4.1 p.18), so
  they copy `ammo-lrm-incendiary`; VRTS / Multi-Trac / AA survive in TW only as quirks; Multi-Trac II and armless are
  Max Tech only; the jump pack differs by edition (Max Tech: BMR jet weight table; TO:AUE p.105: own MP/fuel table);
  EI under IO:AE needs pilot implants (BV2 -1 G and -1 P, IO:AE p.184), interface BV 0.
- Rulings (user, 2026-11-03, written into the plan): R1 EI cockpit alone under BMR(R), pilot implants under TW; R2 no
  cargo MP penalty for the jump pack; R3 jump pack BV2 ignored and logged; R4 armless = no arm structure, arms removed
  from the sheet entirely (no boxes, no outline), tripods too. R5 (no dates for VRTS / Multi-Trac II) and R6 (the
  picker lists all six Max Tech targeting systems) accepted by the user ("sounds good"). NEXT: 2b-1 flare LRM ammo (needs no ruling), then 2b-2
  (VRTS / Multi-Trac II + the BMR(R) Level 3 groundwork), 2b-3 EI, 2b-4 armless, 2b-5 jump pack. One per session.
- 2b-1 workflow: test first (catalog, cost, BV1 x .05 under BMR(R) / x 1 under BMR), the `ammo-lrm-flare` record
  beside `ammo-lrm-incendiary` in `src/data/ammo.ts`, the MAX_TECH.ammo pattern in `src/data/battle-value.ts`; read the
  BMR flare price row from the page image first. Then browser check, news (home.tsx), commit, push, deploy-beta,
  ff master (`C:/repo/battletech-tools` too), handoff + clear. Run test, lint, typecheck one after another.
- THEN 2-4 (BV1 force rules), then round 3.

# EARLIER (2026-11-03): edition-aware BV, Round 2 segment 2-3 (Max Tech Level 3 BV1) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  (the 2-3 note under "Round 2 ('Mech BV1), split in four" lists what was built and the gaps).
- 2-3 DONE in d4e397f04: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded, news
  (home.tsx, Nov 3) updated. `MAX_TECH` (`IBattleValueLevelThree`) is `levelThree` on the BMR(R) 'Mech record only;
  `getPrintedItemBattleValue(item, edition, field, clan)` reads its p.90 table; `getAmmoBattleValueMultiplier` the
  p.91 ammo table. 3853 tests, lint, typecheck green; BV2 untouched.
- Max Tech's BV lists print no Level 3 'Mech, so the tests are hand-worked deltas on the ENF-6M / ENF-4R.
- NEXT, FIRST (user, 2026-11-03): build the Level 3 content that is missing, BEFORE 2-4. Six items: enhanced imaging
  (Clan EI), variable-range targeting system (VRTS), Multi-Trac II, BattleMech jump pack, armless 'Mechs, flare LRM ammo.
  Two parts, a handoff + clear after each:
  - Part 1, PLAN (no code): for each item, find the rules in every edition that prints it (Max Tech pp.59-64 /
    pp.90-92, TO:AUE, IO:AE, TM; `library_search.py`, page image checked) with cites: weight, slots, cost, dates, rules
    level, construction limits, BV1 (Max Tech) and BV2 (TO:AUE / IO:AE / v4.1) steps, record sheet and play effects.
    Check what already exists (catalog tags, `IEquipmentItem` fields, builder pickers, MTF/SSW import names) so each
    item extends a record or flag, no near-duplicates, no new files. Write it into the plan as "Round 2b: Level 3
    content", one segment per item or small group, TDD tests named, edition records per item.
    Part 1 also plans the BUILDER side for each item (user, 2026-11-03: "make sure we are capable in the builder"):
    how a player adds it in the 'Mech creator (picker step, equipment list, armless chassis option), slot placement and
    validation (violations with cites), weight/cost/tech level/era limits per edition, save/load, record sheet and TRO
    output, play-mode effects where the rules give any.
  - Part 2, BUILD: the segments from part 1, one per session. Each segment ships the item usable in the builder FIRST
    (add/remove in the creator, placement, validation, save/load, sheet), then its BV1 + BV2 steps and import mapping;
    test first for both. Check it in a browser (Playwright, or `run` skill) before calling it done. Then news, commit,
    push, deploy-beta, ff master, handoff + clear. BV1 steps: EI +5% weapons (stacks with TC), -25 defensive,
    Piloting -1 for skill; VRTS +10% like a TC; Multi-Trac II rear weapons full; jump pack MP x 5 to final; armless
    +0.1 DMF; flare LRM ammo x .05.
- THEN, 2-4: BV1 force rules in `BV_FORCE_RULES` (Arrow IV homing + TAG +200; C3 +35% of weapons, rear halved;
  Max Tech satellite uplink / command console +200 per side, not with a Mobile HQ; semi-guided LRM ammo x6 beside a
  friendly TAG). Then round 3 per the plan.

# EARLIER (2026-11-03): edition-aware BV, Round 2 segment 2-2 ('Mech BV1 calculation) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  ("Round 2 ('Mech BV1), split in four"; the 2-2 note lists what was built and the gaps).
- 2-2 DONE in f0ac0a8c1 + 04cb62438: beta = master = origin, deployed to beta, `C:/repo/battletech-tools`
  fast-forwarded, news (home.tsx, Nov 3) updated. `BattleMech._calcBattleValue1(edition, log?)`, cached per edition;
  both 'Mech BV_RULES records entered, so Master Rules 'Mechs show "BV1 (BV2: x)" on their own skill table.
  `getBattleValueEdition` / `getPrintedItemBattleValue` / `getSpeedFactor` in battle-value.ts. 3835 tests, lint,
  typecheck green; bundle report unchanged (BV2 untouched).
- Tests: Goshawk 2,243 (BMR, BMR(R), box set), ENF-4R 895, ENF-6M 1,427. Local helper (gitignored)
  `src/zz-local/bv1-check.test.ts` prints a MegaMek file's BV1 log: `BV_FILES="3060u/Black Watch BKW-7R.mtf"
  npx vitest run src/zz-local/bv1-check.test.ts --silent=false` (ENF-5D 1,039 and BKW-7R 1,831 match Max Tech).
- NEXT, 2-3: Max Tech Level 3 BV1 (segment 1 list in the plan, special-ammo table; the 2-2 gaps: Level 3 engine
  structure factors, CASE II, RAC / one-shot heat), tests from Max Tech pp.94 on. Then 2-4 (BV1 force rules).

# EARLIER (2026-11-03): edition-aware BV, Round 2 segment 2-1 (BV1 equipment values) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  ("Round 2 ('Mech BV1), split in four", after "Notes for round 2"; segment 1 has the BV1 step table and Goshawk).
- 2-1 DONE in 4dbde273d: beta = master = origin, `C:/repo/battletech-tools` fast-forwarded. Not deployed (data
  only, nothing reads it yet). BMR pp.142-144 / BMR(R) pp.156-158 BVs and ammo BV per ton in 144 records'
  Master Rules stats; `getItemBattleValue(item, edition, field)` in battle-value.ts. 3830 tests, lint, typecheck green.
- Torpedoes take the LRM/SRM values of their range (user ruling, 796ba1636).
- IS Ultra AC/10 253/29 CONFIRMED (e7aab1fb2): Enforcer III ENF-6M 1,427 and Black Watch BKW-7R 1,831 (Max Tech
  pp.101-103) work out exactly with it. Max Tech's list follows BMR(R) to the point: use it for 2-2 tests (ENF-4R
  895, ENF-5D 1,039, ENF-6M 1,427, BKW-7R 1,831, with the TRO stat blocks). Two formula notes for 2-2 are in the plan
  (the XL factor replaces x1.5; Streak heat halved).
- NEXT, 2-2: the 'Mech BV1 calculation with the Goshawk test (2,243), then 2-3 (Max Tech Level 3), 2-4 (BV1 force
  rules). Bash hook: heredocs with an apostrophe are blocked; use Edit or a scratchpad script.

# EARLIER (2026-11-03): edition-aware BV, Round 1 segment 4b-3 (C3 networks) DONE, round 1 finished

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  (4b-3 note under "Segment 4b, split in three", then "Notes for round 2").
- 4b-3 DONE in d144e4814: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded.
  `BattleMechForce.c3Networks` (UUID → network name) + `setC3Network`; `C3NetworkField` picker (A-H) on 'Mech and
  vehicle roster rows with C3; `getBattleValueC3Type` / `getBattleValueC3Share` in battle-value.ts (TM 5% / boosted
  7% of the network total after TAG; CRB 10% +5% per extra, cap 40, boosted +5). BattleMech gained `getUUID()`.
  3828 tests, lint, typecheck green. The picker was not checked in a browser (Playwright MCP was down).
- Gaps logged in the plan: no network validity checks (C3i vs master/slave, size limits, master required); Nova
  CEWS and naval C3 not counted; BA / ProtoMech C3 not offered.
- NEXT: round 2 ('Mech BV1), read the plan's round 2 notes first (the `_setPilotAdjustedBattleValue` cache, the
  summary note text). BV1 force rules (BMR C3 +35% of weapons) come with it.

# EARLIER (2026-11-03): edition-aware BV, Round 1 segment 4b-2 (TAG) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  (4b-2 note under "Segment 4b, split in three").
- 4b-2 DONE in 7a4e35bf9: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded.
  Rulings (user): take v4.1 AND the TO:AUE p.198 addendum (extra ammo, one bonus per TAG); homing bombs count.
  `getBattleValueTagShare` in battle-value.ts; `getPilotAdjustedBattleValue(edition, forceBonus)` on 'Mech, vehicle,
  fighter, small craft; group `getTotalBattleValue(edition, force)`. 3827 tests, lint, typecheck green.
- Gap logged in the plan: BA Light TAG, ProtoMechs, capital ships take no TAG share yet (BA per-trooper count unruled).
- NEXT, 4b-3: C3 networks in the roster (saved membership per unit, a picker, totals per `c3` rule kind; the
  `forceBonus` param is where C3 joins). Then round 2 ('Mech BV1).

# EARLIER (2026-11-03): edition-aware BV, Round 1 segment 4b-1 (force rules table + external stores) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  ("Segment 4b, split in three", after segment 4a's note): the research there is done and cited, so don't redo it.
- 4b-1 DONE in ae2709fbb: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded.
  `BV_FORCE_RULES` / `getBattleValueForceRules(edition)` in battle-value.ts (`total-warfare`: v4.1 p.23 + TO:AUE
  p.198; `core-rulebook`: CRB p.220 C3 only). Fighter `getPilotAdjustedBattleValue` adds external stores before
  skill. 3826 tests, lint, typecheck green; base BV unchanged (bundle not rebuilt).
- NEXT, 4b-2: TAG. First ask the user the plan's two open points: (a) TO:AUE's per-TAG multiple and extra ammo vs v4.1
  printing neither; (b) whether air-launched Arrow IV homing bombs count. Semi-guided LRM ammo BV comes from the
  launcher it feeds (the record's BV is 0). Then 4b-3 (C3 networks in the roster), then round 2 ('Mech BV1).

# EARLIER (2026-11-03): edition-aware BV, Round 1 segment 4a (UI formatter + roster edition) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  (segment 4a note, the 4b scope and the round 2 notes are after segment 3's).
- Segment 4a DONE in 443c9da1c: beta = master = origin, deployed to beta, `C:/repo/battletech-tools` fast-forwarded.
  `formatBattleValue(battleValue fn, unitType | unitType[], edition)`; adjusted BVs use `getBattleValueSkillEdition`
  (ruling 2: TM table while BV1 is pending). `editionHasBattleValue` now in battle-value.ts (noBattleValue flags gone).
  Every sheet, creator, status bar and roster table formatted; roster has `BattleMechForce.rulesEdition` +
  `RulesEditionSelect`; group `getTotalBattleValue(edition)` / `getBattleValueText`. 3825 tests, lint, typecheck green;
  bundle report unchanged.
- NEXT, segment 4b: force-level TAG / C3 / external stores (gap 3) as per-edition `forceBonuses` in `BV_RULES`,
  read in the force/group totals. Research first (TM / v4.1, CRB C3 rule), cited, page images checked. Then round 2
  ('Mech BV1).

# EARLIER (2026-11-03): edition-aware BV, Round 1 segment 3 (skeleton) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  (segment 3 note is after segment 2's).
- Segment 3 DONE in 6e66c85c7: beta = master = origin, `C:/repo/battletech-tools` fast-forwarded. Not deployed (no
  site change). `src/data/battle-value.ts` (was skill-multipliers.ts) holds `BV_RULES`, `getBattleValueRules`,
  `getBattleValueFor`, `formatBattleValue(unit, unitType, edition)`. Every class: `getBattleValue(edition =
  this._rulesEdition)`. BV1 records are `pending` (shown as "— (BV2: x)"). 3823 tests, lint, typecheck green;
  bundle report unchanged.
- NEXT, segment 4: every UI BV display (~33 files under src/ui) calls `formatBattleValue`; decide there how skills
  enter the formatter (plan ruling 2: BV1 figure uses the edition's skill table, BV2 the TM one). Roster edition
  picker (shared #324 block, Edition only), with force-level TAG / C3 / external stores (gap 3) as per-edition
  `forceBonuses`. Then round 2 ('Mech BV1).

# EARLIER (2026-11-03): edition-aware BV, Round 1 segment 2 (v4.1 examples as tests) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`.
- Segment 2 DONE in c48627f00 (tests only): beta = master = origin. Not deployed, since nothing changed on the site.
  New tests are the Mongoose 758, Thunderbolt 2,008, DemolitionMech 380 (`battlemech.test.ts`) and Dragau II 14,243
  (`dropship.test.ts`, BLK text). The jump platoon and Grenadier already had tests. No BV2 bug found.
  3820 tests, lint and typecheck green.
- Note: the BV v4.1 PDF has no library extract. PyMuPDF text is good enough (scratchpad, not kept).
- NEXT, segment 3: the skeleton (`src/data/battle-value.ts`, fold in skill multipliers, `BV_RULES`,
  `formatBattleValue`, `getBattleValue(edition)` on every class). Segment 4: UI formatter + roster edition picker.
  Force-level TAG / C3 / external stores (gap 3) go with the roster segment.

# EARLIER (2026-11-03): edition-aware BV, Round 1 segment 1 (BV2 bug fixes) DONE

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`.
- Segment 1 DONE in 141327116: beta = master = origin, deployed to beta, #608 and #609 commented and closed.
  `DESIGNS` = 3686, and the MUL gaps dropped from 224 to 200. Three B-Pod MUL gaps are reported on #608 and in the plan. #608 B-Pod counts its slot as Gauss for defensive BV (TM errata v8.0
  item 8; Bloodhound B3-HND now 1005 = MUL); #609 a non-mechanized platoon in encumbering armor reads the Anti-'Mech
  8 column (BV v4.1 p.23); `aerotech-2` now lists `capital-ship` (AT2 contents, BV p.53).
- Note: `npm run build:bundled` caches per file, so a code-only BV change may need a second run to show in the
  report (the first run after the change took 21 s and changed nothing).
- NEXT, segment 2: gap 4, the six v4.1 worked examples as tests (MON-66 Mongoose 758, TDR-10SE Thunderbolt 2,008,
  WI-DM DemolitionMech 380, Grenadier squad 63 per suit / x5.2, anti-'Mech jump platoon 168, Dragau II 14,243),
  built from the examples' own inputs. Any miss is a BV2 bug (plan or issue, memory `track-every-gap`).
- Then segment 3: the skeleton (`src/data/battle-value.ts`, fold in skill multipliers, `BV_RULES`,
  `formatBattleValue`, `getBattleValue(edition)` on every class). Segment 4: UI formatter + roster edition picker.
  Force-level TAG / C3 / external stores (gap 3) go with the roster segment.

# EARLIER (2026-11-03): edition-aware BV, Round 0 DONE (segments 1-4), next is Round 1 (skeleton)

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. Plan: `C:/repo/battletech-tools-master/docs/superpowers/plans/2026-11-03-edition-aware-bv.md`
  (untracked). Segment 4 findings are after segment 3.
- Segment 4 result: the newest BV2 text is BV v4.1 (`JBTIICRework/errata-2025/`), which replaces TM pp.302-314. Our
  BV2 math matches it and the TO:AUE / IO:AE / SO:AA errata, except for:
  - Gap 1: the B-Pod should take the Gauss defensive −1 (TM errata v8.0, item 8).
  - Gap 2: encumbering-armor infantry read skill column 5 instead of 8.
  - Gap 3: no force-level TAG / C3 / external-stores BV (roster, per edition; the CRB C3 rule differs from TM's).
  - Gap 4: six v4.1 worked examples have no test yet.
  Fix gaps 1, 2 and 4 in round 1 (TDD), along with the `aerotech-2` "capital-ship" bug from segment 2.
- Issues opened: #608 (bug, B-Pod), #609 (bug, encumbered infantry), #610 (enhancement, infantry specializations,
  which also settles the "Motorized: 1.0" row; plan round 6), #611 (enhancement: handheld weapons, thermobaric,
  prosthetics). Ruled: mechanized infantry keep the 5 column (plan, segment 4 rulings). New standing rule: every
  gap goes into the plan or a bug/enhancement issue (memory `track-every-gap`).
- Then Round 1 (skeleton) per the plan: `src/data/battle-value.ts`, fold in skill multipliers, `BV_RULES`,
  `formatBattleValue`, a `getBattleValue(edition)` on every class, the roster edition picker.

# EARLIER (2026-11-03): edition-aware BV, Round 0 segments 1-3 DONE, segment 4 since done

- This handoff now lives in `C:/repo/JBTToolsSupportFiles/handoff.md` (user, 2026-11-03). The work stays in
  battletech-tools-master (plan: `docs/superpowers/plans/2026-11-03-edition-aware-bv.md`, untracked).
- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools (`library_search.py`, `render_page.py`; page index = pdf page - 1; `--page` takes the
  extract name without `.txt`, 1-based pdf page). Offsets: BMR(R) printed = pdf - 10; CBT Companion printed = pdf.
- Segment 3 findings are in the plan after segment 2: vehicle BV1 (armor × 1, IS ÷ 2, type modifier 0.8-0.4, no
  tonnage/ammo/heat), ProtoMech BV1 (+ tonnage, DMF +0.1), infantry and BA as BMR / BMR(R) lookup tables, Max Tech
  Level 3 vehicle/infantry/structure values, CBT Companion BA formula (Elemental Point 280, Elite 448). Two open
  points (Companion 280 vs BMR(R) table 279; table ends). Library BMR(R) p.155 rewritten from the image and logged.
- Segment 4: BV2 audit (TM 2007, BV2.1, TM 2020, BV v4.1, TO:AUE, IO:AE, SO:AA, CRB) against our BV2 code for any
  missing modifier, same output shape. Then handoff + clear. Round 1 (skeleton) after that.

# EARLIER (2026-11-03): edition-aware BV, Round 0 segments 1-2 DONE, segment 3 since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools (`library_search.py`, `render_page.py`; page index = pdf page - 1; `--page` takes the
  extract name without `.txt`, 1-based pdf page).
- Segment 2 findings are in the plan, after segment 1. AT2 pp.53-54 = AT2R p.81 (same text; AT2 cites BMR, AT2R
  cites BMR(R)), plus a step table vs our BV2 and the Eisensturm EST-O (2,519) and Mjolnir (179,781) tests. Three
  open points: Gauss ammo counted as explosive, a misprinted label, Artemis on 16 of 20 launchers. One bug for
  round 1: `rules-editions.ts:743` `aerotech-2` is missing `"capital-ship"`.
- Segment 3: vehicle, ProtoMech and infantry BV1 (BMR / BMR(R), Max Tech), battle armor BV1 (CBT Companion). Same
  output shape. Then handoff + clear. Segment 4 (BV2 audit) after that.

# EARLIER (2026-11-03): edition-aware BV, Round 0 segment 1 DONE, segment 2 (aero BV1) since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools (`library_search.py`, `render_page.py`; page index = pdf page - 1).
- Segment 1 findings are in the plan's "Round 0 findings" section: sources per edition (BMR + FanPro errata,
  BMR(R) + Max Tech, box set falls back to BMR(R)), a BV1-vs-BV2 step table with proposed `BV_RULES` fields, Max
  Tech Level 3 rules, the Goshawk test (2,243) and one open point (arm CASE wording).
- Notes for later segments: CBT Companion (FanPro 10975) pp.187-191 = battle armor BV1 (segment 3). BMR(R)
  pp.154-155 = vehicle and ProtoMech BV1, infantry table p.155; Max Tech pp.92-93 = Level 3 vehicle, infantry,
  structure BV1; Max Tech pp.94 on = unit BV1 lists (tests).
- Segment 2: AT2 and AT2R BV1 for fighters, small craft and capital ships, same output shape (step table vs our
  BV2, fields, worked examples). Then handoff + clear.

# EARLIER (2026-11-03): edition-aware BV, PLAN APPROVED, do Round 0 (research) segment 1

- Plan (approved, untracked): `docs/superpowers/plans/2026-11-03-edition-aware-bv.md`. Read it first; rulings 1-5 there.
- Rules: condense/reuse/extend; NO new files except `src/data/battle-value.ts` (all BV moves in). Less is more, low tokens.
- Handoff + clear between sections AND between segments of a section. Round 0 segments: (1) 'Mech BV1: BMR, BMRr,
  CBT box set, Maximum Tech, CBT Companion, FanPro errata; (2) aero BV1: AT2, AT2R; (3) vehicle/infantry/BA/Proto
  BV1; (4) BV2 audit: TM 2007, BV2.1, TM 2020, BV v4.1, TO:AUE, IO:AE, SO:AA, CRB. Write findings (cited, page image
  checked) into the plan's Round 0 section, then handoff + clear.
- Already known: no BV1 code/data exists; skill tables are per edition in `src/data/skill-multipliers.ts`; infantry
  `_battleValueMethods` is the per-edition pattern; every class has `_rulesEdition`; `editionStats` has no BV field.

# EARLIER (2026-11-03): edition-aware BV calculator, in-depth look (done, plan above)

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles). Read `edition-aware-rules`, `edition-disagreements-per-edition`, `newest-publication-wins`, `sheets-are-the-source`, `our-bv-is-certified`, `reuse-extend-smallest-code` and `rules-levels-by-edition` most closely.
- The user's goal (2026-11-03): look at our BV calculator in depth, then make it edition aware, at least between the original BV1 and the current BV2.
  - Each unit type uses the most current ruling for BV1 and for BV2, from the right books (errata included), with book and page citations in edition records. Never hard-code TW.
  - Show the BV for the edition the players select (the shared Rulesets → Edition block, #324).
  - When BV1 is shown, also show BV2 beside it in parentheses, labelled as BV2 (for example "1,234 (BV2: 1,456)"), so players get both.
- Nothing has been done yet: no research, no code. Start with the in-depth look, mapping where BV is calculated for each unit type, which helpers are shared and how editions reach it today. Then brainstorm and plan with the user (superpowers brainstorming) before building anything. Keep the rounds small.
- Related issues to read: #590 (roster edition play), #599 (BV utility, brainstorm first). Find which books carry BV1 (for example BMR / BMRr, CBT Companion, the TRO BV1 lists) with `library_search.py`. Confirm each rule from the page image.

# EARLIER (2026-11-03, latest): #109 BV follow-ups FINISHED, no code change

- Final findings posted on #109 (issuecomment-6606000515). Basilisk (TR:3075) 318/319 = 2007 TM LRM-3 35/5, replaced by TM errata v3.1 p.33 (34/4), so ours stands. Ryoken III-XP C = MUL leaves out the automatic Clan CASE (TM p.210, Clan internal structure), so ours stands. Ryoken III-XP A leftover (38.75 weapon BV) and Gestalt stay unexplained; Quad B follows the user's Frenzy ruling. Nothing left open from #109.
- News (Nov 3: Aces wording, SSW design corrections) in 555e20391: beta = master = origin, deployed to beta (includes 4c31af7ee), master worktree fast-forwarded, deploy comment on #109.
- NEXT: ask the user. Candidates: the Aces priority-digit read (step 2 below), and the year-0 / rulesLevel-0 MegaMek bundle headers.

# EARLIER (2026-11-03, later): Rekikire's typed Aces card library, steps 1-3 DONE

- RULES: standing permission to post GitHub comments and use the gh and git CLIs, and deploy, all without asking (memory `gh-git-permission.md`). This overrides older "ask before pushing/deploying" lines below.

- Rekikire sent all 66 behavior cards (11 decks) typed in our library export format, plus their phrase list. Both are local only, in `tools-local/aces-harness/rek/` (never ship the text).
- Step 1 DONE: 4c31af7ee on beta, NOT pushed or deployed. 16 condition and 30 movement phrases were added to `aces-card-phrases.ts`. A new `acesCombatFilterPhrases` list is matched in `parseAcesScanCombat`, but only when no icon is `[?]`. Tests (3816), lint and typecheck are green. The Command card phrase lists were not added, because there's no Command card reader yet (#592). They are in the rek txt file for later.
- Step 2 DONE (local): `tools-local/aces-harness/score.cjs` grades a run against the key, and run.ps1 prints it. Score: 277/293 (94.5%). Priority digits are weakest (7/18; IMG_0067 prints 987, we read 587). Next tuning target: the priority number read.
- Step 3: the Edge-from-entered-cards idea (a Named Pilot picks from entered Edge cards; in-play prompts such as Assassin in an enemy's rear) is #93's scope. DONE: the scope update was posted on #93 (issuecomment-6605144656). Build it after Rekikire's Edge photos arrive (later this week, plus ~50 more Aces card photos).

# EARLIER (2026-11-03): #607 CLOSED. beta = master = origin at ad2f67c6e, deployed to beta.

- Done: pushed, `git deploy-beta`, master fast-forwarded (and `C:/repo/battletech-tools` merged), comment posted and #607 closed.
- Still open, reported only (from #109): Gestalt D2X-G 2329/2392, Ryoken III-XP A/C leftovers (88, 82), Basilisk (Quad) B 223/218, Basilisk (TR:3075) 318/319 (not chased).
- Noticed, not chased: MegaMek/mordel-sourced bundle headers have year 0 and rulesLevel 0 (see the Skinwalker E/B section below).
- NEXT: FIRST review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles), then ASK the user which item to do next (bugs first, per memory `task-order-2026-10-25`). Scott/mordel stays shelved until the user posts his reply.

# EARLIER (2026-11-02): #607 FIXED in ad2f67c6e on beta (since pushed and deployed, see above).

- Done (ad2f67c6e): `MTF_DESIGN_CORRECTIONS` is now `DESIGN_CORRECTIONS` (same file, `src/data/mtf-design-corrections.ts`). Entries take `values` (MTF lines) and/or `ssw` (`patchwork` per SSW location as "type:techbase", `equipment` renames). SSW keys are "name model", plus the configuration's name for an OmniMech loadout ("Skinwalker (Ryoken III) B"). `correctSSWDesign` runs in `importSSWXML` right after `parseSSWXML`. With no slot list, the import places patchwork armor slots itself, so the correction drops the file's armor slot list.
- Zeus X ZEU-X/X2 (4 keys: RS "Zeus X" and MWDA "Zeus") now 2119/1915 = MUL; the bundle keeps the MWDA SSW copies (year and rules level filled) instead of the year-0 MegaMek records. Skinwalker B 2851 = MUL, as a configuration of the SSW Skinwalker, so `DESIGNS` = 3673. Six "BV differs" lines gone. New fixture `src/utils/__fixtures__/skinwalker-ryoken-iii.ssw`; the Zeus X ZEU-X2 armored-engine test now expects 1915.
- Tests (3813), lint and typecheck green. Memory `design-corrections-table` updated.

- Done: quad melee BV ruling (94325f19e), Nov 2 news (90cfc763c), 3b findings comment posted, #109 closed.
- Open from #109, reported only: Gestalt D2X-G 2329/2392, Ryoken III-XP A/C leftovers, Basilisk (Quad) B 223/218, Basilisk (TR:3075) 318/319 (not chased). SSW files still have no design-correction hook (Zeus X ZEU-X/X2, Skinwalker B).
- NEXT (bugs first): #607, an SSW design-correction hook. Extend `src/data/mtf-design-corrections.ts` and its `correctMtfDesign` helper (no near-duplicate) so `importSSWXML` applies cited corrections too. Write the test first. Cases: Zeus X ZEU-X/X2 SSW (patchwork per RS Dark Age p.224, MUL 2119/1915), Skinwalker B SSW (Improved Heavy Medium Lasers per RG24 p.5, MUL 2851). Then `npm run build:bundled`, check the report diff (those 4-5 "BV differs" lines should go), and run test, lint and typecheck one after the other. Commit on beta, ASK before pushing or deploying, then deploy, ff master, and comment on and close #607.
- After #607: ask the user which item to do next.

# EARLIER (2026-11-02): 3b is FINISHED. beta is 2 ahead (4118bd022, 94325f19e), NOT pushed or deployed. Ask before pushing/deploying.

- Gestalt D2X-G 2329 / MUL 2392 (MUL source JFR). Unexplained. JFR p.150 prints 2,542 = the 2008 TO rule (VSS +3 added to TMM 4: 543.75 x 1.7, then x1.3 = 2541). TO errata v3.6 and TO:AUE (4th) p.194 (page text checked): use the higher of normal TMM or +3, tie = +1, so TMM 4 stands and ours follows it. No heat reading (VSS 10 heat in or out, capacitor heat 15 or 20) reaches 2392; the MUL needs +48.4 before the x1.3.
- Parash 3 1785 / 1753: SOLVED. The MUL counts no gyro BV: (487.75 - 17.5) x 1.4 + 690 = 1348.35, x1.3 = 1752.9. Same XTRO Republic III (2015) no-gyro rule as the Ryoken III-XP; IO p.193 / IO:AE p.187 count a standard gyro, newest wins, ours stands.
- Zeus X ZEU-X / ZEU-X2 SSW copies (RS 3145 and MWDA): the SSW files have "100% Reactive Armor" all over. RS Dark Age p.224 prints patchwork (reactive limbs, Clan standard torsos and head) and BV 2,119 = MUL = our MTF copy. The gap is 127 torso/head points x 2.5 x 0.5 x 1.3 = 206. SSW file error; the bundle keeps the MegaMek records (2119, 1915), so it is right. Same "no SSW design-correction hook" note as Skinwalker B.
- Basilisk ProtoMech (Quad) 255 / 258: WoR p.210 prints 258 (= MUL). IO:AE p.190 (page image checked) gives the Quad MWS "(Dmg x 1.25)" without saying which damage. Ours counts the added Frenzy damage only (2 x ceil(7/5) = 4, x1.25 = 5). Counting the base Frenzy damage too (ceil(7/5) = 2 more, +2.5 offensive x 1.37) gives exactly 258. But the Quad B (MUL 218, source WoR, not printed in WoR) matches ours, and the other reading would give it 223. RULED (user): "count the base frenzy, follow rules not sheets". DONE in 94325f19e: Quad = 258. The Quad B is now 223 / MUL 218: a new reported gap (report it on #109), not overridden.
- Not on the list, not chased: Basilisk (TR:3075) 318 / 319.
- Local helper (gitignored): `src/zz-local/proto-bv.test.ts` prints a ProtoMech BLK's BV log. `BV_FILES="WoR/Basilisk ProtoMech (Quad).blk" npx vitest run src/zz-local/proto-bv.test.ts --silent=false`.
- NEXT: the news (home.tsx), push + `git deploy-beta` + ff master (ASK first), post the 3b findings (Skinwalker E/B, Gestalt, Parash, Zeus X, Basilisk) on #109, and close #109.

# EARLIER START HERE (2026-11-02): Skinwalker E/B round DONE in 4118bd022 on beta, NOT pushed or deployed. Ask before pushing/deploying.

- DONE (4118bd022): RG24 p.5 (page image checked) prints Skinwalker E 3,107 = ours; live MUL 3102 is stale, so `MUL_BV_CORRECTIONS` has 105956 → 3107. The SSW Skinwalker now keeps its E config; `DESIGNS` stays 3674.
- Skinwalker B, no change: both SSW files list plain "(CL) Heavy Medium Laser" x3 where RG24 p.5 prints Imp. Heavy Medium Lasers (the SSW D config in the same file has Improved). The MTF B (2851) is kept as its own record, so the bundle is right. A player importing the SSW file gets the wrong lasers: SSW files still have no design-correction hook (memory `design-corrections-table`).
- For the #109 comment: E (sheet = ours, MUL stale) and B (SSW file error) as above.
- Noticed, not chased: every MegaMek/mordel-sourced bundle header has year 0 and rulesLevel 0 (682 records); SSW ones have both. Check whether that is intended before the next bundle round.
- NEXT: rest of 3b: Gestalt D2X-G 2329/2392, Parash 3 1785/1753, Zeus X ZEU-X/X2 SSW copies, Basilisk Quad 255/258. Then news (home.tsx) and close #109.

# EARLIER START HERE (2026-11-02): 3b Skinwalker round DONE in e39910460: beta = master = origin, deployed to beta, findings posted on #109.

- NEXT (done above): Skinwalker E and the SSW-only Skinwalker B.
- Scott/mordel SHELVED again (user, 2026-11-02 night, Scott is offline). The user gave a TEMPORARY sandbox key; it works: header `X-API-Key`, `GET /api/v1/key` = 200 "API key is valid". Only `/ping` and `/key` exist; every data path is 404. Details in memory `mordel-api-decisions.md`. Never write the key to a file or memory; ask the user for a fresh key next time (sandbox refreshes wipe keys). Pending: a reply to Scott saying the key works and asking which endpoint comes first (units, per the wish list order). Don't draft or build until the user picks this back up. Next is the rest of 3b. Scott is SHELVED until the user posts his reply

- DONE (e39910460): the MUL index gave a shared alternate name ("Skinwalker A") to whichever record loaded first, so the RG24 Ryoken III (Skinwalker) A/D were checked against the Ryoken III-XP's BVs, and XP B/C/Prime were dropped as twins. Now a record's own key beats an alternate one, a shared alternate key matches neither, and designs tied to different MUL ids are no twins. Side gains: 9 BA designs, Procyon, Condor Heavy Hover Tank now match; Basilisk ProtoMech (Quad) and (Quad) B aliases added to `MEGAMEK_MUL_IDS`. Unit counts: BA 921, ProtoMechs 64, vehicles 1064; 'Mech `DESIGNS` stays 3674 (the SSW Skinwalker keeps A and D configs).
- Findings for the #109 comment:
  - Skinwalker A 3500 and D 2545 MATCH the RG24 MUL; the old gaps were the mismatch.
  - Ryoken III-XP B 3663/3613, D 2533/2483, Prime 3063/3013: all +50 = gyro 27.5 x 1.4 x 1.3. The XTRO Republic III (2015) printed BVs count no gyro; IO (2016) p.193 and IO:AE p.187 (page image checked) treat a gyroless interface-cockpit 'Mech as having a standard gyro. Newest wins: ours stands.
  - Ryoken III-XP A 3915/3777 and C 4519/4387: +50 gyro, then 88 and 82 left. A's leftover is exactly 38.75 weapon BV (one TC ER small laser). Unexplained; the printed sheet (XTRO p.8, extract lines ~360-470) matches the MTF loadout.
  - Basilisk ProtoMech (Quad): ours 255, MUL 258, new gap.
- Still to do in 3b: Gestalt D2X-G 2329/2392, Parash 3 1785/1753, Zeus X ZEU-X/X2 SSW copies, Basilisk Quad. Then news (home.tsx) and close #109.
- Note: running `npm test` while `build:bundled` runs gives ~19 timeouts; run them one after the other.

# EARLIER START HERE (2026-11-02, late night): #109 items 1-7 DONE; 3b LAM and FrankenMech groups DONE; design-correction table DONE (65f12aa28) + news (6e19b72ee): beta = master = origin at 6e19b72ee, deployed to beta, LAM + FrankenMech findings posted on #109.

- DONE (65f12aa28, pushed and deployed): user ruling 2026-11-02, "add the table for the bundled designs that updates our viewer to the corrected info on import". New `src/data/mtf-design-corrections.ts` (MTF lines by "chassis model", each cited); `importBattleMechMtf` applies it via `correctMtfDesign`. Sneede 1269 and Sneede II 2198 now match the MUL; Temax 1481 / 1475 (HVAC errata, ours stands). `DESIGNS` = 3674. Any later design whose file differs from its printed sheet goes in this table.

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles). Read `mordel-api-decisions.md` and `custom-units-wait-on-mordel.md` most closely.
- When the user posts Scott's reply (do not ask for it), read the API wish list (`C:/repo/battletech-tools/docs/superpowers/plans/2026-11-01-mordel-data-pipeline.md`, untracked, ticket #2611-001) and the "Scott round 2" and "Next pass: mordel.net" sections below. Where his model differs from the wish list, his model wins.
- Propose the smallest next step from his reply, and wait for the user's OK before building anything. Sandbox: `https://sandbox.mordel.net/api/v1/ping` (200 at round 2, skeleton only).
- Also waiting on mordel: the Solaris7 match results (`scrapes/solaris7.com/_mordel_matches.md`), and the storage decision for JBTToolsSupportFiles (`units/<type>/<chassis> <model>.json` until `arrayPlan.md` is settled).
- mordel pass DONE for now (2026-11-02): mapping fixed (see Scott round 2/3 below); waiting on Scott's service account.
- Scott SHELVED (user, 2026-11-02): don't ask for his reply; the user will post it when it comes.
- DONE: #109 item 7 LAM round (8762b8adc). All 23 LAM files import. `DESIGNS` = 3672. 16 LAMs have BV 0 on the live MUL ("no Master Unit List entry" in the report); the two UrbanMech LAMs went to the custom list. Three new BV gaps are on the 3b list.
- DONE (2026-11-02): 3b LAM group, no code change. All three gaps predate the LAM BV rule (IO 2016, IO:AE p.186 2022; JFR 2011 and XTRO Gunslingers 2014 print no LAM rule), so ours stands (newest-publication-wins, like the Revenant). Details on the 3b list. Report them in the #109 comment. Our math reproduces the IO:AE Phoenix Hawk LAM example (1382).
- DONE (2026-11-02): 3b FrankenMech group, no code change. Our FrankenMech math is right; three of the gaps are the MegaMek files differing from the printed sheets, and the fourth is unexplained. Details on the 3b list. ASKED THE USER: should bundled designs get a cited design-correction table (like `mul-bv-corrections.ts`, but correcting the design file's armor, donors, etc. from the newest printed sheet)? There is none yet. Report all four in the #109 comment.
- NEXT: item 3b's next small group (the Skinwalkers, Gestalt, Parash, Ryoken III-XP and Zeus X). After 3b, update the news (home.tsx) and close #109.
- beta = master = origin at 6e19b72ee, deployed to beta; the 3b LAM/FrankenMech comment is posted on #109 and the Nov 2 news says 28 more 'Mechs. Ask before the next push or deploy.

# NEXT (2026-11-02, night): close out #109 by doing ALL of its missing pieces

- FIRST, review the standing rules in `~/.claude-battletech/projects/<repo>/memory/MEMORY.md` (both battletech-tools folders plus c--repo-JBTToolsSupportFiles). Rulebook checks use the JBTIICRework library: `library_search.py`, all three text extracts, then the page image with `render_page.py` (PNG into the scratchpad). Rewrite garbled pages and log them in `text/_corrected_pages.md` (LF line endings).
- ONE ITEM PER SESSION (user, 2026-11-02): do item 7's LAM round only, commit, update this handoff, then stop for a clear. Keep it light on tokens: no side hunts, short updates.
- The scope below is settled, so don't ask to confirm it again. Items 1-6 are DONE: start on item 7 right away. Stop and ask only before pushing or deploying, or if a rule can't be found in the library.
- User ruling (2026-11-02): everything below is part of #109 ("SSW import: chassis components with no record yet"). Finish all of it, then close #109. Use TDD, extend existing records and maps (no near-duplicates), and give rules edition records with book and page citations.
- Workflow: commit on `beta`. ASK before pushing or deploying. Then push, run `git deploy-beta`, fast-forward master (`git push origin beta:master`, then `git merge --ff-only origin/master` in `C:/repo/battletech-tools`), and post a comment on #109.

## State

- `beta` is 9 commits ahead of origin: c7fecc2a4, ca7623e6b, c3665f206, 960df732d, 9ba431b12, accee6fc7, ddc76b095, c31b97931, 2a149cde4. NOT pushed or deployed.
  - 2a149cde4 (item 7, QuadVee): MTF "QuadVee"/"QuadVee OmniMek" read as quads; SSW motive written "QuadVee Tracks"/"QuadVee Wheels" (from "motive:Track/Wheel") and read back by `importSSWXML`; "QuadVee Cockpit" taken from the chassis; leg slots "Conversion Gear", "Tracks", "QuadVee Wheels" skipped (the chassis places them). Bugs fixed: the standard-only armor/structure lock (IO p.134, IO:AE p.128 set no limit; it was in setArmorType, setInternalStructureType, the FrankenMech donor check and a reset in `_calc`), and tracks/wheels were never weighed or priced (new `quadvee-wheels` formula beside `tracks` in variable-equipment.ts; IO:AE p.181 wheels (750 x ER x TT) / 75, checked on the page image). All 13 QuadVees match the MUL BV. `DESIGNS` = 3668. No new BV gaps.
  - c31b97931 (item 7, FrankenMech): MTF "Biped FrankenMek" + "structure:Hybrid". The center torso's structure is the 'Mech's own (CO p.213); `convertMtfToSSW` returns `frankenMech` donors (tonnage, structure tag, tech base, structure slots counted in each location, CO pp.212-213), and `importBattleMechMtf` applies them with `setFrankenMech`/`setFrankenMechDonor`. The SSW import's "Unallocated Criticals" block is dropped for a FrankenMech and recounted after the donors (an endo CT takes its own 1 slot, not the whole 14: user, 2026-11-02). New designs: Hunchback HBK-LGN-Pin 'Anastasia' and 'Drizella', so `DESIGNS` = 3655. Four new BV gaps, on the 3b list.
  - Local helper (gitignored): `src/zz-local/franken-check.test.ts` prints each location's donor, slots and BV. Run it with `FRANKEN_FILES="<path under meks/>;..." npx vitest run src/zz-local/franken-check.test.ts --silent=false`.
  - ddc76b095 (item 6): MTF "armor:Patchwork" maps to "Patchwork Armor". Each location line's type ("IS Reactive(Inner Sphere):26") is written as SSW's `<la type=".." techbase="..">`, which `_importSSWPatchworkTypes` already reads. New designs: Zeus X ZEU-X, ZEU-X2, Aquagladius AQS-5 MAM, so `DESIGNS` = 3653. The MTF Zeus X copies match the MUL, but the SSW copies (`RS 3145/.../Zeus X ZEU-X*.ssw`, `MWDA/Zeus ZEU-X*.ssw`) still show BV gaps (2326/2119, 2120/1915). They are on the 3b list. Spindrift SDT-1 and Victor VTR-9K2 St. James are copies of their SSW designs. No new "BV differs" lines (280).
  - accee6fc7 (item 5): the MTF engine regex drops a "Large " prefix (a large engine is its type rated over 400, TO:AUE p.119; records in `mechLargeEngineTypes`). The Sasquatch SQS-TH-002/003, Kuma 3 and BattleMaster BLR-6X import. All four are second copies of kept designs, so `DESIGNS` stays 3650 and there are no new BV lines.
  - 9ba431b12 (item 4): SSW "Robotic Cockpit" = standard cockpit + Smart Robotic Control System. BattleMech now has `_roboticControl` through the shared `robotic-control-systems.ts`: weight, Skills, BV x0.85, cost, rules level 3, step-2 picker, saved as feature "srcs"/"srcs-improved". MTF `nocrit:(Improved)SmartRoboticControlSystem` maps to it. The SRCS records now carry `rulesLevel`, so earlier editions do not offer them. Also fixed an FP bug in the shared weight helper (Improved 3.5 t rounded to 4).
  - RULING (user): JFR pp.142-143, 147 (2011, quads only, BV x0.95) and IO/IO:AE p.187 (x0.85) are both in the TW edition, so the newest wins, like errata (memory newest-publication-wins). Revenant UBM-1A: ours 702 (SSW and MTF), MUL 784 (= JFR x0.95). Mention it in the #109 comment with the other BV gaps. `DESIGNS` stays 3650.
  - 960df732d (item 3): the `interface` cockpit record is now "implemented" (bvMultiplier 1.3, rulesLevel 4, altName "Interface Cockpit"; IO:AE pp.110, 199, 213). A `_interfaceCockpit` flag works like Small/Torso-Mounted: a picker choice, saved as feature `interface_cockpit`, read from SSW, and a 2-slot Cockpit at head slot 3 (MegaMek puts the second slot in slot 4). New gyro `none` ("No Gyro", altName "None"; 0 tons, 0 slots), offered only with the interface cockpit; otherwise a violation flags it. Gyro BV stays tonnage x 0.5 (MegaMek's getGyroMultiplier; the book is silent). `DESIGNS` = 3650.
  - Skinwalker Prime/B/C/F (MTF) match the MUL. NEW BV GAPS, item 3b below.
  - JBTIICRework 9b49f9b0 rewrote IO:AE p.213 (extract index 214) from the page image: the cost table with the Late Succession Wars, Clan Invasion, Jihad and Wars of Reaving rows. Before this, those columns had slipped rows. Index 212 (p.211) was done earlier.
  - c3665f206 (item 2): MTF `ISPrototypeJumpJet` maps to `Primitive Prototype Jump Jet` in `JUMP_JETS`. The record's cost comment now cites p.211. All five files import cleanly, but each is a second copy of a design already kept, so the bundle didn't change and `DESIGNS` stays at 3648. Tests, lint and typecheck are green.
  - c7fecc2a4 adds the Endo-Steel Prototype structure (IO:AE pp.65/97/211) and the "Prototype Ferro-Fibrous" altName. The Jenner JR7-K (Grace) now imports. ESLint now ignores `src/zz-local` and `tools-local`.
  - ca7623e6b (item 1):
    - New equipment `prototype-double-heat-sink` (equipment-misc.ts, next to Freezers, heatDissipation 2). The MTF import treats `ISDoubleHeatSinkPrototype` as equipment and subtracts those items from MegaMek's "heat sinks" count (`sinkCount`).
    - The mixed-sinks violation now names the item it found.
    - New `battleValueHeat` field (IEquipmentItem), used in the 'Mech and fighter BV heat. Five prototype lasers carry their IO:AE p.189 "count as N heat" values. The recovered prototype medium pulse laser BV went from 48 to 43 (p.189, in every printing).
    - `DESIGNS` = 3648. The tech-lists fixture (`src/data/__fixtures__/tech-lists.json`, `is` + `universal`) has the new tag.
  - Four BV gaps against the MUL are REPORTED, not fixed. Our math follows the books. The MUL's own numbers fit no single rule:
    - Black Knight BL-6-KNT Ian: ours 1861, MUL 1830. The MUL leaves out the TSM doubling of hatchet BV, which TM p.317 requires ("after all possible modifications (such as TSM)").
    - Grand Dragon DRG-5K Emory: ours 1394, MUL 1431. The MUL fits the production ER large laser BV (163), not the book's 136.
    - Cataphract CTF-2X George: ours 1337, MUL 1311. The MUL fits 136 BV and 13 heat, with the prototype doubles counted as 1 each.
    - Hunchback HBK-4G Shakir: ours 952 (was 957), MUL 968. The MUL fits the production medium pulse laser BV (48).
    - Mention all four in the #109 comment, side by side with the book citations.
  - Local helper (gitignored): `src/zz-local/bv-log.test.ts` prints a MegaMek file's BV log. Run it with `BV_OUT=<dir> BV_FILES="<path under meks/>;..." npx vitest run src/zz-local/bv-log.test.ts`.
  - Bash hook: a heredoc containing an apostrophe is blocked. Write scripts and commit messages to the scratchpad first.
- JBTIICRework commit 2724d133 rewrote IO:AE (2nd printing) p.211 from the page image: the Additional Alternate Era Weapons and Equipment cost table, prototype rows included. Use it for the prototype items below.
- Pattern to copy: the new test "reads prototype endo steel structure and prototype ferro-fibrous armor" in `src/classes/battlemech-mtf.test.ts`. It edits the synthetic `brawler` fixture. MTF legs have only 6 slots, and the arms hold the brawler's Hatchet.
- After each item:
  - Run `npm run build:bundled`, read the diff of `src/data/bundled/mechs-report.md`, and bump `DESIGNS`.
  - Run `npm test`, `npm run lint` and `npm run typecheck`.
  - Any new "BV differs from the MUL" line is our bug ([[sheets-are-the-source]]).

## Remaining #109 work, easiest first. Counts are from mechs-report.md after c7fecc2a4

1. DONE (ca7623e6b): prototype double heat sinks. See State.
2. DONE (c3665f206): **Primitive prototype jump jets.** MTF `ISPrototypeJumpJet`: Wasp WSP-1, Griffin GRF-1A, Phoenix PX-1R, Wolverine WVR-1R/3R.
   - IO:AE p.211: PE C/F-X-X, 2464P, TT x 200 x Jump^2. The rules are on p.114 (and p.117 for who may use them).
   - The record ALREADY EXISTS: `primitive-prototype` in `src/data/mech-jump-jet-types.ts` (~line 135), altName "Primitive Prototype Jump Jet", costMultiplier 200. Its comment says "No cost is printed": p.211 does print TT x 200 x Jump^2, so fix that comment and cite p.211.
   - The likely fix is one `JUMP_JETS` entry in `battlemech-mtf.ts`: `"ISPrototypeJumpJet": ["Primitive Prototype Jump Jet", 1]`. The SSW lookup is `_findSSWComponent("jumpJet", ...)` (battlemech.ts ~13772). Write the test first, modelled on the ca7623e6b test in battlemech-mtf.test.ts.
3. DONE (960df732d): Interface Cockpit with No Gyro. See State.
   - 3b. Now that these import, they show BV gaps. Per [[sheets-are-the-source]] they are our bugs, but they come from each config's equipment, not the cockpit. Run them with the bv-log helper. Ours, then MUL:
     - Skinwalker A: 3500 / 3777. The TC is counted, and the 6 ER small lasers are halved for heat.
     - Skinwalker D: 2545 / 2483. Watchdog, UAC/10, CASE II.
     - Skinwalker E: 3107 / 3102. ER PPC with capacitor, Gauss.
     - SSW-only B: 2725 / 2851. The MTF copy gives 2851, so the SSW file or the SSW import differs.
     - Gestalt D2X-G: 2329 / 2392. Heavy PPC with capacitor, Angel ECM.
     - Parash 3: 1785 / 1753. Angel ECM, Bloodhound.
     - Ryoken III-XP A: 3915 / 3777. Tonnage 82.5: TSM x1.5?
     - Ryoken III-XP D: 2533 / 2483.
     - Zeus X ZEU-X / ZEU-X2, SSW copies only: 2326 / 2119 and 2120 / 1915. The MTF copies match the MUL, so the SSW files or the SSW import differ (from item 6).
     - FrankenMechs DONE (reported, no code change; each was checked on the page image):
       - Hybrid Rifleman RFL-3N (Sneede) 1248 / 1269 and (Sneede II) 2165 / 2198. The MUL is the ForcePack Record Sheets: Snord's Irregulars (2023) BV. Those sheets print other armor (Sneede: HD 9, LT 22, RT 15, arms 20/20, CT 22, legs 16/16, rear CT 4, LT 6, RT 2 = 152; Sneede II: HD 9, LT 20, RT 21, LA 15, RA 19, CT 28, legs 24/24, rear 9/6/7 = 182) on plain 60 t structure (99 points). With those, our math gives 1268.68 and 2197.7, exact matches. The MTFs follow the CO pp.213-214 example (armor 144; CO also names 70 t donors for the RA (Warhammer) and LT/LA (Archer), but the MTF has RA 60 and LT 65).
       - Temax Cat TMC-NB 1490 / 1475 (XTRO:Boondocks p.6, 2010). The printed design has armor 185 (rear torso R/L 6/8; the MTF has 8/8 = 187) and 65 t legs (15/15; the right leg is a TMP-3M Tempest, but the MTF gives it a 90 t donor). With those we get 1480.6. The last 6 is the HVAC/10: the XTRO took -1 per slot (6), but TO:AUE p.195 (added in errata v7.0, 2023) says to treat it as a Gauss weapon with one slot (-1). Newest wins, so ours stands at 1481 once the design is corrected.
       - Schwerer Gustav 1643 / 1796 (XTRO:Mercenaries p.7, 2009). The printed design matches the MTF exactly (structure 3/31/15/21/10/21, armor 192, gear and locations). Unexplained. Candidates: no -75 for the RT ammo (IS CASE in an IS XL side torso; TM counts it) = +90; the XL as Clan (x0.75) = +59.4. Neither one, nor any single TO 2008 value checked (Clan RAC/5 345/43, Thumper 41/5), gives 153.
     - LAMs DONE (reported, ours stands): Pwwka S-PW-1LAM 1668 / 1638 and Waneta S-WN-2LAM 2760 / 2713. MUL = JFR (2011) printed BV, which is IO:AE p.186 with TMM +6 (AirMech Flank 27 = +6, without the "+1 airborne"). With TMM 6 both match to the point. Screamer SCR-1X-LAM 1475 / 1144: the MUL is plain 'Mech BV (no bomb-bay -15s, ground TMM 3, speed MP 10), and XTRO Gunslingers (2014) prints no BV.
     - User ruling (2026-11-02): do 3b AFTER the remaining #109 items, not before item 4.
4. DONE (9ba431b12): **Robotic Cockpit** = SRCS. See State.
5. DONE (accee6fc7): **Large XXL engines.** MTF "425 Large XXL Engine", "420 Large XXL (Clan) Engine": Sasquatch SQS-TH-002/003, Kuma 3.
   - Check how other Large engines are mapped in `ENGINES` (battlemech-mtf.ts) and in the engine catalog.
6. DONE (ddc76b095): **Patchwork armor in MTF files.** See State.
7. **Bigger layouts the user counts as part of #109.** Do these last, one round each, and report after each:
   - DONE (c31b97931): **FrankenMech** ("Biped FrankenMek", "Hybrid" structure; 6 files). See State.
   - DONE (2a149cde4): **QuadVee** (13 files). See State.
   - DONE (8762b8adc): **LAM** (23 files). MTF `Config:LAM` + `lam:Standard|Bimodal` is written as SSW motive "Standard LAM"/"Bimodal LAM" and read back in `importSSWXML`. Landing Gear and Avionics slots are skipped (the chassis places them).
   - Check how the SSW importer handles each before writing MTF code.
- Out of scope (not chassis): a Torso-Mounted Cockpit on an IndustrialMech (2 files). That is a TM p.69 rule break, so leave it reported. Missing weapon or ammo names in the report (e.g. 'Ammo (Medium Chemical Laser)') also stay out.

# EARLIER (2026-11-02, late): mordel.net pass. The user has Scott's reply; ask them to paste it

- FIRST, review the standing rules in `~/.claude-battletech/projects/<repo>/memory/MEMORY.md`. Read `custom-units-wait-on-mordel.md` most closely.
- The user still wants the credits status quo: small rounds, least work for the biggest gain, and TDD.
- Workflow: commit on `beta`, push, `git deploy-beta`, fast-forward master (`git push origin beta:master`, then `git merge --ff-only origin/master` in the `C:/repo/battletech-tools` worktree), and post a progress comment on the issue. Ask before pushing or deploying.

## State

- beta = master = origin at c1aa87dfb. The beta site is deployed.
- #183 (ammunition explosions) is CLOSED. Its notes are at the bottom of this file.
- #301 (Solaris7 lead) stays OPEN for the unit designs. The equipment is done: commits 5244fff31, 5bc8fb238 and 863d8db5e. A progress comment is posted, and the news (home.tsx) covers Nov 1-2.
  - Equipment is in the `*-custom.ts` catalogs. Tests are in `src/data/solaris7-custom.test.ts`.
  - Rulings:
    - Nanotube armor stays Munchkin (user, 2026-11-02).
    - Captain's railgun takes one whole side of a 'Mech: the new `spreadLocations: "one-side"`.
    - BV for new weapons is fitted to canon single-hit weapons: 21.3 per point of damage at long range 22, plus 0.3 per hex beyond. Ammo is an eighth of the weapon.
  - Not entered, because no rules were posted: the heavy chemical laser, weapon clamps, upgraded Thunderbolts, the handheld AC kit, and the smoke generator (the Smoker covers it).
- The Ollama lead-scrape queue is STOPPED (user asked). It is safe to restart: saved pages are not refetched. Restart with `bash ~/.claude/ollama/run_leads.sh > /c/repo/JBTIICRework/unsorted/scrapes/_run-<date>.txt 2>&1` (run in background). If a shell is killed, its Python can survive: check `scrapes/_queue.pid`.

## Scott round 2 (2026-11-02): read memory `mordel-api-decisions.md`
- Sandbox `https://sandbox.mordel.net/api/v1/ping` answers 200 (the email's `www.sandbox.net` times out). Only the skeleton exists.
- His levels 1-8 map to ours as pairs: 1-2 → 1, 3-4 → 2, 5-6 → 3, 7-8 → 4. CORRECTED in round 3: "(Extinct)" only means not available in that year/era, so it is not Apocryphal. We have dates, not a flag, so drop the bit.
- Round 3 (2026-11-02): no API changes yet. The user is asking Scott for a SERVICE ACCOUNT for us, so the API key test waits for that (no personal-login key). Sandbox login uses the production credentials. Make an API key from Profile → API Key; the next sandbox refresh wipes it.
- Forum is OUT for now (wish list §2.4 dropped). No contributor rights needed.

## Next pass: mordel.net (Scott's reply in hand)

1. Ask the user to paste Scott's reply. It answers our API wish list (ticket #2611-001).
   - The wish list is `C:/repo/battletech-tools/docs/superpowers/plans/2026-11-01-mordel-data-pipeline.md`, untracked, in the master worktree.
   - Read both before proposing anything. Where his model differs, his model wins (the wish list says so).
2. Possibly still running: the Solaris7 design check against mordel.net.
   - Script: `~/.claude/ollama/mordel_match.py`.
   - Run log: `scrapes/solaris7.com/_mordel_run.txt` (at 57/104 threads when this was written).
   - Results: `scrapes/solaris7.com/_mordel_matches.md` / `.json`.
   - It resumes and caches, so rerun it if it was cut off: `python -I ~/.claude/ollama/mordel_match.py /c/repo/JBTIICRework/unsorted/scrapes/solaris7.com`.
   - Early totals: 3 same design, 12 likely same, 39 name only, 31 none.
   - Caveats:
     - The model's unit lists are unchecked; it sometimes lists canon units a thread only mentions.
     - mordel holds only 'Mechs, IndustrialMechs, ProtoMechs and Combat Vehicles.
   - If Scott's API replaces the search endpoint the script uses (the TRO page's AJAX `filter.ajax.module.php`, XML action `UnitListing`), switch the script to the API and keep his rate limits.
3. Storage DECIDED (user, 2026-11-02): designs not on mordel go into C:/repo/JBTToolsSupportFiles as plain JSON (each class's `exportJSON()` format), `units/<type>/<chassis> <model>.json`, until `arrayPlan.md` settles the final format. Still to pick: which Solaris7 designs to enter (likely the "none" verdicts, crediting their authors).

# DONE: #183 ammunition explosions (2026-11-02), kept for reference

- FIRST, review the rules and tools. The standing rules are in `~/.claude-battletech/projects/<repo>/memory/MEMORY.md` (copied from `~/.claude` on 2026-11-02). Rulebook checks use the JBTIICRework library: `library_search.py`, all three text extracts, then a page image with `render_page.py`.

- The user is back on their normal allotment, but still wants the credits status quo: small rounds, least work for the biggest gain.
- They picked one enhancement to do next: #183. The plan is `docs/superpowers/plans/2026-11-02-mech-ammo-explosion.md` (untracked). Follow it with TDD.
- The 'Mech work is one private `_onSlotHit` hook, called by both `rollCriticalHit` and `rollEditionCriticalHit`. It calls `getAmmoExplosion()` and applies the result through `takeDamage(..., { structureOnly, noTransfer })`. There is no `getAmmoBinExplosionDamage`.
- The CASE and CASE II rules are verified (see PROGRESS).
- EXPANDED: ammunition explosions for EVERY unit type, edition aware, wherever a book lists a ruling. That covers Vehicle, Building, Fighter, Small Craft, capital ship and ProtoMech; BA and infantry probably have none. Heat-triggered explosions are included. See the plan's "Expanded scope" table and its 6-step order. Do one step per round and report after each.
- CONDENSE (user rule): all shared ammo-explosion logic goes in ONE file, `src/data/ammo-explosion.ts`. It holds the rules table keyed by edition and then unit type, and one `getAmmoExplosion()` that returns rules, damage and log. Classes only apply the damage to their own locations. See the plan's "Condense" section, which overrides any placement wording elsewhere.
- REUSE AND EXTEND (user rule): smallest code. Use one shared explosion-damage helper (lifted from Vehicle), give `takeDamage` an options argument instead of writing a new loop, use one crit hook for both roll paths, and extend the existing heat rows. Grep before writing any function. See the plan's "Reuse and extend" section, which overrides the "add X" wording elsewhere in the plan.
- EDITION AWARE (user requirement): explosion rules are edition records, with book and page citations, in the `AMMO_EXPLOSION_RULES` table in `ammo-explosion.ts`, not in `rules-editions.ts`. Never hard-code TW. The user doesn't want a later edition sweep, so ask for any missing rulebook text rather than guessing.
- Then commit, deploy to beta, and close #183. After that, stop and report. Don't start the next item.
- PROGRESS:
  - Step 1 is DONE: commits 72323c3e2 and b8ace8dde on `beta` (local beta is 2 ahead of origin/beta, not pushed or deployed; push and deploy once #183's 'Mech step works). It adds `src/data/ammo-explosion.ts` with its tests. The table has TW records for mech, vehicle, building, fighter and small-craft, plus a core-rulebook mech record. Vehicle and Building now call the shared `getAmmoDamagePerShot`.
  - Rules were confirmed from the library text and page images (C:\repo\JBTIICRework, see the library rule in memory). There is no `verified` field: every record is book-checked.
    - **TW p.125, 'Mech.** The hit slot's bin explodes and the MechWarrior takes 2 (also TW p.41). Damage starts at Step 3 on structure. CASE vents the excess. Destroyed-location crits on explosive slots are resolved (errata v11.01).
    - **TO:AUE p.111, CASE II.** 1 point goes to structure and the rest to rear armor. A limb loses all its remaining armor or half its original armor, whichever is less. Nothing transfers, and each resulting crit is rerolled and ignored on 8+. A fighter takes 1 point against SI. CASE II does not reduce pilot damage.
    - **CRB pp.96-97, 207, 'Mech.** Structure damage is capped at 20 (none), 10 (CASE) or 1 (CASE II).
      - No CASE: if the location survives, it loses all its armor (only the rear armor for a torso).
      - CASE or CASE II: the excess goes to armor (rear for a torso), up to 10, and nothing transfers.
      - CASE II gives -1 to its crit check. The MechWarrior takes 1 hit (CRB p.107).
    - **TW p.161, fighters and small craft.** Damage is shots × per-shot damage /10, or /20 for a fighter with CASE, minimum 1. The pilot takes 1. On a heat explosion, the bin with the most destructive ammo per shot goes first.
    - **BMM p.42** matches TW. The BMM errata (p.119) rewords CASE II only.
  - `getAmmoExplosion(..., protection)` returns `baseDamage` and `damage` (after the divisor and cap). The 'Mech applies the CRB armor blowout and the TO:AUE CASE II armor itself, from `baseDamage`.
  - Step 2 is DONE (2026-11-02, 'Mech): `_onSlotHit` is called by both roll paths. `_ammoExplosionProtection(loc)` handles CASE, CASE II and Clan CASE. `takeDamage` takes a 4th argument, `{ structureOnly, ventAt }`. The record has a new `excessToArmor` field: TW `{case-ii: "half"}`, CRB `{none: "all", case: 10, case-ii: 10}`. Tests are in `src/classes/battlemech-ammo-explosion.test.ts`. Not covered: the CASE II rule that rerolls crits from the 1 point and ignores them on 8+ (structure-damage crits aren't automated), and the CRB rule that handles damage transferred into CASE as if it originated there (it is vented TW-style).
  - Step 3 is DONE (2026-11-02, e1930646a; pushed, deployed to beta, master fast-forwarded, progress comment on #183): Vehicle (`_ammoExplosionDamage`) and Building (`getAmmunitionExplosionDamage(hex, cased)`) call `getAmmoExplosion`. The shared loop now counts battle-armor-scale ammo (GoO p.54) and extended fuel tanks (TM p.244). The record has `minDamage` (aero 1); building has `damageDivisor: { case: 10 }` (TO:AR p.118, round down, no minimum). Vehicle CASE (rear armor, excess ignored, crew stunned, TW p.194) and the Large Naval per-location scope (TO:AUE p.27) stay in vehicle.ts: no book differs on them yet, so no record field.
  - Step 4 is DONE (2026-11-02, 420524538; pushed to beta, deployed to beta, progress comment on #183). Master fast-forwarded and pushed (the classifier first blocked it as a "production deploy"; the user clarified that the deploy is `git deploy-beta` from beta, so pushing master is only round cleanup). TW gives aero no ammo crit. Explosions come only from heat (TW p.161), via shared `getHeatAmmoExplosion` (most destructive bin; that weapon's other bins lost) and `explodeAmmunition()` on AerospaceFighter/SmallCraft, plus a heat-panel button. `explodedAmmo` uuids are in inPlay, since aero play doesn't track shots. DropShips: zero net heat, no explosion. Capital ships: TW none. SO:AA p.86 has an OPTIONAL ammo-tracking rule (weapon crit, 10+ hits ammo, damage to that facing's armor, /100 for WarShips, 20-point groups for JumpShips/stations), not built, waiting on the user.
  - #606 is DONE (2026-11-02, e2a41e662; pushed, deployed to beta, master fast-forwarded, issue closed). DropShips run at zero net heat (TW p.161, AT2R p.22): a fired arc adds its full `getArcHeat`; going over dissipation logs one arc only plus a Control Roll at +1 per 100 over. The panel hides the Heat Scale, heat input and Avoid Rolls, and its title says DropShip. Also cleared the vite codeSplitting `debugName` build warning. ASKED THE USER: AeroTech (1986) p.28 gives DropShip fire factors 7 heat each against heat sinks, with no heat-scale effects. That edition gets the same zero-net handling until they rule on it.
  - Step 5 is DONE (2026-11-02, ProtoMech): no ruling in any book. Crits never hit ammunition (TW pp.185-186, BMR pp.54-55, checked on the page images) and ProtoMechs vent heat like vehicles (TM p.86), so there is no record and no explosion. The commit adds a test and a cited comment in the table only.
  - Step 6 is DONE (2026-11-02, 51963be57; pushed, deployed to beta, master fast-forwarded in the C:/repo/battletech-tools worktree, #183 CLOSED). The records hold citations, and the hooks work for editions that can't be selected yet (the user's rule).
    - New record fields: `heatOnly` (BD: a crit on ammunition does nothing), `destroysUnit` (vehicles before TW; CASE blows out the rear armor and the crew survive) and `oneShot` (AT2/AT2R fighter with CASE).
    - New scopes: "location" ('Mech BT2 to BT4: every bin in the location) and "weapon" (AT/BTM/BTC heat: all of that weapon's bins at full force).
    - BT3 library page p.29 (extract idx 30) was rewritten from the image (JBTIICRework 467bd730).
    - Not built: the AT2R optional "Ammo Criticals" rule, the SO:AA optional rule, and automated 'Mech heat explosions (display only).
  - NEXT: #183 is finished. Ask the user which item to do next.

# Handoff (2026-10-29), not committed

Read the standing rules in MEMORY.md first. Credits rule (kept as status quo): bugs only, and keep rounds small.

## State

- beta = master = origin; deployed to beta. Last commits: phrase matching, then deskew (#591).
- All open work is in issues:
  - #591: Aces card reader. A status comment lists the leftovers.
  - #592: other card types.
  - #598: record sheet reader.
  - #599: BV utility. Brainstorm first.
  - #600: bundled fighters and the 7 BV gaps.
  - #601: library rename and push (waiting on the LFS budget).

## Aces photo harness (local, gitignored)

- Test: `src/zz-local/aces-rek-harness.test.ts`.
- Tools: `tools-local/aces-harness/`. It holds run.ps1, summary.cjs, Rekikire's photos in rek/png, and baseline.txt.
- Run: `.\tools-local\aces-harness\run.ps1 -Out rN.txt [-Only IMG_0041] [-Debug]`, then diff the summary against baseline.txt.
- Env options: `ACES_TILT=5` tilts the photo first to test deskew; `ACES_NO_DESKEW=1` skips straightening.
- run.ps1 deletes eng.traineddata after the run.
- Variable names: PowerShell names are case-insensitive, so don't use both `$T` and `$t`.

## Next deskew improvement (#591)

- Rotate the original full-resolution image once in loadPhoto, instead of rotating the 2000-wide copy and scaling again.
- The double resample lost one filter row and the card number in the 5° tilt test.

# Handoff notes (2026-11-02)

## Done since 10-29
- #602 Command card form fixed (filters, phase-less orders, Maintain this strategy, support rule from text). Deployed to beta; master fast-forwarded.
- #591 retest posted; leftovers: icon shape for a bare "target" line, glare-proof TN reads.
- Ollama lead queue running (run_leads.sh, log scrapes/_run-2026-11-01.txt).

## Open from email (start here: bugs first)
- #603 DONE 83066e293, #604 DONE 77e151cd5 (2026-11-02): closed on origin, merged the weekly MUL sync, beta = master = 6e68d37da, deployed to beta.
- #604 reads "+N"/"-N" from Initiative-phase order text (no card text seen); if Rekikire's real wording differs, adjust `acesCommandInitiativeModifier` in aces-helpers.ts.
- No open bugs left on origin after these two.
- #605 enhancement: pick which Battlefield Support cards to spend ("up to 2").

## Scott (mordel.net) answers, round 1
- Rules level: records the calculated rules level for Year, Era and Current, plus a canon flag.
- No "munchkin" flag yet. Planned with custom equipment, which would count as munchkin.
- Custom equipment: none at this time.
- More answers are coming in his next emails. API ticket #2611-001 (unitdata endpoint, keys, throttling).
- Our requirements doc: battletech-tools/docs/superpowers/plans/2026-11-01-mordel-data-pipeline.md (untracked).

- The user plans to ask Scott to match our rules level rulings, to simplify the mapping.

## Edge ability cards (#93), decided 2026-11-02
- Like every card, we never ship the exact card text.
- Rekikire's Edge card text is reference for building the OCR scans only. For example, it lets us match repeated or problem lines against the real wording.
- If we have no sample card of a type, build one from a custom unit, following how those cards work, and mark it NOT OFFICIAL.

## Waiting on the user
- Enhancement order: answered 2026-11-02, done-sweep first (see below). The custom content format (JBTToolsSupportFiles arrayPlan.md + plan.md + mordel) is still to come.

## Done-sweep (2026-11-02)
- #201 closed: b936ce6cb (icon links wrap below 1200px; Aces tracker tables scroll on phones), deployed to beta; beta = master = origin.
- Partly done, issue text out of date: #109, #171, #196, #187. Still blocked: #211, #601/#225.
- Least effort next: #109 altName "Prototype Ferro-Fibrous", #143 pod AS data, #183 Mech ammo explosion (port Vehicle.getAmmunitionExplosionDamage), #605.
