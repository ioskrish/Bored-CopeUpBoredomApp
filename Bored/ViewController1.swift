//
//  ViewController1.swift
//  Bored
//
//  Created by TryCatch Classes on 14/10/22.
//

import UIKit

class ViewController1: UIViewController {
    
    var array = [BoredParam]()
    
    @IBOutlet weak var activity: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var participants: UILabel!
    @IBOutlet weak var link: UILabel!

    //dice images count
    let diceFaces = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var randomDiceIndex1: Int = 0 //dice start no.

    @IBOutlet weak var diceImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        randomDice()
    }
    
    @IBAction func rolldice(_ sender: Any) {
        self.array.removeAll()
        randomDice()
        
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(BoredParam.self, from: data)
                    print(jsonData)
                    DispatchQueue.main.async {
                        self.activity.text = "\(jsonData.activity)"
                        self.type.text = "\(jsonData.type)"
                        self.participants.text = "\(jsonData.participants)"
                        self.link.text = "\(jsonData.link)"
                    }
                    
                } catch {
                    print("Something went wrong")
                }
            }
        }.resume()
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        randomDice()
    }
    
    func randomDice() {
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        diceImg.image = UIImage(named: diceFaces[randomDiceIndex1])
    }

}
