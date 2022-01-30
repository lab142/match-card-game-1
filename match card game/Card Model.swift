//
//  Card Model.swift
//  match card game
//
//  Created by Rick Ator on 1/2/22.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare an empty array to store cards
        
        var generatedCards = [Card]()
        //Randomly generate 8 pairs of cards
       // change this to a while loop
        for _ in 1...8 {
            
            // generate a random number
            
            let randomNumber = Int.random(in: 1...13)
            
            // create two new card objects
            
            let cardOne = Card()
            let cardTwo = Card()
            
            //Set their image names
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            //add them to the array
            generatedCards += [cardOne, cardTwo]
            
            print(randomNumber)
            
        }
        //randomize the cards within the array
        
        generatedCards.shuffle()
        
        
        // return the array
        
        return generatedCards
    }
}
