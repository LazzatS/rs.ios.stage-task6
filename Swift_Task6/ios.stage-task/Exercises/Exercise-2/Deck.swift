import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        self.cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
        var deck: [Card] = []
        
        for suit in suits {
            for value in values {
                deck.append(Card(suit: suit, value: value))
            }
        }
        
        return deck
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        if let trumpCard = cards.first?.suit {
            trump = trumpCard
            setTrumpCards(for: trump!)
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        var atHand = 0
        for everyPlayer in players {
            everyPlayer.hand = []
            for _ in 0..<6 {
                everyPlayer.hand?.append(cards.first!)
                cards.removeFirst()
                atHand += 1
            }
        }
    }

    public mutating func setTrumpCards(for suit:Suit) {
        for card in 0..<cards.count {
            if cards[card].suit == trump {
                cards[card].isTrump.toggle()
            }
        }
    }
}

