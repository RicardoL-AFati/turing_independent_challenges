# OpenMic

## Preparation

1. Fork this repository.
1. Clone your new repository to your local machine.
1. Run `bundle` from the command line.
1. Run `rake` from the command line.

## Tasks

Add code to the Joke and User classes to support the interaction patterns described below.

Use tests to drive your development.

### Iteration 1: Creating Jokes

In this repository we have an existing Joke class. We're going to add to that class so that it can hold basic information about a joke. Add to the existing Joke class so that it supports the following interaction pattern:

```ruby
> require './lib/joke'
# => true

> joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
# => #<Joke:0x007fc87b02c2e0 ...>

> joke.id
# => 1

> joke.question
# => "Why did the strawberry cross the road?"

> joke.answer
# => "Because his mother was in a jam."
```

### Iteration 2: Add Jokes to Users

Currently we have a User class with a `name` attribute.

Add to the existing User class so that it can support the following interaction pattern.

```ruby
> require './lib/joke'
# => true

> joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
# => #<Joke:0x007fc87b02c2e0 ...>

> require './lib/user'
# => true

> sal = User.new("Sal")
# => #<User:0x007fc87c8f8aa8 ...>

> sal.jokes
# => []

> sal.learn(joke)
> sal.jokes
# => [#<Joke:0x007fc87b02c2e0 ...>]
```

### Iteration 3: Allow Users to Tell Jokes

Continue adding to the User class to support the following interaction pattern.

```ruby
> require './lib/joke'
# => true

> joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
# => #<Joke:0x007fc87b02c2e0 ...>

> require './lib/user'
# => true

> sal = User.new("Sal")
# => #<User:0x007fc87c8f8aa8 ...>

> ali = User.new("Ali")
# => #<User:0x007fc87cabfbe8 ...>

> sal.tell(ali, joke)
> ali.jokes
# => [#<Joke:0x007fc87b02c2e0 ...>]

> ali.jokes.count
# => 1
```

### Iteration 4: Allow Users to Perform Routines

Continue adding to the User class to support the following interaction pattern.

```ruby
> require './lib/joke'
# => true

> joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
# => #<Joke:0x007fc87b02c2e0 ...>

> joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
# => #<Joke:0x007fc87b135240 ...>

> require './lib/user'
# => true

> ilana = User.new("Ilana")
# => #<User:0x007fc87c8f8aa8 ...>

> josh = User.new("Josh")
# => #<User:0x007fc87cabfbe8 ...>

> ilana.learn(joke_1)
> ilana.learn(joke_2)
> ilana.perform_routine_for(josh)
> josh.jokes
# => [#<Joke:0x007fc87b02c2e0 ...>, #<Joke:0x007fc87b135240 ...>]

> josh.jokes.count
# => 2
```

### Iteration 5: Allow Users to Learn Routines

Continue adding to the User class to support the following interaction pattern.

```ruby
> require './lib/user'
# => true

> casey = User.new("Casey")
# => #<User:0x007fc87c8f8aa8 ...>

> casey.learn_routine('./jokes.csv')
> casey.jokes.count
# => 100
```
