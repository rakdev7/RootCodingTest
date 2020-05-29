#  RootCodingTest

Problem Statement - https://gist.github.com/dan-manges/1e1854d0704cb9132b74

**Solution** : This program reads the input from a file named `input.txt` saved with in the application bundle of the iOS app. Output is shown as a list of results in a table view. *I couldn't accept the input via stdin (e.g. if you're using Ruby cat input.txt | ruby yourcode.rb), or as a file name given on the command line (e.g. ruby yourcode.rb input.txt)*

### Note: This code can be tested by changing/replacing the "contents" of this `input.txt` file and seeing the output in a simulator/physical device when run on Xcode. You need to press `CMD + R` to run this app.

This is built on Xcode 11.5 using iOS SDK 13.5, Swift 5.0.

I created this app in a modular fashion mainly based on Single Responsibility principle. Each class/struct is given a specific responsibilty. I chose structs for data models to prevent unexpected changes to the underlying data.

I have made intentional choices of using tuples, structures, classes and extensions wherever necessary. I have also added unit tests.

I have written a few test cases to demostrate my unit testing skills. _These are just a **sample** to showcase the fact that I can write more unit tests if needed which thoroughly test the application code._

P.S. If you want to replace input.txt with a file with different name, go to `ViewController.swift` and replace the name of the file here - `static let kinputFileName = "input"`

