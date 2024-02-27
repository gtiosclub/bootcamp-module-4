import Foundation

enum CardValue: String {
    case ace
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case jack
    case queen
    case king
    
    // you can use this to parse a card value string
    static func parse(from val: String) -> CardValue? {
        switch val {
        case "ace": return .ace
        case "one": return .one
        case "two": return .two
        case "three": return .three
        case "four": return .four
        case "five": return .five
        case "six": return .six
        case "seven": return .seven
        case "eight": return .eight
        case "nine": return .nine
        case "jack": return .jack
        case "queen": return .queen
        case "king": return .king
        default: return nil
        }
    }
}

enum CardSuit: String {
    case clubs
    case spades
    case diamonds
    case hearts
    
    // you can use this to parse a card suit string
    static func parse(from val: String) -> CardSuit? {
        switch val {
        case "clubs": return .clubs
        case "spades": return .spades
        case "diamonds": return .diamonds
        case "hearts": return .hearts
        default: return nil
        }
    }
}

protocol Card {
    var suit: CardSuit { get set }
    var value: CardValue { get set }
    
    init(from data: [String: String]) throws
}

let cardData: [[String: String]] = [
    [
        "suit": "clubs",
        "value": "jack"
    ],
    [
        "suit": "hearts",
        "value": "eight"
    ],
    [
        "suit": "spades",
        "value": "joker"
    ],
    [
        "suit": "hearts",
        "value": "seven"
    ],
    [
        "suit": "diamonds",
        "value": "ace"
    ],
    [
        "value": "one"
    ],
    [
        "suit": "queen",
        "value": "hearts"
    ],
    [
        "suit": "clubs",
        "value": "four"
    ],
    [
        "suit": "spades"
    ],
]

// [1] Define a custom error type for the following scenarios:
//     - No suit provided
//     - No value provided
//     - Invalid suit
//     - Invalid value
/* BEGIN YOUR CODE */
enum CardError: Error {
    case missingSuit
    case missingValue
    case invalidSuit
    case invalidValue
}
/* END YOUR CODE */

// [2] Create a struct which implements Card.
//     It should be able to handle invalid data errors.
//     This will require unwrapping optionals. Think about whether it makes
//     sense to use a guard-let or an if-let in this scenario.
/* BEGIN YOUR CODE */
struct StandardCard: Card {
    var suit: CardSuit
    var value: CardValue
    
    init(from data: [String: String]) throws {
        guard let suitString = data["suit"] else {
            throw CardError.missingSuit
        }
        
        guard let valueString = data["value"] else {
            throw CardError.missingValue
        }
        
        guard let suit = CardSuit.parse(from: suitString) else {
            throw CardError.invalidSuit
        }
        
        guard let value = CardValue.parse(from: valueString) else {
            throw CardError.invalidValue
        }
        
        self.suit = suit
        self.value = value
    }
}
/* END YOUR CODE */

func containsInvalidCard(cardData: [[String: String]]) -> Bool {
    for cardElement in cardData {
        // [3] Use optional conversion to check if a card is invalid.
        //     Hint: Use try?
        /* BEGIN YOUR CODE */
        let possibleCard: Card? = try? StandardCard(from: cardElement)
        guard let _ = possibleCard else {
            return true
        }
        /* END YOUR CODE */
    }
    return false
}

func getHand(from cardData: [[String: String]]) -> [Card] {
    // [4] Parse the card data and return an array of valid cards.
    //     Print any errors in the console.
    /* BEGIN YOUR CODE */
    var result: [Card] = []
    for cardElement in cardData {
        do {
            let card: Card = try StandardCard(from: cardElement)
            result.append(card)
        } catch CardError.missingSuit {
            print("ERROR: Found a card without a suit!")
        } catch CardError.missingValue {
            print("ERROR: Found a card without a value!")
        } catch CardError.invalidSuit {
            print("ERROR: Found a card with an invalid suit!")
        } catch CardError.invalidValue {
            print("ERROR: Found a card with an invalid value!")
        } catch {
            print("ERROR: Found a card which couldn't be parsed!")
        }
    }
    return result
    /* END YOUR CODE */
}

// [5] Currently, printing a list of cards might look a bit weird.
//     Let's extend our card *struct* so that printing it outputs a string:
//     "[Value] of [Suit]" (e.g. "eight of hearts")
//     Hint #1: It should conform to CustomStringConvertible
//     Hint #2: Take a look at the `rawValue` property of a String-conforming enum
/* BEGIN YOUR CODE */
extension StandardCard: CustomStringConvertible {
    var description: String {
        return self.value.rawValue + " of " + self.suit.rawValue
    }
}
/* END YOUR CODE */

// Some invalid data is present in the user's hand.
// What should the output be?
if containsInvalidCard(cardData: cardData) {
    print("Hand contains some invalid cards:")
} else {
    print("Hand does not contain any invalid cards.")
}

let cards: [Card] = getHand(from: cardData)
print(cards)

// [6] If done correctly, you should get a couple error messages
//     followed by a human-readable list of cards.
