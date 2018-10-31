//
//  GameViewController.swift
//  FindTheSpyIosVersion
//
//  Created by Ilya Nester on 11/09/2018.
//  Copyright © 2018 Nester's suicide squad. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var numberofPlayers = 0;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the
    }
    var firstSpy = 0
    var secondSpy = 0
    var flag = 1
    let timeRemaining = [300,360,360,420,420,480,540,600]
    let players = [4,5,6,7,7,8,9,10]
    let spyCount = [1,1,1,1,2,2,2,2]
    var timer = Timer()
    var seconds = 60
    //36 локации
    @IBAction func newGameButton(_ sender: Any) {
        
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
        } else {
            seconds -= 1
            nowPlayer.text = timeString(time: TimeInterval(seconds))
           
        }
    }
    
    func timeString(time:TimeInterval) -> String {
       
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    let poolLocation = ["штаб навального", "помойка", "бар", "кладбище", "тюрьма", "метро", "музей", "баня", "прачечная", "лес", "университет", "дом инвалидов", "лаборатория", "ботанический сад", "база террористов","больница","церковь","литературный клуб","качалка","туалет","банк","зоопарк","парк атракционов","автомобильный завод","стриптиз клуб","мкс","футбольный стадион","казино","полицейский участок","канализация", "деревня","спиртзавод","курилка", "пивоварня","притон"]
  
    @IBOutlet weak var nowPlayer: UILabel!
    
    var counter = 1
    
   
    let diceRoll = (Int(arc4random_uniform(UInt32(1e2))) % 34)
    
    @IBOutlet weak var textChan: UIButton!
    
    @IBOutlet weak var off: UILabel!
    @IBAction func showLoc(_ sender: Any) {
        if counter > players[numberofPlayers]*2 - 1{
            //start timer
            
            off.text = "Времени осталось: "
            runTimer()
            textChan.setTitle("working", for: .normal)
            
        }
        else{
        if counter == 1 {
                firstSpy = (Int(arc4random_uniform(UInt32(1e9 + 7))) % players[numberofPlayers]) + 1
                firstSpy = (Int(arc4random_uniform(UInt32(1e9 + 7))) % players[numberofPlayers]) + 1
                firstSpy = (Int(arc4random_uniform(UInt32(1e9 + 7))) % players[numberofPlayers]) + 1
            if (numberofPlayers >= 4)
            {
                secondSpy = (Int(arc4random_uniform(UInt32(1e9 + 7))) % players[numberofPlayers]) + 1
                secondSpy = (Int(arc4random_uniform(UInt32(1e9 + 7))) % players[numberofPlayers]) + 1
                secondSpy = (Int(arc4random_uniform(UInt32(1e9 + 7))) % players[numberofPlayers]) + 1
            }
            if secondSpy == firstSpy
            {
               secondSpy += firstSpy
                secondSpy %= players[numberofPlayers]
                secondSpy += 1
            }
            if secondSpy == firstSpy
            {
                secondSpy += (firstSpy * Int(arc4random_uniform(UInt32(1e9 + 7))))
                secondSpy %= players[numberofPlayers]
                secondSpy += 1
            }
        }
       // for i in 0...2*players[numberofPlayers] {
            
       // }
        if numberofPlayers < 4 {
            nowPlayer.text = String(counter);
            
            if flag == 0
            {
                textChan.setTitle("нажмите, чтобы узнать локацию", for: .normal)
                flag = 1
            }
                
            else if counter == firstSpy{
                textChan.setTitle("ШПИОН", for: .normal)
                flag = 0
                counter = counter + 1
            }
                
            else{
                textChan.setTitle(poolLocation[diceRoll], for: .normal)
                flag = 0
                counter = counter + 1
            }
            if counter == players[numberofPlayers] + 1 && flag == 0
            {
                counter *= 2
            }
        }
        else {
            nowPlayer.text = String(counter);
            
                if flag == 0
                {
                    textChan.setTitle("нажмите, чтобы узнать локацию", for: .normal)
                    flag = 1
                }
            
                else if counter == firstSpy{
                    textChan.setTitle("ШПИОН " +    String(firstSpy ) + " ВТОРОЙ ШПИОН " + String(secondSpy ) , for: .normal)
                    flag = 0
                    counter = counter + 1
                }
                else if counter == secondSpy  {
                    textChan.setTitle("ШПИОН " +    String(secondSpy ) + " ВТОРОЙ ШПИОН " + String(firstSpy) , for: .normal)
                    flag = 0
                    counter = counter + 1
                }
                
                else{
                textChan.setTitle(poolLocation[diceRoll], for: .normal)
                    flag = 0
                    counter = counter + 1
                }
                if counter == players[numberofPlayers] + 1 && flag == 0
                {
                    counter *= 2
                }
            }
        }
    }

    
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
