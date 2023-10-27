- [Behave](https://behave.readthedocs.io/en/latest/)
- # Behaviour driven development
	- Agile software development technique.
- Simple video explanation:
	- {{video https://www.youtube.com/watch?v=ydddSkVz_a8}}
	- What is BDD?
		- {{video https://www.youtube.com/watch?v=zYj70EsD7uI}}
		-
	- On TDD vs BDD below:
	- {{video https://www.youtube.com/watch?v=Bq_oz7nCNUA}}
	- From Test suite being a specification to a test being a scenario. `Given` some starting conditions, `when` an action occurs `then` we expect some results.
	- ![image.png](../assets/image_1693828846690_0.png)
	- ![image.png](../assets/image_1693829396192_0.png)
- BDD philosophy is quite interesting.
	- https://behave.readthedocs.io/en/latest/philosophy/
	- ![image.png](../assets/image_1693831905074_0.png)
- Behave installation:
	- Created a new conda environment:
		- ```bash
		  conda create -n testing python
		  ```
	- Installed `behave` using pip
		- ```bash
		  pip install behave
		  ```
- Started the [tutorial](https://behave.readthedocs.io/en/latest/tutorial/):
	- Make `features` directory
	- Make `tutorial.feature` file inside `features` directory
		- Copy sample feature scenarios to `tutorial.feature`:
			- ```Gherkin
			  Feature: showing off behave
			  
			    Scenario: run a simple test
			       Given we have behave installed
			        When we implement a test
			        Then behave will test it for us!
			  ```
	- Make a new directory `features/steps` and create `tutorial.py` file:
		- Copy  below code:
			- ```python
			  from behave import *
			  
			  @given('we have behave installed')
			  def step_impl(context):
			      pass
			  
			  @when('we implement a test')
			  def step_impl(context):
			      assert True is not False
			  
			  @then('behave will test it for us!')
			  def step_impl(context):
			      assert context.failed is False
			  ```
	- Run code in the directory:
		- ```bash 
		  $ behave
		  ```
	- Results:
		- ![image.png](../assets/image_1693835563204_0.png)
		-
- [[Sep 5th, 2023]]
- ## Feature Testing Setup
	- ![image.png](../assets/image_1693904513060_0.png)
	  id:: 64f6ee42-59fb-45f9-89d6-0dcd46f47b74
- ## Gherkin Feature Testing language
	- Features are made up of scenarios:
	- ```Gherkin
	  Feature: feature name
	  
	    Scenario: some scenario
	      Given some condition
	       Then some result is expected.
	  ```
- Tag expressions
- ## Django test integration
	- There are two projects tha integrate django and behave:
		- [django-behave](https://github.com/django-behave/django-behave/blob/master/README.md#how-to-use)
		- [behave-django](https://behave-django.readthedocs.io/en/latest/installation.html)
			- ![image.png](../assets/image_1693912799306_0.png)
	- Testing out behave_django
		- forked the repo
		- cloned it locally
		- Install packages listed in `requiremnts.txt`
		- On first run:
			- ```bash
			  python manage.py behave
			  ```
			- Error:
				- ![image.png](../assets/image_1693916558711_0.png)
			- Uninstall previous `behave` package
				- ![image.png](../assets/image_1693916488946_0.png)
			- Installed behave again
				- ![image.png](../assets/image_1693917836549_0.png)
			- Created a configuration file for complex projects
				- https://behave-django.readthedocs.io/en/latest/configuration.html
				- ![image.png](../assets/image_1693917729904_0.png)
			- The checks run:
			- ![image.png](../assets/image_1693918102371_0.png)
			-
- [[Sep 8th, 2023]]
- ## Fixtures in behave
- so set up a test-scope at the beginning of the test
- so clean up a test-scope at the end of the test
- Two ways to use it in a feature file
	- First option: In a feature - line 4
	- ```Gherkin
	  # -- FILE: features/use_fixture1.feature
	  Feature: Use Fixture on Scenario Level
	  
	      @fixture.browser.firefox
	      Scenario: Use Web Browser Firefox
	          Given I load web page "https://somewhere.web"
	          ...
	      # -- AFTER-SCENARIO: Cleanup fixture.browser.firefox
	  ```
	- Second option: Global - line 2
	- ```Gherkin
	  # -- FILE: features/use_fixture2.feature
	  @fixture.browser.firefox
	  Feature: Use Fixture on Feature Level
	  
	      Scenario: Use Web Browser Firefox
	          Given I load web page "https://somewhere.web"
	          ...
	  
	      Scenario: Another Browser Test
	          ...
	  
	  # -- AFTER-FEATURE: Cleanup fixture.browser.firefox
	  ```
- behave django
	- {{video https://youtu.be/0XUr1mXGRbk?si=rilejyAl8XkUST6S}}
	-
- [[Sep 11th, 2023]]
- I am working on django_behave. Integrating it to a django project.
	- 1️⃣ Navigated to my app, `farms`, directory.
	- 2️⃣ Created a `feature` directory then I created a `feature/test` directory
	- 3️⃣ In the feature directory, I created a `test.feature` file
		- ![image.png](../assets/image_1694429662277_0.png)
	- 4️⃣ Contents of the `test.feature` file
		- ```Gherkin
		  Feature: testing website navigation
		  
		    Scenario: navigating to admin page
		      Given user is on home page
		      When user clicks on link
		      Then point of interest page loads
		  ```
	- 5️⃣ Under `feature/steps` directory, I created a `test.py` file
		- ```python
		  from behave import given, when, then, use_step_matcher
		  from selenium import webdriver
		  from selenium.webdriver.common.by import By
		  from selenium.webdriver.firefox.options import Options
		  
		  use_step_matcher("re")
		  
		  
		  @given("user is on home page")
		  def step_iml(context):
		      firefox_options = Options()
		      firefox_options.add_argument("--headless")
		      context.selenium = webdriver.Firefox(options=firefox_options)
		  
		      # login to admin panel
		      context.selenium.get(f"http://127.0.0.1:8000/admin/")
		  
		      # fill in login information
		      username = context.selenium.find_element(By.ID, 'id_username')
		      username.send_keys("jeff")
		      password = context.selenium.find_element(By.ID, 'id_password')
		      password.send_keys("jeff123")
		  
		      # locate login button and click on it
		      context.selenium.find_element(By.XPATH, '//input[@value="Log in"]').click()
		  
		      # Assert that the title matches the expected title
		      expected_title = "Site administration | Django site admin"
		      assert context.selenium.title == expected_title
		  
		  
		  @when("user clicks on link")
		  def step_iml(context):
		      # response = context.client.get("/point_of_interest/")
		      # assert response.status_code == 200
		      pass
		  
		  
		  @then("point of interest page loads")
		  def step_iml(context):
		      # assert "point_of_interest" in context.response.decode()
		      pass
		  
		  ```
		- On running `behave`:
			- ![image.png](../assets/image_1694436710498_0.png)
	- 6️⃣ Major update on the setup
		- Update on `test.feature` file
		- ```gherkin
		  Feature: testing website navigation
		  
		    Scenario: logging into admin page
		      Given user is on 'Admin Log in page'
		      When user clicks on 'Log in'
		      Then page is 'Admin page'
		  ```
		- The script:
		- ```python
		  from behave import given, when, then, use_step_matcher
		  from selenium import webdriver
		  from selenium.webdriver.common.by import By
		  from selenium.webdriver.firefox.options import Options
		  
		  # uses regex to match
		  use_step_matcher("re")
		  
		  # global variables
		  firefox_options = Options()
		  firefox_options.add_argument("--headless")
		  
		  
		  @given("user is on 'Admin Log in page'")
		  def step_iml(context):
		      context.selenium = webdriver.Firefox(options=firefox_options)
		      # login to admin panel
		      context.selenium.get(f"http://127.0.0.1:8000/admin/")
		  
		  
		  @when("user clicks on 'Log in'")
		  def step_iml(context):
		      # fill in login information
		      username = context.selenium.find_element(By.ID, 'id_username')
		      username.send_keys("jeff")
		      password = context.selenium.find_element(By.ID, 'id_password')
		      password.send_keys("jeff123")
		  
		      # locate login button and click on it
		      context.selenium.find_element(By.XPATH, '//input[@value="Log in"]').click()
		  
		  
		  @then("page is 'Admin page'")
		  def step_iml(context):
		      # Assert that the title matches the expected title
		      expected_title = "Site administration | Django site admin"
		      assert context.selenium.title == expected_title
		  
		  ```
		- Test results:
		- ![image.png](../assets/image_1694440812710_0.png)
- [[Sep 12th, 2023]]
- Results
- ![image.png](../assets/image_1694524513201_0.png)
-