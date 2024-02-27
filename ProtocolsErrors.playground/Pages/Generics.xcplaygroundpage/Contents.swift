import Foundation

/**
 On this page, you will implement a linked list protocol using generics. If you do not know what a linked list is or how it can be implemented, I recommend doing research online to familiarize yourself with the data structure. Your code must work for any generic type, T.
 Here are the steps for you to do.
  1. Add an initializer (constructor) for linked list nodes. Node values should not be empty; if they are, provide a default value.
  2. Implement the necessary properties and functions outlined by the LinkedList protocol in the MyLL struct. Add additional functions or properties if you would like to.
  3. Test your code below by creating a linked list and testing the various functions using String as the value type. Make sure that your testing covers all of the possible return types of the functions, i.e. when "get(index: Int)" does not take in a valid index.
  4. Once your code is tested, copy and paste the PersonalID protocol and your Buzzcard struct into this file, and create a LinkedList of Buzzcard objects. Test your functions once again.
 */

protocol LinkedList {
    associatedtype Element // generic placeholder type
    var head: Node<Element>? { get set }
    var size: Int { get set }
    
    func add(value: Element) // append element to head of linked list
    func clear() // clears linked list
    func getHead() -> Node<Element>? // returns head node, if possible. If not, return nil
    func get(index: Int) -> Node<Element>? // returns node at index, if possible. If not, return nil
    func contains(value: Element) -> Bool // returns true if linked list contains value
    func toArray() -> [Element]? // convert the linked list's values to an array, retaining the correct order. Return nil if linked list is empty.
}

public class Node<T> {
    public var value: T
    public var next: Node<T>?
    
    // add init block here
}

public struct MyLL<T>: LinkedList {
    // implement the linked list here
}

// TEST YOUR LINKED LIST IMPLEMENTATION USING STRINGS BELOW

// ADD PERSONALID AND BUZZCARD BELOW

// TEST YOUR LINKEDLIST WITH BUZZCARD BELOW
