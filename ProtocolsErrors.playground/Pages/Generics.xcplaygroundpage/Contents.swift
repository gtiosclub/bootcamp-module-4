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
    
    mutating func add(value: Element) // append element to head of linked list
    mutating func clear() // clears linked list
    func getHead() -> Node<Element>? // returns head node, if possible. If not, return nil
    func get(index: Int) -> Node<Element>? // returns node at index, if possible. If not, return nil
    func contains(value: Element) -> Bool // returns true if linked list contains value
    func toArray() -> [Element]? // convert the linked list's values to an array, retaining the correct order. Return nil if linked list is empty.
}

public class Node<T> {
    public var value: T
    public var next: Node<T>?
    
    // add init block here
    public init(value: T) {
            self.value = value
            self.next = nil
        }
}

public struct MyLL<T: Equatable>: LinkedList {
    
    public var head: Node<T>?
    public var size: Int = 0
        
    public mutating func add(value: T) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
        size += 1
    }
        
    public mutating func clear() {
        head = nil
        size = 0
    }
        
    public func getHead() -> Node<T>? {
        return head
    }
        
    public func get(index: Int) -> Node<T>? {
        guard index >= 0 && index < size else {
            return nil
        }
        var current = head
        var currentIndex = 0
            
        while currentIndex < index {
            current = current?.next
            currentIndex += 1
        }
        return current
    }
        
    public func contains(value: T) -> Bool {
        var current = head
        while let node = current {
            if node.value == value {
                return true
            }
            current = node.next
        }
        return false
    }
        
    public func toArray() -> [T]? {
        guard size > 0 else {
            return nil
        }
        var array: [T] = []
        var current = head
            
        while current != nil {
            array.append(current!.value)
            current = current?.next
        }
        return array
    }
}

// TEST YOUR LINKED LIST IMPLEMENTATION USING STRINGS BELOW
var stringList = MyLL<String>()

stringList.add(value: "First")
stringList.add(value: "Second")
stringList.add(value: "Third")

print("Head Node Value:", stringList.getHead()?.value ?? "No Head")
print("Array Representation:", stringList.toArray() ?? "Empty List")
print("Contains 'Second':", stringList.contains(value: "Second"))
print("Contains 'Fourth':", stringList.contains(value: "Fourth"))

if let nodeAtIndex1 = stringList.get(index: 1) {
    print("Value at index 1:", nodeAtIndex1.value)
} else {
    print("No value at index 1")
}

stringList.clear()
print("Array after clear:", stringList.toArray() ?? "Empty List")

// ADD PERSONALID AND BUZZCARD BELOW
protocol PersonalID {
    var id: String { get }
    var name: String { get }
}

struct Buzzcard: PersonalID, Equatable {
    var id: String
    var name: String
}
// TEST YOUR LINKEDLIST WITH BUZZCARD BELOW
var buzzcardList = MyLL<Buzzcard>()

buzzcardList.add(value: Buzzcard(id: "001", name: "Alice"))
buzzcardList.add(value: Buzzcard(id: "002", name: "Bob"))
buzzcardList.add(value: Buzzcard(id: "003", name: "Charlie"))

print("Buzzcard List Head:", buzzcardList.getHead()?.value.name ?? "No Head")
print("Buzzcard Array Representation:", buzzcardList.toArray()?.map { $0.name } ?? "Empty List")
print("Contains Buzzcard with ID '002':", buzzcardList.contains(value: Buzzcard(id: "002", name: "Bob")))
print("Contains Buzzcard with ID '004':", buzzcardList.contains(value: Buzzcard(id: "004", name: "David")))

if let buzzcardAtIndex1 = buzzcardList.get(index: 1) {
    print("Buzzcard at index 1:", buzzcardAtIndex1.value.name)
} else {
    print("No Buzzcard at index 1")
}
