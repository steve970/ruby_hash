# Instructions

## Setup

* `git clone [SSH-repository URL copied from GitHub]`
* `bundle`
* `rspec` (you should see something like "X examples, Y failures, Z pending" in the output)
* `atom .`

## How to proceed

`learning_hash.rb` defines a class called `LearningHash` in which you will define methods to do things with ruby hashes. The behavior for each method you need to write can be found in `spec/learning_hash_spec.rb`. To make things fun and show a practical usage of key/value pairs, the tests are written using hashes containing keys `:input` and `:output`.

### What are tests?

Tests are simply code, but the purpose of that code is to exercise or *specify the behavior* of other code (whoa meta). Having an automated way to check that **the behavior of code is what we expected** means that we can safely make changes in large applications and know that we are not breaking existing functionality. Additionally, having to test code encourages good behaviors like having each class represent a single entity or overall function in the application, since testing intertwined entities becomes difficult.

Many contemporary developers view testing as an essential part of writing reliable software. But, like many other areas of software development, testing is hotly debated amongst developers on topics ranging from "is testing really necessary?" to "to what extent do I need to test my application?" Our belief is that testing leads to better developer behaviors and habits, cleaner code design, maintainable and extensible code, and more reliable systems.

As time goes on we will develop a model for writing tests, ***for now the goal is to get comfortable developing with tests and using the `rspec` command.*** [An example of how people feel about tests and code maintainability](https://twitter.com/ananelson/status/445705093199826944).

### Workflow Algorithm for developing with tests

All of your source code to implement the methods will go in `learning_hash.rb`. All steps assume you are `cd`ed into the directory where this repository is cloned, whenever a file modification is a step, it is assumed that you are saving the change:

1. `rspec`
1. Read the failure message to determine which method is failing. The convention used in this exercise is as follows: output like `LearningHash#foo_key` means that we would need to go to the `foo_key` method in `learning_hash.rb`.
1. Add the appropriate code to the method to make the tests pass.
1. Go back to the terminal and issue the `rspec` command:
  * IF all tests are passing
    * THEN open `spec/learning_hash_spec.rb` and find the first `xdescribe` block (reading the file from top to bottom) and change it to `describe` and GOTO Step 1. If no more `xdescribe` blocks remain and all tests pass, then you are done.
  * ELSE
    * GOTO Step 2.

***Note:*** The only changes you should make in the `spec/` folder are changing `xdescribe` to `describe` as outlined above to advance through the examples. No test expectations should be modified.


## 110% optional, feel free to ignore

[RSpec](http://rspec.info/) is a Ruby testing utility that we will eventually use with Rails.
