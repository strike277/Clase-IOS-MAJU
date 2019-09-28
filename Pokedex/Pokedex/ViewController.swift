//
//  ViewController.swift
//  Pokedex
//
//  Created by Denisse Maldonado on 9/17/19.
//  Copyright © 2019 Cliente. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var burtton1: UIButton!
    
    //Variables
    var entero: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    @IBAction func ejecutaUno(_ sender: UIButton) {
    
    }
}
