# Example code for ReactiveCocoa

“Functional programming is a programming paradigm that treats computations as the evaluation of mathematical functions and avoids state and mutable data.”

Functional reactive programming (FRP) is a declarative approach to GUI design. The term declarative makes a distinction between the “what” and the “how” of programming. A declarative language allows you to say what is displayed, without having to specify exactly how the computer should do it.


The problem, rather, is that stateful programs evolve in bad ways when programs get large.
So what about code rot? Why is the functional style more robust against software entropy than object-oriented or imperative code? The answer is inherent in functional programming’s visible (and sometimes irritating) limitation: you can’t add direct state effects, but have to change interfaces. What this means is that adding complexity to a function expands its interface, and it quickly reaches a point where it’s visibly ugly. What happens then? A nice thing about functional programming is that programs are build up using function composition, which means that large functions can easily be broken up into smaller ones. People break functions up (encouraging code reuse) when they get to that point. That’s a really great thing! Complexity sprawl still happens, because that’s how business environments are, but it’shorizontal. As functional programs grow in size, there are simply more functions. This can be ugly (often, in a finished product, half of the functions are unused and can be discarded) but it’s better than the alternative, which is the vertical complexity sprawl that can happen within “God methods”, and in which it’s unclear what is essential and what can be discarded. 

We program imperatively when needed, and functionally when possible.

Recommended reading
http://michaelochurch.wordpress.com/2012/12/06/functional-programs-rarely-rot/
https://blog.stackmob.com/2013/01/resources-for-getting-started-with-functional-programming-and-scala/
http://elm-lang.org/learn/What-is-FRP.elm

Frameworks
Java https://github.com/Netflix/RxJava


Javascript examples
http://jsfiddle.net/f2rsk/
http://jsfiddle.net/akHsJ/

Objective-c examples
https://bitbucket.org/agens/ivycore-ios/src/1a031e40bda4bc082c96ce20b3d8cbff5b4d6ab2/Source/UI%20components/IVYConfigLoadingController.h?at=develop
https://bitbucket.org/agens/ivycore-ios/src/1a031e40bda4bc082c96ce20b3d8cbff5b4d6ab2/Source/UI%20components/IVYConfigLoadingController.m?at=develop

https://bitbucket.org/agens/ivycore-ios/src/1a031e40bda4bc082c96ce20b3d8cbff5b4d6ab2/Source/Issue_Group_View/IVYIssueGroupViewController.m?at=develop



