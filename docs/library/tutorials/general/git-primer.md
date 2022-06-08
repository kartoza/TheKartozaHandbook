# Git Primer

This tutorial will show you how to use Git to safely implement new features or changes into a project, without any risk of adversely affecting the primary code base, or main branch. We will cover some concepts about git and version control systems to allow suers to get up to speed quickly and start contributing straight away.

## Basic branching in Git

A key function of Git is to function as a "distributed version control system", which means that it can be used to track changes in a project across multiple developers. Centralised version control systems typically require an individual to "check out" and "lock" a resource while it is under development, and then "check in" the changes when the resource is ready to be released. By contrast, distributed version control allows multiple  to "fork" an existing set of resources, and then track backwards through the commit history to see what changes have been made to the resource. A key element of git is "forking" and manipulation of "branches".

> Note that this tutorial assumes that users already have a git project setup and ready to use. If you need assistance getting setup, review other resources for [Getting started with Git and GitHub](https://docs.github.com/en/get-started/getting-started-with-git), [setting up projects on GitLab](https://docs.gitlab.com/ee/user/project/working_with_projects.html), [migrating existing projects](https://about.gitlab.com/community/moving-to-gitlab/), or simply run `git init` in a project directory to get going quickly.

## Monitoring Change in Git

Git is a version control system, but its mechanism of operation relies on the process of _tracking changes_. You could even think of Git primarily as a change monitoring tool, which has a whole host of additional features which make use of the metadata collected during the monitoring operation to provide sophisticated distributed version control.

With every new commit, or collection of changes, git collects the differences between the previous commit and the current one, along with some additional metadata. Each commit has a signature, or hash, uniquely identifying it. Later on, this signature can be used to reference the commit and even check for differences between specified commits.

## Committing Code

As highlighted above, Git is a change monitoring tool, but it also needs to be told what files to track the changes on.

By default, git won't track changes to any files. Using `git add filename` will add the file to the "staging" area, and `git commit -m "message"` will commit the collection of staged changes to the currently active branch in the repository.

In cases where more than one file needs to be added, using a space separated list of files, such as `git add file1.ext file2.ext` will add all listed files to the staging area.

To add all files (not matched by [.gitignore](https://git-scm.com/docs/gitignore)) to the staging area at once, simply use `git add -A`.

## Git Branches

Commits track these changes in sequence to each other. This is what enables git as such a powerful method of _distributed_ version control, and can also be effectively leveraged to provide a method of _branching_, whereby certain changes are developed in isolation to the rest of the project.

Git uses branches by default, although new projects are simply created with a single default, or _main_, branch.

![git single branch](https://user-images.githubusercontent.com/64078329/170365261-2591c4a6-029d-4f1f-a1eb-5c3c39f6a330.png)

_A chain of commits in a single branch Repository_

## Creating Branches

Creating a new branch can be done with the command `git checkout -b branch-name`. The `-b`, or branch, flag indicates that git should create a new branch with the specified name. The base commit of the branch will simply reference the currently active HEAD commit. Future commits to the main branch will no longer affect the new branch.

![git branch reference](https://user-images.githubusercontent.com/64078329/170365213-de055b5c-bdca-4a3f-ad1c-5dc48c44ccd4.png)

_A new git branch is simply creating a "forked" chain, using a specific commit record as the base_

![git commit to branch](https://user-images.githubusercontent.com/64078329/170365196-60aa2ced-4d00-400c-9f26-54568d95ee95.png)

_Performing a git commit with a new branch checked out creates a distinct history from parallel branches_

This should clearly illustrate how branches keep changes isolated between them, allowing changes to be made to the code without affecting the other branches.

## Viewing Branches

Checking the available branches in a repository is as simple as `git branch`, which will print out a list of available branches and indicate the active branch with an asterisk.

![GitHub Repo Branches](https://user-images.githubusercontent.com/64078329/170366715-d9564004-53b0-4dd5-8a6e-5c5009ec5eee.png)

_GitHub provides a drop-down menu with the available branches_

![GitHub Branch URL](https://user-images.githubusercontent.com/64078329/170366757-a2890ef8-037b-4dca-9d51-15e4b0cc8322.png)

_Branches and resources within branches can also be accessed via URL_

## Changing Branches

Commits and other git commands are typically going to be executed on the active branch.

To switch between branches, simply use `git checkout branch-name`.

In some cases, you may have uncommitted changes which may get lost when switching between branches. To prevent data loss in these instances, git includes the [stash](https://www.git-scm.com/docs/git-stash) feature.

## And then some

Git is incredibly powerful (and as a result, rather complex). A common use case, however, might be the merging of changes from a branch back into the main branch of the project. The `git merge` command is designed for exactly this, and it's typical usage follows a simple workflow.

Simply switch the active branch to the branch it is desired that the changes are merged into, e.g. `git checkout main`

Then use `git merge branch-name` to merge the changes from branch-name into the main branch.

Git supports multiple branches, and creating branches from other branches, so it's perfectly feasible that some long lived branches might be kept around for certain purposes, whilst others are merged into other branches, and then discarded.

![simple git overview](https://user-images.githubusercontent.com/64078329/170365375-a6c86697-a84b-4c79-afc1-31d64ddc574d.png)

_A Git repository might include feature branches kept in isolation, or it may merge changes from a branch back into the main branch_

The "HEAD" reference in git is simply pointing to a specific commit, which will often be designated to the currently active branch.

There's all sorts of advanced functionality available for managing the repository, such as remote repository management, cherry picking, and history modifications... but very often users simply need a way to manage simple changes in an isolated manner, and branches are a great way to do that.

For the more advanced functionalities, [additional tools](https://about.gitlab.com/) can help simplify the management and deployment of Git repositories.

## Conflict resolution, Rebase, History, Squashing, and Stashing

These are terms for all that "advanced functionality" that was just mentioned.

When merging changes from one branch into another, or switching between branches with committed and uncommitted changes, there are a number of scenarios which can occur. This introduces a plethora of git functionalities (and jargon) which give git it's superpowered reputation and a fair number of jokes about it's complexity.

For the most part, however, the concepts are actually simple... it's the execution that can be complicated. Over the years, many tools and platforms have produced more efficient ways to handle these scenarios in efficient and reliable ways, so they're less of a pain point, but we'll cover them here at a high level so that when they are encountered, you'll know what to do with them 😉.

If multiple individuals make changes to the same file, in the same place, a conflict can occur - that means that git cannot automatically resolve what the correct code is that should be injected into the resource, and manual conflict resolution must be done where a developer tells git which lines to keep, which to remove, and which to add to a new commit to patch things up to standard again.

Sometimes a new set of features should be "rebased" - that is switching the "base commit" that it was forked from (often to the most recent main commit), and the developer can resolve any minor conflicts before asking for a code review from upstream developers etc. It's also capable of doing this in an interactive way, allowing developers to pick which commmits to keep when you have a git history full of noise, mistakes or other issues. There are also a great many ways to rewrite, or even migrate, git history... Remember that git tracks _changes_, which can, in fact, lead to bloat.

Another way to clean up the history is to "squash" commits - so noisy or erroneous changes can be excluded from the history. This often makes things easier for reviewers to understand and cleans up bloat.

Finally, git has a feature called "stashing" which allows developers to temporarily store changes in a "stash" before committing them to git. This is useful when a developer is working on changes that are not ready for committing, and needs to be able to revert to a previous state, change branches, or pull new commits from the upstream repository into their current branch. Essentially the "stash" is a kind of temporary or background commit that does not form a part of the git history, and allows users to avoid conflicts and prevent data loss.

## Releasing Changes

Once you have your changes committed to your branch, you can create a "featured checkpoint" in your project using a git [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) with the `-a` flag to add an annotation.

```shell
git tag -a v0.1-my-changes -m "my changes for v0.1"
```

On existing projects, you may want to review the available tags for a project using `git tag -l` before you decide on a tagging convention.

Of course tags will only make the source code available to other developers, but a more sophisticated method of distributing your changes would be to create a [release](https://docs.gitlab.com/ee/user/project/releases/#create-a-release) which might include compiled assets.

If you're eager to get started with Git, be sure to [check out](https://github.com/trending) what [others are building](https://gitlab.com/explore/), or [contribute to ongoing open source initiatives](https://opensource.guide/how-to-contribute/).

## PRs, MRs, Issues, Releases, Packages, CI/CD, and GitOp(tion)s Galore

Git itself is a version control utility... and a really great one at that. What it doesn't do are things like project management, issue tracking, bug reports, file distribution and more. There are, however, a lot of platforms that fill this gap and offer a great suite of tools for managing and deploying Git repositories alongside these other features, like GitHub, GitLab, BitBucket, or even self hosted systems like Gitea.

The key elements are the "Pull Requests" and "Merge Requests". These are essentially the same thing conceptually - You are flagging to the "upstream" repository managers that you originally forked from that you have changes which you believe would be beneficial to integrate into another branch of the repository. Platforms like GitHub say "Pull Request", because the first action you would perform would be to get your changes pulled into the upstream repository. Platforms like GitLab say "Merge Request", because the last action you would perform would be to merge these changes into the upstream branch (typically the default branch of _main_ or _develop_, but various workflows exist for feature branches and more).

## TL;DR

Git commandline seem a bit confusing for you? Good news is once you understand _what_ it's doing under the hood, _how_ you get it done should be less of an issue. I definitely recommend the super-duper-next-level-ultra-awesome [GitLens for VSCode](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens).

## Conclusion

What? You made it to the end? I don't believe you I think you cheated and skipped the rest of the content. But if you really did make it all the way here from start to finish I am very proud. You deserve a present. Here, have a carrot... 🥕
