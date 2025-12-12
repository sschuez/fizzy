# Fork Maintenance Guide

This is a fork of [basecamp/fizzy](https://github.com/basecamp/fizzy).

## Branch Strategy

| Branch   | Purpose                                      |
|----------|----------------------------------------------|
| `main`   | Clean mirror of basecamp/fizzy - never commit here |
| `custom` | Your customizations - deploy from this branch |

## Remotes

| Remote     | Repository                              |
|------------|----------------------------------------|
| `origin`   | Your fork (sschuez/fizzy)              |
| `upstream` | Original repo (basecamp/fizzy)         |

## Syncing with Upstream

When basecamp releases updates, run these commands:

```bash
# 1. Update your main branch
git checkout main
git fetch upstream
git merge upstream/main
git push origin main

# 2. Merge updates into your custom branch
git checkout custom
git merge main
git push origin custom
```

If there are merge conflicts in step 2, resolve them and commit:

```bash
# After resolving conflicts
git add .
git commit -m "Merge upstream updates"
git push origin custom
```

## Quick Reference

```bash
# Check which branch you're on
git branch

# Switch branches
git checkout main      # go to main
git checkout custom    # go to custom

# See remote configuration
git remote -v
```

## Deploying

Always deploy from the `custom` branch - this contains basecamp's code plus your customizations.

## Making Customizations

1. Make sure you're on the `custom` branch: `git checkout custom`
2. Make your changes
3. Commit and push: `git add . && git commit -m "Your message" && git push`

Never commit directly to `main` - keep it as a clean sync point with upstream.
