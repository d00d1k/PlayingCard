//
//  PlayingCard.swift
//  Playing Cards
//
//  Created by Nikita Kalyuzhniy on 2/10/20.
//  Copyright © 2020 Nikita Kalyuzhniy. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible
{
    var description: String {
        return "\(rank)\(suit)"
    }
    
    var suit : Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        var description: String {
            return self.rawValue
        }
        
        case spades = "♠️"
        case heards = "♥️"
        case diamonds = "♣️"
        case clubs = "♦️"
        
        static var all = [Suit.spades, .heards, .diamonds, .clubs]
    }
    
    enum Rank: CustomStringConvertible {
        var description: String {
            switch self {
            case .ace: return "A"
            case .face(let kind): return kind
            case .numeric(let pips): return String(pips)
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRank: [Rank] = [Rank.ace]
            for pips in 2...10 {
                allRank.append(Rank.numeric(pips))
            }
            allRank += [Rank.face("J"),.face("Q"),.face("K")]
            
            return allRank
        }

    }
}
