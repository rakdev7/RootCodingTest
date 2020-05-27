#  RootCodingTest

This program reads the input from a file named `input.txt` saved with in the application bundle of the iOS app. Output is shown as a list of results in a table view. { I couldn't accept the input via stdin (e.g. if you're using Ruby cat input.txt | ruby yourcode.rb), or as a file name given on the command line (e.g. ruby yourcode.rb input.txt) }

### Note: This code can be tested by changing/replacing the "contents" of this `input.txt` file and seeing the output in a simulator/physical device when run on Xcode. You need to press `CMD + R` to run this app.

This is built on Xcode 11.5 using iOS SDK 13.5, Swift 5.0.

I created this app in a modular fashion mainly based on Single Responsibility principle. Each class/struct is confined to a specific thing it deals with. I chose structs for data models to prevent unexpected changes to the data they contain. Also used class for Trip model since I wanted to intentionally add data after initial parsing from `input.txt` file.

I have used tuples, structures, classes and extensions wherever necessary.



