# START HERE (2026-11-17, Opus 5.5, latest): CHUNK R2 DONE (FUTURE WARS PRINTING ALTERNATES), DEPLOYED

FIRST: check memory (MEMORY.md and every file it links), the standing rules and the guidelines (CLAUDE.md, plan
conventions, NGCFells naming, OCR-correct-from-PNG, no heredocs, verify against catalogs, era-honest dating, vitest in
PowerShell only) before doing anything else.

QUEUED (NGCFells, 2026-11-17, after Chunk R2): new entry from Lopunny (Queer Tech Discord; credit "Lopunny, Queer
Tech Discord", name the server, ask NGCFells for a post link if one exists):
  1. Heat-Seeking Thunderbolt ammo, intro 3082. Rules: the same rules as Heat-Seeking LRM ammo, but NO ammo-tonnage
     change (shots per ton stay the Thunderbolt's).
  2. Thunderbolt torpedoes, intro 3082 (Lopunny: a launcher system "should be forever"). Same stats as the standard
     Thunderbolt launcher, as a torpedo launcher, OR simply an alternate (torpedo) ammo type for the standard launcher
     doing the same. Lopunny's note: "It astounds me how there aren't alternate thunderbolt ammos since you have so
     much space to work with, as well as working really cool as big torpedo's".
  NGCFells RULED (2026-11-18): Thunderbolt TORPEDO LAUNCHERS are their own launchers, separate from the Thunderbolt
  missile launchers, as LRTs are separate from LRMs ("mechanically missiles are very different from torpedos... one
  needs venting to get rid of exhaust, the other needs pressurized air to launch initially"). If Lopunny comes back
  with lore that explains it differently, go with Lopunny's lore. Look up Heat-Seeking LRM and LRT/SRT rules in the
  catalogs before building; NGCFells decides launcher vs ammo.

STATE. beta = origin/beta = 1eeea46d7 (Penitrator cost note), deployed (`git deploy-beta`, also ships ce575521c). `npm run check` green (5541
unit + 28 data, build OK, 3 known lint warnings). Nov 17 news bullet "Future Wars originals (issue #172)" rewritten to
say both printings can now be chosen. ResourceLibrary pushed: c696eae2a, 1e33809f2 (FW #17 pp.37, 38, 40), ee94cb87b
(FW #12 pp.12-13). Plan workspace `.superpowers/sdd/2026-11-17-future-wars-printing-alternates/` deleted after review.
DONE (Chunk R2, plan `docs/superpowers/plans/2026-11-17-future-wars-printing-alternates.md`; ticked in
`2026-11-17-future-wars-originals.md`), commits 786847c0c, 1e7030108, e94facee9, 4406654e8, 17c1404d5:
- NGCFells's rule: reprint misprints follow the original; real rule differences are alternate Special Rulesets.
- Twins sharing the reprint's `changes` key (clash, one at a time): fw-morale-17 (FW #17), fw-weapon-malfunctions-9
  (FW #9), fw-long-range-wars-12 (FW #12); the reprint rulesets keep their ids, renamed "(Best of Future Wars printing)".
- "Future Wars: equipment as first printed" (fw-equipment-first-printings): Power Booster no 4th-turn burnout (later
  turns 11 or less, NGCFells's ruling), burned-out legs walk not run; Inferno Gauss ammo hit 30 heat (20 CASE) + 1
  damage a shell (FW #19, Chris Congdon - NOT #14); LR Flamer fuel 2 damage + 3 heat a round; PDS heat 0 (sheet too);
  Swing Fire's three rules as reminders.
- Roster panel: pass number line ("Passes on 8+ on 2D6 (broken)" under #17), Clear status button, #12 ranging on any
  target. TRO - JBT Best of Future Wars readout ends with "Two printings".
- Final review (fresh Opus): 1 Important + 3 re-graded minors fixed TDD. Deferred minors: BV1 follows the equipment
  ruleset; first-printing ammo branches skip the Power Armor pilot line; BT2-BT4 every-bin rule vs LR Flamer fuel.
Penitrator cost CLOSED (2026-11-18, 1eeea46d7, deployed): missiles keep the author's 250,000 C-bills a ton (NGCFells
tried "Tandem-Charge doubled" = 270,000 and kept the original as lower); notes and readout say so.
OPEN for NGCFells: Hellborer booster row not built (no Hellborer item).
NEXT: the QUEUED Lopunny entry, then G / H / K + K2 (Kin = alternate universe unless an article references the Far
Country birds; own TRO) / COIL-alt.

# Previous (2026-11-17, Opus 5.5): CHUNK R DONE (FUTURE WARS ORIGINALS), DEPLOYED

STATE. beta = origin/beta = e3fda3ae6, deployed (`git deploy-beta`). `npm run check` green (5509 unit + 28 data, build
OK, 3 known lint warnings). News bullet "Future Wars originals (issue #172)" in the November 17th entry.
ResourceLibrary: 5d0de322f (FW #8, #9, #11, #13, #14, #15, #17 extract fixes) and 1b1b8a8e4 (FW #3 cover + p.5
Penitrator transcribed), both pushed.
DONE (Chunk R of `docs/superpowers/plans/2026-11-17-future-wars-originals.md`, all three steps ticked; ledger "Chunk R"
section in `.superpowers/sdd/2026-11-12-custom-homebrew-batch/progress.md`):
- Every built Best-of item read from the original issue's page image. Credits (equipment notes, `future-wars-play-rules.ts`
  sources, special-rulesets, walker credit, TRO - JBT Best of Future Wars and Walkers readouts) now cite the ORIGINAL
  issue, year and page first, then the 1991 reprint. Years read from the issues' own pages: #3 Nov 1987 (cover), #8 and
  #9 1988, #11-#15 1989, #16, #17, #19 1990 (evidence in the ledger).
- Credit corrections: Pom-Pom is FW #9 p.27 (not #11), signed Karl Sander; Power Booster FW #14 p.46, signed; LR Flamer
  FW #9 p.27; Morale FW #17 pp.36-40; Weapon Malfunctions = Karl Bruanning AND Herb Barents (FW #9 pp.10-11); Swing
  Fire's +1 to hit is the original's; Penitrator = Mech War Times, reprinted unsigned in FW #3 p.5.
- Plan's "Where each Best-of article first appeared" table corrected. Test in tro-jbt.test.tsx guards the readout credits.
- NO play/stat change: where the reprint changed the original, play still follows the reprint and the notes say so.
OPEN: ASK NGCFELLS (one message; already put to them in chat 2026-11-17, answers not yet in) whether to follow the
original in each of these:
  1. PDS heat 0 (FW #14) vs 1 (FW #24, current).  2. Inferno Gauss ammo hit: original adds 1 damage a shell left.
  3. LR Flamer ammo hit: original 2 damage + 3 heat a round left.  4. Power Booster: reprint-only 4th-turn burnout and
  "major overhaul"; original's Hellborer row.  5. Swing Fire: one-turn swing, AeroTech arcs, crit stops the swing.
  6. Long Range Wars: reprint-only "still or up to 6 hexes"; original's d8 malfunction on 2-3.  7. Weapon Malfunctions:
  seven rows differ (ledger).  8. Morale: five differences (ledger).  9. Penitrator cost "$250,000 per ton" (record 0).
  ANSWERED: each alternate universe gets its OWN TRO - JBT readout (memory alt-universe-own-tro).
- MECH WAR TIMES = the zine's name for issues #1 (6-12-87) and #2; FASA (letter 8 Oct 1987, FW #3 p.2) forced the
  rename; FW #3 (Nov 87) is the first Future Wars. Scans renamed mech_war_times_01/02_Qyhm8x.pdf (JBTIICRework
  51a41fdd) and extracts mech-war-times-0N-Qyhm8x (ResourceLibrary f4910f3a7, indexes updated). Sarna hosts the same
  scans as media/magazines/future_wars_01.pdf / _02.pdf (wiki wrongly says #2 was the first Future Wars). Penitrator
  credit corrected: first printed FW #3 p.5 under the old running head (e3fda3ae6); MWT #1-#2 have no Penitrator.
NEXT: apply NGCFells's answers (failing test first, note says "the original's"), then G / H / K + K2 (Kin = alternate
universe unless an article references the Far Country birds) / COIL-alt.

# Previous (2026-11-17, Opus 5.5): POWER ARMOR CHUNK F DONE, HOME TOOLS SECTION, KO-FI BUTTON TEXT, DEPLOYED

STATE. beta = origin/beta = 8bbe7e8b0, deployed. `npm run check` exit 0; after the home edit, tsc + home test green.
DONE:
- Power Armor Chunk F: check green; no Power Armor commit touched bundled data (only 949bd6057, the quad-import rebuild); the Nov 17 news bullet already covers Power Armor; plan box ticked; shipped comment posted on #172 (issuecomment-6968814452; issue stays open for DropShips, Economics, Kin, COIL-alt).
- Home > Available Tools (NGCFells request): Special Rulesets paragraph; 'Mech Creator gets Compact 'Mechs + Power Armor; new Micro-Mech Creator and Walker Creator entries (Custom Homebrew); roster bullet for the Future Wars panels; TRO - JBT rewritten (central fan material with source links, Unit Types / Equipment / Ammunition, contents list). Equipment and Custom MUL editors left out (developer menu only).
- Ko-fi button text "Tip" -> "Assist with development costs" (NGCFells request) in the UNTRACKED deploy script `C:/repo/battletech-tools/.git/beta/inject-issues-button.cjs` line 72; confirmed in the published gh-pages index.html.
NEXT: re-plan Chunk R, then G / H / K + K2 / COIL-alt.

# Previous (2026-11-17, Opus 5.5): TRO CATEGORIES + CONTENTS, VTOLAM/PAM READOUTS, NGCFELLS NAMING, NEWS CONDENSED, DEPLOYED

STATE. beta = origin/beta = 494d804a9, deployed, working tree clean. `npm run check` green (5508 unit + 28 data, build OK, 3 known lint warnings).
DONE (user request, 2026-11-17):
- NAMING (memory credit-ngcfells-not-owner): player-facing "owner", "ours", "our choice/reading/year", "we follow/use/round...", "extrapolated by us", "Custom Homebrew, ours" -> NGCFells across src + docs/lore (scripts in session scratchpad). Computed app values say "JBT" (BV Accuracy "JBT BV", "JBT bug", "the JBT catalog/equipment records"). Left alone: Spork's original text (settings, play, imports), community lines ("join us on Discord"), the tro-jbt.md intro (NGCFells's own voice), in-character ArtVee quotes, code-only comments/identifiers (walker slot `owner`, AS source "ours").
- NEWS: NGCFells dailies Sep 29 - Nov 17 condensed (home.tsx ~95k -> ~50k chars), one entry per date, issue numbers and thanks kept; Nov 17 has a TRO - JBT bullet.
- TRO - JBT: landing = categories Unit Types (card per readout + linked example designs), Equipment, Ammunition, Other (`TRO_CATEGORIES`, `category`/`pageCategories`/`examples` on `ITroDocument`, `troIndex()`); each entry shows its page's credit line and source document and links `slug#page-id`. Reader has a clickable Contents (`readoutContents`, open by default). TRO_DOCUMENTS order now artvee, micro-mechs, walkers, power-armor, vtolam, permanent-air-mech, best-of-future-wars, homebrew-equipment, ammunition. Tests `tro-reader.test.tsx`; e2e artvee.spec updated. Checked in Chromium at phone width.
- VTOLAM + PERMANENT AIR 'MECH readouts (494d804a9): Unit Types cards with lore (`docs/lore/vtolam-tro.md`, `docs/lore/permanent-air-mech-tro.md`: credits + links, in-character history, what sets one apart, the sample designs); one page per sample design generated from the save in `src/data/lam-samples-readout.ts` (figures read from BattleMech so they match the Creator; BV provisional except vtolam-btitf; AS PV NOT OFFICIAL; save's tro text + "Source and Notes"). Bare https URLs in readouts now render as links (`BARE_URL` in inline()). Router slugs added. Tests `lam-samples-readout.test.ts`, `tro-links.test.tsx`.
NGCFells's RULES (memories tro-jbt-non-cgl-unit-types, tro-jbt-link-sources): every unit type CGL does not ship gets a TRO - JBT Unit Types readout with lore; TRO - JBT is the central place for scattered fan material, so link every original source (Reddit, Solaris7, Sarna, Mordel, DeviantArt, forums) and name Discord servers so people can join.
OPEN QUESTION (ask NGCFells when it comes up): do custom designs of non-CGL unit types and alternate-universe material get a separate TRO?
FOLLOW-UP OFFERED (not requested yet): audit existing readouts and equipment notes for sources with no link (Solaris7 items; Discord-sourced items should name the server).
NEXT: Power Armor Chunk F (below), then re-plan R, then G / H / K + K2 / COIL-alt. Any new readout needs `category` (and `pageCategories` for pages filed elsewhere).

# Previous (2026-11-17, Opus 5.5): POWER ARMOR CHUNK E DONE, DEPLOYED

STATE. beta = origin/beta = 62466f77a, deployed (`git deploy-beta`). News bullet "Sample Power Armor." added to the November 17th entry. `npm run check` green (5496 unit + 28 data, build OK, 3 known lint warnings); after the news line, tsc + src/ui/pages tests green.
DONE (Chunk E, plan box ticked; ledger "Chunk E" section in `.superpowers/sdd/2026-11-17-future-wars-power-armor/progress.md`):
- `src/data/power-armor-samples.ts` (+ test): IPA-1 (10 t, 14/21/0, small laser), IPA-2 (10 t, 7/11/3, ML + 2 SL, third jet RT 3), IPA-3 (15 t, 3/5/2, LL ML 2 SL) slot-for-slot from FW #14 pp.43-45 (re-read from page images: all arms keep hand actuators); IPA-4 from the owner's save (BV 147, 184,065 C, 9 PV unchanged). Armor of 1-3 = every half ton left, Best Guess spread: 16/32/48 points. BV 177/320/443, PV 13/15/14. IPA-1 BV hand-checked (test).
- Step 1 picker "Sample Power Armor (Custom Homebrew)" (`power-armor-samples`): loading ticks fw-power-armor and drops rulesets `getRulesetBlock` refuses (Flint's), keeps the rest. Tests in `step-power-armor.test.tsx`.
- TRO - JBT Power Armor gains a generated "The Sample Suits" page (`getPowerArmorSamplesReadout`, rows read from the designs; test checks every row).
- BUG FIXED (found here): `allocateArmorSane` capped the head at 9 for every 'Mech -> a 5-ton suit got 9 head armor; now `getMaxHeadArmor()` (also Flint's rules). Test in `battlemech-power-armor.test.ts`.
- Chromium (dev server port 5199): IPA-2 loaded via the replace dialog, step 6 no issues, slots as the sheet; TRO page renders, no console errors, no overflow.
NEXT: Power Armor Chunk F (verify and report: `npm run check`, no bundled design changed, comment on #172 — needs the GitHub connection or `gh`), then re-plan Chunk R, then G / H / K + K2 / COIL-alt.

# Previous (2026-11-17, Opus 5.5): POWER ARMOR CHUNK D DONE, DEPLOYED

STATE. beta = origin/beta = 08cb1ceee (two plan-only commits on top of 3f522fc0e, which is deployed) (`git deploy-beta`). News bullet "Power Armor values and readout." in the November 17th entry. `npm run check` green before the news line (5474 unit + 28 data, build OK, 3 known lint warnings); after it, typecheck + src/ui/pages tests green.
OWNER RULING (Alpha Strike): converter's BattleMech card (BM, Size 1) + Custom special PWA (text `POWER_ARMOR_AS_ABILITY_TEXT`, registry source TRO - JBT: Power Armor p.6); ground PV adds +1 to the defense modifier for PWA, as STL (`alphaStrikeGroundPointValue.ts`).
DONE (Chunk D):
- BV2: `bv2.def.factor.power-armor` +0.1 Defensive Factor for the +1 to hit (OURS, my call by analogy with the AS ruling; provisional step, ledger row in `2026-11-10-cited-bv-ledger.md`, new calc source `best-of-future-wars`). Not applied to BV1 editions. OWNER CONFIRMED 2026-11-17: keep it.
- Hand-checked IPA-4 (fixture `src/data/__fixtures__/power-armor-ipa-4.json`): cost 184,065 (175,300 x 1.05; shielding adds weight not cost, as vehicles); BV 147 (was 139; gyro "none" counts 0.5 per IO:AE p.187); AS MV 12" A1 S1 1/0/0 ENE PWA, 9 PV (7 without PWA). Test `battlemech-power-armor-values.test.ts`.
- Breakdown notes on cost/BV for a suit; ruleset description carries dates + values; TRO - JBT card `power-armor` (`docs/lore/power-armor-tro.md`: credits, history in our words, what sets it apart, in this app, values, AS rules).
- BUG FIXED: TRO - JBT cards "best-of-future-wars" and "homebrew-equipment" had no route (404). Router list now has every slug; test "gives every card a page to open". Checked in Chromium (all three open, no console errors).
NEXT: Power Armor Chunk E (samples IPA-1..4 in `power-armor-samples.ts`; reuse the IPA-4 fixture; a TRO entry per sample could follow the walkers' pattern), then F, re-plan R, then G / H / K + K2 / COIL-alt.

# Previous (2026-11-17, Opus 5.5): SPECIAL RULESETS WINDOW REFACTOR DONE, DEPLOYED

STATE. beta = origin/beta = fb3154065, deployed (`git deploy-beta`). News: bullet "Special Rulesets window." added to the November 17th entry (title now ends "; a new Special Rulesets window"). `npm run check` green: 5456 unit + 28 data, build OK, 3 known lint warnings outside touched files. Worktree btt-rulesets-window and branch removed.
DONE (plan `docs/superpowers/plans/2026-11-17-special-rulesets-window.md`, commits b65b2f869..fb3154065, executed inline):
- Registry (`special-rulesets.ts`): every ruleset has `summary` (<=120 chars), `category` (construction/play/campaign/setting, `RULESET_CATEGORIES`), `source.publication/tag/author`; optional `excludes`, `requires`; `CHANGE_LABELS` for every `changes` key. `getRulesetCredits` still prints title/url only.
- Eligibility: `getRulesetBlock(ticked, id, unitType?)` -> {kind: clash|excluded|needs|neededBy|unitType, by, reason}; used by the window, `changeGameSetting` (result has `block`), the settings block notice, and "Hide unavailable". Ticked rulesets only get warnings (saved pairs load unchanged) except neededBy. `orderForUntick` makes "No" clear requirement chains. `changeMULSearchFilters` drops rulesets with a missing requirement ("Needs X").
- UI: `src/utils/ruleset-list.ts` (filter/group, apostrophe-insensitive search), `src/ui/components/special-rulesets/ruleset-list.tsx` (filter bar, folding category groups "n of m ticked", rows with tag + summary + More info) and `ruleset-detail.tsx` (same-window detail: description, Future Wars tables open, source, author, changes, cannot-be-used-with, needs/needed by, Tick/Untick). Back restores scroll (nearest scrolling ancestor: `.modal` in the browser) and focus.
- Tests: `special-rulesets-step.test.tsx` (new), `ruleset-list.test.ts` (new), blocks in `special-rulesets.test.ts`, `game-settings*.test`, `mulSearchFilters.test.ts`; builder `src/test-support/rulesets.ts` (`testSpecialRuleset`).
- Chromium: 'Mech Creator step 1 checked (clash reason, curly-apostrophe search, More info/back scroll+focus, 375 px, no console errors). MUL search page not opened in Chromium (same component).
FINAL REVIEW (fresh Opus): fixed I1 ("No" left a requirement ticked), M1 (missing-requirement warning on a ticked ruleset), M4 (groups forced open while filtering). DEFERRED minors: M2 MUL says "Clashes with" for an exclusion; M3 Back loses focus if the row got filtered out; M5 no window-level test of neededBy/needs rows or excludes through MUL. Ledger was in the (now removed) worktree; this paragraph is the record.
FOR LATER CHUNKS: a new ruleset sets summary, category, source.publication/tag/author, changes (+ a CHANGE_LABELS entry), excludes/requires where needed. DropShips `changes: ["dropshipConstruction"]` (category construction), Economics `["economics"]` (campaign), COIL alternates `["coilRules"]` (detail view should say it replaces our COIL rules).
NEXT: Power Armor Chunk D (values; bring the owner the Alpha Strike proposal first: candidate a size-1 BattleMech card with a special for the +1 to hit, after `micro-mech.ts`), then E, F, re-plan R, then G / H / K + K2 / COIL-alt.

# OWNER ANSWERS 2026-11-17 (second round): RULESET UI DESIGN CHOICES
- ORDER confirmed as suggested: UI refactor -> Power Armor D -> E -> F -> re-plan R -> G / H / K + K2.
- LIST: grouped by CATEGORY (Construction, Play, Campaign & Economics, Setting...), collapsible with "n of m ticked"; each row carries a SOURCE TAG (e.g. "FW #36", "r/battletech").
- ROW: name + source tag + a ONE-LINE SUMMARY (new `summary` field, written from the existing descriptions) + More info button. Full description and the Future Wars tables move into More info.
- MORE INFO: a detail view INSIDE the same Special Rulesets window ("<- Back to list"), with Tick/Untick and the eligibility reason; search text and scroll position are kept. No stacked modals, no route.
- FILTERS: all of them: text search (name, description, source, author), source dropdown, "Hide unavailable" toggle (off by default), "Show ticked only" toggle.
- ELIGIBILITY: keep the shared-`changes` clash as the default, add optional explicit `excludes` and `requires`; each disabled row states why ("Clashes with X (both change ...)", "Needs X", "<unit type> do not exist under this ruleset"). Move Power Armor's refusal of Flint's into this model.
- OLD ITEMS SETTLED: periscope 2900 OK; Natalya Orlova OK. Izzy193's other COIL design (topic 88212) and Seer's COIL charge ruleset (topic 71729): BUILD each as an ALTERNATE RULE that REPLACES ours when ticked (so the eligibility model needs "replaces": it excludes/overrides our default COIL rules). Add to the plan's chunk list; confirm with the owner whether the Izzy193 design is an equipment variant or a ruleset when reading topic 88212.
- DONE (d963bca01, pushed to beta, docs only): plan `battletech-tools-master/docs/superpowers/plans/2026-11-17-special-rulesets-window.md` (6 tasks: registry fields, eligibility model `getRulesetBlock`, pure list filter, list view, More info view, check/ship); round-1 answers + new chunk table (UI, COIL-alt) written into `2026-11-17-future-wars-originals.md`.
- NEXT: owner reviews the plan and picks execution (subagent-driven or native); then build it in worktree `C:/repo/btt-rulesets-window`.

# OWNER ANSWERS 2026-11-17: "I WANT THEM ALL. EVERYTHING." + RULESET UI REFACTOR

ANSWERS. Every option below is built, each as its own alternate rule the player can click on. The recommendations are not used.
- Q1 DropShips: all four methods (Stock, Stock+Eid, Reese, Houseman), each its own selectable ruleset. Stock and Stock+Eid exclude each other; Eid builds on Stock.
- Q2 Kin: the whole Kin arsenal and the designs of FW #25 and #34, not just the Pulsar's needs. Chunk K2 is now in scope.
- Q3 Economics: both the original FW #5 numbers and the reprint's "double or triple" rule, as alternate options.
- The re-plan doc does not record these answers yet. Write them into `battletech-tools-master/docs/superpowers/plans/2026-11-17-future-wars-originals.md` (Questions for the owner, and the chunk table) before building G, H, K and K2.

NEW REQUIREMENT, before the alternate rules grow: refactor the Special Rulesets (alternate rules) UI.
1. A list with a checkbox to select each ruleset.
2. Rulesets that conflict make each other ineligible. Once one is ticked, the others show as disabled, with the reason. An example: two DropShip methods, or Flint's and Swisher's 'Mech construction.
3. A "More info" button on each item. It opens the ruleset's full details (what it does, its tables, its source and author) in a modal or page(s). The player closes it to get back to the list.
4. It must scale to a very long list. Consider grouping by source or category, and search or filter (the owner did not specify; propose).
Plan it first (brainstorm, then a plan with the owner's sign-off) and build it before Chunks G, H and K add more rulesets. Today's code is the Special Rulesets window, the `special-rulesets.ts` data and the per-ruleset summary the window already shows. Any existing exclusions (e.g. `fw-power-armor` refuses Flint's construction) should move into the new eligibility model.

ORDER (suggested; confirm with the owner): Ruleset UI refactor plan -> Power Armor Chunk D (its Alpha Strike proposal is still to be asked) -> E -> F -> re-plan Chunk R -> G (DropShips, all four) / H (Economics, both) / K + K2 (all Kin).

# OWNER QUESTIONS (answered above, kept for reference)

From the re-plan, `battletech-tools-master/docs/superpowers/plans/2026-11-17-future-wars-originals.md` ("Questions for the owner"). Q4 was answered yes on 2026-11-17.
- Q1. DropShips (blocks Chunk G). The Best-of method is Stock's (FW #16). Erik Eid revised it (FW #25). Mike Reese (FW #36) says both fail to rebuild a FASA Union, wrote his own, and says FASA's masses are too low. Doug Houseman wrote a fourth (FW #36). Which method or methods do we build? Recommendation: Stock's with Eid's revision as one ruleset, checked against the canon Union, Leopard and Overlord; Reese and Houseman summarised only.
- Q2. Kin (blocks Chunk K). Do we build only the items the Pulsar (HMP file) needs, or the whole Kin arsenal and designs of FW #25 and #34? Recommendation: the Pulsar's needs now; the rest as its own read-and-plan chunk (K2) if wanted.
- Q3. Economics (blocks Chunk H). Do we use the original's numbers (FW #5: 7, 6 and 12 million for the printed combinations), with the reprint's "double or triple" as the rule for combinations it does not list? Recommendation: yes.
- STILL OPEN, to be asked at Chunk D: the Power Armor Alpha Strike card has no source. Chunk D brings a proposal first. Candidate: a size-1 BattleMech card with a special ability for the +1 to hit, after the Micro-Mech ruleset in `micro-mech.ts`.

# START HERE (2026-11-17, Opus 5.5, latest): POWER ARMOR CHUNK C DONE, DEPLOYED

STATE. beta = origin/beta = efe5b7f7f, deployed (`git deploy-beta`). The news is merged into the day's entry "November 17th, 2026 - Power Armor in the 'Mech Creator, on the record sheet and in play" (home.test allows one entry per date). `npm run check` is green: 5421 unit + 28 data tests pass, the build is OK, and the 3 lint warnings are not in touched files.
DONE (Chunk C). Commits 3a5825726 (record sheet and play) and efe5b7f7f (review fixes and news).
- Record sheet (`power-armor-rules-box-svg.tsx`, `battlemech-svg.tsx`, `component-damage-svg.tsx`): title POWER ARMOR; the suit's Building Effects row and a short rules box at the foot of the Weapons box; no Gyro Hits when the gyro is "none". Rendered 5/10/15 t in Chromium.
- Play (`battlemech.ts`, `utils.ts`, `play.tsx`, `_futureWarsRulesetTools.tsx`):
  - The Target dialog's Power Armor checkbox gives +1 to hit (`showPowerArmorTargetFlag`, kept in view while ticked). Checked in Chromium: 4+ becomes 5+.
  - A Pilot critical in the head kills; in the CT it rolls 1D6 hits, logged.
  - An ammo explosion logs 1 hit, or killed if it reaches the CT.
  - `getPowerArmorPilotingModifier()` gives +2 for a 5-ton suit's Piloting 4 pilot.
  - The exit turn: `startPowerArmorExit` takes the suit from unlatching to out at turnReset; while it lasts it may not fire.
  - The roster panel's Power Armor section carries the building row, the rules and the Unlatch / Call it off buttons.
- Tests: `battlemech-power-armor-play.test.ts`, `power-armor-record-sheet.test.tsx`, and the Power Armor blocks of `_futureWarsRulesetTools.test.tsx` and `future-wars-power-armor.test.ts`.
TEXT ONLY (no engine in the app): punches, kicks, charges, clubs, DFA on the punch table, stacking, the own-DFA pilot hit, and the 1D3 CT hits while unlatching. Pilot hits are logged, not written to wounds.
FINAL REVIEW: Fable 5.2 needs usage credits, so the review ran on Opus 5.5. Two fixes were made. 4 minors are deferred, and one Important finding was ruled unreachable: the suit's head is full, so no ammo can sit there. Details are in the ledger's "Chunk C" section (`battletech-tools-master/.superpowers/sdd/2026-11-17-future-wars-power-armor/progress.md`).
NEXT: Power Armor Chunk D (values; Fable 5.2 needs usage credits, so Opus otherwise; take the Alpha Strike proposal to the owner first), then E (samples including IPA-4; Sonnet), then F. Re-plan Chunk R. Owner Q1-Q3 are still open.

# Previous (2026-11-17, Opus 5.5): POWER ARMOR CHUNK B DONE, DEPLOYED

STATE. beta = origin/beta = b492417e1, deployed (`git deploy-beta`), news entry "November 17th, 2026 - Power Armor in the 'Mech Creator". `npm run check` green (5398 + 28 data pass, build OK, 3 lint warnings not in touched files).
DONE (Chunk B). `BattleMech.getConstructionTonnages()` -> step 1 offers 5/10/15 and clamps to nearest on ticking; 5-ton gyro list = "No Gyro" only; step 5 picker withholds non-listed weapons at 5 t (`_isEquipmentAllowedForChassis`); `_isPowerArmorWeapon` now counts "Custom Equipment" with damage > 0 (AC/15 Solaris7, Disruptor, Pile Bunker were leaking; found in Chromium); new issue: 5-ton pilot Piloting 5+; issue lines deduped (duplicate React keys). Tests: `battlemech-power-armor.test.ts` (Chunk B block), new `mech-creator/step-power-armor.test.tsx`. Played in Chromium: 65 t Thunderbolt -> 15 t on tick, waldo + No Gyro in step 2, picker Energy = Flamer/Vehicle Flamer/Small Laser, Ballistic = MG, Custom = Smoker; no console errors. Ledger: "Chunk B" section.
OWNER REQUEST DONE: 5-ton design IPA-4 (ours, next in the IPA series) saved at `JBTToolsSupportFiles/designs/power-armor/IPA-4.json` (5 t, walk 6, 2 small lasers, 10 SHS, 24 armor, no issues, BV 139); written into the plan's Chunk E as the fourth sample.
OTHER THIS SESSION: drafted the reply to Scott (Mordel) pointing to construction code (src/classes, src/data, creator UI) and explaining ResourceLibrary/JBTIICRework; owner invited him as collaborator on both.
NOTED, NOT FIXED: weight breakdown labels engines "<name> - 0" (engine records carry rating 0; battlemech.ts ~4448; not shown in UI). Sidebar shows "Cockpit 0.5" for the waldo (Chunk C/D).
NEXT: Power Armor Chunk C (record sheet + play; Opus), D (values; Fable 5.2, AS proposal to owner first), E (samples incl. IPA-4; Sonnet). Re-plan Chunk R. Owner Q1-Q3 still open.

# Previous (2026-11-17, Opus 5.5): QUAD IMPORT REGRESSION FIXED, BUNDLE REBUILT (Batch Chunk 7 done), DEPLOYED

STATE. beta = origin/beta = 2d1031808; 949bd6057 deployed (`git deploy-beta`), 2d1031808 (Power Armor IS base) pushed only. Unit tests classes/data/utils/ui 5353 pass, 5 skipped; tsc clean.
BUG. The uncommitted rebuild below failed the Chunk 7 gate (matched 3937 < floor 3942; import losses 83 -> 162): slot refactor 06d048997 gave quad arms 0 slots, and SSW import placed a quad's front-leg items (LA/RA) there. FIX 3afa30c97: `_sswCriticalLocation` is now an instance method that also maps LA/RA -> fll/frl via `_normalizeLocation`, used at every SSW placement site (generic, heat sinks, jump jets, armored slots, fixed armor). Test `battlemech-quad-import.test.ts` (Tarantula ZPH-1 fixture) RED -> GREEN.
BUNDLE 949bd6057: matched 3942 (= floor), import losses 76 (was 83). Kept designs changed only where a commit explains it: quad items stored fll/frl; light blazer derived BV on 4 Gothic designs (FS9-HB 528->746, KGC-0KP, MAD-3H, PXH-1S; 8b92fdc6d); Alpha Strike values in custom-units.json (#636).
OWNER RULING (2026-11-17): Power Armor is Inner Sphere BASE only: "is" and Mixed IS base ("mis") allowed; Clan and Mixed-Clan refused. BUILT and pushed after the deploy (issue in `_getPowerArmorIssues`, test "is built on an Inner Sphere base only"); not deployed, nothing reachable until Chunk B.
OWNER RULE: bugs first (memory bugs-first.md).
NEXT: Power Armor Chunk B (Sonnet 5.5), C (Opus), D (Fable 5.2), E (Sonnet). Re-plan Chunk R (Sonnet). Owner Q1-Q3 still open.

# Previous (2026-11-17, Opus 5.5): POWER ARMOR CHUNK A DONE (pushed, not deployed)

STATE then. beta = origin/beta = 4144fb7d2: d4914ff9c "Custom Homebrew: Power Armor construction (#172)" + 4144fb7d2 Chunk E rulings in the plan. NOT deployed (nothing a user can reach until Chunk B). Worktree btt-power-armor-a and branch removed.
DONE. Ruleset `fw-power-armor` (special-rulesets.ts, Custom Homebrew, changes mechConstruction so it refuses Flint's). Tables + waldo record: `src/data/future-wars-power-armor.ts`. BattleMech: `usesPowerArmorConstruction()` (biped, 5/10/15 t) gates slot counts (6 a location, CT 12), waldo in place of the cockpit (0.5 t, 50,000 C; "Pilot" head 3-4 + CT 11-12 beside the printed Life Support / Sensors), lower arm actuators kept, head armor <= 2x head structure, 5 t: no gyro (getGyro() = "none"), H1 CT3 ST2 A1 L1, fusion shielding weight row, flamer/MG/small laser only; issues for wrong tonnage/type, armless, weapons in head/CT. Tests: `battlemech-power-armor.test.ts`, `future-wars-power-armor.test.ts` (26). Rulings + costs: ledger `battletech-tools-master/.superpowers/sdd/2026-11-17-future-wars-power-armor/progress.md`.
CHECK. unit classes/data/utils 4590 pass; `npm run check` 5380 pass + 1 timeout (SSW Dire Wolf omni import, 42 s under load; passes alone).
OWNER RULINGS (re-plan Q4 = YES; written into the plan's Chunk E): armor spread as a standard BattleMech (ours, noted); IPA-2 gets a third jump jet in RT 3; names IPA-1 (p.43: type line NOT on the scan, correction of the plan's "none written"), IPA-2 (p.44, written "I PA - 2"), IPA-3 (p.45: lower halves fit), notes saying IPA-1/IPA-3 names are ours.
(RESOLVED above) UNKNOWN WORK IN THE MAIN CHECKOUT. battletech-tools-master had UNCOMMITTED bundled-data changes (src/data/bundled/mechs*.json, mechs-report.md, ...) from a background "Rebuild the bundled data" task that finished in this session's task area but was not started in this conversation (probably Batch Chunk 7 started before /clear). Left untouched: verify (Batch Chunk 7) before committing it.
NEXT: Power Armor Chunk B (creator; Sonnet 5.5), then C (record sheet + play; Opus), D (values, AS proposal to the owner; Fable 5.2), E (samples, rulings in hand; Sonnet). Or Batch Chunk 7 (check the uncommitted rebuild above). Re-plan Chunk R (Sonnet). Owner Q1-Q3 still open.

# Previous (2026-11-17, Opus 5.5): RE-PLAN DONE, Fanzine Chunk F (Power Armor plan) DONE; Batch Chunk 7 see below

STATE. beta = origin/beta = 612cd0491 (two plan commits on top of a0cff6773). Docs only, nothing to deploy.
DONE.
- Re-plan: `battletech-tools-master/docs/superpowers/plans/2026-11-17-future-wars-originals.md` replaces the Best-of plan's Chunks F-L (pointer added there) and adds Chunk R (re-check built items against the originals). It maps every Best-of article to its first printing. Key finds: Economics = FW #5 pp.5-6 with combination values the reprint dropped (7 / 6 / 12 million); DropShips have Eid's revision (FW #25 p.6) and rival systems by Reese and Houseman (FW #36 pp.14-23; Reese says Stock's and Eid's fail to rebuild a Union); the Kin arsenal and designs are FW #25 pp.21-~45 and FW #34; City Raid's original not found; Penitrator re-checked on FW #3 p.5: matches our record (FW #25's Kin Penetrator Missile has other bands: a later Kin version).
- Chunk F: `docs/superpowers/plans/2026-11-17-future-wars-power-armor.md` (construction Special Ruleset on BattleMech, chunks A-F). FW #14's scan lacks printed pp.39-42 (text: Best-of only); pp.43-45 = three sample suit sheets not in the Best-of. Ledger entry appended.
OWNER QUESTIONS (in the re-plan): Q1 DropShip method(s); Q2 Kin scope (Pulsar only, or all of FW #25/#34); Q3 use FW #5's economics numbers; Q4 bring in the three FW #14 sample suits.
NEXT: Power Armor plan Chunk A (Opus 5.5), or re-plan Chunk R (Sonnet 5.5). Chunks G, H, K wait on Q1, Q3, Q2.

STATE. beta = origin/beta = a0cff6773, deployed. `npm run check` green (5360 pass). Only uncommitted file: this handoff.
DONE THIS SESSION (Sonnet 5.5): era review finished. Pom-Pom (House Marik, FW #11 + Best-of p.27), Penitrator (Steiner, FW #3), SABOT (Gargoyle, FW #15/#32), other Power Boosters (FW #14) = Inner Sphere, introduced 3025, never extinct, as `ERA_RULINGS` entries with `by: "era review of the original article"` (new optional field). Owner ruled the Long Range Flamer takes the vehicle flamer's dates (1950, never extinct) and rating. VHE/Inferno Gauss already carry the article's date. Test: `era-rulings.test.ts`.
TOOLING. Vitest fails in the Bash tool (every suite, "reading 'config'") because env var CLAUDECODE is set: use PowerShell, or `env -u CLAUDECODE npx vitest ...`. Not a repo bug (memory `vitest-claudecode-env`).
SARNA. The OWNER will download Sarna files himself. `C:/repo/ResourceLibrary/SARNA-LINKS.md` lists every missing / size-only file as a link, by section, high value first. Do NOT crawl or download Sarna yourself; when he drops files into `JBTIICRework/unsorted/`, then hash, VirusTotal and let the intake tools dedupe (never Ollama).
NEXT (owner: "I will switch models, then clear, then get to work"):
1. REDO THE PLAN for the remaining work (Batch Chunk 7, Fanzine Chunk F Power Armor, anything that depends on magazines) now that the whole Future Wars run is known to be in the library: every issue is `JBTIICRework/magazines/Future Wars/future_wars_NN_Qyhm8x.pdf`, extracts `ResourceLibrary/text/future-wars-NN-Qyhm8x.*` (issues 1-25, 27, 30, 31, 38-41; Calibre issues 26, 28, 29, 32-37 as `Future-Wars-Magazine-Issue-0NN-...`). The earlier plan was written reading only the Best-of reprint, so re-check each planned item against the ORIGINAL articles (read page images, OCR rule) before building. Check `JBTIICRework` before saying any title is missing.
2. Then execute: Batch Chunk 7 (rebuild bundled data and verify; Sonnet is fine), Fanzine Chunk F (Power Armor).
Older state follows unchanged.

# Previous (2026-11-16): Batch Chunk 6 DONE; fan items complete; ERA REVIEW half done (Sonnet 5.5 session, near its limit)

STATE. beta = origin/beta holds everything below, deployed (`git deploy-beta`). `npm run check` green. Ledger: batch `progress.md`, the four "Batch Chunk 6" sections (first pass, derived values, completion pass, era rulings).

DONE THIS SESSION
- Built: Superheavy PPC, Fusion Lance, Omni-Laser, Pile Bunker, PPC-X (Apocryphal), Re-Engineered Fusion Engine, COIL-S/M/L (Apocryphal, hexes), Reloading Rocket Launchers 10/15/20 (ours), Tandem Charge SRM Special Ruleset.
- Every Custom/Apocryphal/Munchkin item now has notes, lore, rules, dates, tech rating, rules level, cost, BV (or a stated reason for 0) and Alpha Strike values.
  Code: `src/data/derived-values.ts` (BV/cost methods, canon-checked), `derived-custom-values.ts` (`applyDerivedValues`, `DERIVATION_RULES`, `DATING_RULES`,
  `ERA_RULINGS`), `derived-alpha-strike.ts`, `custom-lore-rules.ts`, `variable-equipment.ts` (`fusion-lance`, `coil-s/m/l`). Guard: `custom-completeness.test.ts`
  (accepts a prototype date in place of an introduction date). Readout: `docs/lore/homebrew-equipment-tro.md`, TRO - JBT card `homebrew-equipment`.
- OWNER ERA RULINGS (locked, in `ERA_RULINGS`, `era-rulings.test.ts`, the readout): COIL = Clan Wolverine weapon (prototype 2810, introduced 2815, extinct 2824,
  reintroduced 3025, Inner Sphere only; a Clan unit cannot know it by sight but recognises a firing COIL by its pattern, breaks Zellbrigen and destroys the carrier as its first priority: lore, rules and notes); Fusion Lance = Succession Wars desperation weapon built on Tikonov III in the Battle of Tikonov 23 Sep to 18 Oct 3028
  (Operation RAT; Capellan v Davion Crucis Lancers; Ridzik defending, Duncan attacking; the technician Natalya Orlova and the workshop are ours), prototype and
  introduced 3028, never extinct; Smoker = ancient never-out-of-style, 1950, universal; Periscope = Succession Wars water-world invention, Inner Sphere only,
  year 2900 (MY year, owner gave none); Buckler Smoke Dispenser = SLDF design about 2650, universal, second-line / Solahma / ArtVee users, Gargoyle Industries
  markets it from the early Clan war with no end date; EII PDS = prototype about 3028 near Tikonov, no production, no introduction date.

OPEN: THE ERA REVIEW OF THE OTHER FANZINE ITEMS (do this first)
The owner challenged my blanket 3025 date ("when is new?"). Every OTHER item dated 3025 by `DATING_RULES` (FANZINE_YEAR) still needs the same treatment: read its
article in the scans (`C:/repo/ResourceLibrary/text/Future-Wars-Magazine-*.ocr.txt` / `.raw.txt`; the Best of volume is `...Best-of-Future-Wars-Magazine.ocr.txt`),
find the setting clues, ask the owner, then add an `ERA_RULINGS` entry. Memory `era-honest-dating`. Items and what is known:
- Gatling Laser (Best of p.27, Karl Sanders): "the old question of how to reduce the heat build-up of the laser", "I have proposed", "tests show" -33% damage and range; no maker, no year. It reads as an experimental prototype. Canon neighbours: small laser 2300, pulse lasers 2609 (lost 2950 to 3037), first canon rotary weapons 3062. Owner question pending: prototype only (no introduction date, like the PDS), or a prototype of a given era?
- Long Range Flamer (p.28): stats only; 15 shots a ton of fuel, 4/8/12; it is a pressurised vehicle flamer (canon Flamer and Vehicle Flamer 1950, never extinct, rating B/C). Owner leaning: old, low-tech, obscure. Options asked: Age of War onward, a Succession Wars technicians' improvement, or keep the vehicle flamer's 1950. PENDING.
- Pom-Pom guns (p.27): the article says House Marik's rapid-fire system "is fairly reliable" now, built on Riflemen and an Atlas variant; my lore calls it a field modification. Needs a House (Marik) and an era. NOT YET ASKED.
- Power Boosters (p.28): no setting clue read yet. NOT YET ASKED.
- Penitrator (p.20, Herb Barents): my lore says "only the Federated Commonwealth fields it", captured from the 'Mech "the Blaster"; I gave it 3025, which contradicts the lore (Sarna: the Federated Commonwealth formed 3040; the 3028 wedding made the alliance, check the exact date). Needs 3040-ish or a lore fix. NOT YET ASKED.
- SABOT (FW #15, Tomaszewski), VHE and Inferno Gauss (FW #19, Congdon; story year 3040): Gargoyle Industries (FW #32 p.17, an Inner Sphere firm selling in the early Clan war) licenses all three from independent researchers. SABOT is currently 3025.
- Swing Fire is already ruled (SLDF about 2750). Hailstorm, ArtVee ComboGuns, Nuclear Pulse Cannon, chemical laser have dates from earlier rulings.
- Reddit and Solaris7 items sit at their sources' dates (3050 and later) and are not Succession Wars; flag them as out-of-era Custom Homebrew only if the owner asks.
- Facts only from search snippets (not read from the page): the Marauder II was "first built in 3012" (Sarna). CORRECTION: every Future Wars issue is in our library. Issue 24 is `JBTIICRework/magazines/Future Wars/future_wars_24_Qyhm8x.pdf` with an extract `ResourceLibrary/text/future-wars-24-Qyhm8x.ocr.txt` (lowercase names: search case-insensitively; extracts exist for issues 1-25, 27, 30, 31, 38-41 under `future-wars-NN-Qyhm8x.*`, and the Calibre issues 26, 28, 29, 32-37 under `Future-Wars-Magazine-Issue-0NN-...`). The era review should read the ORIGINAL issue articles, not only the Best-of reprint. Issue 24 (read from the page images, corrected): "Ell - Serving Your Needs" (Larry Ellena) puts Ellena Industries on the planet UR in the Capellan Confederation (Ellena family; secret factory for Mitchel Vehicle Interstellar in the early First Succession War; JumpShips, DropShips, vehicles, VTOLs, 'Mech modifications; the PDS is its "latest development"), and its p.10 table gives the PDS heat 1 (applied: the record now has heat 1 and the readout lore carries the company facts).

ERA REVIEW: ORIGINAL ARTICLES FOUND (owner: "read on any item we create lore for"; started 2026-11-17). Extracts are `ResourceLibrary/text/future-wars-NN-Qyhm8x.ocr.txt`; read the PDF page images (render at 110 dpi) for any figure, per the OCR rule. Where each item first appears:
- Penitrator: first described in Future Wars #3 (extract future-wars-03; not yet read). FW #13 (the Blaster 'Mech, lines ~830-960): "first seen on the World of Harvest, after the Silveradoes were there"; two versions, an SRM 6 one and one with Penitrator missiles; missiles "travel about 4 times the range of an SRM". FW #25 line ~638 and ~1133-1159 (a hovercraft with 8 "Penetrator Missiles" and a gauss rifle: "wreak havoc with a 'Mech's internal systems"). FW #22 has a "Penetrator Lancer" turret. NOT YET FOUND in any of these: the "Federated Commonwealth fields it" claim in my approved lore; read FW #13's Blaster paragraph fully and FW #3 and fix the lore or the date accordingly.
- Gatling Laser: appears on fielded 'Mechs in FW #12 ("2 Martell Gatling Lasers" at line ~594; "How's Gatling Lasers", Howe's Howlers, lines ~3080-3150), so it is NOT a lab-only prototype; the Best-of article (p.27) is the write-up. FW #14 line ~1273-1292 is the Power Booster article (rules: a 5 or less fails; two turns in a row 9 or less; third turn 11 or less; a 2 breaks what it boosted), with a Gatling Laser stat line. Read the maker "Martell" and FW #12's 'Mech descriptions for era and house.
- Rapid Fire Auto Cannon (Pom-Pom): FW #11 has "Krupp Rapid Fire Auto Cannon" (lines ~467, ~1084); the Best-of text names House Marik's rapid-fire system and Riflemen/Atlas variants. Read FW #11.
- SABOT: FW #15 lines ~898-935 (Tomaszewski; "Sabot is French for boot"; rounds per ton 20/4, 15/3, 10/2, 5/1). Uses elsewhere: FW #21 (DRL armor vs HDUAP/sabot), #22 (sabot ammo on vehicles), #23 (Buzz Saw Carrier, AC/2 sabot). VHE/Inferno: FW #19 (Congdon). Long Range Flamer and Power Booster originals: grep FW #9, #21, #22 mentions.
- READ 2026-11-17 from page images: Penitrator (FW #3 p.5, "Mech War Times: The Penitrator", Nov 1987): captured by the 113th Regiment's recon company, the Silveradoes, on Glow (first moon of Harvest); "only House Steiner has these weapons". The 1991 reprint changed that to "Federated Commonwealth". Lore now carries both (committed, deployed). Era stays 3025 baseline (Steiner-era 1987 setting).
- READ: Gatling Laser (FW #8 p.37, "New Technology" by Karl Sanders, with the Swing Fire Missile System in the same column): "being tested in the field right now", the Charger refit is the example; Swing Fire: "tests ... not yet complete". FW #12 (cover: "The Fourth Succession War") lists fielded Gatling Laser 'Mechs and VTOLs (Martell, Howe's Howlers). Suggested era for the owner: Gatling Laser prototype 3025 (field test), introduced about 3028-3029 (Fourth Succession War); Swing Fire prototype 3025, no introduction. NOT APPLIED: waiting on the owner's ruling.
- OWNER RULINGS 2026-11-17: Gatling Laser (and its Power Booster) prototype 3025, introduced 3028: APPLIED, deployed. Swing Fire: SLDF design, lost, rediscovered and reverse-engineered by the Inner Sphere (owner floated late 2nd Succession War, then 3rd: "found a cache with design schematics and tech manuals"), and the Clans have it too (so techBase universal, SLDF origin, never extinct after rediscovery). RULED 2026-11-17: rediscovered during the THIRD Succession War (a cache of design schematics and technical manuals). APPLIED and deployed: Inner Sphere racks introduced 2750, extinct 2830, reintroduced 2880 (our years; racks with their own later gaps keep them); Clan racks unchanged (they kept it). Lore and TRO page updated.
NEXT, IN ORDER: (1) read FW #11 (Pom-Pom), #14 (Power Booster), #15 (SABOT), #19 (VHE, Inferno) from page images, settle eras, ask the owner only where the source does not settle it; apply via ERA_RULINGS (it now takes a `date` field); Long Range Flamer era is still open. (2) Sarna downloads, high value first (rules, newsletters, MWDA dossiers after checking one is game content, then stories, previews, record sheets, data PDFs, missing magazines) by the method above. (3) Then Batch Chunk 7 or Fanzine Chunk F. Everything in battletech-tools-master is committed, pushed and deployed; JBTToolsSupportFiles/handoff.md is the only uncommitted file.
- ADDED 2026-11-17: u/Xenosama (QueerTech Discord) Plasma Lance (custom-plasma-lance) and Pilebunker (custom-pilebunker-xenosama), separate from FweeCom's Reddit Pile Bunker; deployed with news.
- Still to read (not started): FW #11 (Pom-Pom), #14 (Power Booster), #15 (SABOT), #19 (VHE, Inferno).

SARNA DOWNLOADS (owner said high value first; NOT STARTED): docs/rules (46), docs/newsletters (32), docs/mwda_dossiers (239; check one is game content), then stories (compare with our novels), products previews, record sheets, data PDFs, the ~65 probable-missing magazines. Method in the SARNA COMPARISON paragraph above.

OTHER OPEN
- Owner to confirm: periscope 2900; the invented names (Natalya Orlova); Izzy193's other COIL design (topic 88212) is NOT used; Seer's COIL charge ruleset (topic 71729) is not adopted.
- Next after the era review: Batch Chunk 7 (rebuild bundled data and verify; Sonnet 5.5), or Fanzine Chunk F (Power Armor, Fable 5.2).
- Model note: this was done on Sonnet 5.5; the era review is research and judgement, so Opus is fine.

SARNA COMPARISON (owner asked; partly done). Sarna's download area (https://www.sarna.net/files/, 7,948 files) was crawled and compared with the library: `ResourceLibrary/records/sarna-files-compare-2026-11-16.json` (magazines, docs, data rows; status name+size / size only / missing). Magazines: 342 on Sarna; 239 match; 38 titles we hold as another scan; about 65 look missing (MechForce UK record sheets and scenarios, Stardate and Stardrive, Challenge 35/44/49/71, Space Gamer 78/83/85, Mecha Press 04/11/13-16, Tech Factory 9, Commando Quarterly 03, BattleTech Newsletter 5/7/8, UBTN Special 1, PC Gamer vol 6 #12, others) but the name matching is fuzzy: CHECK EACH AGAINST JBTIICRework (and by hash after downloading) before adding. The Review: we hold "The Review of the War College of Goshen" (3 issues, `magazines/The Review of the War College of Goshen/`); Sarna's "the_review_vol.42_issue_1/3_may/july_3067" are probably the same, compare. Owner wants, if missing and useful for lore, rules, equipment or units: docs/mwda_dossiers (239; check they are game content, probably MechWarrior Dark Age unit cards), docs/rules (46), docs/newsletters (32), docs/stories (102; check against the novels we hold first), plus useful magazines, products previews, record sheets and data PDFs. How: download each into a fresh folder, hash, check the hash against `text/_hashes.json`, VirusTotal by hash with the library's `.vt_api_key` (4 a minute), then drop the new files into `JBTIICRework/unsorted/` and let the intake tools dedupe (never use Ollama). NOT DONE YET: nothing from the Sarna list has been added to JBTIICRework.

STANDING RULES. Never use Bash heredocs (memory `no-heredocs`): write a file with Write, then run it. Verify numbers against the catalogs yourself (`verify-against-catalogs`).
Era tags are "age-of-war", "star-league", "early-sw", "late-sw-lt", "late-sw-rn", "clan-inv", "civil-war", "jihad", "dark-ages" (an invalid tag silently falls back to the default).
Tests: `npx vitest run --project unit src/data` is fast; `npm run check` before any commit.

# Previous: Best of Future Wars Chunk E MERGED, pushed, DEPLOYED to beta

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
