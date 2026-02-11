# Resources

This folder contains supplementary materials (commands list), references, and templates that support the command line tools and scripts in this repository.

## Structure

```bash
resources/
├── cheatsheets/
├── references/
└── templates/
```

## **Cheatsheets**

Quick-reference guides for various cmd tools and systems.

### Contents

- **Linux/Unix commands** - System administration and shell commands.
- **Git operations** - Branching, merging, rebasing, and other workflows.
- **Windows activation keys** - Set of keys for activated Windows.
- **Networking commands** - Set of network commands for operating systems like Linux/Unix and Windows.

### Usage

```bash
cat cheatsheets/sorted_linuxCommands.txt

grep "git switch" cheatsheets/git_commands.txt
```

## References

Curated collection of external resources, research links, and cybersecurity materials.

### Categories

  **1. Git learning resources:**

- Git cheatsheets links.

  **2. Cybersecurity research:**

- XZ backdoor incident.
- The Shadow Brokers group.
- Cybersecurity tools.

  **3. Programming links:**

- Programming bugs.
- Assembly docs.

## **Templates**

Reusable templates for configuration files, commit meesage, and documentation.

### File types

- **Git commit templates** - Standardized commit message formats.

- **YAML configuration** - For Docker or orchestration tools.

### Usage_templates

```bash
cp resources/templates/docker-compose.yaml my-docker_compose.yaml
```
