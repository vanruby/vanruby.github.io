# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

VanRuby is the website for Vancouver's Ruby community (vanruby.org), built with Jekyll static site generator. The site showcases events, sponsors, and community information.

## Development Commands

### Local Development
```bash
bundle install                    # Install dependencies
bundle exec jekyll serve --watch  # Start development server at http://localhost:4000
```

### Linting
```bash
bundle exec rubocop              # Run RuboCop linter
```

## Architecture

### Jekyll Static Site
- Uses **rdiscount** markdown processor with smart extensions
- Layouts in `_layouts/`: `layout.html` (main), `post.html` (blog posts)
- Data files in `_data/`: `companies.csv`
- Generated site output in `_site/` (excluded from git)

### Frontend Stack
- Bootstrap 5 for styling
- Custom SVG logos for sponsors (Clio, NorthEast, GitHub, Zayzoon)
- Responsive design with mobile-first approach
- Luma calendar integration for upcoming events

### Key Pages
- `index.html` - Homepage with hero, sponsors, stats, and event calendar
- `companies.html` - Companies using Ruby in Vancouver
- `2014-heroes.html` - Historical tribute page

## Ruby Version
Ruby 3.4.6 (see `.ruby-version`)

## Git Commit Standards

Follow the Conventional Commits specification for all commit messages.

**IMPORTANT**: Do not include AI tools (Claude, ChatGPT, etc.) as co-authors or mention them in commit messages. All commits should be attributed to human authors only.

### Format
```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

### Types
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files

### Scopes (optional)
- `sponsors`: Sponsor-related changes
- `content`: Website content updates
- `deps`: Dependency updates

### Examples
```
fix(sponsors): correct logo alignment on mobile
feat(content): add new community section
docs: update README with deployment instructions
chore(deps): update jekyll to 4.3.0
```

## Important Notes
- Sponsor logos are SVG files in `images/sponsors/`
