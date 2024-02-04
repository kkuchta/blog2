---
layout: main
title: Talks
---

# Conference Talks

I've given a number of talks, mostly at the annual RubyConf. Most of them are a combination of a silly premise and a lot of metaprogramming to achieve it.

## Everything a Microservice: The Worst Possible Intro to dRuby

Presented at RubyConf 2022 - [Video](https://www.youtube.com/watch?v=cC4kRXAnunc) | [Slides](https://speakerdeck.com/kkuchta/everything-a-microservice-the-worst-possible-intro-to-druby)

_"Microservices are great, but I think we can all agree: we need more of them and they should be micro-er. What's the logical limit here? What if every object was remote in a language where everything's an object? Let's take a look at dRuby, the distributed programming module you've never heard of, and use it to achieve that deranged goal! You'll learn about a nifty little corner of the standard library while we attempt to reach the illogical conclusion of today's hottest architecture trend. Be warned: those sitting in the first few rows may get poorly-marshaled data on them."_

What if every object in ruby (down to even Strings and Integers) were a proxy object backed by a remote service? This talk walks through accomplishing this ridiculous goal ("everything a microservice") using a somewhat obscure corner of the ruby standard library (dRuby).

## Vertical Assignment in Ruby

Presented at RubyConf 2021 - [Video](https://www.youtube.com/watch?v=B2nBB70uy6M) | [Slides](https://speakerdeck.com/kkuchta/vertical-assignment-in-ruby)

_"Ruby's long had leftward assignment (x = 3) and recently got rightward assignment (3 => x). The problem here is obvious: we need a vertical assignment operator. In a complete abdication of good taste and common sense, this talk will walk through correcting this heinous oversight. We'll abuse otherwise-respectable metaprogramming tools like Ripper and TracePoint to add a fully functional vequals operator. While this talk is almost 100% bad-ideas-by-volume, you'll learn a few tricks that you can use in your day-to-day work (or at least to terrify your co-workers)."_

A technically-dense, but very silly talk about introducing a ridiculous new operator (the "vertical assignment" operator) into ruby using a mess of metaprogramming

## Source Diviving for Fun and Profit

Presented at RubyConf 2019 - [Video](https://www.youtube.com/watch?v=2YobJGkSSrU) | [Slides](https://speakerdeck.com/kkuchta/source-diving-for-fun-and-profit)

_"Ever spent hours pouring over a gem's documentation trying to figure out how to make it work? Dug through dozens of blog posts trying to understand why a library's not working? Well what if I promised you an end to all that?! Well, ok, I'd be lying. But maybe I can save you some hair-pulling some of the time! Let me introduce you to the joys of Reading the Code. Maybe it seems obvious to you, but one of the biggest leaps I made as a ruby dev was really getting comfortable jumping into a gem's source as a debugging technique. In an effort to get you over that hump earlier than I did, let's talk tips and tricks for getting in and out of a library's codebase as efficiently as possible. It won't solve every problem, but sometimes 5 minutes on GitHub will save you hours on StackOverflow."_

A talk wherein I try to convince newer developers not to be afraid of diving into a dependency's source code to solve a problem.

## Ruby is the Best Javascript

Presented at RubyConf 2018 - [Video](https://www.youtube.com/watch?v=datDkio1AXM) | [Slides](https://speakerdeck.com/kkuchta/ruby-is-the-best-javascript)

_"Some people love Ruby and some people love Javascript. Both will hate this talk. In a display of complete moral depravity, we'll abuse flexible syntax and metaprogramming to make valid Ruby code that's indistinguishable from Javascript. We'll use a variety of tricks to accomplish it that you can take home and use in more respectable code."_

A silly talk full of metaprogramming tricks towards a humorous end.
