//
//  ListaCollectionViewController.swift
//  Pokedex
//
//  Created by Denisse Maldonado on 9/26/19.
//  Copyright © 2019 Cliente. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

private let reuseIdentifier = "Cell"

class ListaCollectionViewController: UIViewController {
    @IBOutlet weak var collectionPolemom: UICollectionView!
    var data = [JSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "pokemon", ofType: "json")!
        let jsonFile = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        
        if let dataFromFile = jsonFile!.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromFile)
            data = json.arrayValue
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if(segue.identifier == "segue_detail") {
            let next = segue.destination as! ViewController
            next.entero = 5
        }
    }
}

extension ListaCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCollectionViewCell
    
        let pokemon = data[indexPath.row]
        //cell.imagenPokemon.sd_setImage(with: URL(string: pokemon["image"].stringValue), placeholderImage: UIImage(named: "Ditto"), options: .fromLoaderOnly, context: nil)
        if let url = URL(string: pokemon["image"].stringValue) {
            let data = try! Data(contentsOf: url)
            let image = UIImage(data: data)
            cell.imagenPokemon.image = image
        }
        
        cell.buttonOne.setTitle(pokemon["name"].stringValue, for: .normal)
        cell.buttonOne.addTarget(self, action: #selector(goDetail), for: .touchUpInside)
        cell.buttonOne.tag = indexPath.row
        // Configure the cell
    
        return cell
    }
    
    @objc func goDetail(_ sender: UIButton) {
        let row = collectionPolemom.cellForItem(at: IndexPath(row: sender.tag, section: 0))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segue_detail", sender: nil)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
