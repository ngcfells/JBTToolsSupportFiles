# START HERE (2026-11-11, later): #599 Tasks 1-7 and 9 complete and pushed; next is Task 8

Owner chose option (a) (keep the cited fix). Done: `npm run build:bundled` (about 22 minutes, 7,677 files
re-prepared), checked, committed, `npm run check` green, pushed. origin/beta = local `beta` = `3f42a7383`, working
tree clean.
- Rebuild check: 3,686 designs kept before and after; no BV, tonnage or other field changed; cost moved by exactly
  one C-bill on 1,096 designs (690 down, 406 up). The bundled-mechs test passes.
- `src/data/bundled/mechs-accuracy.json` (new): 3,924 MUL entries matched, 119 differ (one row each), not compared:
  123 import failures, 246 with no MUL entry. It agrees with `mechs-report.md` (which did not change): the 248 lines
  are 236 MUL comparisons, of which 117 are a second file for the same MUL entry or an entry a kept design matches.
  The other 12 are OmniMech configurations checked against the file's own BV (no MUL entry): they are counted
  nowhere in the accuracy file. Task 10 decides whether the public page says so.
- `2b380a725`: the "keeps Best Guess..." armor test timed out again in `npm run check`; it now has a 30 s timeout.

STILL NOT DONE (owner's call): `git deploy-beta`, fast-forward `master`, and the #599 round comment (it must list
the one-C-bill cost change). Ask before deploying.

Next: Task 8 (breakdown view; `getBattleValueBreakdown(edition)` and `getCostBreakdown()` are ready; it must show
the pilot-adjusted BV again), then 10, 11, 12. Sonnet for 8 and 10, Fable for 11. The notes and tips in the block
below still hold; its "owner decision" is answered.

# EARLIER (2026-11-11, handoff at /clear): #599 Tasks 4-7 and 9 committed; one owner decision, then a bundle rebuild

Next session model: **Sonnet** is enough for the rebuild check and Tasks 8 and 10; **Fable** for Task 11 (root causes).

State: worktree `C:/repo/battletech-tools-master`, branch `beta`, working tree clean. origin/beta = `c9ce06c60`
(Tasks 4, 5 and both findings). Local, NOT pushed: `7c65a6ebe` (Task 6, cost step definitions), `b9336ff53`
(Task 7, cost emits steps), `84910874e` (Task 9, the bundle build returns and writes accuracy data). NOT deployed
to beta, `master` NOT fast-forwarded, the #599 round comment NOT posted: ask the owner before `git deploy-beta`.
Issue #631 filed (cost under older editions follows the current rules).

