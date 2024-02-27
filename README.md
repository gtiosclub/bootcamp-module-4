# Module 4: Protocols, Extensions, and Error Handling

(Derived from [Nick Candello's](https://github.com/nac5504/week_5_bootcamp) repo)

This week, we'll be going over how Swift deals with blueprinting via protocols,
along with methods for error handling.

#### What you'll accomplish today

- [ ] Implement properties of a protocol
- [ ] Write a protocol from scratch
- [ ] Extend functionality of a protocol
- [ ] Create a custom Error type
- [ ] Utilize do-catch for error handling
- [ ] Utilize optional conversion for error handling

## Getting started

Clone this repo onto your local device, either using Xcode or the command line.

Once you've cloned it, open the `ProtocolsErrors` playground file if you
haven't already.

## Protocols (and Extensions)

In the _Protocols_ page of the playground, follow the instructions provided in
the file.

1. Take a look at `PersonalID`. Notice that the syntax is familiar to classes
   and structs, but with the `protocol` keyword used instead. Also notice that
   variable and function signatures are declared, but not defined.
   
2. Now take a look at `DriversLicense`. It is a struct which implements the
   `PersonalID` protocol. Similar to implementing Java interfaces, classes or
   structs which implement a protocol _must_ define its functions.
   
3. We've now defined a struct which conforms to `PersonalID`. Follow the
   instructions to properly initialize, manipulate, and display an instance
   of `DriversLicense`
   
4. One of the primary purposes of a protocol is that it can serve as a common
   definition for multiple types of objects (aka polymorphism). Create a new
   struct called `Buzzcard` which conforms to `PersonalID`.
   
5. You may have noticed that you've had to define the `move` function
   individually for each struct even though the code is (or should be)
   identical. Implement the extension provided which changes the ID's address.
   
6. Now, try adding a `toString()` extension from scratch. You can refer to the
   implementation in step 5 if needed.
   
#### What you've accomplished so far:

- [x] Implement properties of a protocol
- [x] Write a protocol from scratch
- [x] Extend functionality of a protocol

## Error Handling
