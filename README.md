# Example code for ReactiveCocoa

### What is Function Reactive Programming

“Functional programming is a programming paradigm that treats computations as the evaluation of mathematical functions and avoids state and mutable data.”

Functional reactive programming (FRP) is a declarative approach to GUI design. The term declarative makes a distinction between the “what” and the “how” of programming. A declarative language allows you to say what is displayed, without having to specify exactly how the computer should do it.


### Why FRP?
- Use time describing "what" instead of "how"
- Classes and functions have less state
- Multithreading is safer, easier and less errorprone
- Code rots less

### Why ReactiveCocoa?
- KVO finally done RIGHT!!
- It's a port of the very popular reactive framework for .NET so it will stay around
- Seems like it has a great community

#### Recommended reading

- https://github.com/ReactiveCocoa/
- https://blog.stackmob.com/2013/01/resources-for-getting-started-with-functional-programming-and-scala/
- http://elm-lang.org/learn/What-is-FRP.elm

### Searchterms
- Actor
- Futures and promises
- Funcitonal reactive programming


### Code rot

The problem, rather, is that stateful programs evolve in bad ways when programs get large.
So what about code rot? Why is the functional style more robust against software entropy than object-oriented or imperative code? The answer is inherent in functional programming’s visible (and sometimes irritating) limitation: you can’t add direct state effects, but have to change interfaces. What this means is that adding complexity to a function expands its interface, and it quickly reaches a point where it’s visibly ugly. What happens then? A nice thing about functional programming is that programs are build up using function composition, which means that large functions can easily be broken up into smaller ones. People break functions up (encouraging code reuse) when they get to that point. That’s a really great thing! Complexity sprawl still happens, because that’s how business environments are, but it’shorizontal. As functional programs grow in size, there are simply more functions. This can be ugly (often, in a finished product, half of the functions are unused and can be discarded) but it’s better than the alternative, which is the vertical complexity sprawl that can happen within “God methods”, and in which it’s unclear what is essential and what can be discarded.

http://michaelochurch.wordpress.com/2012/12/06/functional-programs-rarely-rot/ 

### When to use FRP

We program imperatively when needed, and functionally when possible.

### Java
- https://github.com/Netflix/RxJava
