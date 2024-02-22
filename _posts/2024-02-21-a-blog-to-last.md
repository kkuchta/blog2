---
layout: post
title: A Blog To Last
---

How do you build software that will last more than a decade with no maintenance?

<!--break-->

After about 10 years of maintaining kevinkuchta.com as a personal site slash blog, I finally had to rebuild it.  It was a statically-generated Jekyll blog and I could no longer get a sufficiently old version of ruby to run.  Updating to a recent ruby broke a few dependencies that I couldn't fix without way more work than it was worth, and I had to admit it was time to redo this thing.  And since my goal is to maintain this site with as little effort as possible, I found myself asking the above question– how *do* I set it up so I don't have to rebuild anything for another 20 years?

Here's my current approach:

1. Stick to static site generation.  Flat files can be hosted anywhere for cheap.  Currently I'm using Netlify, but if they go belly-up I can switch to Cloudfront/S3 or any of a hundred other flat file hosting options with ease.
2. Avoid Javascript.  I spend a lot of my day job in and around single-page apps which rely on complicated and ever-changing tooling.  There's nothing inherently wrong with it, but it's a tradeoff: you get developer productivity benefits at the cost of paying the tool churn tax.  Given that I expect *very* little development effort to go into this site after it's built, the tool churn tax is way higher than I want to pay here!
3. Hew close to web standards.  I think there's a lot of value in css/js/html preprocessors and tools of that nature.  I'd much rather write HAML for HTML or SASS for css, but that's more tooling that can break.  In fact, hacking HAML support into Jekyll was one of the things that sunk the *last* version of this blog.  As such, I'm writing raw HTML with raw, modern CSS.  I really miss basic things like SASS nesting + variable (native CSS variables are useful but still have a lot of gaps), but I'll live.
4. Use tools that have existed for at least a decade.  In this case, I'm sticking to Jekyll.  It kinda stagnated for a bit in the mid-2010s, but seems active and stable these days.

With any luck, this blog will still be live in 2034 and won't need any rewrites by then!