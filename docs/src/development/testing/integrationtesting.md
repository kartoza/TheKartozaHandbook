# Integration testing

Tests how multiple units operate together.

It aims to uncover defects that may arise at the interfaces between these interconnected parts, ensuring seamless data flow and functionality across the entire system.

**NOTE**: It occurs after [unit testing](tdd.md) and just before [system testing](systemtesting.md).

## Types of integration testing

- Big bang integration testing
- Incremental integration testing

### Big bang integration testing

All modules are integrated simultaneously and tested as a whole.

### Incremental integration testing

Modules are integrated and tested in smaller increments or groups.

Subtypes include:

- `Top-down integration`:
Start with high-level modules and work downward.
- `Bottom-up integration`:
Start with low-level modules and work upward.
- `Sandwich/Hybrid integration`:
Combine top-down and bottom-up approaches.

## Test cases

- `Verification of Navigation Flow`:
Test that clicking on a link/button on the landing page redirects the user to the correct section/page (e.g., navigation from landing to product details).

- `Data Exchange Between Components`:
Verify that data entered on the login page is correctly passed to the user authentication module and that the user is redirected to the appropriate dashboard.

- `Testing External Service Integration`:
If the application interacts with external services.

- `Testing API Integrations`:
If the application uses APIs, test that data is correctly exchanged between the frontend and backend APIs. Verify that the API responses are processed appropriately and displayed on the user interface.

- `Verification of Error Handling`:
Test error scenarios, such as entering incorrect login credentials, and confirm that error messages are displayed correctly without affecting the overall application.

- `Testing Concurrent User Actions`:
Simulate scenarios where multiple users interact with the application simultaneously (e.g. updating profiles) to ensure that data integrity is maintained.

- `Integration with Third-Party Plugins`:
If the application relies on third-party plugins or modules, verify that the integration is seamless, and functionalities provided by these plugins work as expected.

- `Verification of User Roles`:
Test scenarios involving different user roles (e.g., admin, regular user) to ensure that each role has the appropriate access permissions and functionalities.

- `Testing Session Management`:
Verify that user sessions are managed correctly, and actions performed in one session do not impact the state of other user sessions.

- `Testing Cross-Browser Compatibility`:
Ensure that the integration works consistently across different web browsers, confirming that users have a similar experience regardless of the browser they use.
    
- `Verification of Database Integrity`:
Check that changes made through the user interface (e.g., updating profile information) are accurately reflected in the underlying database.
