//
//  PlayingCradDeck.swift
//  Playing Cards
//
//  Created by Nikita Kalyuzhniy on 2/10/20.
//  Copyright © 2020 Nikita Kalyuzhniy. All rights reserved.
//

import Foundation

struct PlayingCardDeck
{
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4Random )
        } else {
            return nil
        }
    }
    
}

extension Int {
    var arc4Random: Int {
        switch self {
        case 1...Int.max:
            return Int(arc4random_uniform(UInt32(self)))
        case -Int.max..<0:
            return Int(arc4random_uniform(UInt32(self)))
        default:
            return 0
        }
    }
}
