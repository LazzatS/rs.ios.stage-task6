//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        
        var firstAttacker: Player?
        
        var lowestTrumpCard: Card?
        
        for player in players {
            for card in player.hand! {
                if card.isTrump == true && card.value.rawValue < lowestTrumpCard?.value.rawValue ?? 100 {
                    lowestTrumpCard = Card(suit: card.suit, value: card.value, isTrump: true)
                    firstAttacker = player
                }
            }
        }
        
        return firstAttacker
    }
}
