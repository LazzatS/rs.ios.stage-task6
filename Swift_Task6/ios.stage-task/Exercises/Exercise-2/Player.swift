//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        for i in 0..<hand!.count {
            if hand![i].value == card.value {
                return true
            }
        }
        
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        
        var cardsOnTheTable = [Card]()
        
        for _ in table {
            cardsOnTheTable.append(contentsOf: table.keys)
        }
        for _ in table {
            cardsOnTheTable.append(contentsOf: table.values)
        }
        
        for h in 0..<hand!.count {
            for card in cardsOnTheTable {
                if hand![h].value == card.value {
                    return true
                }
            }
            
        }
        return false
    }
}