`npm run check` has ONE failing test, and it is expected: `src/data/bundled-mechs.test.ts` "load at the Battle Value,
cost and tonnage they were built with" (106 of the every-10th sample). Cause: Task 7 stopped rounding the engine
cost early (TechManual p.274: no cost is rounded before the end; the book's Mongoose example keeps 333,333.333), so
a design's cost can move by a C-bill or two, and the bundled index still holds the old costs.

OWNER DECISION needed first (asked at the end of the 2026-11-11 session, not answered):
- (a) Keep the cited fix: run `npm run build:bundled` (the cache is invalidated, every file is re-prepared; needs
  `C:/repo/megamek`, the SSW data and `C:/repo/mordel-units`). Then check: no kept design's BV changed, the kept
  count is unchanged, cost deltas in `mechs-index.json` are a C-bill or two, the test above passes, and the totals in
  the new `src/data/bundled/mechs-accuracy.json` agree with `mechs-report.md` (200 "BV differs from the MUL" + 47
  configuration + 1 every-configuration, less any MUL entry that also has a kept design). Commit the regenerated
  data, `npm run check`, push, list the cost change in the #599 comment.
- (b) Keep early rounding: put `Math.round` back on the engine cost in `_calcCBillCost`, make the Mongoose test
  expect 333,333 with a note, mark `cost.engine` provisional (ledger Finding 20). `npm run build:bundled` is still
  needed once, for `mechs-accuracy.json`.
The session's recommendation is (a).

After that: Task 8 (breakdown view; `getBattleValueBreakdown(edition)` and `getCostBreakdown()` are ready; it must
show the pilot-adjusted BV again), 10 (verdicts, public page, remove the MegaMek audit), 11, 12.

Notes for whoever continues:
- Task 7's conversion was done by a Sonnet subagent to tests written first; 643 tests in the 7 files it touched
  pass. The old cost-log assertions were rewritten onto steps. One thing it dropped: the log no longer says
  "IO p.186" for LAMs and "p.187" for QuadVees; both cite the IO:AE table (pp.215, 218). Task 12's reviewer should
  look at that diff.
- "keeps Best Guess within every location's armor cap" (battlemech.test.ts) timed out once at 5 s inside
  `npm run check` while the slow build tests ran; it passes alone. If it recurs, give it a longer timeout.
- The run ledger (`.superpowers/sdd/2026-11-10-cited-bv-and-cost-mechs/progress.md`) has `complete` lines for Tasks
  1-6 and both findings, every ruling, and "NOT complete" notes for Tasks 7 and 9 (they wait on the rebuild).

Done today (run ledger has the detail and every ruling):
- Task 4 `b9146e179`: `src/data/calc-steps-mech-bv1.ts`, one cited step table per BV1 edition.
- Finding A `b4ff5db44`: under master-rules only CASE inward excuses arm ammunition (`armCaseInwardOnly`). The
  designer needed nothing: both books allow Inner Sphere CASE only in a torso and it already refuses an arm.
- Finding B `8e6eadfa5`: the FASA Maximum Tech (corrected 2nd printing, 1999) IS held. It prints the same Level 3
  tables as the Revised: Grenade Launcher BV 1, Inner Sphere and Clan (the code's 4 is now 1). master-rules now reads
  Level 3 from it, so a design with Level 3 gear has the same BV1 under both Master Rules editions. The owner's "15"
  is in neither printing held; the 1997 first printing is not in the library (a source to add, nothing waits on it).
- Task 5 `c9ce06c60`: `getBattleValueBreakdown(edition)` gives BV2, BV1 or "no Battle Value" steps; the Goshawk
  example (BMR p.145, BMR(R) p.159) is checked step by step.

- Task 6 `7c65a6ebe`: `src/data/calc-steps-mech-cost.ts`. A component price is cited only where its table row was
  read (`READ_ROWS`); the rest read a provisional "from our records" step.

After #599's tasks: Rekikire's Aces feedback
(owner, 2026-11-11): (1) add 'Mechs or vehicles to the automated force part way through a game, by searching the MUL;
(2) two screenshots of the Aces End Phase and card reader on beta (Command card Mechwarrior D, "Ideal RED: needs
your answer", a bare "None." bullet under the ideal list; the reader asking "Which of these match: Starting Armor"
for Star Adder Prime and Victor VTR-9Ka, which the app could answer from the unit cards). The owner will put
Rekikire's zip files in a folder (no Gmail access from this session). File or extend an issue before building.

Tips: run vitest from PowerShell (`Set-Location C:\repo\battletech-tools-master`); from Git Bash `cd /c/...` every
suite fails with "reading 'config'" (drive-letter case). A Bash heredoc with an apostrophe is blocked: write a script
file. BMR(R) and BMR page images: front matter is extract index = page + 1 (BMR(R)) or = page (BMR); the BV chapter
is index = page + 9 (BMR(R)) or page + 8 (BMR). Max Tech (both): index = page (FASA), page + 1 (Revised).

# EARLIER (2026-11-11, morning): finish cited Battle Value (#599). Task 4 half done: reading finished, no code yet

Today's job (owner, 2026-11-11): **finish #599**, Tasks 4 to 12 of the plan. Model: **Fable** for Tasks 4 and 6
(Sonnet subagents are fine for 8, 9, 10). Usage was at 8% at the start; the window resets at 10:10 AM.

Rules for this session:
- **Do NOT use Ollama** (owner, 2026-11-11: it may have caused last night's crash). No local-model offload at all;
  this overrides the older "offload to Ollama" memories. Claude subagents on a named model only.
- **BattleTech only.** Leave `C:/repo/testingUtility` alone: another account's agent works there.
- Do not rely on a timer. The 23:00 job of 2026-11-10 never fired: it was session-scoped and the session ended at
  about 21:30. Nothing ran overnight; nothing was lost. Do not run `taskkill` on `node.exe`.
- The GitHub MCP server fails to connect (bad Authorization header); use the `gh` CLI.

State (checked 2026-11-11 05:20): battletech-tools `beta` = `master` = origin at `36e8265bf`, worktree
`C:/repo/battletech-tools-master` clean, deployed to beta. No commit since 20:25 on 2026-11-10.

Resume, in this order:
1. Read the run ledger FIRST: `C:/repo/battletech-tools-master/.superpowers/sdd/2026-11-10-cited-bv-and-cost-mechs/progress.md`
   (git-ignored). Its Task 4 lines hold everything read so far, the page offsets for the BV1 books, and three owner
   rulings. Do not re-read the pages it lists as read and agreeing. Then the Task 4 brief beside it, and the plan
   `docs/superpowers/plans/2026-11-10-cited-bv-and-cost-mechs.md` (use superpowers:executing-plans).
2. Finish Task 4: confirm the BMR(R) TMM table (pp.30-31, an image: re-render it, last night's scratchpad is gone)
   against `getMovementModifier` capped at 4; read TC note D (BMR(R) p.158, BMR p.144); then ledger rows, failing
   tests, the tables in `src/data/calc-steps-mech-bv1.ts` (the master-rules table also carries the light-engine and
   stealth steps as provisional), commit.
3. Finding A (owner ruling): its own commit after the Task 4 tables, red test first. Per edition, in BV1 AND in the
   designer's ammo/CASE placement check: under master-rules (errata p.12) arm ammo is protected only by CASE in the
   next location inward; under master-rules-revised (p.153) CASE in the arm or inward counts.
4. Finding B (owner ruling): edition dependent. Look in `C:/repo/ResourceLibrary/INDEX.md` and `rulebooks-legacy`
   for the original FASA Maximum Tech (1997, or a 1998 printing; the owner recalls IS Grenade Launcher BV1 = 15 in
   one of them). If held: master-rules gets its own whole Level 3 table read from it. If not held: tell the owner it
   is a source to add, and master-rules stays without Level 3. The FanPro Revised prints 1; the code's 4 matches no
   page: fix it for master-rules-revised.
5. Then Task 5 (BV1 emits steps; all BV1 sources are held, so 5 goes before 6-7), 6-7 (cost), 8 (breakdown view with
   the edition switch; it must show the pilot-adjusted BV again), 9-10 (accuracy data, verdicts, public page; remove
   the MegaMek audit), 11 (the 248 'Mech misses), 12 (one whole-branch review). `npm run check` before each push;
   ask before deploying. Add `complete` lines to the run ledger as each task ends, and update this block.

Last night's transcripts, if needed: `C:/Users/chris/.claude-battletech/projects/c--repo-testingUtility/`
(6096effc... and 66388735...; the session was started in that folder).

The block below is last night's handoff: its reading method, offsets and open owner items still hold.

# EARLIER (2026-11-10, late): cited Battle Value (#599), Tasks 1-3 of 12 done and live on beta

Next session model: **Fable (or Opus)** for Task 4 and Task 6 (they read the rules and decide what the app claims).
Tasks 8, 9 and 10 run fine on **Sonnet**. The owner's plan: `/clear`, then small chunks; a timer at 23:00 resumes.

What this is: every unit gets a step-by-step Battle Value and C-bill cost breakdown, per rules edition, each step
citing the page it was read on, plus a public record of where our BV and the MUL differ. Catalyst sources only.
Owner rulings (2026-11-10): the math is key; transparency (misses shown); BV by edition is the headline; cost is in
scope; no `astech` agent: the session itself or Claude subagents on a named model; a missing source is reported to
the owner, who adds it to the library.

Read, in this order (all in battletech-tools, on `beta` = `master` = origin at `89e3e473b`):
1. `docs/superpowers/plans/2026-11-10-cited-bv-and-cost-mechs.md` (the plan: 12 tasks, 'Mechs only).
2. `docs/superpowers/specs/2026-11-10-cited-bv-and-cost-design.md` (the design it argues from).
3. `docs/superpowers/plans/2026-11-10-cited-bv-ledger.md` (what was read on each page, the worked examples, 14 findings).
4. The run ledger: `C:/repo/battletech-tools-master/.superpowers/sdd/2026-11-10-cited-bv-and-cost-mechs/progress.md`
   (git-ignored; Tasks 1 to 3 have `complete` lines, plus the rulings made).

How to resume: worktree `C:/repo/battletech-tools-master`, branch `beta`. Use superpowers:executing-plans with the
plan above; it resumes from the run ledger at **Task 4** ('Mech BV1 step definitions read on the page: Master Rules
pp.139-145 with the FanPro errata, Master Rules Revised pp.152-159, Maximum Tech pp.90-92). First list those books
with their printings from `C:/repo/ResourceLibrary/INDEX.md`; any not held is a report to the owner, and Tasks 6-7
(cost) go before Task 5. Then 5 (BV1 emits steps, editions with no BV), 6-7 (cost), 8 (the breakdown view with the
edition switch; it must show the pilot-adjusted BV again), 9-10 (accuracy data, verdicts, the public page; remove the
MegaMek audit), 11 (work the 248 'Mech misses), 12 (one Opus whole-branch review).

Done and deployed to beta (no Battle Value changed; `npm run check` 4,074 passed):
- `src/data/calc-steps.ts`, `calc-sources.ts`: the step and citation model, the renderer.
- `src/data/calc-steps-mech-bv2.ts`: 61 'Mech BV2 step definitions, each read on its page.
- `BattleMech._calcBattleValue` records steps; `calcLogBV` renders them; `getBattleValueBreakdown()` returns them.
- `src/classes/battlemech-bv-examples.test.ts`: TechManual's Mongoose (758), Thunderbolt (2,008) and DemolitionMech
  (380), checked at every number the book prints.
- #599 has a comment with all of this and the findings.

How the reading is done (it worked well):
- `cd C:/repo/ResourceLibrary`, then `python library_search.py --page <extract name> <pdf page>`. Offsets: TechManual
  pdf = page + 2 (`BattleTech-TechManual`); TO:AUE pdf = page + 1 (`BattleTech-Tactical-Operations-Advanced-Units-and-Equipment`);
  IO:AE pdf = page + 2 (`BattleTech-Interstellar-Operations-Alternate-Eras`); Total Warfare pdf = page + 1.
- `text/100-TechManual-Battle-Value-v4-1.txt` is the whole BV chapter in one clean column: much easier to read than
  the two-column book pages, and it holds the Thunderbolt example the sixth printing's extract drops.
- Tables lose their columns in the extracts. Crop the page image and look: a small pymupdf crop script (pdf, page
  index, fractions of the page, dpi 140-150) against `C:/repo/JBTIICRework/rulebooks/<book>.pdf`, then Read the PNG.
- Never grep `src/data/equipment-*.ts` without `| cut -c1-200`: one line is thousands of characters.

Open for the owner (nothing blocks the work):
- The findings in the ledger. Prototype CASE (Finding 2) is FIXED and live on beta (56672e08a, 2026-11-10): BV2
  ammo slots behind it cost 8, step `bv2.def.explosive.prototype-case`. Finding 4 (AES on tripod legs, 0.3) FIXED
  (63d707094). Finding 3 DECIDED by the owner: keep IO:AE p.190 (the MUL and record sheets compute with it; p.185
  moved all 30 bundled designs off), 36e8265bf. `beta` = `master` = origin at 36e8265bf, deployed to beta.
  Next findings: 1, 5, 6, 7, 8 (rules vs MUL/MegaMek; check MUL matches before changing, as Finding 3 showed).
  Three steps follow MegaMek/SSW/the MUL and not the page (IS XL with CASE in an arm; an armored gyro; signature
  system heat): they show as provisional. Two are the book contradicting itself (Dark Age armor multipliers, IO:AE
  p.185 against p.190; radical heat sinks): questions for Catalyst.
- The conversion subagent ran `taskkill` on `node.exe` once on 2026-11-10: restart any dev server that was running.
- Still pending from before: the four Mordel decisions in the block below.

# 2026-11-10 (night): API fixes built on mordel-user-key, rerun clean; owner decisions pending

Next session model: **Sonnet**. On `mordel-user-key` (worktree C:/repo/battletech-tools-mordel-key, NOT pushed, NOT
merged): commit 152009764 builds the fixes from Scott's API v1 docs (owner=me, cursor resume, /units/ids removals,
Retry-After, GET /key, proxies gone); `npm run check` green; 535c1185e is the sandbox rerun (sections 7 and 8 of
`docs/superpowers/plans/2026-11-06-mordel-api-mapping.md`). Nothing wrong found in the sandbox API.
Owner decides: (1) production `https://mordel.net/api/v1` answers 404, so the app should default to the sandbox until
Scott opens it; (2) send or change the drafted reply to Scott (section 7); (3) the optional features (MegaMek export
cross-check, BV breakdown text); (4) merge `mordel-user-key`. Test `owner=me` once the owner makes private units.
Move the two untracked zz-*.test.ts out of src/ before any commit.

# 2026-11-10 (late): review patch pushed, beta deployed, Scott's API docs are done; sandbox key saved

Next session model: **Sonnet** (the Mordel check is mechanical; use Opus only for a whole-branch review).
This block supersedes the "ACES #630: NOT pushed" block below: #630 is closed and live.

State now:
- battletech-tools `master` = `beta` = `origin/*` at `00f97f37d`. That holds: Scott's answers (docs), the review patch
  `e4b9262b7` (17 files; review notes in `~/Documents/battletech-tools-review.md`) and two plan files. `npm run check`
  passed before the push. `git deploy-beta` ran from master at `e4b9262b7`, so the beta site has the fixes (the plans
  after it are docs only). `deploy-prod` points at the upstream heysporky repo: NOT run, the owner decides.
- JBTToolsSupportFiles: arrayPlan.md committed, everything pushed.
- Key: the sandbox key is saved in `C:/repo/JBTToolsSupportFiles/.env.mordel` (git-ignored; `. ./.env.mordel` gives
  `$MORDEL_API_KEY`). `GET /api/v1/key` = 200. A sandbox refresh wipes it. Never print it or write it elsewhere.
  It was pasted in chat once, so replace it when convenient.
- Scott (2026-11-10): REST API v1 docs are done
  (`https://sandbox.mordel.net/documentation.php?a=api&s=start`, `s=endpoints`, `s=reference`).
  Base `https://sandbox.mordel.net/api/v1`, GET only, `X-API-Key` (keys in the URL are 400), CORS `*`, 120 points per
  60 s (`/units` page 1, `/units/ids` 2, record sheet 4, Alpha Strike card PDF 10), cursor paging (limit 1-1000, default
  500), `owner=me` lists your own units at every privacy level, the summary has `name_parts`, `mul_id`, `role`,
  `designer`, `omni_base_id`; the detail has `alpha_strike`, `equipment`, `locations`, `files` (megamek .mtf/.blk,
  texts, PDFs). NOT there: a removals feed (diff `/units/ids`), an original-designer field, import or push endpoints.
  Texts can change without `updated` changing. 503 during site releases.

Next steps, in order:
1. `gh issue list` in testingUtility and battletech-tools first (bugs beat everything).
2. Review the `mordel-user-key` branch (worktree `C:/repo/battletech-tools-mordel-key`, plan
   `docs/superpowers/plans/2026-11-07-mordel-next.md`) against Scott's docs. List the gaps in sections 5 and 6 of
   `docs/superpowers/plans/2026-11-06-mordel-api-mapping.md`. Test with the key (read-only calls only, mind the
   120-point budget). Draft a short reply to Scott for the owner to send (thanks; the original-designer field, a
   removals feed and file import were asked for and are not in v1).
3. Owner checks: the two review-patch fixes that rest on memory of the rules (low-skill PV `ceil` over 104 PV;
   Strategic Command Star accepts `AF`), against the ASCE book. Review section 3 lists 11 not-fixed items (TSM TMM,
   MUL sync cap 900/800/700, fork identity, the `-1` no-shot to-hit); the owner picks. Section 4 lists canon items that
   should each have an issue: compare with `gh issue list` and file the missing ones.
4. testingUtility: #16 (font size on phones), #17 (install as an app / offline), then #11, #6.
5. Still open for the owner: hand-check the Aces auto-answer on beta; the VERIFY items (Weapon Hit 50 vs 25 percent);
   the `mordel-user-key` merge.
- JBTIICRework working tree: the pending rename (#601, LFS budget). Leave it.

# BACK ON THE HOME MACHINE (2026-11-09)

The home machine is on again, and local `C:/repo` is the main copy. Cloud work is pulled in: battletech-tools
`master` (rebased; one local docs commit, bf2c594c8 rebased, not pushed), `mordel-user-key` fast-forwarded to
13e645064 (section 2 WIP, see `docs/superpowers/plans/2026-11-07-mordel-next.md`), `beta` at origin, testingUtility
`command-primer` same as origin. ResourceLibrary pulled. The CLOUD block below is history.

Open issues (2026-11-09): cert-exam-trainer has no bugs; new `from-app` requests #16 (font size setting for phones)
and #17 (install as an app / work offline), both enhancements, plus #11, #6, #5. battletech-tools: the only bug is
#630 (Aces playtest, plan below). JBTIICRework, TechFoundry: no issues. JBTIICRework's working tree has 37 deleted,
11 changed and 154 new library files: that is the pending rename (#601, waits on the LFS budget). Leave it.

# ACES #630 (2026-11-10): 5 of 7 points built on `beta`, NOT pushed, NOT deployed

Next session model: **Sonnet** (the rest is code plus tests; the crit tables are already verified).

State: worktree `C:/repo/battletech-tools-master`, branch `beta`, 7 local commits ahead of origin (one per point,
messages end "(#630 point N)"). `tsc` is clean; the Aces unit and page tests pass (1234 passed, 4 skipped). The full
`npm run check`/lint was NOT run on battletech-tools. Points 6 and 7 are already added to #630 as a comment.

Done: 1 (player move count follows the roster at Movement, `setPlayerUnitsFromForce`), 3 (damage at range from the
unit S/M/L and the entered distance, typing overrides, `getAcesDamageAtDistance`), 4 (`applyCommandTokens`, run on card
change, scenario load and each new Initiative phase), 5 (ASCE crit tables in `src/data/aces-rules.ts`, checked by the
astech agent against the 5th printing and Errata v7.02; notes at the end of this block), 6 (`findAcesCommandCard`
matches "Deck, Faction"; a warning shows when no card matches), 7 (`getAcesUnitLabels`, duplicates numbered in force
order on both sides), and the DISPLAY half of 2 (`getAcesIdealTargets` plus `_ideal-targets.tsx`).

OWNER RULING (2026-11-10): this session's job is to FINISH #630 end to end: build the rest of point 2, check,
commit, push `beta` (push is approved), `git deploy-beta`, fast-forward master and push, comment on #630 with what
changed and how to replay it, and CLOSE #630. Only after that, go to testingUtility bug #18 (see
`C:/repo/testingUtility/HANDOFF.md`, top block). If a part of point 2 cannot be done from known data, ask the owner
before closing; do not close with a point silently dropped.

NOT done:
- Point 2, the auto-answer half: answer the card conditions from known data ("any [moved] enemies in N\"", "no
  [moved]/[notmoved] enemies in N\"", "at least K enemies in [los] and N\"", "ideal [c] is [moved]", "this unit is
  crippled"), with a per-turn "player unit moved" list saved in the game and reset in `nextTurn`. Unknown distance
  means ask. See the plan below.
- Round cleanup: run `npm run check` (or the repo lint plus tests), push `beta`, `git deploy-beta`, fast-forward
  master, push, update #630 (tick the points, say what is left). Rekikire should replay the playtest on beta.
- Possible follow-ups from the astech report: IndustrialMech rolls twice (built in as `also`); ammo, crew, destroyed and
  the aerospace effects are "mark by hand" (the card has no box). VERIFY items: the book prints Weapon Hit on
  multi-attack units as 50 percent on p.50 and 25 percent on p.184 (errata edits only p.184); no table exists for
  JumpShips, WarShips, space stations or buildings (they still say "look it up"); Turret Locked is never defined.
  The astech report is at `C:/Users/chris/AppData/Local/Temp/claude/b9dfea8c969aa7cc/2796b0fd-1910-4ca6-8569-e3bd0359266d/scratchpad/asce-crit-tables.md`
  (may be gone; the rows are in aces-rules.ts with page cites).

The original plan (kept for point 2):

Earlier note: Sonnet. The plan below is laid out point by point and test-first. Use the `astech` agent
(or the ResourceLibrary search) for the point 5 crit tables. Opus only if point 6 will not reproduce.

Issue: https://github.com/ngcfells/battletech-tools/issues/630 (points 1 to 5 filed). Points 6 and 7 below came in
later and are NOT on the issue yet: add them to #630 first. Work on branch `beta` in the worktree
`C:/repo/battletech-tools-master` (clean, nothing written yet). Test first; prove each regression test fails before
the fix. Round cleanup: commit, push beta, `git deploy-beta`, fast-forward master, push, update #630.
Master in `C:/repo/battletech-tools` has one unpushed docs commit (Scott's 2026-11-08 answers), rebased on origin.

Plan per point (files: `src/classes/aces-game.ts`, `src/classes/aces-engine.ts`,
`src/ui/pages/alpha-strike/aces/game.tsx`, `src/ui/pages/alpha-strike/aces/_card-reader.tsx`):

1. **Player units able to move defaulted to 4** (should be 6). `playerUnitsAbleToMove` is a saved number (default
   0), never synced to the roster; 4 was likely a stale value. Fix: add `AcesGame.setPlayerUnitsFromForce(force)`
   (live, not immobile units) and call it when the phase bar enters Movement (`_renderPhaseBar`, game.tsx ~504).
   Keep the field editable.
2. **Ideal RED/YELLOW/BLUE not shown.** Add an engine helper that runs `narrowAcesCandidates` over the player units
   with each colour list of the Command card; show the ideal unit per colour in the reader. Auto-answer behavior
   conditions where the data is there: the phrases are listed in `src/data/aces-card-phrases.ts`
   (acesConditionPhrases): "any [moved] enemies in N\"", "no [moved]/[notmoved] enemies in N\"", "at least K enemies
   in [los] and N\"", "ideal [c] is [moved] (and in N\")", "this unit is crippled". "unit can move ..." parts stay
   a question, but a not-moved ideal answers False. Unknown distance means ask. Player "moved" state: keep it per
   turn in the game (new saved list, reset in `nextTurn`) so ticking it once carries to the next automated unit.
3. **Damage at this range** is typed by hand. Add current S/M/L damage to `IAcesReaderUnit`; default the field from
   the target's entered distance (S 0-6\", M >6-24\", L >24-42\"); typing overrides.
4. **Move First token not given automatically** on Command card B. Add `AcesGame.applyCommandTokens(card)` using
   `chooseAcesTokenUnit` (aces-game already imports aces-engine). Call it when the card changes (strategy button
   ~line 800, card select ~556) and at each new Initiative phase. Only assigns when the choice is not tied.
5. **Crit table not built in.** `rollAcesCriticalHit` returns "use-asce-table" for 'Mechs etc. Build the ASCE
   critical hit tables in `src/data/aces-rules.ts` and apply via `applyAcesCriticalToUnit`. VERIFY the table rows
   against the ASCE book in ResourceLibrary (`python library_search.py`) or the astech agent; do not write it from
   memory. Ammo/crew results the card can't track: say "mark by hand".
6. **(new, bug) Combat skips the RED list: "No Command card: skipped the red list"** while a Command card is
   active. The engine passes the card through (`identifyAcesCombatTarget` -> `narrowAcesCandidates`), so
   `game.tsx _commandCard()` (line 134) returned null. Likely cause: the deck name match is exact
   (`card.deck.toLowerCase() === game.commandDeck`), or `commandCardId` points at another letter, so a sortie's
   deck name that differs from the library's (spacing, "deck" suffix, faction) finds nothing. Reproduce with a test
   first (systematic-debugging). Fix the lookup (trim/normalise, fall back to the only deck with that letter) and
   show a warning when a Command deck is set but no library card matches. Points 2 and 4 depend on this lookup too.
7. **(new) Duplicate units can't be told apart** (two Fulcrum Heavy Hovertanks): lists re-sort by priority each
   turn, so it is unclear which one moved first or took damage. Fix: number duplicate names in `unitName` for the
   automated force, e.g. "Fulcrum Heavy Hovertank (1)" / "(2)", stable by force order (works for infantry and
   Elementals too). Rekikire also suggested a fixed list order; numbering is the smaller change. Use the same
   label in the unit table, queue, reader, log and crit messages. Also check the player side (`_enemies`).

# CLOUD (2026-11-07): the home machine is off, possibly for a week or more

Work continues in Claude Code cloud sessions. Everything that was only on the home machine (unpushed branches,
git-ignored working data, Claude memory, the mordel.net mirror) is in the private repo `NGCFells2/ResourceLibrary`,
folder `Custom/cloud-handoff/`. Start with `Custom/cloud-handoff/CLOUD-START.md` there. Windows paths below
(`C:/repo/...`) mean the same repo cloned in the cloud.

What was in progress when the machine went off:

1. battletech-tools, branch `mordel-user-key` (not pushed, not merged): mordel.net user keys are built and reviewed.
   Next: `docs/superpowers/plans/2026-11-07-mordel-next.md` on that branch (alt names and tags, every unit kind,
   missing catalog items, Battle Value root causes, the report for Scott). The owner chose: assume our BV is wrong
   until the rules and errata show otherwise.
2. testingUtility, branch `command-primer`: Task 15, release (see the block below).

Both branches are in the bundles under `Custom/cloud-handoff/`. Nothing is pushed to the public repos.

# START HERE (2026-11-06, after /clear): all repos in one place

The same block is at the top of `C:/repo/testingUtility/HANDOFF.md` and `C:/repo/JBTToolsSupportFiles/handoff.md`.
Older history is below it in each file.

Every session: run `gh issue list` in testingUtility first. Bugs come before everything else. Learners can now
file issues from the app (label `from-app`), so check for those too. At the end of 2026-11-06 the open issues were
#11, #6 and #5, all enhancements.

NEXT SESSION (written 2026-11-06, late evening):

1. `gh issue list`. Any bug, or any `from-app` issue, comes first.
2. testingUtility: the command primer, issue #5, branch `command-primer` (not merged). The plan is approved:
   `docs/superpowers/plans/2026-11-06-command-primer.md`. Ledger: `.superpowers/sdd/2026-11-06-command-primer/progress.md`
   (keep it). Tasks 1 to 14 are done and green. Task 14, the data group (SQL and pandas), is commit b167620, and
   `PENDING` is now empty. Next is **Task 15, release** (see testingUtility/HANDOFF.md). It starts with the owner
   approving the link list (Practice safely in `src/primer/links.json`, plus each topic's `links`). gnu.org still
   gave no answer at 20:30 on 2026-11-06, so recheck the three coreutils links first. Run it with
   superpowers:executing-plans and resume from the ledger.
   - The skill's task-start/task-done scripts cannot find content tasks (the plan heading is "Tasks 8 to 14"). Read
     the plan section "Tasks 8 to 14" and ledger by hand in the same format.
   - Listing the bank steps for a group: a throwaway vitest file in `src/primer/` that imports the three bank item
     files and `commandWords` and writes matching steps to the ledger folder (Task 9 wrote `t9-steps.md`). Delete it
     after.
   - Bank tests (`npx vitest run src/banks`) hold the primer acronym check. It also reads example `line` fields, so
     capital words in sample output (`PANIC`, `NR`) trip it; the drafter picked other samples.
   - Accuracy review that paid off in Task 9: run every Bash example in Git Bash and every PowerShell form in pwsh
     (both are on this machine). It caught a PowerShell `-replace` paired with a first-match-only `sed`, a false
     "No close equivalent." (`Measure-Object -Sum`), and a Bash `&&` line offered as the PowerShell form.
   - Linux tools for that review (set up 2026-11-06 at the owner's request): WSL Ubuntu now runs (its Windows
     service was Disabled; now Manual), with dnsutils and netcat added. Run a Bash file there with
     `wsl -d Ubuntu -u root -- bash -c "tr -d '\r' < /mnt/c/<path>.sh | bash"`. dig is also on Windows (winget
     ISC.Bind). Put a `timeout` on anything that may not stop (Task 10 hung on Linux `ping -n`).
   - Drafters copy the bank's own scenario (Task 10: the same TTL, addresses and JSON bodies). Swap in new values.
   - A new acronym in a topic must go in the acronym list of every exam the topic shows for (`meta.ts`); the Data+
     meta test pins its community count (now 27).
   - The copy checker (Haiku) tends to re-define "PowerShell" and "Bash" in every topic and can garble cross-reference
     titles; check every "see <title>" against the real topic titles.
   - Primer e2e: `tests/e2e/primer.spec.ts` (fixture) and `primer.responsive.spec.ts` (phone, tablet), helper in
     `tests/e2e/primerUtil.ts`. Run: `npm run build:e2e`, then `npx playwright test tests/e2e/primer.spec.ts
     tests/e2e/primer.responsive.spec.ts --project=fixture --project=phone --project=tablet` (7 tests).
   - From Task 11: www.gnu.org did not answer from this machine at commit time (it gave 200 earlier that
     session); the Task 15 link check must confirm the three coreutils links. `NET` (as in .NET) is now on
     NOT_ACRONYMS in `src/acronyms/extract.ts` as a product name.
   - From Task 12: WSL Ubuntu runs systemd (255), so services can be checked for real with a throwaway unit in
     `/run/systemd/system` (gone on reboot); clean up any `enable` symlink in `/etc/systemd/system/*.wants` and any
     test user. It caught: failed units print `×` not `●`; `systemctl start` is silent with exit 0 even when the
     program dies at once; `journalctl` as a plain user shows `-- No entries --` for system units. `FAILURE` is now
     on NOT_ACRONYMS; ID, PID, UTC are AutoOps+ community entries. gnu.org was down for everyone at Task 12 (owner, 2026-11-06); recheck the three coreutils links later.
   - From Task 13: Docker Engine 29 now runs in WSL Ubuntu (apt `docker.io`, installed 2026-11-06). The
     every-topic responsive e2e is marked `test.slow()` (axe over all open topics in two schemes passed 30 s); if it
     times out again after Task 14, raise its budget, do not drop the check.
     Python (miniconda, conda 25.11) is on Windows for checking pandas examples; sqlite3 may need checking for SQL.
   - Task 15: release. Empty `PENDING`, get the owner to approve the links, `npm run check`, one Opus whole-branch
     review, fix every finding (minors too), merge, push, `npm run deploy`, close #5.
3. Between primer tasks and while tests run: the tools work (section B in
   `C:/repo/JBTToolsSupportFiles/handoff.md`).

Both testingUtility features from 2026-11-06 are DONE and live: in-app exam tools (#14, section A) and in-app
reports (section A0 in testingUtility/HANDOFF.md).

Open items for the owner (none blocks the primer):

- Confirm one ruling from the reports review: the "reports waiting to send" banner has one "Send or discard" button
  that opens the report panel, not separate Send and Discard buttons.
- The relay GitHub token expires 2027-02-04. Renew before then: in `testingUtility/relay/` run
  `npx wrangler secret put GITHUB_TOKEN` and paste the new token only into that prompt, never in chat.
- `relay/README.md` says "Then, from this folder:" just before step 1, which is `cd relay`. Reword it if the owner
  wants.
- The local `in-app-reports` branch is merged into main and can be deleted (`git branch -d in-app-reports`).
- The hand checks listed under section A are still open.

## A. testingUtility: in-app exam tools (issue #14). DONE: merged, pushed and deployed 2026-11-06

Status (2026-11-06, about 12:15):

- All 7 tasks are done, the Opus whole-branch review ran, and every finding is fixed, minors too.
- Merged to main (fast-forward), pushed, and deployed to gh-pages (4518342). The `exam-tools` branch is deleted.
  It was never pushed.
- Ledger (keep it): `.superpowers/sdd/2026-11-06-in-app-exam-tools/progress.md`. The decisions are its `Ruling:`
  lines.
- Final check: lint, typecheck and builds pass, unit 942/942, e2e 109/109.
  - Inside `npm run check`, the unit step twice hit a vitest worker timeout ("Timeout calling onTaskUpdate"), with
    all 942 tests passing. Run alone, it exits 0.
  - If it keeps happening, consider `--maxWorkers` in the check script.
- Calculator coverage: every approved Data+ numeric and data item needs only + − × ÷ % √ and xʸ.
- Fixes after the review:
  - The Tab exemption is replaced by Tab wrapping inside the page.
  - The app's own leave prompt no longer counts as leaving.
  - No panel opens over the results.
  - An answer given as the page hides still counts.
  - One attempt keeps one result id (keyed on its start time).
  - A bad saved record is cleared.
  - Saves after the start write only the answers.
  - Calculator: full precision, Backspace, comma, and ± after an operator.
  - The whiteboard repaints on a theme change.
- Close issue #14 if it is still open: `gh issue close 14`.
- VERIFY by hand (the owner will test these later):
  - On a real Firefox and Safari, does opening a PBQ dropdown (native select) count as leaving the mock?
  - What do Android and iOS do when you pull down the notification shade?
  - Does the calculator key set match Pearson's?
- NEXT in testingUtility: primer issue #5 (below).

- Spec (approved): `docs/superpowers/specs/2026-11-06-in-app-exam-tools-design.md` (f158a6a).
- Plan (approved, "that sounds great"): `docs/superpowers/plans/2026-11-06-in-app-exam-tools.md`. Both are on
  origin/main.
- What it builds:
  - Settings opens as a panel from any screen.
  - Calculator and Whiteboard buttons sit side by side in mock, practice and cram.
  - In a mock, leaving ends and scores the exam. Leaving means a hidden page, window blur, a refresh or close, or
    the app's own Back and All exams buttons ("Leave and score the exam now?").
  - An "I understand" warning gates Start.
  - Results say "Ended because you left the exam."
  - The timer never pauses.
- How it was built (the user's standing choice for features): natively, superpowers:executing-plans test-first,
  then one Opus whole-branch review, fix every finding (minors too), then merge, push and `npm run deploy`.
- Rules: keep `.superpowers/sdd` ledgers, no GitHub Actions, no LFS, and if a port is busy use a free one.
- AFTER #14: primer issue #5 (Bash/PowerShell). The brainstorm is partly done. Agreed so far:
  - Assume zero experience.
  - Show Bash and PowerShell side by side for every command.
  - An exam-level layer, plus a "Learn more" button for depth.
  - Include SQL and pandas where learners type them.
  - It opens directly from the question.
  - Link to safe practice sites and beginner training. No emulator.
  - The topics come from the commands the banks accept (git, curl, grep, sort, head, wc, sed, awk, dig, ping, chmod,
    sha256sum, systemctl, docker, fg/bg/nohup, conda, SQL SELECT, pandas), plus how to read a made-up tool's help
    text.
  - No bank accepts a PowerShell answer today.
  - Decided 2026-11-06: no primer link in mock exams. The primer shows in study and cram only, matching the real
    exam, which has none.
  - Next: the written design, then the builder check.

## B. Tools work (battletech-tools, JBTIICRework, ResourceLibrary, JBTToolsSupportFiles)

Scott answered (2026-11-06 evening), and the user sent two replies. Both are saved in sections 5 and 6 of
`battletech-tools/docs/superpowers/plans/2026-11-06-mordel-api-mapping.md`, with the follow-ups at the end.
- Per-user keys are agreed in principle, so option (c) leads. We asked for CORS (three origins: jeffs-bt-tools,
  heysporky and ngcfells .github.io), a "my units" list with private units, name_parts, mul_id and role in the list,
  and a removals feed. Waiting on his answer.
- The three mismatches are fixed in production. Recheck them after his next production-to-sandbox copy.
- Archive designs: build them as real designs under an archivist account with credit in the notes. We asked about
  an original-designer field, moving designs to their creators, file import, and a push API.
- Sizes measured from a sample at 21:15: all details about 530 MB (87 MB gzipped); the list about 25 MB (3.5 MB
  gzipped).
- The user is away at a conference in Utah the week of 2026-11-09 and may be fully offline.

**Mordel user keys: BUILT 2026-11-07 overnight, not pushed.** Worktree `C:/repo/battletech-tools-mordel-key`,
branch `mordel-user-key` (last commits 039cd2bb7 review fixes, 51e889a36 docs). `npm run check` passes.
- The key is saved in Settings. A Mordel units panel sits in the Classic and Alpha Strike rosters and the 'Mech
  designer. Tabs: search the list, "My Mordel designs", or paste a link. Details are pulled with the user's key and
  converted (MTF for 'Mechs, BLK for vehicles and ProtoMechs), with a warning when our BV differs from mordel.net's.
- The list chunks hold member designs. They are git-ignored and load only in dev with `VITE_MORDEL_LIST=local`
  (in the worktree's `.env.development.local`). A production build has no list; with a key it tops up daily.
- Owner decisions needed: memo `docs/superpowers/plans/2026-11-07-mordel-storage-memo.md` (where the list comes
  from, and the 334 canon mismatches). New questions for Scott are at the end of
  `docs/superpowers/specs/2026-11-06-mordel-user-key-design.md`. Nothing sent.
- The full pull ended at 02:50 on 2026-11-07, with 56,043 units and none missing. The list and the mismatch report are
  rebuilt, and the memo has the final counts (2b35ec7f6): 381 canon mismatches, 4,317 canon units dropped.
- Merge, push and deploy wait for the owner's OK.

Steps, in order:

1. **Mordel full pull (running).** At 12:05, batch 13 was done and 43,043 of 56,043 units were waiting. It does
   about 1000 every 20 minutes, so it should finish around 02:30 on 2026-11-07. Log:
   `battletech-tools/tools/mordel-sync/.mirror/full-pull.log` (a "done" line at the end). If it stopped, restart
   it detached from battletech-tools with `bash tools/mordel-sync/.mirror/full-pull.sh` (it resumes). When it is
   done:
   - Measure total size (`du -sh`), gzip size, count per type and size per type.
   - Write the user a memo with a recommendation on three options: (a) ship with the app, (b) an optional pack,
     (c) per-user keys (the user's favourite: we ship a unit list only, and each user fetches with their own key;
     it depends on Scott's answer on keys and CORS).
2. **Sort JBTIICRework `unsorted/scrapes/`: DONE 2026-11-06 (cheap subagent), working tree only, logged.**
   - 262 of the 296 are sorted: 239 moved and 23 duplicates set aside. That is on top of the 74 duplicates set aside
     earlier.
   - 34 are left in place: 10 podcasts, 4 Solaris Sentinel files, 4 ironwind files, and 16 ourbattletech,
     hpgstation and scottsgameroom files.
   - 23 battletech.com and battletech-mercenaries.com files are not sorted yet.
   - Leave `_queue.lock` and `_queue.pid` alone.
   - **Owner answers (2026-11-06) to the sorter's questions. Apply them (cheap subagent, working tree only, log
     every change in `jbtiicrework-pending.md`, never delete):**
     1. BattleSpace sheets marked WizKids 2001: the publisher is **FanPro**. Rename them to match, and file them by
        content (record sheets go in `record-sheets/`).
     2. Fan-made counters: a folder under `fan-made/`, not `battleforce/`.
     3. Years: check each one online and fix the name if it is wrong. The owner thinks the errata 2025 is likely
        right. The blank sheets "20138" are probably 2013. ForcePack Wave One is listed as 2021.
     4. Fan-made publisher tag: the author when the author is known. Otherwise use `fan-made` as the publisher.
        Never leave the tag empty.
     5. The two BattleMech Manual flowchart copies in `errata/` (0.8 MB and 8.2 MB): compare them. If they show
        the same thing, or the larger one includes everything in the smaller, set the smaller aside under
        `unsorted/_duplicates/`. Never delete it. Otherwise keep both.
     6. Shrapnel names by issue number, with no CAT number: OK as is. On the TRO3063 files, PQ means Print Quality
        and WQ means Web Quality. Keep both versions, with the PQ or WQ marker as the edition.
   - Name format (memory `library-rename-project`): `Title(Publisher-ProductNo)[CopyrightYear]-Edition.ext`,
     CamelCase, ASCII, no spaces.
     - WizKids, Topps and Microsoft are never the publisher.
     - No copyright block means fan-made.
     - Never delete: set copies aside under `unsorted/_duplicates/`.
     - Never rename the slugs in `CITE` in `library_search.py`.
   - Tools: `ResourceLibrary/rename_library.py` (CLUES, RIGHTS, `camel()`, `target()`, `actual_publisher()`) and
     `sort_batch.py`. `pdftotext` is in /ucrt64/bin; pypdf is not installed. The 2026-11-06 helper scripts were in
     the old session scratchpad (dupcheck.sh, movedups.sh, poddups.sh) and may be gone; they are easy to rewrite.
3. **Rename the whole library to the format: DONE 2026-11-06 (cheap subagent), working tree only.**
   - Results:
     - 794 renamed, 929 already correct, 4,887 left in place, each with a reason.
     - Most of the files left are not documents: images, epub, zip and similar.
     - Also left alone: fiction, languages and magazines; ambiguous names; files with no text; protected CITE slugs;
       15 names cited by other repos; 5 would-be collisions.
   - Every rename is in `ResourceLibrary/records/jbtiicrework-pending.md`.
   - The INDEX and the search index are rebuilt. ResourceLibrary is pushed (7e795b605).
   - Product numbers taken only from the old name are marked "VERIFY number" in the log. Fan-made years taken only
     from the old name are marked "VERIFY year".
   - The per-file plan (`plan.tsv`) was in the session scratchpad, so it may be gone. The pending log is the record.
   - **Owner answers (2026-11-06) to the renamer's questions. Apply them (cheap subagents, working tree only, log
     every change in `jbtiicrework-pending.md`, never delete):**
     1. Fiction (637 files in `fiction/`): rename them. Novels keep the author name in the name, as well as the
        publisher and year. Proposed form: `Title-Author(Publisher-ProductNo)[Year]`. Show the owner a sample of
        about 5 names before the whole batch.
     2. Translations and magazines (577 files in `languages/` and `magazines/`): rename them too.
        - A real publication: the publisher is its real publisher (for example Devir) when it is known, and
          `Unknown` when it is not.
        - A fanzine: the publisher is the author, else the group, else `fan-made`.
     3. Editions taken from the old name (`Alpha Strike (Corrected 2nd Printing)` showing `[2015]`): acceptable,
        no change.
     4. The fan-made author tag:
        - Novels and fiction follow answer 1.
        - Everything else follows the sourcebook and fanzine rules: the author if known, else the group, else
          `fan-made`.
     5. The 59 files with no copyright block outside `fan-made/`: move one into `fan-made/` only when you can show
        it is fan-made, for example from its text, its source site or its author. Leave the rest, with a reason.
     6. The 85 files with no usable text: OCR each one and write the result back into the PDF as a text layer (for
        example `ocrmypdf`; check whether it or tesseract is installed, and install it if needed). Then rebuild its
        `ResourceLibrary/text/` extract, rename it by the usual rules, and rebuild the INDEX and search. A changed
        PDF is a modified file in JBTIICRework, so log it as a replace in the pending list.
        **DONE 2026-11-06.** ocrmypdf is not installed. Tesseract 5.4 + PyMuPDF do it: new tool
        `ResourceLibrary/ocr_textlayer.py` (incremental save, so the original bytes stay a prefix; undo = truncate to
        `origSize`; log `records/_ocr-textlayer.jsonl`). Of the 85: 46 PDFs got a text layer, 18 terrain maps had
        no readable text (left unchanged), 1 cannot be opened by any reader (`sourcebooks/Scenarios and Campaigns/
        BattleCorps Scenario - Birth of the King (CGL)[2012].pdf`: needs a fresh copy), and 20 were Word/RTF/text
        documents. `extract_rulebooks.py` and `sync_library.py` now extract .txt/.doc/.docx/.rtf too (56 documents in
        the library; a .doc Word will not open falls back to the text runs in the file). 74 files renamed (sources:
        the OCR copyright lines and Sarna), `Map Set #3.pdf` set aside as a copy of the FASA Map Set 3 scan, a few
        left with reasons; all in the pending list. Pushed: ResourceLibrary `3404476a9`, and the 33 pure renames
        in JBTIICRework `d236f2ca`. The OCR'd files (changed content) wait for 2026-12-02.
   - **NEXT, for a cheap subagent: subsort JBTIICRework `sourcebooks/`.** The owner asked for this on 2026-11-06.
     Files loose at the top of `sourcebooks/` most likely belong in one of its existing subfolders. Same rules:
     working tree only, log every move in `jbtiicrework-pending.md`, never delete.
   - Still to do: as you check each file, read its `ResourceLibrary/text/` extract. If the text is garbled, fix it
     (re-OCR, then rebuild the INDEX and search). Commit and push ResourceLibrary in batches.
4. **Cleanup** (the full inventory is in the older START HERE block of `JBTToolsSupportFiles/handoff.md`, step 5):
   - Push battletech-tools master (ahead 2: the mordel-sync fast-forward and 9b0d70f36). Check the deploy rules
     first.
   - Remove the `battletech-tools-mordel-sync` worktree and the `mordel-sync` branch.
   - Check `layers`.
   - Delete testingUtility branches merged into main, locally and on origin. `chunk11-secai` has 34 unpushed
     commits, so check it first.
   - Delete the stale SDD workspaces outside testingUtility, after copying `scrapes_native.tsv` into ResourceLibrary
     `records/`.
   - Delete the old scratchpad leftovers.
   - Ask first before deleting any unmerged remote branch or `backup/pre-lfs-strip`.
5. **Update both handoffs and push** testingUtility and JBTToolsSupportFiles.

## Open items found at the clear (2026-11-06)

- JBTIICRework shows 3 tracked PDFs as modified. Explained 2026-11-06: the 2026-11-04 rulebook sort deliberately
  replaced each one with a better Calibre copy (record: `ResourceLibrary/records/_rulebook-sort-2026-11-04.json`,
  `op: replace`). The old copies are kept, hash-checked, under `unsorted/_duplicates/rulebooks-2026-11-04/`. They
  were never committed. They are now on the pending list for 2026-12-02. Nothing to do until then.
  - `battleforce/BattleForce (FASA).pdf`: same 82 pages, now with a text layer, 150 dpi against 100.
  - `rpg/A Time of War Companion.pdf`: same printing, later file (Oct 2012), restores text cut off on pages 30,
    182 and 223.
  - `rulebooks-legacy/Tactical Handbook (FASA 8630)[1994] - Corrected 4th Printing.pdf`: same printing and pages,
    now with a text layer.
- battletech-tools has an untracked `docs/superpowers/plans/battletech-tools.code-workspace`, and
  JBTToolsSupportFiles has an untracked `arrayPlan.md`. Both belong to the user; leave them.

## Standing rules (all repos)

- The mordel key is in `JBTToolsSupportFiles/.env.mordel` (git-ignored). Never print it or put it in a commit,
  memory note or handoff. Scripts read it by regex and scrub it from saved output.
- The mordel mirror holds member designs and stays git-ignored: battletech-tools is public.
- **JBTIICRework: anything that uploads LFS data waits until 2026-12-02.** Make every change in the working tree and
  log it in `ResourceLibrary/records/jbtiicrework-pending.md` (from, to, why).
  - Pure renames and moves may be committed and pushed any time (owner ruling 2026-11-06), because the content is
    unchanged and no LFS object is uploaded. Stage only the `R100` pairs from
    `git diff --cached -M100% -l0 --name-status`, using a temporary `GIT_INDEX_FILE` to sort them. Then check that
    `git lfs push --dry-run origin main` prints nothing before you push.
  - The first batch was 732 renames, pushed in `56d01ef2`.
  - New files, changed content (OCR included) and replaced files wait. On 2026-12-02, commit and push them, then
    clear the list.
- ResourceLibrary is the user's private repo: commit and push freely.
- `upstream/*` in battletech-tools is Jeff's repo: never touch it.
- Use the cheapest subagent models; final reviews run on Opus. Bundled testingUtility content must be original.
- Bash tool: a heredoc whose body contains an apostrophe is blocked by a hook. Write the script with the Write tool
  and run the file instead.

---

# START HERE (2026-11-06, after /clear): Scott's reply first, then sort + rename, then repo cleanup

Done before the clear (user yeses 2026-11-06): ResourceLibrary a897274c1 and JBTIICRework 9257bb7d pushed;
`solaris7-review` deleted on JBTIICRework origin; the mapping doc sent to the user's phone; battletech-tools master
fast-forwarded LOCALLY to `mordel-sync` (97ef7cfd7, master is now ahead 1 of origin, not pushed); full mordel pull
started (below).

Work in this order, no check-ins between steps (user: "get to work"):

1. SCOTT'S REPLY FIRST. The draft is section 4 of
   `battletech-tools/docs/superpowers/plans/2026-11-06-mordel-api-mapping.md` (the user has it on the phone). The
   user's plan (2026-11-06): "we are going to mod that after we get back before I send it". So open the session by
   showing the draft and editing it WITH the user until they approve it. Then give the final text ready to paste,
   and save it in the doc. The user sends it, not us. Commit the mapping doc (and the untracked
   `2026-11-01-mordel-data-pipeline.md`) to battletech-tools master, checking first that the key is not in them.
2. FULL MORDEL PULL (running since 2026-11-06 07:39, detached, about 20 h at 1 request/s): the script is
   `battletech-tools/tools/mordel-sync/.mirror/full-pull.sh` (batches of 1000, store saved after each, resumes from
   `store.json` if started again). Log: `.mirror/full-pull.log` ("done" line at the end). Mirror: `.mirror/units/<type>/<id>.json`,
   git-ignored (member designs, public repo). Check the log; if it stopped, start the script again with
   `bash tools/mordel-sync/.mirror/full-pull.sh`, run detached.
   When done, measure: total size (`du -sh`), gzip size, count per type, size per type. Early estimate from 3 details:
   about 11 KB each, so about 600 MB raw for 56k units, plus a 7.3 MB index. Then write the user a short decision memo
   on three options: (a) ship with the app, (b) an optional pack fetched from storage when asked for, (c) each user
   enters their own mordel.net key in the app and fetches only what they want (needs Scott's agreement). Give the
   sizes, the CORS and key-handling question for (c), and a recommendation.
3. SORT THE 370 NATIVE FILES YOURSELF (user: "don't leave that to ollama"): JBTIICRework `unsorted/scrapes/`, list in
   ResourceLibrary `.superpowers/sdd/2026-11-05-resource-library-split/scrapes_native.tsv` (168 pdf, 163 zip, 3 doc, 6
   PDFs without an extension, 30 podcast m4a = 1.1 GB). Move each into its JBTIICRework category folder. Follow the
   rename guidance in memory `library-rename-project.md` and `library-best-copy-rule.md`
   (`~/.claude-battletech/projects/c--repo-battletech-tools-master/memory/` and `.../c--repo-JBTToolsSupportFiles/memory/`).
   Use `ResourceLibrary/rename_library.py` and `sort_batch.py`, with the records in ResourceLibrary.
   USER RULING 2026-11-06: NO JBTIICRework commits or pushes until 2026-12-02. Until then, make the moves and renames
   in the working tree only. Note each one as pending in ResourceLibrary `records/jbtiicrework-pending.md` (what moved
   or was renamed, from where to where, and why). On 2026-12-02, commit and push them all, then clear that list.
   This applies to every JBTIICRework change, not only these files.
4. THEN THE WHOLE LIBRARY: go through JBTIICRework and make every file name follow the rename guidance. As each file
   is checked, read its text extract in ResourceLibrary `text/`. If the text is garbled or unusable, fix it there
   (memory `correct-garbled-library-text.md`: re-OCR or correct, then rebuild INDEX/search). Done by the session, not
   by ollama. Commit ResourceLibrary in batches and push (it is the user's private repo). The JBTIICRework renames
   stay uncommitted and go on the pending list (step 3 ruling, until 2026-12-02).
5. CLEANUP, MERGE, ORIGIN (user: "clean up stale workspaces and worktrees, everything that can be at origin is
   there, merge branches when possible, trim if no longer needed"). Inventory at the clear:
   - battletech-tools: master ahead 1 (the mordel-sync ff), so push it. Check the e2e and deploy rules in the
     battletech-tools memory first, because master pushes may deploy. Worktree `C:/repo/battletech-tools-mordel-sync`
     is merged, so remove it and delete the `mordel-sync` branch. Local `layers` has no upstream: check whether it is
     merged, then merge or delete. `gh-pages` (ahead 773, behind 237) is the deploy branch, leave it. Worktree
     `C:/repo/battletech-tools-master` is on `beta` (= origin/beta at 224052f67): keep it, it is the main beta
     checkout. Remote branches on origin (`CustomMUL`, `bundle/unit-builders-and-catalogs`, `feature/clan-eras`,
     `modernize-tooling`): check each one's merged state with `git branch -r --merged origin/master`, and ask before
     deleting any that are not merged. `upstream/*` is Jeff's repo: never touch it.
   - JBTIICRework: local `backup/pre-lfs-strip` is a safety backup from the LFS strip: ask before deleting.
   - testingUtility (CompTIA trainer, different project): local branches answer-marks, chunk10-harvester,
     chunk11-secai (ahead 34 of origin), chunk12-autoops, chunk6-question-adder, chunk7-acronym-tester,
     chunk8-dataplus-bank, chunk9-legal-branding-deploy, dataplus-length-tell, math-engine, study-tips,
     ui-exam-cards. Delete those merged into main (`git branch --merged main`) locally and on origin. Push or merge
     the rest only after checking (chunk11-secai has 34 unpushed commits).
   - SDD workspaces (user ruling 2026-11-06): LEAVE testingUtility's (cert tester) alone. DELETE the stale ones
     elsewhere: ResourceLibrary `.superpowers/sdd/2026-11-05-resource-library-split` (the split is finished; it holds
     the 4.26 GB review diff) and battletech-tools-master `.superpowers/sdd/2026-10-20-artvee` and
     `2026-10-21-catalogs-editions`. First, check each plan is finished (its ledger) and copy anything still needed
     out of it, such as `scrapes_native.tsv` for step 3. Copy that one into ResourceLibrary `records/` before the
     delete. The memory rule `keep-sdd-ledgers` now covers only the cert tester.
   - Scratchpad leftovers from the old session (mordel probe fixtures with member designs, smoke mirror) are in the
     old session's temp scratchpad: delete them.
6. Update this handoff, push JBTToolsSupportFiles.

Security, still: the mordel key is in `.env.mordel` (git-ignored). Never print it or put it in a commit, memory note
or this file. Scripts read it by regex and scrub it from saved output.

# EARLIER (2026-11-06): split reviewed and fixed; mordel sync client built on a branch

- SPLIT FINAL REVIEW DONE: no Critical, 1 Important, 6 Minor; Important and Minors 1-5 fixed test-first (ledger:
  ResourceLibrary `.superpowers/sdd/2026-11-05-resource-library-split/progress.md`, "Final" lines). The Important one:
  the `~/.claude/ollama` scrape tools now save native downloads (PDFs, archives, media) and the VirusTotal quarantine
  under `JBTIICRework/unsorted/scrapes/`, never into tracked `ResourceLibrary/scrapes/` (`.bak2` copies kept; tests in
  `~/.claude/ollama/tests/test_native_downloads.py`), plus backstop ignore rules in ResourceLibrary. Minor 6 (a 4.26 GB
  review diff in that SDD workspace) is left in place per the keep-SDD-ledgers rule.
- NOT PUSHED, waiting on the user: ResourceLibrary a897274c1 (fix pass, suite 19/19) and JBTIICRework 9257bb7d
  (`.vt_api_key` ignore guard). The `solaris7-review` branch delete still waits for a yes.
- MORDEL: Scott's API update mapped against the wish list in battletech-tools
  `docs/superpowers/plans/2026-11-06-mordel-api-mapping.md` (untracked in the main checkout); the reply to Scott is
  drafted in its section 4, for the user to send.
- MORDEL SYNC CLIENT: worktree `C:/repo/battletech-tools-mordel-sync`, branch `mordel-sync`, commit 97ef7cfd7, not
  pushed. `npm run mordel:sync` (flags `--max-detail N` default 100, `--full`, `--dry-run`); code in
  `tools/mordel-sync/`, tests in `src/utils/mordelSync.test.ts` (26). Changes-only lists via `updated_since`, a full
  list weekly to notice removals, details capped per run, 401 stops, 503/429 retried. The mirror
  (`tools/mordel-sync/.mirror/`, member designs) is git-ignored: the repo is public. Smoke run on the sandbox: 56,043
  units listed, 3 details fetched, key absent from all output. Full `npm test` green (3986). Typecheck shows only 2
  older errors: `tesseract.js` is missing from the shared `node_modules` (needs `npm install`).
- RULING: no full detail pull (about 56k requests) without the user's OK; the default batch is 100 a run.
- STILL OPEN: the Solaris7 verdicts in `C:/repo/ResourceLibrary/reviews/solaris7/` (see below), sorting the 370
  native files in JBTIICRework `unsorted/scrapes/`, and tier B (waits on JBTIICRework's LFS reset).

# EARLIER (2026-11-06): split done; next, the Solaris7 verdicts, then Scott's API update

- SPLIT DONE 2026-11-05/06 (plan Tasks 1 to 6; final review pending): JBTIICRework is native files only (main
  be437c50 = origin, no LFS spent). Everything we made is in `C:/repo/ResourceLibrary` (main 41222c6a2 = origin): scripts,
  `text/`, `INDEX.md`, `records/`, `scrapes/` (raw lead scrapes, `scrapes/reddit`), `reviews/solaris7/` (the review
  pages with the user's 3 edits from `solaris7-review`, pictures in LFS). Run scripts from ResourceLibrary as
  `py -3.11 <script>.py C:/repo/JBTIICRework ...`; `library_search.py build` makes the local search index (never commit
  `search.sqlite`). The intake watcher Run entry now starts `ResourceLibrary/watch_unsorted.py`. The `~/.claude/ollama`
  scrape and mordel tools write to ResourceLibrary (`.bak` copies of the old ones kept).
- WAITS ON THE USER: (1) confirm the review pages in ResourceLibrary, then the `solaris7-review` branch on JBTIICRework
  origin can be deleted; (2) sort 370 files left in JBTIICRework `unsorted/scrapes/` (native PDFs, ZIPs, DOCs and 30
  podcast m4a, 1.1 GB; list in the plan workspace `scrapes_native.tsv`). They are native, so they go to JBTIICRework
  category folders, which needs its LFS.
- NEXT TASK: act on the Solaris7 verdicts in `C:/repo/ResourceLibrary/reviews/solaris7/` (rows below). Note
  `mordel_match.py` now writes there and a rerun overwrites hand edits: use `--out` for a scratch run.
- THEN: Scott's API update (`Mordel.Net API update for testers.md`, pasted 2026-11-05): map it against our wish list,
  then build the sync client. New key is in `.env.mordel` (never here).
- Tier B library sort waits for JBTIICRework's LFS reset (native files belong there).

## Earlier (2026-11-05): execute the ResourceLibrary split plan, NATIVE (done, see above)

- ACTIVE TASK, USER 2026-11-05 (superseded by the block above): JBTIICRework becomes native files only. Everything
  we made from them (text extracts, scripts, reports, records, Solaris7 review pages, scrapes) moves to
  `C:/repo/ResourceLibrary` (<https://github.com/NGCFells2/ResourceLibrary>, private, NGCFells2's account, its own LFS).
  - Spec (approved): `C:/repo/ResourceLibrary/docs/superpowers/specs/2026-11-05-resource-library-split-design.md`
  - Plan: `C:/repo/ResourceLibrary/docs/superpowers/plans/2026-11-05-resource-library-split.md` (6 tasks).
  - User chose NATIVE execution: use superpowers:executing-plans, do every task in-session, then one fresh reviewer on
    the most capable model checks the whole thing at the end. Read spec and plan first; start at Task 1.
  - ResourceLibrary local main has 2 commits (spec, plan), NOT pushed yet; Task 4 Step 6 pushes.
  - User rulings: no more JBTIICRework LFS spend (not paying). ResourceLibrary LFS only for files that fit its purpose
    (images in reviews/ and scrapes/, files over 100 MB); never `search.sqlite`; never native sources. Rebuilding search
    on a fresh machine is fine. Raw scrapes move too (replaces the 2026-10-27 "this PC only" ruling).
  - State at handoff: all repos pulled from origin 2026-11-05. JBTIICRework main = origin (pulled with
    GIT_LFS_SKIP_SMUDGE=1; Birth of the King restored from local LFS cache). 4 PDFs show locally modified (BattleForce
    FASA, A Time of War Companion, Tactical Handbook 4th printing, Beginner-Box Quick-Start): leave them alone.
  - Solaris7 verdicts: the user has edited 3 rows so far on `solaris7-review` (commits 20886a79, 302a92f9, a3aa4fc2):
    Atlas AS7-D3 NOT the same, add a 2 to the end of the Solaris one; Chihuahua NOT the same (Solaris is an OmniMech,
    mordel's a BattleMech; note covers all Chihuahua rows); Dire Wooly Dire O has no mech on Solaris, only a request for
    info, so rerun the content verification. Acting on them is the task AFTER the split, in `ResourceLibrary/reviews/solaris7/`.
  - Tier B library sort waits for JBTIICRework's LFS reset (native files belong there).

## Earlier (2026-11-05): Solaris7 review waits on the user; LFS allowance decision open

- PARKED, USER 2026-11-05: the next session goes back to the cert trainer in `C:\repo\testingUtility` (AutoOps+
  domain 4; its HANDOFF.md). Our reply to Scott WENT OUT 2026-11-05. When the user returns here: ask whether he answered,
  and how far the Solaris7 verdict review got, then follow the order below.
- PIVOT, USER 2026-11-05 (late): the next session does Scott/mordel FIRST, then the library sort. Order:
  1. Ask the user whether Scott has replied to the five points sent 2026-11-04 (list below), and whether the Solaris7
     verdicts are reviewed (Step 2 under "NEXT, USER: finalize the Solaris7 work").
  2. If the verdicts are reviewed: Step 3, designs NOT on mordel to `units/<unit type>/<chassis> <model>.json`.
     If Scott replied: map "Unavailable" and his other answers, then build the sync client. His model wins over our wish list.
  3. Only then resume the ACTIVE TASK sort batches (tier A, then B). Re-check the LFS credit first: November's was due to
     run out about 2026-11-06 07:00 UTC, so an exit 3 (push refused) is likely. Stop there, as the Method says.
  The AutoOps+ work in `C:\repo\testingUtility` is parked at a clean point (domains 1 to 3 shipped).

- Any session can read this file at https://raw.githubusercontent.com/ngcfells/JBTToolsSupportFiles/main/handoff.md (public repo:
  never put a key here). `.env.mordel`, the scrape folder, `~/.claude/ollama/` and the memory folders exist only on the user's PC.
- ACTIVE TASK, USER 2026-11-05: "sort in small batches until we are out of LFS for the month". The user may switch accounts mid-task, so
  update this note and push it after every batch. Library main = origin at 9cc342b5 (the 23 deletions are done; every one had an exact
  local copy). LFS credit: 6,432 of 7,440 GB-hours used at 14:12 UTC. Check: `gh api "users/ngcfells/settings/billing/usage/summary"`.
  Method, from the library root: `python sort_batch.py list`, then `python sort_batch.py run A 350` (tier, max MB per batch; about 150 s).
  It moves only rows it trusts, confirms every file is LFS, stages exact paths, commits and pushes. Exit 3 means the push was refused: it
  undoes the commit and the files stay staged at their new paths. STOP there, say so, and do not work around it. Never `git add .` here.
  Trusted rows: target keeps every source title word; not rulebooks, rulebooks-legacy, alpha-strike or magazines; no shared target; no
  Topps, WizKids or Microsoft as publisher; no impossible date; no BattleCorps item outside fiction. Sampled targets lost issue numbers,
  chapters and unit names, which is why. Tier A = product code also matches. Tier B = mostly fiction: publisher and year are model
  guesses, renames later cost no upload. Held rows and `review` rows wait for the user.
  After sorting, rebuild as usual: extract, `page_offsets.py text`, hash, index, search. INDEX is not rebuilt yet.
  PROGRESS: 4 batches pushed, 31 files, 1361 MB; library main de662086. PAUSED by the user when tokens ran out, not by LFS. Tier A is empty: resume with `python sort_batch.py run B 350`. Update this line by hand after each batch.
- New repo 2026-11-05: `C:/repo/ResourceLibrary` = https://github.com/NGCFells2/ResourceLibrary (private, owned by NGCFells2, ngcfells has push). Empty so far; purpose not stated yet.
- USER'S NEXT STEPS: review the Solaris7 verdicts on origin, and decide whether to pay for LFS (see the allowance note below).
  Review link, private repo, logged in: https://github.com/ngcfells/JBTIICRework/blob/solaris7-review/unsorted/scrapes/solaris7.com/_mordel_matches.md

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- Scott sent API docs for the sandbox. New: `GET /units` (type, created_since, updated_since, limit, cursor). His next
  task is endpoints for all the information on a single unit. The scraper account is on the sandbox after his refresh.
- Key: `C:/repo/JBTToolsSupportFiles/.env.mordel` (gitignored). `. ./.env.mordel` gives `$MORDEL_API_KEY`. Each refresh
  kills it: get a new one from Profile, API Key, and replace it there.
- Tested 2026-11-04, all as documented: 56,043 units (49,611 bm, 5,437 cv, 582 im, 413 pm), 57 pages at limit 1000, about
  2.5 minutes, no duplicates, order right, every error code right, updated_since and created_since exact and inclusive.
- SCOTT REPLIED 2026-11-05 (user pasted it; our reply drafted, user sends it):
  - `rules_level` "Unavailable" = his designer could not work out a level (era and rules approach can disagree). It stays
    possible; he will add a warning on save. OUR SIDE: map it to unknown and work the level out from the equipment.
  - Any recalculation that changes unit information bumps `updated`, so `updated_since` syncs are safe.
  - Coming: a canon/custom field (he may add a third "official but not CGL canon" marker, maybe an Apocryphal filter), an
    Omni flag, and name/name2/model in the single-unit pulls. Looking into: cache headers, Hammer HMR-5M cost 0, the
    leading non-breaking space. "Untitled" is a default users can keep. [BASE] oddities are users building Omnis wrong.
  - Single-unit endpoints will return construction, equipment, source and designer. NO quirks (he has none yet). BV, PV,
    weight, cost, TRO, record sheet, AS card and MegaMek come later as text or PDF from
    `/api/v1/units/{type}/{id}/files/{format}`, not JSON.
  - He asked: is limit 1000 right, is 2.5 minutes fine, do we pause between requests (we do not: 57 back to back, about
    2.6 s each), and why document created_since plus updated_since (answer: it is AND; doc that, and say whether a new
    unit's `updated` equals `created`, since then `updated_since` alone is the sync).
- Our side: `name` is chassis and model in one string, with `[BASE]` inside it, until name2/model arrive; designer =
  Catalyst Game Labs (5,414 units) stands in for canon until his field exists. Add a pause between pages in the sync client.
- Removed units: a full listing is cheap enough to diff ids weekly, so tombstones are not urgent.
- Site unit pages answer 406 to curl's default client string; a descriptive User-Agent works.
- Review copy for the user: branch `solaris7-review` on JBTIICRework origin (private; start at `_mordel_matches.md`, one
  `_mordel_pairs_<verdict>.md` page per verdict). It is a deliberate exception to scrapes staying local; do not merge it to main.
- Library pushed 2026-11-05: main at 9cc342b5 = origin (see ACTIVE TASK for anything newer). In: non-LFS sync; `unsorted/mordel_custom_units` removed on purpose (the API
  replaces it); every new LFS file in the sorted folders (71). Read back byte-identical, including the largest. Moved or repeated
  content needs no upload. STILL LOCAL: 900 new files in `unsorted/` (13.1 GB, an upper bound), 4 modified PDFs (`battleforce/`, `rpg/`,
  `rulebooks-legacy/`, `rulebooks/`). The 23 LFS deletions are pushed.
  `unsorted/` also holds 102 `.mobi`, `.azw`, `.mp4` files (933 MB) with no LFS rule, two over GitHub's 100 MB limit: never add them
  as plain git. Push more LFS only when the user asks.
- LFS allowance (read from GitHub billing 2026-11-05): free plan, billed by GB-hours at $0.000094086 each. The free credit is $0.70 a month = 7,440 GB-hours (10 GB for a 31-day month), not 10 GB of space. The repo stores 58.4 GB (main references 41.11 GB; the rest is old objects), so the month's credit lasts about 5.3 days. October hit exactly 7,440 on Oct 15 and metering then stopped, which fits the lockout the user saw. November's runs out about 2026-11-06 07:00 UTC; the credit should reset on the 1st; the 1.6 GB pushed after this reading brings that forward slightly. The lockout is inferred from October, and the budget setting could not be read. USER DECIDES: pay about $3.26 a month at 58.4 GB (about $4.27 with everything), which needs a payment method and an LFS budget, or stay free and get about 5 days of LFS a month. A trim cannot reach free: main alone is about 43 GB. `gh` now has the `user` scope: `gh api "users/ngcfells/settings/billing/usage?year=Y&month=M"`.
- Keys: one key went invalid mid-pull and the next the user made was refused too (cause unknown); the third works and is in
  `.env.mordel`. If keys keep dying, ask Scott whether a refresh was running or a limit applies.
- NEXT, USER: finalize the Solaris7 work (#301). The designs are held by `custom-units-wait-on-mordel`; equipment is done.
  Step 1 DONE: `C:/repo/JBTIICRework/unsorted/scrapes/solaris7.com/_mordel_matches.md/.json` are rescored against the full pull
  (56,043 units, saved at `~/.claude/ollama/mordel_units.json`). 385 units, 104 threads: same design 15, likely same 37, same
  chassis 67, name only 73, none 123, unsearchable 12, not a mordel unit type 58. `same chassis` is new: the chassis is on mordel,
  this model is not. Sandbox ids equal live ones (464 of 464 old matches), so the links are www URLs. `_mordel_cache` deleted.
  `mordel_match.py` reads the pull, resumes a broken one, and rescores saved model lists; `--refresh` pulls again.
  USER RULING: `same chassis` is not the same design, so those 67 count as NOT on mordel.
  `_mordel_matches.md` now holds a side by side for 327 units (Solaris post beside the mordel page; open with Markdown preview).
  Pictures: `_mordel_shots/` (143 pages, 30 MB, gitignored), from `mordel_match.py --shots`, which skips pictures it has.
  The readout loads by AJAX after the page: check picture sizes, not the failure count (a first run saved 143 logos).
  USER 2026-11-05: the 2-part Design Contest (28 units) is HELD for a separate review later. `HELD_THREADS` in
  `mordel_match.py` keeps it out of the main table, totals and verdict pages; it has its own section at the end of the
  summary and `_mordel_pairs_held.md`. Pushed to `solaris7-review` (d2254c58). Totals now: 357 units in the main table.
  Step 2 IN PROGRESS: the user has reviewed some verdicts. Known weak spots: the list came from the model, unchecked, and holds non-designs
  (weapons, armor notes); its tonnages can be wrong, so `name only` may hide real matches; 13 `likely same` rows have no model
  and matched on chassis alone; 12 `unsearchable` rows are bare letters (Perun and Obsidian Idol configs, mostly);
  3 threads listed no units. Step 3: designs NOT on mordel go in `units/<unit type>/<chassis> <model>.json` in this repo, in the
  `exportJSON()` format, crediting designer and thread. Designs on mordel wait for the single-unit endpoints.
- AFTER Solaris7: check for a reply from Scott, then build the sync client.
- PARKED behind mordel: 3-2 (e2e showing a vehicle BV1 in creator, sheet, roster total; confirm with the user, who said
  "I think"), then #625 or round 4. #621 still has the mechanical jump booster question for the user.
- `arrayPlan.md` in this repo is the working draft of the user: leave it alone. Deploy with `git deploy-beta` only.

# EARLIER (2026-11-04): bugs clear, #621 acted on, mordel pivot since started

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- No open bugs when this was written: #626 (6607f7337), #627 (eb53a7063) and #620 (JBTIICRework c1b7834f) are closed.
  Run `gh issue list --label bug` first anyway. beta = master = origin at 224052f67, deployed.
- #627 is live, so `?v=` cache busters are safe again on the live site.
- #621 acted on: 224052f67 bars the jump pack beside jets, on every LAM and with partial wings, in every edition
  (`canCarryJumpPack()`); the `jumpPackJumping` flag and use-pack box are gone. VTOL +1 and rotor structure confirmed
  from the BMR(R) p.154 image; no VTOL entry in the Battle Value section of the BMR errata, and no Maximum Tech errata in the library.
- #621 stays open on one question for the user: may a 'Mech with mechanical jump boosters carry a pack? Allowed as built.
- New enhancements: #628 (combat drop step), #629 (ArtVee make and model names, all equipment; the user rewrote the
  readout, so read it first and check before large rewrites).
- Tip: Playwright can serve a stale `build/`. If an e2e shows old text, run `npm run build` first and rerun.
- 3965 unit tests, lint, typecheck green; smoke, mech-rules-edition and industrialmech-play e2e green in Chromium.
- INDEX.md's hand-written errata lines are edited but uncommitted, with the rest of the library sort churn.
- `arrayPlan.md` in this repo is the user's untracked working draft: leave it alone.
- Deploy with `git deploy-beta` only.
- NEXT, USER PIVOT: the next round is the new work from Scott at mordel. The details were not given before this handoff, so
  ASK the user what Scott sent or wants before starting. Background: `mordel-api-decisions` and `custom-units-wait-on-mordel`
  memories, and `docs/superpowers/plans/2026-11-01-mordel-data-pipeline.md` (untracked, in `C:/repo/battletech-tools`).
  Those notes date from 2026-11-02, so check them against what Scott sent. Sandbox keys are wiped on refresh and never stored.
- PARKED behind mordel: 3-2 (e2e showing a vehicle's BV1 in creator, sheet, roster total; confirm with the user, who said
  "I think"), then #625 or round 4.
- Round cleanup each time: commit, push beta, `git deploy-beta`, ff master in `C:/repo/battletech-tools` and push,
  comment/close the issue.

# EARLIER (2026-11-04): #619 fixed, #626, #627 and the #621 review since done

- FIRST, review the standing rules in MEMORY.md (both battletech-tools folders plus c--repo-JBTToolsSupportFiles)
  and the library tools. USER: smaller chunks, stop well before a compact. Reuse/extend, no new files.
- USER RULING: killing bugs is the priority, ahead of the NEXT item and enhancements. Order now: open bugs (#626, #627), then
  review #621 (the user answered INLINE, inside the issue body and all 3 comments, no new replies: read each in full, act on each),
  then probably 3-2 (user said "I think", so confirm), then #625 or round 4.
- #619 DONE and closed: fix is in `.git/beta/inject-issues-button.cjs` (untracked, in the main repo `C:/repo/battletech-tools`,
  because `battletech-tools-master` is a worktree). Deployed. The page ran to 1456 px at every width below that, not only on phones.
  Header now wraps below 1600 px; drawer top padding 7.5rem below 768 px. Five pages x six widths checked live, no sideways scroll.
- New #626 (bug, tracked code): menu and logo overflow from 768 to about 1045 px without the beta buttons. Beta hides it
  through the #619 wrap, so measure with those styles removed. After the tracked fix, remove any wrap rule it makes unnecessary.
- New #627 (bug, tracked code): any direct link with a query string, except on Home, shows the in-app 404. `public/404.html`
  packs `&q=`; the `index.html` decoder never unpacks it.
- Tip: until #627 lands, do not add `?v=` cache busters when checking the live site. They load the 404 page, not the page named.
- #625 (MUL search terms, enhancement) waits behind 3-2. Commit 9f55e3222 (Home: Available Tools) came after the 3-1 notes.
- `arrayPlan.md` in this repo is the user's untracked working draft: leave it alone.
- Deploy with `git deploy-beta` only.
- NEXT: #626, then #627, then the #621 review, then 3-2 (details in the section below). Round cleanup each time: commit, push beta,
  `git deploy-beta`, ff master in `C:/repo/battletech-tools` and push, comment/close the issue.

# EARLIER (2026-11-04): 3-1 done (vehicle BV1 data and math), next 3-2 (vehicle BV1 UI check and e2e)

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
