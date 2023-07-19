# Your daily workflow at Kartoza

## Starting your day

The activities for your day are determined by:

1. Which project you are working on, as listed in the company-wide project planning sheet (discussed under View planning sheet). Normally we try to have you work on a single project per day to reduce cognitive friction as your context switch from one project to another.
2. The scrum board/project board for that day's project. The list of sized tickets should be implemented sequentially, from the top of the 'this sprint' column, down to the bottom.

## Story points

Your issues closed in GH should equate to a day or more (assuming some tasks will be quicker than estimated) of GH issue sizes. Before working on any issue it should be sized. Any issue deemed to be larger than 1 day of work should be split into smaller issues.

## Standups

Your daily stand ups should be written like this:

--------

### Yesterday

**Project: Flux Capacitor Enlargement**

* [Size 4] Closed <https://github.com/fcap/foobar/issues/123> - Add transparency to map
* [Size 4] Closed <https://github.com/fcap/foobar/issues/124> - Add transparency to legend
* [Size 2] WIP <https://github.com/fcap/foobar/issues/125> - Add transparency to widgets

**Project: Kartoza**

* [Size 1] Water cooler - outed @Rudolf as a serial imposter

### Today

**Project: Flux Capacitor Enlargement**

* [Size 8] <https://github.com/fcap/foobar/issues/128> - Render flux capacitor on map

### Blockers

* Waiting for client to respond with clarification request on <https://github.com/fcap/foobar/issues/130>

--------

Here is an example from our Slack of a beautifully presented standup up - yours should look like this too!

![Standup Example](./img/dimas-standup.png)

## Running your timesheets

We run our own timesheet application (thanks Dimas!) at [timesheets.kartoza.com](https://timesheets.kartoza.com/) - and in our ERP Next platform. The timesheets.kartoza.com is preferred since it has many niceties to make your time tracking more efficient. We bill our customers in 15-minute increments, rounded down or up as appropriate. This is aggregated across the day. That means if you e.g. log 2h12 minutes on one cost center for a client and 1h00 minutes on another cost center for the same client, the client will be billed 3h15min for the day's work.

The descriptions in your timesheets should be defensible, terse descriptions of work with links to GitHub issues. Defensible means that if a client were ever to ask you to justify how you spent your time in an invoiced line item, we can refer back to the description and see references to tickets worked on and the story points associated with the work.

**Your timesheets should match the projects planned on the planner sheet.**

## Setting up the timesheet account

Step 1: Go to <https://timesheets.kartoza.com>

Step 2: Choose register to create your account:

![Register](./img/timesheets-register.png)

Step 3: Complete the form to create your account:

![Register Form](./img/timesheets-register-form.png)

Step 4: Use the cog menu to get to the settings panel

![Register Cog](./img/timesheets-register-cog.png)

Go to ERP Next to get your API keys by looking in your user profile e.g.

<https://kartoza.erpnext.com/app/user/YOURUSERNAME%40kartoza.com>

![Register API](./img/timesheets-generate-keys.png)

Back on the timesheets app, in the form that appeared from the cog menu, enter your API key and secret:

![Register API](./img/timesheets-register-api.png)

Now use button (1) to pull data from erpnext then button (2) to return to your timesheet.

![Register Complete](./img/timesheets-harvest.png)

## Completing your timesheet

Once you are logged in, you will see this interface:
![Interface](./img/Timesheet-interface.png)

The **Activity** dropdown has a list of activities, such as meetings, applied GIS work, coding, etc. This is a mandatory field and an option needs to be selected there to describe the type of activity being recorded. 

The **Project** dropdown has a list of ongoing projects at Kartoza. If the activity being recorded is related to Kartoza, such as Admin tasks, or internal meetings such as All Hands meetings then this can be left blank and the system will automatically record it as Kartoza. However, if the task is related to a project, select a project from the dropdown.

The **Task** dropdown has a list of tasks pertaining to specific projects, this differs from project to project since the tasks will be broken down by high-level requirements so if the project requires development there would be a dropdown value 'Development/Implementation' but other projects might not need implementation. If you can't find the specific task you are doing, either look for the list and see what fits it (for example if the task you are recording is to discuss the data model with the client then you can select 'Modelling' from the list instead). However, if a task is crucial and missing from the list, contact Marina.

## View the Planning sheet
The planning sheet shows the schedule for the list of Kartoza members and the projects they are assigned to. This can  be accessed by clicking on the cog menu and selecting 'Planning':
![Register Cog](./img/timesheets-register-cog.png)

Using this, you can see what projects are assigned to you for a specific period. Since projects will include various staff members, you can also find out who else is simultaneously assigned to the project in case you have queries or need to work on a task with someone and need their help.

## View the Burndown chart
The burndown chart provides information on how much time we have left to complete the project, how much time was allocated to a specific project and how much we have exceeded the allocated time if the project is not concluded on the specified deadline. This can  be accessed by clicking on the cog menu and selecting 'Burndown Chart'.
![Register Cog](./img/timesheets-register-cog.png)


