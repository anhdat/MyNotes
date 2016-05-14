# Preface

## What makes a pragmatic programmer?

- Early adopter/fast adapter: cool new shiny things. "Your confidence is born of experience."
- Inquisitive: _What is that?_ _What's inside of it?_ _How does this work?_
- Critical thinker: _There is a missing thing in your conclusion_
- Realistic: _Making thing is hard, it takes time, effort and human_
- Jack of all trades: Broad range of technologies. Even with the job that required you to be a
  specialist, you will be able to move on to a new area and new challenge.

- Tip 1: Care about your craft: Some thing worth doing is worth doing it well.

- Tip 2: THINK! about your work: This isn't one off process. Constantly be thinking, critiquing
  about your work.


# Chapter 1: A Pragmatic Philosophy


## The cat ate my source code

Be responsible -> Take responsibility.

> The greatest of all weaknesses is the fear of appearing weak.
> J. B. Bossuet

- Tip 3: Provide options, not lame excuses.

Don't say it can't be done, explain what can be done to salvage the situation.

- Tip 4: Don't live with broken windows

Crack down small stuff to keep out the big stuff.


## Stone soup and boiled eggs

- Tip 5: Be catalyst for change

Offer people an on-going process, ask them to join.

- Tip 6: Remember the big picture

Keep an eye on boiling stove.


## Good-enough software

There will be trade-offs.

- Tip 7: Make quality a Requirements Issue

Good software today is better than perfect one tomorrow. Let the users have some thing to play with,
they will comeback with a better solution.


## Your knowlege porfolio

Keep momentum to learn.

Because your biggest asset is knowlege, and they're expiring ones. So you have to build it
continously. Learn from a financial investor:

- Invest regularly
- Diversity
- Manage risk
- Buy low, sell high
- Review and rebalance

For those techniques, we should set some goals to make it into actions:

- Learn at least one language every year.
- Read a technical book every quarter
- Read nontechnical books too
- Take classes
- Participate in local users group
- Experience in different environments
- Stay current
- Get wired

Critical thinking

- Tip 9: Critical analyze what you read and hear


## Communicate!

None of our works in a vacuum.


# Chapter 2: A Pragmatic Approach


## The evils of duplication

Every piece of knowlege have a single, unambiguous, authoritative representation within a system.

- Tips 11: Don't repeat yourself

It's not the question when will you rembember, it's the question when will you forget.

The reasons could lead to duplication:

- Imposed duplication: developers have no choice to duplicate the knowledge. e.g. duplication
  between different languages, layers, documentation and code. Automative tools could help prevent
  this.

- Inadverted duplication: it's the duplication from the design. e.g. object properties which can be
  calculated from others should be a computed one. Thus principles like having a uniform way to
  access and modify properties through methods will prevent this, even when the requirements gets
  increased in size, for example, there's a need to cache the computation.

- Impation duplication: remind yourself that the time you're thinking that is saving now would cost
  you a ton later.

- Interdeveloper: share knowledge between people in team. Think about library-oriented development:
  write to reuse, clear in reuse module. `utils` model gets forgotten.

- Tips 12: Make it easy to reuse

## 8. Orthogonality

Orthogonality: root from geometry, means that 2 lines that meet at a right angle. In vector it means
independent. In software engineering, it means decoupling: changing one thing doesn't affect others.

The system that isn't orthogonal: helicopter's control. (I learned this from GetSmarterEveryday
chanel) -> Every control input has sencondary effects.

- Tip 13: Eliminate effects between unrelated things

Benefits when we do things orthogonaly:

- Gain productivity: 

    - Changes are localized: so tests and code should be small and easier to change
    - Reuse components
    - Flexible to combine

- Reduce risk:

    - Isolated
    - Better tests

Some places that we can improve by applying orthogonality to it:

- Teams: based on project and people we have
- Design: separate abstract parts of the whole system. The upper layer only use the abstractions
  provided by the lower ones.

- Coding:

    - Write shy code: modules that don't reavel anything unnecessary to others and don't rely on
      other's implementations
    - Avoid global data

## 9. Reversibility

> Nothing is more dangerous than an idea if it's the only one you have.
> Emily Auguste Chartier



















