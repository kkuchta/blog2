---
layout: post
title: Startup technical choices that I endorse or regret
---

One of the coolest things about working at a tiny startup is getting to make foundational technical decisions and seeing how they play out.  A couple years in startup time is <s>as long as a life-age of the earth</s> like a decade in normal business time.  It lets you get feedback on how those decisions worked out as the company + team scale.

I was the first eng hire at Daybreak Health. 3 years later I was managing a team of 8 in a 70-person company.  Here are the decisions I'm glad of and here are the ones I regret.

<!--break-->

Credit to [this great post by Jack Lindamood](https://cep.dev/posts/every-infrastructure-decision-i-endorse-or-regret-after-4-years-running-infrastructure-at-a-startup/) for inspiring this format.

## Context
To give you a feel for the situation: I created and architected our SPA web frontend from scratch in my first couple weeks after joining Daybreak in 2021.  By "from scratch," I mean I did everything from initializing the git repo onward.  I later took ownership over our React Native mobile app.  And while I was the frontend lead, there was also a ton of work to do in the Rails backend, so I spent 30-40% of my time on that as well.  As such, most of the below decisions were mine to make for better or worse.

## Choosing React: Endorse
Having gone through the age of [React](https://react.dev/), then Angular before that, then Bootstrap before that, then "Jquery Soup" before that... I'm a little wary of betting on a frontend framework and watching it die.  Thankfully, even by 2021 it was clear that React had more staying power than its predecessors.  There were competitors like Vue, but I had React experience and it seemed like React was the safest bet for community longevity.  3 years later, I'd say that worked out well.  We had no trouble hiring for React experience, the React community has only grown, and React is still top dog in the frontend world.  Looking forward, I'd make that bet again today.

## Choosing Tanstack Query for state management: Endorse
For most non-trivial React apps you need something to manage state or data that more than one component needs to read or write.  In 2021, Redux was the popular solution for this.  Redux is, at its core, a pretty simple pub-sub system – something I've always appreciated about it.  However, in my experience, to actually build anything *useful* with Redux, you need to build a pretty heavy abstraction layer on top of it.  And since everyone builds this abstraction layer differently, actually *using* Redux is pretty complicated.

Thankfully, it turns out that the overwhelming majority of state in a lot of frontend codebases is "data we just received from an api call to a server." [Tanstack Query](https://tanstack.com/query/latest) (formerly React Query) is a tool explicitly for managing that kind of state, and it does it *really* well.  My plan for Daybreak's frontend state management was "use TanstackQuery for api state and use a simple React Context for any remaining pieces of global state." In practice, we had exactly one piece of non-tanstackquery global state ever, so this worked out well.

There *was* a medium learning curve as new developers onboarded to our state management system.  Probably less than if we'd used Redux, though.  I *did* put a very thin wrapper around Tanstack Query to make it automatically implement some of our api handling (deserialization, error handling, metadata handling, etc); in retrospect I'd make that wrapper even *thinner*, such that our engineers were directly calling Tanstack Query functions (`useQuery` and `useMutation`) in their components.

## Choosing Typescript: Mostly Endorse
Bias warning: I'm a [Typescript](https://www.typescriptlang.org/) convert.  Despite being a [long-time rubyist](/talks), I've fallen in love with Typescript and [know its ins and outs pretty well](https://github.com/kkuchta/TSpell).  As such, it was an obvious choice for me.  Did it pay off?

During the early period where I was working on the frontend alone: it definitely did. You can find a better-written defense of typed languages elsewhere, but I found it made refactoring easy, made changes much safer, made catching minor bugs faster, and powered truly excellent autocomplete.  The setup time (hooking it into VS Code and our CI/CD) was half a day, and then the ongoing cost of adding type annotations where needed was near trivial.  I probably spent an hour lost in a type puzzle once every 1-2 months, but that was easily made up for in other time savings.

When other devs joined the codebase, though, the cost of Typescript went up.  To be clear: these were smart, capable, fullstack developers. But each had only a passing familiarity with Typescript to start.  Since Typescript is, in some sense, a tool that does nothing but tell you "no," it's a frustrating experience trying to work in a large, typed codebase if you don't have pretty solid Typescript experience.  They ran into problems understanding TS errors (very fair), understanding more complex type features (eg type generics), and knowing where it was/wasn't acceptable to cut type safety with `any` and `as`.

Doing it again, I'd do two things differently:
1. Encourage everyone working the codebase on non-trivial features take a mid-level Typescript course.  Maybe [ExecuteProgram's "Everyday Typescript" program](https://www.executeprogram.com/courses/everyday-typescript) or something similar.
2. Avoid complex types, even in library code.  I *really* like having as-complete-as-possible type safety throughout the app, from UI to api requests, but in practice it meant other devs had a hard time tracing through the library code I wrote.  I might adjust this opinion with a team of more frontend-focused engineers, but it represented an unacceptable cost on a team of fullstack engineers.

## Setting up Frontend Visual Diff Testing: Endorse
In my experience, your testing strategy is something you have to set up from day one in a tiny startup.  There's never going to be time to go in and add a full suite of tests to a mature codebase, but there *can* be time to add tests for each new feature to an already-tested codebase, especially if the policy is "we always add tests of <some specific kind> as a standard part of writing features."

With that in mind, I decided that our frontend quality assurance would come largely from Typescript and visual diff tests.  For the latter, we used [Storybook](https://storybook.js.org/) such that every react component in the app could be viewed independently of anything else (this was also a nice devex improvement).  We then used a hosted service called [Chromatic](https://www.chromatic.com/) which rendered all our components in Storybook and compared the results between commits as part of our CI process.  This meant that if a frontend change caused some bit of UI in some random corner of the site to change height/color/font/whatever, it'd show up as a failing check on the relevant github PR.  Then someone would go into chromatic, review the changed UI, and mark that change as "yep, I did actually mean to change that."

Visual diff testing caught a number of small regressions over the years and was relatively non-flakey.  More importantly, though, it gave us a *ton* of certainty when making refactors or ripping out unused code: if the visual diffs haven't changed and typescript still type-checks cleanly, we can be very sure nothing weird broke.

## Auth0 for Authentication: Regret
Auth is the same everywhere, so why not just use an off-the-shelf auth thing?  We used [Auth0](https://auth0.com/) and it was a pain in the butt.

On one hand, it gave us some nice features out of the box that we would have had to build ourselves: social login with google, SAML integration with Salesforce, some nice access logging, and team/access management for our internal users.

On the other hand, it really tied us down in terms of user experience:
- The login flow that Auth0 *heavily* steers you towards means that users are redirected off your site, to Auth0, then back again.  You have pretty minimal control over what that UI flow looks like and how it behaves, which made it nearly impossible to do anything when end users were confused by that UI.
- Auth0 has its own concept of "users" and it didn't *always* match up with our own.  If a new user successfully signed up in the Auth0 UI, but failed to provision in our system, they'd end up in a weird state thereafter where login would *half* work.
- The fact that you could log in via "login with google" as 'example@gmail.com' *or* "login with username/password" as 'example@gmail.com" and those were two separate users in auth0's system was a source of endless confusion to a number of our less technical users.  They often wouldn't remember which one they used when they signed up several weeks ago.

Throw in the fact that Auth0's frontend SDKs were A) immature and B) regularly being replaced and I ultimately would not recommend it again.

I'm not sure what I *would* recommend at this point, to be frank.  Spend the time to build your login/signup from scratch like your noble forbearers?  Try your luck with Okta (which now owns Auth0 anyway), Cognito, or one of the other misc services?  I dunno at this point.

## Heroku for Rails Hosting: Endorse, I guess.

Heroku's still nice and easy for hosting a rails app, a postgres database, and a redis install.  It's got some nice, easy addons for when you have random other needs.  It's been that way for the last decade and hopefully it will continue to be.  It's fine.  It gets expensive, but by the time you get there, you can hire a devops person to run your stuff in AWS.

I've heard good things about [render.com](https://render.com) and [fly.io](https://fly.io) as heroku replacements and might try one of those at some point, but I'd probably start a new startup on Heroku unless I had a strong, idiosyncratic need.

## Netlify for Frontend Hosting: Endorse
Sure, you can host your frontend on pretty much anything- flat files are easy.  Just throw them on S3!  But you probably also want a CDN to speed things up, so I guess you want to set up Cloudfront or similar on top of that.  And you probably want SSL, so you'll need something to provide that (maybe ACM if you're all-in on AWS).  And then you need to actually build your frontend somewhere (once having devs create the production frontend builds on their dev machines becomes too much of a pain), so maybe set up a service for that?  And it'd be nice to have a git-based deploy flow, so I suppose you can use github actions or something for that.  And then maybe you want more granular deploy permissions, asset header overrides, deploy audit logging, multiple environments, per-PR deployments...

It turns out you *can* host flat files anywhere, but there are a bunch of small quality-of-life improvements that are super handy for actually managing + deploying a frontend codebase.

I've switched to using Netlify for all my frontends (including this blog, as of 2024).  It has all those niceties at a pretty cheap price with a UI that's straightforward (while still being solidly aimed at technical users). I worry that they're drifting towards trying to become a more all-encompassing PaaS (as opposed to being "the one really good frontend PaaS), but for now I'd definitely pick them again for a new startup.

## Building Impersonation Functionality: Endorse
At every startup I've been at, we've run into the problem where a users report bugs with insufficient detail to understand what's happening.  And every time, we think to ourselves: "it sure would be great to have some way to see what the user's seeing!" And then we decide that's a lot of work and go back to debugging by pouring through logs + analytics events.

At Daybreak, after about a year, we built an "impersonation" feature that let us log in as a user.  It included an audit trail and a short timeout period to prevent abuse or accidental breakage.  It took about a week for one engineer to build and probably paid for itself within 3-4 months in saved troubleshooting time.

Doing it again, I'd either build this feature really early or set up a session reply tool (I've used [LogRocket's](https://logrocket.com/features/session-replay-developers), but [datadog has one](https://www.datadoghq.com/knowledge-center/session-replay/) has one too, as do a lot of monitoring companies these days).  I'd probably advocate for doing this within the first 6 months of a startup's lifespan - it's easily the highest value debugging tool I've found for triaging + troubleshooting raw user complaints.

## Overbuilding Guest Users Early: Regret
This one's a little more Daybreak specific, but: in the early days, we were a b2c startup and we intended to have a heavyweight, pre-signup onboarding flow.  Having built one of those before, I was keen to build out a solid way to track + represent a pre-signup "guest user" in our database.  I built out a system for this, we built out the onboarding flow, and then we promptly pivoted to B2B.  This meant we ditched the onboarding flow and my nicely-designed guest user system gathered dust for a few years.

The lesson here is really a more general one: you can build functionality you expect to need in the near future, but the length of "near" should vary by startup maturity.  Don't build something you think you'll need in 6 months at a 1-year-old startup.  You can't predict pivots and changes 6 months out at that stage.

## Building on Salesforce: Regret
This will need its own blog post, but: about a year in, we migrated a ton of our internal tools (used by therapists and support staff) to Salesforce.  Specifically, we built out a lot of custom UIs and flows.

At first, this was a huge win.  It let us migrate off of a different SaaS that we were rapidly outgrowing, and the pace of development our Salesforce expert could build things was amazing.  I knew it would come with headaches and limitations down the road, but I ultimately thought it was a good tradeoff (made by the CTO, not me).

After about a year, though, the problems with this approach became clear:
1. Salesforce is an engine that runs on money.  Any given problem (logging, auth, pdf generation, duplicate management, UI improvements) you can think of has a solution, and it's always to shell out hundreds to thousands of dollars per month to Salesforce itself or one of a bevy of third party providers.  By the end, we were paying a fully-loaded engineer's salary to keep our Salesforce setup running.
2. Salesforce development practices are not nearly as mature as software development practices.  You want "local" development?  There's no such thing - all development is done on Salesforce itself, often in limited sandbox environments, resulting in a lot of "testing on prod." You want any sort of decoupling?  Nope, everything in SF is couple as hell, meaning every change is high-risk and needs to be managed by extremely senior Salesforce Architects.
3. Building a significant portion of our app (all the internal tools) in Salesforce put a big, hard skillset divide in the middle of our team.  Any new feature that required work in both Salesforce and Appdev (as we called our rails + react codebase) required technical planning that spanned both systems.  Unfortunately, there's pretty much no one with the required seniority in both Salesforce and Software development, so all architecture was a collaboration between two senior engineers.  You'll always hit this point at a startup *eventually*– your frontend expert is unlikely to *also* be a backend expert *and* an infrastructure expert.  But your frontend expert *can* at least be a decent backend dev and know their way around infrastructure a bit.  That sort of generality is often fine for many years at a small startup, and it allows you to move *incredibly* fast in the early days.  The longer you can wait before putting up a sharp skill divide in the middle of your team, the better.  Building on Salesforce put a sharp (and nearly irrevocable) divide way too early, and it slowed down development a *lot* in the following years.

Doing it again, I'd pay the upfront and maintenance costs of building our internal tools entirely in our codebase, rather than trying to rely on a low-code tool for a core piece of our business.  The costs (in both financial and productivity terms) were way to high.

# Things that were fine
We used a number of tools that were bog-standard: Github, Redis, Postgres, Slack, Notion - I wouldn't write home about any of them.

Similarly, we used a number of tools that could have been swapped for competitors without us noticing: Airbrake for exception handling, NewRelic for log browsing, Amplitude for event analytics, Github Actions for CI/CD - they all worked fine, but I wouldn't push back if someone argued for alternatives in the next project I work on.

## Disclaimer
While I'm saying that I regret some of these choices, I think they were all reasonable choices given the information at the time.  I don't think anyone was an idiot for making them!  Likewise, I'm down on a few technologies here, but the engineers we had at Daybreak were top-notch.  Our Salesforce experts were kind, capable, and often brilliant people.  Our software engineers were people I'm proud to have worked alongside.  There's value in learning from our experience, but none of the above should be construed to denigrate anyone who participated in that experience!

## Anyway

All in all, I'm pretty happy with many of the decisions I personally made (huge surprise 😉).  I don't think we ran into *too* many forseeable landmines in our first three years, although I'd be interested to hear how some of these decisions age in another 3.  Hopefully I can harass one of my recently-ex-coworkers into writing their own version of this blog post in 2027!