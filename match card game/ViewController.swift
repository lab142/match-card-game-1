//
//  ViewController.swift
//  match card game
//
//  Created by Rick Ator on 1/1/22.
//
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   

    @IBOutlet weak var collectionView: UICollectionView!


    
    let model = CardModel()
    var cardsArray = [Card]()
    // the below keeps track of the flipped card. the '?' means its optional
    var firstFlippedCardIndex:IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
       cardsArray = model.getCards()
        
        // set the view controller as the data source and delegate of the collection view
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - Collection view delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return numbers of cards
        return cardsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //get a cell
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
       // get the card from the card array
      let card = cardsArray[indexPath.row]
      
        //  finish configure the cell
        cell.configureCell(card: card)
       
        // return it
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        // get  reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as?
            CardCollectionViewCell
        
        // check the status of the card to determine how to flip it
        if cell?.card?.isFlipped == false {
            
            // flip the card up
            cell?.flipUp()
            
            //check if this is the first card that was flipped or the second one
            
            if firstFlippedCardIndex == nil {
                
                //this is the first card flipped over
                
                firstFlippedCardIndex = indexPath
            }
            else {
                
                //second card that is flipped over
                
             
                // run the comparison logic
           
            }
            
        
        }
        
    }
    
    // MARK:  -Game Logic Methods
    
    func checkForMatch(_ secondFlippedCardIndex:IndexPath) {
        
        // get the two card object for the two incices and see if they match
        let cardOne = cardsArray[firstFlippedCardIndex!.row]
        let cardTwo = cardsArray[secondFlippedCardIndex.row]
        print(secondFlippedCardIndex.row)
        print(firstFlippedCardIndex!.row)
        
        
        // get the two collection view cells that represent card one and two
        
        let cardOneCell = collectionView.cellForItem(at:firstFlippedCardIndex!) as? CardCollectionViewCell
       
        let cardTwoCell = collectionView.cellForItem(at:secondFlippedCardIndex) as?
        CardCollectionViewCell
        
        
        //compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            
            //its a match
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            //set the status and remove them
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
        }
        
        else {
            
            // its not a match
            // flip them back over
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        
        // reset the first flipped card index property
        
        firstFlippedCardIndex = nil
    }

}

