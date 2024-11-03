

## Development Lifecycle Overview

The following steps outline the general development workflow when contributing to a Kartoza project. These practices ensure code consistency, maintainability, and alignment with project conventions and standards.


```mermaid
graph TD
    A[Receive Project Repository Link] --> B[Clone the Project Locally]
    B --> C[Set Up the Project]
    C --> D[Configure Environment Variables]
    D --> E[Run the Project Locally]
    E --> F[Develop New Features or Fix Bugs]
    F --> G[Write and Update Tests (If Applicable)]
    G --> H[Code Formatting and Standards]
    H --> I[Create a New Branch for Your Changes]
    I --> J[Push Changes to the Remote Repository]
    J --> K[Open a Pull Request (PR)]
```


1. **Receive Project Repository Link**  
   Developers are provided with a GitHub repository link for the project they will be working on.

2. **Clone the Project Locally**  
   Use Git to clone the project repository to your local machine:
   ```bash
   git clone <repository-link>
   ```

3. **Set Up the Project**  
   After cloning, follow the installation instructions available in the README file to set up dependencies, tools, and the environment.

4. **Configure Environment Variables**  
   Adjust the environment variables in `.env` or as instructed in the documentation to ensure proper configuration for local development.

5. **Run the Project Locally**  
   Start the project to confirm that it runs as expected in your local environment.

6. **Develop New Features or Fix Bugs**  
   Identify the feature or bug you will be working on and make the necessary code changes. Ensure these changes align with project goals and specifications. You might also want to refer to [Coding Standards](./conventions/coding_standards.md) during the development process.

7. **Write and Update Tests (If Applicable)**  
   If tests are available, add or update tests to verify that your changes are working as expected. This helps maintain stability and reliability.

8. **Code Formatting and Standards**  
   Follow PEP 8 (or other specified code style guidelines) to ensure code quality and readability. Use a linter or code formatter to assist with this step.

9. **Create a New Branch for Your Changes**  
   Use Git to create a new branch specific to the feature or bug fix:
   ```bash
   git checkout -b <branch-name>
   ```

   [Git](./conventions/git.md)

10. **Push Changes to the Remote Repository**  
    Push your branch to the remote repository on GitHub:
    ```bash
    git push origin <branch-name>
    ```

11. **Open a Pull Request (PR)**  
    Open a pull request for your branch, describing the changes made. This PR will be reviewed by other team members to ensure code quality and alignment with project requirements. Attach screenshots to the pull request if applicable to show proof of work.

### Important Notes
- **Security**: All users, regardless of role, should understand and review the [Security](../devops/security/index.md) section.
- **Consistency with Client Conventions**: Kartoza projects may involve existing tools, codebases, or conventions from other organizations. Follow these practices for consistency with team standards and client expectations.

Kartoza is a consulting and development firm that values consistent, maintainable practices across projects. This documentation outlines the processes to maintain uniformity within the team. Where beneficial conventions are not in place within a client’s project, we may suggest adopting these standards for overall project quality.

