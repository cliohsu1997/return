# Project Structure

High-level layout for the **return** repository. Updated when folders or organization change.

## Root layout

```
return/
├── .cursor/              → Cursor rules and agent skills
├── .vscode/              → Editor settings
├── conversation_cursor/  → Task proposals (YYYYMM/YYYYMMDD/task_name.md)
├── to-do/                → Task checklists (same naming as proposals)
├── task_summary/         → Task summaries and deliverables
├── progress/             → Active and completed task tracking (latest.md)
├── structure/            → Project structure documentation (this file)
├── literature/           → Literature review source materials (papers, notes)
├── draft/                → LaTeX manuscript and paper drafts
├── figuretable/          → Figures and tables (draft inputs)
├── doc/                  → Project documentation
├── report/               → Generated reports
├── R/                    → R package and analysis scripts
├── src/                  → C++ source code
├── inst/                 → Package inst files (R)
├── man/                  → R package documentation
├── main/                 → Main analysis or pipeline entry points
├── python/               → Python scripts (Poetry; see python/SKILL)
├── tests/                → Test scripts
├── hpc4/                 → HPC4 cluster job scripts and config
├── debug/                → Debugging scripts and scratch output
└── .gitignore            → Ignored paths (build artifacts, secrets, venv)
```

## Workflow folders

| Folder | Purpose |
|--------|---------|
| `conversation_cursor/` | Technical proposals and design decisions |
| `to-do/` | Uncompleted task checklists |
| `task_summary/` | Completed work, findings, and results |
| `progress/` | `latest.md` — active and completed tasks |
| `structure/` | `latest.md` — folder layout and brief descriptions |

## Research and code

| Folder | Purpose |
|--------|---------|
| `literature/` | Papers, reading notes, and materials for the literature review |
| `draft/` | LaTeX draft (`main.tex`, sections, bibliography) |
| `figuretable/` | Figure and table fragments for the draft |
| `R/` | R package code and estimation scripts |
| `src/` | C++ implementations |
| `python/` | Python utilities (e.g. PDF extraction); run via Poetry |
| `tests/` | Automated and manual test scripts |
| `hpc4/` | SLURM jobs and cluster execution |

## Remote

| Remote | URL |
|--------|-----|
| `origin` | https://github.com/cliohsu1997/return.git |
