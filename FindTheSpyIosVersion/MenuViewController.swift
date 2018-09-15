//
//  MenuViewController.swift
//  FindTheSpyIosVersion
//
//  Created by Ilya Nester on 11/09/2018.
//  Copyright © 2018 Nester's suicide squad. All rights reserved.
//

import UIKit



class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var chosenButton = 0
    @IBOutlet weak var bu71: UIButton!
    @IBOutlet weak var bu72: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var bu102: UIButton!
    @IBOutlet weak var buttonplaey4: UIButton!
    @IBOutlet weak var bu92: UIButton!
    @IBOutlet weak var button6player: UIButton!
    @IBOutlet weak var bu82: UIButton!
    @IBOutlet weak var startbutton: UIButton!
   
    @IBAction func start(_ sender: Any) {
     
    }
    
    @IBAction func player4(_ sender: Any) {
        buttonplaey4.isSelected = true
        chosenButton = 0
        f.isSelected = false
        button6player.isSelected = false
        bu71.isSelected = false
        bu72.isSelected = false
        bu82.isSelected = false
        bu92.isSelected = false
        bu102.isSelected = false
    }
    @IBAction func player5(_ sender: Any) {
        buttonplaey4.isSelected = false
        f.isSelected = true
        chosenButton = 1
        button6player.isSelected = false
        bu71.isSelected = false
        bu72.isSelected = false
        bu82.isSelected = false
        bu92.isSelected = false
        bu102.isSelected = false
    }
    @IBAction func player6(_ sender: Any) {
        buttonplaey4.isSelected = false
        f.isSelected = false
        chosenButton = 2
        button6player.isSelected = true
        bu71.isSelected = false
        bu72.isSelected = false
        bu82.isSelected = false
        bu92.isSelected = false
        bu102.isSelected = false
    }
    @IBAction func player71(_ sender: Any) {
        buttonplaey4.isSelected = false
        f.isSelected = false
        chosenButton = 3
        button6player.isSelected = false
        bu71.isSelected = true
        bu72.isSelected = false
        bu82.isSelected = false
        bu92.isSelected = false
        bu102.isSelected = false
    }
    
    @IBAction func player72(_ sender: Any) {
        buttonplaey4.isSelected = false
        f.isSelected = false
        button6player.isSelected = false
        bu71.isSelected = false
        chosenButton = 4
        bu72.isSelected = true
        bu82.isSelected = false
        bu92.isSelected = false
        bu102.isSelected = false
    }
    @IBAction func player8(_ sender: Any) {
        buttonplaey4.isSelected = false
        f.isSelected = false
        button6player.isSelected = false
        bu71.isSelected = false
        bu72.isSelected = false
        bu82.isSelected = true
        chosenButton = 5
        bu92.isSelected = false
        bu102.isSelected = false
    }
    @IBAction func player9(_ sender: Any) {
        buttonplaey4.isSelected = false
        f.isSelected = false
        button6player.isSelected = false
        bu71.isSelected = false
        bu72.isSelected = false
        bu82.isSelected = false
        bu92.isSelected = true
        chosenButton = 6
        bu102.isSelected = false
    }
    @IBAction func player10(_ sender: Any) {
        buttonplaey4.isSelected = false
        f.isSelected = false
        button6player.isSelected = false
        bu71.isSelected = false
        bu72.isSelected = false
        bu82.isSelected = false
        bu92.isSelected = false
        bu102.isSelected = true
        chosenButton = 7
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let nextScene = segue.destination as? GameViewController
            
            nextScene?.numberofPlayers = chosenButton
            nextScene?.seconds = (nextScene?.timeRemaining[chosenButton])!
        }
    }

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


