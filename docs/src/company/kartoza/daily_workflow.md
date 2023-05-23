# Your daily workflow at Kartoza

## Starting your day

The activities for your day are determined by:

1. Which project you are working on, as listed in the company-wide project gantt chart / sheet. Normally we try to have you work on a single project per day to reduce cognative friction as you context switch from one project to another.
2. The scrum board / project board for that day's project. The list of sized tickets should be implemented sequentially, from the top of the 'this sprint' column, down to the bottom.

## Story points

Your issues closed in GH should equate to a day or more (assuming some tasks will be quicker than estimated) of GH issues sizes. Before working on any issue it should be sized. Any issue deemed to be larger than 1 day of work should be split into smaller issues.

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

We run our own timesheet application (thanks Dimas!) at [timesheets.kartoza.com](https://timesheets.kartoza.com/) - and in our ERP Next platform. The timesheets.kartoza.com is preferred since it has many niceties to make your time tracking more efficient. We bill our customers in 15 minute increments, rounded down or up as appropriate. This is aggregated across the day. That means if you e.g. log 2h12 minutes on one cost center for a client and 1h00 minutes on another cost center for the same client, the client will be billed 3h15min for the day's work.

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

Now use the button (1) to pull data from erpnext then the button (2) to return to your timesheet.

![Register Complete](./img/timesheets-harvest.png)

## Additional Guidelines

Developing a project can be a lot of fun and enjoyable to work together to make
something awesome, but we need to do it within the guide rails which we have
laid down:

1. Only work on the project you have allocated in your planning sheet. If you
   need to work on something else, you need to communicate with your project manager and ask
   her to change your planning allocation. Ideally ahead of time, not on the day
   of working.
2. You need to follow the scrum board - the ticket you have chosen in your
   standup is not on the scrum board. That is a complete No-No.
3. You need to work only on tickets you have been assigned - if someone asked
   you to work on #46, you need to ask them to allocate yourself as the
   developer.
4. Before working on any ticket, it needs to be sized. You listed [5] as the
   effort for your ticket in the standup, but your ticket lists [1] as its
   size. If you disagree on the sizing you cannot start to work on the ticket
   before reaching consensus with the technical lead.
5. You need to work only on tickets that are in the 'this sprint' column - you
   currently have only one ticket #57  which is eligible to be worked on. If
   you feel another ticket needs to happen first (e.g. it is a logical dependency)
   then again, you need to have a conversation with the technical lead and ask
   them to update the board to accommodate your requested changes to the plan.
6. When you write that you will work on a ticket of 8 points or less, it needs
   to be done at the end of your workday with a neat  PR referencing the
   ticket, providing testing (both backend and UI), providing a screen grab or
   better, and animated GIF illustrating the work done, passing all coding
   standard checks (pylint / black /pep8 etc.). If at the end of the day you have
   not finished what you committed to then you have taken a wrong turn in your
   workflow - you probably would have realised that you would not finish the task
   at 50% in and you should have raised the issue with your team along with an
   estimate of how much time extra will be needed to resolve. Then you stop
   working on that ticket and work down the sprint board onto the next issue.
7. Basically when you go over your estimate, you are spending either the
   client's money or the Kartoza's profits for the job, neither of which should
   be done without conscious agreement from your team mates.

We really need you to step up and introduce this rigour into your work.  As you
can see in the list above, in no case do we ask you to do anything unreasonable
- we don't ask that you 'grind out' 18 hour days coding and going quietly
insane with stress and pressure - we just want to see work delivered in a
steady, orderly flow so we can predict timelines, make profit, please our
clients and be awesome! So please keep it tight and communicate with your project
manager and technical team lead using the framework above, let us see a PR at
the end of the day (or more if your queue has multiple issues), and take on the
tasks in a respectful, communicative, methodical and conscious manner.  We
promise if you do that, your enjoyment of your work is going to sky rocket and
your rapport and respect of your colleagues will too!
