# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

VanRuby is the website for Vancouver's Ruby community (vanruby.org), built with Jekyll static site generator. The site showcases meetup events, sponsors, and community information.

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
- Data files in `_data/`: `companies.csv`, `meetups.yml` (symlink to `meetup/meetups.yml`)
- Generated site output in `_site/` (excluded from git)

### Meetup Data Management
The site maintains historical meetup data fetched from Meetup.com API:

1. **fetch_meetups.rb** - Fetches events and comments from Meetup.com API
   - Uses `bundler/inline` with `meetup_client` gem
   - Requires `MEETUP_API_KEY` environment variable
   - Fetches from 'vancouver-ruby' group (ID: 573925)
   - Outputs to `raw_meetups.yml`

2. **transform_meetups.rb** - Processes raw data into clean format
   - Uses `bundler/inline` with `virtus` gem
   - Reads from `meetups.yaml` (note: expects `.yaml` not `.yml`)
   - Extracts slides (SpeakerDeck, SlideShare, Gist) and videos (YouTube)
   - Filters out "Developer Night" and "Hack Night" events
   - Outputs to `clean_meetups.yml`

3. **_data/meetups.yml** - Symlink to `meetup/meetups.yml` for Jekyll consumption

### Frontend Stack
- Bootstrap 5 for styling
- Custom SVG logos for sponsors (Clio, NorthEast, GitHub, Zayzoon)
- Responsive design with mobile-first approach
- Luma calendar integration for upcoming events

### Key Pages
- `index.html` - Homepage with hero, sponsors, stats, and event calendar
- `meetups.html` - Historical meetup listings
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
- `meetups`: Meetup data management
- `sponsors`: Sponsor-related changes
- `content`: Website content updates
- `deps`: Dependency updates

### Examples
```
feat(meetups): add video extraction from Vimeo
fix(sponsors): correct logo alignment on mobile
docs: update README with deployment instructions
chore(deps): update jekyll to 4.3.0
```

## Important Notes
- The transform script expects `meetups.yaml` but the actual file is `meetups.yml` - this inconsistency may cause errors
- Meetup data scripts use inline Gemfiles, separate from main project dependencies
- Sponsor logos are SVG files in `images/sponsors/`
