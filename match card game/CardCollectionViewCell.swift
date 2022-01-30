//
//  CardCollectionViewCell.swift
//  match card game
//
//  Created by Rick Ator on 1/3/22.
//

import UIKit

class CardCollectionViewCell:UICollectionViewCell {
    
   
    @IBOutlet weak var frontImageView: UIImageView!
   
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func configureCell(card:Card){
      
        //keep track of the card the cell represents
        self.card = card
        
        if card.isMatched == true {
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        } else {
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        // set the front image view to the image that represents the card
        frontImageView.image = UIImage(named:card.imageName)
    
    
  // reset the state of the cell by checking the flip status of the card and the showing the front or the back imageview accordingly
        if card.isFlipped == true {
            UIView.transition(from: backImageView, to: frontImageView, duration: 0.2, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
       
    // show the front image view
    
    else {
        // else show the back image view
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.2, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
//        flipDown(speed: 0)
    }
    
    }
    // flip up animation
    func flipUp(speed:TimeInterval = 0.3) {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        //set the status of the card
       // card?.isFlipped = true
    }
    func flipDown(speed:TimeInterval = 0.3) {
        UIView.transition(from: frontImageView, to: backImageView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        //set the status of the card
       // card?.isFlipped = false
        }
    func remove() {
        
        // make the image views invisible when they match
        
        backImageView.alpha = 0
       
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
            
        }, completion: nil)
    }
    
    }

