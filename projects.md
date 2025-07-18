---
layout: page
---

# Projects

These are my mostly-serious personal projects that intended to solve some real problem or another. I'm probably better-known for my [silly hacks](/hacks).

## [Kriegspiel Tic Tac Toe](https://kttt.io) <span class='github'>[Github](https://github.com/kkuchta/kttt)</span>

A tic-tac-toe variant where you can't see your opponent's moves. It's socket-based and multiplayer. I wanted to force myself to practice AI-driven coding, so this is 100% vibe-coded by Claude and Cursor. React/Typescript/Node/Express/Redis.

## [The Twitter Book, 2022](https://twitter.com/QuinnyPig/status/1610317856876683264) <span class='github'>[Github](https://github.com/kkuchta/secret_twitter_book)</span>

An elaborate gift wherein I converted all of a friend's tweet history into 5 leatherbound volumes. It's a big mess of css, ruby, and shell scripts.

## [SQLtoAPI.com, 2021](https://www.sqltoapi.com/)

A straightforward SaaS: you give it a database connection string and a query, it'll give you an http endpoint (with optional http simple auth). The marketing pages and management interface are powered by a straightforward rails app, though the actual queries are run by AWS lambda functions.

I put together this prototype in a couple weekends. I got a number of signups in the first few weeks of launch, but no one made any material use of it so I haven't pursued it further. My theory is that people don't trust the site and don't want to put in their sensitive DB credentials. To get people to use it, I'd need to improve the percieved trustworthiness of the site. That said, really what I'd need to do is some user research, and I don't have enough interest in the product to want to do that un-fun work!

## [ShirtBot, 2019](https://www.reddit.com/user/shirt_bot)

A reddit bot. If you saw a funny reddit comment, you could reply to it with `!shirt_bot`. Shirtbot would then reply to you with a generated link to a shirt with that comment on it! It was a fun hack project over a month or two: ruby, docker, and a few external apis. Those apis have died or moved on, so the bot is largely defunct. It's just as well: while the reddit users mostly liked the bot, no one ever bought a single shirt!

## [Scarr, 2018](/2018/06/scarr/) <span class='github'>[[github]](https://github.com/kkuchta/scarr)</span>

An end-to-end tool for flat-files on AWS. It handles registering a domain, generating a TLS cert, creating an S3 bucket, creating a cloudfront distribution, setting up DNS, and uploading files. This is my first time touching Go, so the code is likely to turn you to stone if you look at it too long.

<hr>
## [VoyageFound.com](https://voyagefound.com/, 2017) <span class='github'>[[github]](https://github.com/kkuchta/voyagefound)</span>

I like browsing random locations on Wikivoyage, a wikipedia-like travel site, to explore places I might like to travel to. However, wikivoyage's "Random" button tends to take me to one of the bazillion little towns in New England more often than not.

VoyageFound is a tool I built on top of Wikivoyage. It lets you jump to a random page, subject to filters you can define. For example, if you want to leave out all of the US, you can add "United States" to the exclude filter. If you want to search for places in Asia but you've already been to a few countries, you can include Asia but exclude Vietnam and Thailand.

This was my first personal project with React.js, and I'm already feeling the need for a proper state management system (we use redux at work).

## Mitt, 2016 <span class='github'>[[gitbhub]](https://github.com/kkuchta/mitt)</span>

A dead-simple project that I was surprised didn't exist (as far as I could find in 2016). It's a CLI tool that listens for incoming http requests and prints them to the command line. I still use it occasionally for debugging webhooks. It's a small, published ruby gem.

<hr>
## [UnexpectedHamilton, 2017](https://twitter.com/suddenhamilton) <span class='github'>[[github]](https://github.com/kkuchta/lyric_bot)</span>

A ruby twitterbot for detecting partial song lyrics and tweeting the next few lines. Eg if you tweet "I took my shot," it might detect that as a match to the line "Not throwing away my shot" from the musical Hamilton. The bot would then tweet the following lines from Hamilton: "Hey yo, I'm just like my country / I'm young, scrappy and hungry."

It matches base on line endings. It weights each matching word based on how common the word is (so a match of "and me" is scored lower than a match of "extra marsupials"), and considers the tweet + lyric a match if the weighted score is over a configurable threshold.

<hr>

## [KevinKuchta.com, 2012](http://kevinkuchta.com) <span class='github'>[[github]](https://github.com/kkuchta/kkuchta.github.com)</span>

