# Module 4: Protocols, Generics, and Error Handling

(Derived from [Nick Candello's](https://github.com/nac5504/week_5_bootcamp) repo)

This week, we'll be going over how Swift deals with blueprinting via protocols,
along with methods for error handling.

#### What you'll accomplish today

- [ ] Implement properties of a protocol
- [ ] Write a protocol from scratch
- [ ] Extend functionality of a protocol
- [ ] Implement a class which is paramaterized with a generic type
- [ ] Implement a generic struct based on a protocol
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

To navigate to the _Protocols_ page, you may need to click on the sidebar
button located in the very top left of Xcode, next to the window controls.

Under the _ProtocolsErrors_ dropdown, you should see a playground page called
_Protocols_.

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

## Generics

Navigate to the _Generics_ playground page. You should see a definition for
a Linked List provided as a protocol.

Your job is to implement a linked list which can handle objects of any type.
It should conform to the given protocol.

1. Add an initializer (constructor) for linked list nodes.
   Node values should not be empty; if they are, provide a default value.

2. Implement the necessary properties and functions outlined by the LinkedList
   protocol in the MyLL struct. Add additional functions or properties if you
   would like to.
   
3. Test your code below by creating a linked list and testing the various
   functions using String as the value type. Make sure that your testing
   covers all of the possible return types of the functions, i.e. when
   `get(index: Int)` does not take in a valid index.

4. Once your code is tested, copy and paste the PersonalID protocol and your
   Buzzcard struct into this file, and create a LinkedList of Buzzcard objects.
   Test your functions once again.

#### What you've accomplished so far:

- [x] Implement properties of a protocol
- [x] Write a protocol from scratch
- [x] Extend functionality of a protocol
- [x] Implement a class which is paramaterized with a generic type
- [x] Implement a generic struct based on a protocol

## Error Handling

#### What you've accomplished so far:

- [x] Implement properties of a protocol
- [x] Write a protocol from scratch
- [x] Extend functionality of a protocol
- [x] Implement a class which is paramaterized with a generic type
- [x] Implement a generic struct based on a protocol
- [x] Create a custom Error type
- [x] Utilize do-catch for error handling
- [x] Utilize optional conversion for error handling
