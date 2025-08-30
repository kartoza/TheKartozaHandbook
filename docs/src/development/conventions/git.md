
## Git Conventions

Following a consistent Git workflow is essential for ensuring project clarity and maintaining code quality. Here are some conventions and tools recommended for managing code changes, collaborating with team members, and improving overall workflow efficiency.

1. **Branching Strategy**
   - **Create Separate Branches for Each Feature or Bug Fix**: Start a new branch for each new feature, bug fix, or task. This keeps changes isolated and organized, making it easier to track work and manage pull requests.
   - **Use Descriptive Branch Names**: Branch names should be concise but informative, describing the purpose of the branch. Common conventions include:
     - `feature/<feature-name>` for new features
     - `bugfix/<issue-description>` for bug fixes
     - `hotfix/<urgent-fix>` for critical patches
   - Example:
     ```bash
     git checkout -b feature/add-user-authentication
     ```

2. **Commit Message Conventions**
   - **Keep Commit Messages Simple and Informative**: Each commit message should describe the changes made in that commit. Standard prefixes are used to provide context:
     - `feat: <message>` - for a new feature
     - `fix: <message>` - for a bug fix
     - `patch: <message>` - for small changes or patches
     - `refactor: <message>` - for refactoring code without changing functionality
     - `docs: <message>` - for documentation updates
     - `test: <message>` - for test-related updates
   - Example:
     ```bash
     git commit -m "feat: add login form and authentication handling"
     ```

3. **Avoid Too Many Commits in a PR**
   - Try to group related changes together and avoid committing excessively within a single pull request (PR). Each PR should have a manageable set of commits to make it easier to review. If you accumulate too many commits, consider squashing them into meaningful commits before opening the PR.
   - However, if necessary, don’t compromise clarity just to reduce commits—clear, granular commits are more important than quantity.

4. **Use GitLens for Visual Studio Code**
   - GitLens is a powerful Git extension for Visual Studio Code that enhances the Git experience by displaying history, blame annotations, and more. It’s highly recommended for tracking changes and understanding code history effectively.
   - Install it via VS Code's extension manager for easier navigation and insight into code changes.

5. **Standard Tools and Processes**
   - **Pre-Commit Hooks**: Use pre-commit hooks to automatically run checks (e.g., linting, testing, or formatting) before commits are accepted. This helps catch issues early in the process.
     - Example: You can set up a hook to run `black` (for Python) or `eslint` (for JavaScript) on staged files.
   - **Git Workflows**: Consider using GitFlow or GitHub Flow for managing branches and releases in a structured way. 
     - **GitFlow**: A branching model for larger projects, organizing development into feature, release, and hotfix branches.
     - **GitHub Flow**: A simplified workflow ideal for small teams or continuous deployment setups, usually with a single main branch and feature branches.
   - **Continuous Integration (CI)**: Set up CI pipelines (e.g., GitHub Actions, Jenkins) to automatically run tests and code quality checks whenever new code is pushed or a pull request is opened.
   - **Code Review Workflow**: Ensure all PRs undergo a code review. This practice encourages knowledge sharing and improves code quality through constructive feedback.

6. **Additional Tips**
   - **Rebase Before Merging**: Rebase your branch with the latest changes from the main branch to keep history clean and avoid merge conflicts.
   - **Squash Commits**: If you end up with multiple minor commits (e.g., typo fixes, small adjustments), squash them into meaningful chunks before merging to keep the commit history concise.

By following these conventions and utilizing the suggested tools, the development process remains streamlined and efficient, facilitating collaboration and code consistency across the team.

