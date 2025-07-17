---
layout: post
title: "Forcing Myself to Vibe Code"
date: 2025-07-05
---

I've noticed two things recently:

1. People's skepticism of "what AI-based coding is good for" is inversely proportional to how good they are at it.
2. I am skeptical of AI-based coding.

So: epistemologically speaking, I think my best path towards having a well-informed opinion about what AI-based coding is and is not good for is to "Get Gud" as the kids would say.

[kttt.io](https://kttt.io) is my first pass at that.

<!--break-->

In the interest of pushing my boundaries, I set myself the following constraints:

- I will write no code.
- I will read no code.
- I will lean on the AI for anything I've heard people say AIs can be helpful for (thinking through things, requirements gathering, design, debugging, etc)
- I will avoid, as much as possible, leaning on my decade or two of experience as a software engineer to drive this process.

## What I built

Because I have AI trust issues, I wanted something low-stakes. I'm not ready to let an AI handle auth code sight-unseen, for example.

Looking through my pile of half-baked project ideas that I will totally get to some day I swear, I picked up "Kriegspiel Tic Tac Toe." It's a Tic Tac Toe variant based on the [Kriegspiel chess variant](<https://en.wikipedia.org/wiki/Kriegspiel_(chess)>): you can't see your opponent's pieces and you lose your turn if you try to make an invalid move. Inspired by [this Zach Wienersmith toot](https://mastodon.social/@ZachWeinersmith/111890121393299096).

I figure that even if the AI introduces glaring security holes, there's not much you could really do with that: there's no interesting data, no passwords, no emails... the worst you could really do, if you wanted to, is cheat at Tic Tac Toe!

## How it went

I built it! You can check it out at [kttt.io](https://kttt.io)

The highlights:

- I spent about 24 hours building it (split over a number of evenings)
- I think I would have taken 36-48 doing it by hand
- I could probably do it in 12 AI-driven hours if I started over, having gotten a lot better at this stuff

## What I learned

Vibe-coding extends the [Ballmer Peak](https://xkcd.com/323/) significantly. Several of these evenings took place while vacationing in Sonoma and after several glasses of delicious wine.

But more seriously...

### Good prompts are too much work - make the AI write them.

I got a lot of value by asking the LLMs things like "Here's my overall product vision - what's next?" and conversing with them. I didn't learn anything new here - the AI proposed the same node/redis/react system I'd have suggested - but I was able to get a detailed description of this architecture into the context window with a _lot_ less typing.

### Encouraging the model to ask me questions also saves a lot of typing.

I _could_ write three paragraphs about what I want, _or_ I could write one sentence and add "ask me questions about any decisions you need made." This gets us to the same conclusion, but lets me focus on only typing out the decisions that are not forgone.

### Dump context to files.

After a 5-6 round discussion about implementation strategies, "Write our conclusions to `.ai/implementation.md`" is a great way to capture the implementation plan into a file I can reuse. Thereafter, every new chat session starts with including that file into context so the model knows how we're building what we're building.

### Long-term workplans keep distractible AIs on track

Before I wrote any code, but after talking through the requirements and implementation, I told the model to write out a TODO list. I iterated on this a bit until I landed on a [nested markdown check list](https://github.com/kkuchta/kttt/blob/39aab9575d339550f676668e5db427d2618fd4de/.ai/worklog.md). This meant that I could start every session with "Here are the 4-5 context files you need - take a look at the worklog and tell me what's next." . Most of the time it'd propose a reasonable next step and I could just say "Sounds good, go for it."

### Short-term worklogs keep dumb AIs from spinning their wheels

Whenever I'm debugging something myself, I keep a running file of theories, symptoms, and things I've figured out. Turns out this works for the AIs too! Telling the models to "keep a log in `.ai/game-rejoin-bug.md` of what you've tried and what you've learned" _drastically_ reduced the amount of time they spent going in circles while debugging.

### Fast iteration cycles are worth their weight in gold for an LLM.

A failing unit test along with "here's how you run this unit test" will let an AI fix a bug much faster than a human-in-the-debugging-loop situation where, after every plausible fix, I have to manually check if it worked. I found linters, automated testing, and type checking to be pretty valuable versions of this.

## Some things I still need to figure out:

I still have no idea which models are good for what. I did this entirely with Claude Sonnet Max in Cursor. Would I have been faster with Gemini or whatever? Maybe! I need to experiment more.

I also need to learn more/better tools. I used only Cursor for this, but I hear Claude Code is cool. Async agents are the new hotness now too. They _sound_ like a terrible idea - but I've learned I should reserve judgment until I actually try it in earnest. Skill with these AI tools _does_ matter.

I still need to figure out how to make the AI keep its own context docs up to date. I built 4-5 of these markdown docs describing how to do design, implementation, etc, but struggled to get the AI to remember to update them when we made new decisions (eg "stop using too many fscking emojis!"). Maybe some better-written Cursor Rules would be good here?

I also need a better way for the AI to evaluate the results of its work in the browser. I spent quite a while trying to get Claude to debug a socket reconnection issue that you could only really see by opening two separate browser windows and clicking a dozen different buttons. I messed around with having the AI follow a written test plan using Puppetteer over MCP and it _sorta_ worked, but it was super slow and unreliable. In the end, I convinced the AI to just tell me when it wanted to test something in-browser and I'd report the results. Not great.

## Conclusions

AI-driven development is much better than I gave it credit for, though I still have a ways to climb up the skill curve here.

Kriegspiel Tic Tac Toe exists and is kinda fun! I never wrote or read a line of code. It's... fun? I think? People seem to enjoy it for 3-4 games anyway! It's react+typescript on express+node on fly.io with redis as a datastore.

I definitely expected to hit a wall of complexity at some point where the AI just couldn't be useful. I hit a few walls that looked like that at first - bugs it couldn't fix or features it couldn't nail - but every time I got past it by improving my own context engineering skill. This isn't a particularly huge app, though, so the wall may still be there just out of sight.

As such, I'm still not sure how well this kind of development can be applied outside of a toy project. I feel like I'd need to level up my context engineering skills a _lot_ before I can get value like this on a large, mature, production codebase. I also don't think I'm anywhere near being able to trust the AIs with anything sensitive (user data, auth, etc) unsupervised.

But I will say this: my skill with AI coding has gone up and my skepticism has gone down. I'll have to see if that trend holds over time.