Included here for completeness, this is a generated static Jekyll-based site hosted on github pages. I've added in Haml for the html and Sass for the css, along with Jekyll's built-in markdown parsing for the content. I started from a bootstrap base, but the visible design and css are my own. I'm debating whether to keep the faux-bold headings- my more design-oriented friends say they're crap- I'm mixed on it.

<hr>

# Graveyard

## Bub, 2016-2018 <span class='github'>[[github]](https://github.com/kkuchta/bub)</span>

A ruby slackbot for claiming and deploying to heroku servers. My company had a handful of heroku boxes we use for staging new features + doing acceptance test on them. Since several new features may be in progress at once, the devs were constantly asking "Is staging server X free?". This is a slackbot I wrote to manage claiming and releasing servers.

I eventually recently the ability to actually deploy github branches to heroku through bub.

Although this is used by Joyable, it's a personal project- I've strictly separated my work on this from my employer, using personal time and machines, so I can show it off here.

<hr>
### [Baller JS Physics Engine, 2012](https://github.com/kkuchta/physicsengine)

I wanted to play around with canvas, so I drew a ball. Then I made it move. Then I thought the movement should be more realistic, and it spiraled from there. Before I realized it, I had general-purpose forces like gravity and friction, and I was working on collision resolution. It only ever dealt with balls, of course, but it was fun.

<hr>

### [Wall of Imgur (potentially NSFW), 2013-2015](http://random-imgur.s3-website-us-east-1.amazonaws.com/) <span class='github'>[[github]](https://github.com/kkuchta/RandomImagur2)</span>

This is pretty silly- it's just a wall of random images from Imgur.com (an image-hosting site). It has infinite scrolling, zoom-hover (which was a little tricky to make work nicely without covering the page and whatnot), semi-intelligent tiling, and a mode that replaces all the images with kittens. That last one is because, since these are truly random images, some of them are occasionally NSFW and I wanted to be able to be able to work on this in public places.

August 2013: I recently started a job using coffeescript and backbone. To refamiliarize myself with these, I rebuilt the wall of imgur in with them.

May 2015: Wall of Imgur (renamed to wallopics.com) was quite popular on reddit. Then, eventually, Imgur decided to shut it down by blocking wallopics.com as a referrer. See the [writeup](/2015/05/wallopics-is-dead/) for more details. Moving this to the graveyard, but you can still use the compiled site on [github raw](https://rawgithub.com/kkuchta/RandomImagur2/master/index.html).

<hr>

## [Vimbits.com, 2013](http://www.vimbits.com) <span class='github'>[[github]](https://github.com/kkuchta/Vimbits)</span>

A site to upvote and downvote your favorite Vim configuration snippets. Made with Bootstrap and Rails (decided to keep it largely js-free for v1). Hit the HN front page twice, and got about 12k uniques in the first week or so. It's leveled off to around 80 uniques a day. It needs a lot of visual work and some bug fixes, but mostly it needs better features to support wading through the mass of noise to find the gems: duplicate detection, a moderation queue/interface, real searching, better tagging, etc.

This is probably my most popular project to date. Unfortunately, I kinda outgrew it. It's on a really old version of rails and written pretty poorly. I built it before I was a full-time rails dev, and so I contravened a _lot_ of best practices. Predictably, it became a maintainability nightmare. Since there also isn't a whole lot it can teach me anymore, I let it quietly die.

<hr>
## Rayne, aka ShitIbuilt.com, 2012

This was intended to be a competitor to Linkedin that was focused on "Shit I Built". It addressed the problem that although I have a bunch of friends, I can't really vouch for many of them as good programmers/designers/marketers/whatever, as I just haven't worked with them. This was meant to be an 'anti-social network' where the key link was not friendship or acquaintance, but shared projects.

Rayne (our internal name) died on the vine as we became less convinced that we had the interest to make it happen. We built a minimum product, but the 'viable' part was not really there: an idea that simple really needed a lot more polish than we had the time to give it (and we weren't nearly confident enough about the idea to go full-time on it).

<hr>

## Ubimenu.com, 2012

A tool for restaurants and bars to have a simple mobile webapp with no coding experience required. I worked on the frontend stuff: the welcome page, the admin panel, and a bit of the mobile js. We ended up getting a few paying customers at the high point.

This died for a couple reasons:

1. It required too much sales work- there was no organic growth. The other guy involved (my roommate at the time) had to talk to restaurants individually, and that wasn't that scalable unless we wanted to bet the farm on this and do it full time (we weren't).
2. By the time this started to mature, there were plenty of tools out there filling this niche already (as well as fancy features like online ordering and native apps).
