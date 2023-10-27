- https://playwright.dev/python/docs/intro
- End to End software testing
- [[Sep 5th, 2023]]
- Writing tests
	- Starting off!
	- It runs browsers in headless mode
		- Example:
		- ```python
		  from playwright.sync_api import sync_playwright
		  
		  with sync_playwright() as p:
		      browser = p.webkit.launch()
		      page = browser.new_page()
		      page.goto("https://kartoza.com/")
		      page.screenshot(path="kartoza.png")
		      browser.close()
		  ```
		- Returns a screenshot of the webpage.
			- ![image.png](../assets/image_1693922416760_0.png)
			- Image:
			- ![kartoza.png](../assets/kartoza_1693922449062_0.png)
			- headless as false
			- ![image.png](../assets/image_1693922659057_0.png)
			- Here's the preview:
			- ![Peek 2023-09-05 17-05.gif](../assets/Peek_2023-09-05_17-05_1693922774532_0.gif)
			- Test generators
				- ![image.png](../assets/image_1693947365184_0.png)
			- Generated tests:
				- ![image.png](../assets/image_1693947468469_0.png)
			- code:
				- ```python
				  from playwright.sync_api import Playwright, sync_playwright, expect
				  
				  
				  def run(playwright: Playwright) -> None:
				      browser = playwright.chromium.launch(headless=False)
				      context = browser.new_context()
				      page = context.new_page()
				      page.goto("https://kartoza.com/")
				      page.get_by_role("button", name="About").click()
				      page.get_by_role("link", name="About Kartoza").click()
				      page.get_by_role("button", name="About").click()
				      page.get_by_role("link", name="Team").click()
				      page.get_by_role("link", name="Shop").click()
				      page.get_by_role("button", name="Gallery").click()
				      page.get_by_label("Gallery").get_by_role("link", name="Portfolio").click()
				      page.get_by_role("button", name="Gallery").click()
				      page.get_by_role("link", name="Maps").click()
				      page.get_by_role("link", name="Blog").click()
				      page.get_by_role("button", name="Partners").click()
				      page.get_by_role("link", name="Mergin Maps").click()
				      page.goto("https://kartoza.com/contact-us/new")
				      page.get_by_role("link", name="Solutions").click()
				      page.get_by_role("link", name="Courses").click()
				      page.get_by_role("link", name="Login").click()
				      page.get_by_role("textbox", name="Email").click()
				      page.get_by_role("textbox", name="Email").fill("jeff@kartoza.com")
				      page.get_by_placeholder("•••••").click()
				      page.get_by_placeholder("•••••").fill("manjaro*342")
				      page.get_by_role("button", name="Login").click()
				  
				      # ---------------------
				      context.close()
				      browser.close()
				  
				  
				  with sync_playwright() as playwright:
				      run(playwright)
				  
				  ```
- [[Sep 6th, 2023]]
	-