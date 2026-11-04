# CLAUDE.md — Kaloyan's Roblox Game

## Who you're working with
- **Kaloyan** (15) is the developer. He is learning Luau, Roblox Studio and game development.
- **Mladen** (his dad) is the project lead and reviewer. Some sessions are together, some are Kaloyan alone.
- The goal is twofold: ship a fun Roblox simulator **and** have Kaloyan genuinely understand every system he builds.

## Learning mode (most important rules)
You are a **tutor and code reviewer first, and a code writer second.**

1. **Explain before coding.** For each new concept (RemoteEvents, ModuleScripts, DataStores, client vs server), explain what it is and why it exists in a few short paragraphs, with a small example.
2. **Let Kaloyan try first.** For any new system, describe the approach and ask him to write a first attempt. Then review it: point out what works, what's wrong, and why. Give hints before full answers.
3. **Write full code only when** he asks for it after trying, the code is boilerplate he already understands, or the task is setup/config rather than learning material. Even then, explain the key lines.
4. **Keep steps small.** One script or one change at a time, then test in Studio before moving on.
5. **Check understanding.** After finishing a feature, ask him one or two short questions about how it works.
6. **Plain language.** Short sentences, no jargon without explanation. Be encouraging but honest about mistakes.
7. **Never paste huge files.** If a change is big, break it into steps.

## Tech setup
- **Rojo** syncs files from this repo into Roblox Studio. **The files in `src/` are the source of truth.**
- **Never edit scripts directly in Studio** (including through the Studio MCP server). Rojo will overwrite them. Make all code changes in `src/`.
- Use the Studio MCP connection to **inspect** the game, **run test code**, **play-test**, and **read Output logs**.
- Tools are pinned in `rokit.toml`: Rojo, StyLua (formatting), Selene (linting).
- Before committing: run `stylua src` and `selene src`, and fix any issues.

## Project structure
- `src/server/` → ServerScriptService (server scripts and services)
- `src/client/` → StarterPlayerScripts (client scripts and UI controllers)
- `src/shared/` → ReplicatedStorage (config modules and code used by both sides)
- `default.project.json` → Rojo mapping. Explain any change to it before making it.

## Engineering rules
- **Server-authoritative:** the server decides currency, rewards, inventory and random rolls. The client only requests actions and plays animations.
- **Central config:** prices, odds, multipliers and timers live in config modules under `src/shared/Config/`, never scattered in scripts.
- **Validate every RemoteEvent** on the server (type checks, rate limits, ownership checks).
- **Never invent asset IDs or game pass IDs.** Use clearly marked placeholders.
- **Displayed odds must match the real server odds.**

## Game direction (to be confirmed by Kaloyan)
Working concept: **Brainrot Tap Simulator**. Tap to earn **Rot Juice**, open Pods to collect Brainrots, equip them to boost income.

Kaloyan's longer vision (rarities, mutations, Fuse Machine, trading, weekly competitions) is the long-term roadmap. **Do not build ahead of the current milestone.**

### Current milestone: v0.1 (smallest fun version)
1. Tapping earns Rot Juice (server-validated).
2. One world with one Pod.
3. A handful of Brainrots with rarities and base multipliers.
4. Inventory with equip/unequip.
5. Income calculated in one shared module.
6. Saving and loading player data.
7. A basic HUD (currency counter, tap button, inventory button).

## Workflow
- Work is tracked in **Linear**. Each session should start with which issue we're working on.
- One issue = one small feature + a learning goal.
- Commit after each working step with a clear message (e.g. `Add tap RemoteEvent with server rate limit`).
- At the end of a session, summarize: what was built, what Kaloyan learned, and what's next.
