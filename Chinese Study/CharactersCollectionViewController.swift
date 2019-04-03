//
//  CharactersCollectionViewController.swift
//  Chinese Study
//
//  Created by Paul Baker on 4/2/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit

class CharactersCollectionViewController: UICollectionViewController {
    
    var characters = CharacterStore().chars
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.characterLabel.text = characters[indexPath.row].chineseCharacter
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "translation" {
            let destination = segue.destination as! TranslationViewController
            let itemRow = collectionView.indexPathsForSelectedItems?.first!.row
            destination.char = characters[itemRow!]
        }
    }
}
