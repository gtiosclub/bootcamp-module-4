import Foundation

/**
 On this page, you will implement a linked list protocol using generics. If you do not know what a linked list is or how it can be implemented, I recommend doing research online to familiarize yourself with the data structure. Your code must work for any generic type, T.
 Here are the steps for you to do.
  1. Add an initializer (constructor) for linked list nodes. Node values should not be empty; if they are, provide a default value.
  2. Implement the necessary properties and functions outlined by the LinkedList protocol in the MyLL struct. Add additional functions or properties if you would like to.
  3. Test your code below by creating a linked list and testing the various functions using String as the value type. Make sure that your testing covers all of the possible return types of the functions, i.e. when "get(index: Int)" does not take in a valid index.
  4. Once your code is tested, copy and paste the PersonalID protocol and your Buzzcard struct into this file, and create a LinkedList of Buzzcard objects. Test your functions once again.
 */

protocol LinkedList{
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

public class Node<T>{
    public var value: T
    public var next: Node?
    
    // add init block here
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

public struct MyLL<T>: LinkedList {
    var head: Node<any LinkedList>?
    var size: Int
    
    func add(value: any LinkedList) {
        let head = value
    }

    func clear() {
        let head = -1
    }
    
    func getHead() -> Node<any LinkedList>? {
        return head
    }
    
    func get(index: Int) -> Node<any LinkedList>? {
        var currentNode = head
        for i in 0...index {
            currentNode = currentNode!.next
        }
        return currentNode
    }
    
    func contains(value: any LinkedList) -> Bool {
        let currentNode = head
        while currentNode != nil {
            //if node value == value then return true
        }
        return true
    }
    
    func toArray() -> [any LinkedList]? {
        var endArray: [any LinkedList]?
        if (head == nil) {
            return nil
        } else {
            var currentNode = head
            while currentNode != nil {
                endArray?.append(currentNode as! (any LinkedList))
                currentNode = currentNode?.next
            }
        }
        return endArray
    }
}




// TEST YOUR LINKED LIST IMPLEMENTATION USING STRINGS BELOW

// ADD PERSONALID AND BUZZCARD BELOW
protocol PersonalID {
    
    // Property requirements
    var firstName: String { get }
    var lastName: String { get }
    var expirationDate: String { get }
    var address: String { get set }
    
    // Function requirements
    func move(newAddress: String)
    func toString() -> String
}

struct MyBuzzCard: PersonalID, Identifiable, Hashable{
    /**
        Steps To Do:
            1. Implement the protocol requirements specified in PersonalID.
              The function implementation is up to your interpretation.
            2. Add 3 additional properties and 1 function that apply solely to
              drivers licenses.
            3. Make DriversLicense also conform to Identifiable.
     */
    var firstName: String
    var lastName: String
    var expirationDate: String
    var address: String
    //additional properties
    var id = UUID()
    var birthDate: String
    var bloodType: String
    var weight: Int
    //function
    func getExpiration() -> String{
        return expirationDate
    }
}
extension PersonalID {
    func move(newAddress: String){
        let address = newAddress
    }
}

// [6] Implement an extension from scratch which adds toString() functionality

/**
 Once you have implemented a function in a protocol extension, you can choose
 to delete the redundant function in your structs/classes, or leave it if you
 would like a more specific implementation. Below, add a protocol extension
 for the "toString" method.
 */

extension PersonalID{
    func toString() -> String{
        var result: String = firstName + " " + lastName + " Expiration: " + expirationDate + "address: " + address
        return result
    }
}

// TEST YOUR LINKEDLIST WITH BUZZCARD BELOW
