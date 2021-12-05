//
//  menuVC.swift
//  MPG
//
//  Created by Alexander Plam on 12/1/21.
//

import UIKit

class menuVC: UIViewController {


    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var bpmToggle: UISwitch!
    @IBOutlet weak var genreToggle: UISwitch!
    @IBOutlet weak var keyToggle: UISwitch!
    @IBOutlet weak var instToggle: UISwitch!
    @IBOutlet weak var bpmLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var instLabel: UILabel!
    @IBOutlet weak var inst2Label: UILabel!
    @IBOutlet weak var inst3Label: UILabel!
    @IBOutlet weak var inst4Label: UILabel!
    @IBOutlet weak var inst5Label: UILabel!
    @IBOutlet weak var generatorView: UIStackView!
    @IBOutlet weak var refresh: UIButton!
    @IBOutlet weak var instNum: UISegmentedControl!
    @IBOutlet weak var instView: UIStackView!
    @IBOutlet weak var produceLabel: UILabel!
    @IBOutlet weak var includeLabel: UILabel!
    @IBOutlet weak var menuIcon: UIButton!
    
// Genre array
    let genre = ["Hip Hop", "Rap", "Rock", "Jazz", "Lo-fi Hip Hop", "Trap", "Future Bass", "Indie Folk", "Electronic", "Dubstep", "Chillhop", "Shoegaze", "Country", "Blues", "Indie Rock", "Punk", "Blues", "R&B", "Neo-Soul", "Cinematic", "Metal", "House", "Techno", "Trance", "Drum & Bass", "Electro", "Hardstyle", "Grime", "Jazz Rap", "Gospel", "J-Pop", "K-Pop", "Latin", "Pop", "Funk", "Reggae", "Singer-Songwriter"]
// Key array
    let key = ["C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"]
// Instrument array
    let instrument = ["Electric Guitar", "Acoustic Guitar", "Piano", "Electric Bass", "Trumpet", "Saxophone", "Synthesizer", "Rhodes", "Supersaws", "Sine Keys", "Wurlitzer", "Harp", "Mandolin", "Vocal Chops", "Strings", "Cajon", "Reese Bass", "Claves", "Cowbell", "Glockenspiel", "Gong", "Guiro", "Maraca", "Tambourine", "Triangle", "Vibraphone", "Washboard", "Wood Block", "Xylophone", "Conga", "Djembe", "Acoustic Drums", "Drum Machine", "Accordian", "Bassoon", "Clarinet", "Flute", "Oboe", "Piccolo", "Organ", "Recorder", "Trombone", "Banjo", "Cello", "Clarinet", "Upright Bass", "Classical Guitar", "Spanish Guitar", "Harpsichord", "Ukulele", "Violin", "Viola", "Square Wave Bass", "Synth Bass"]
// Major or minor array
    let majMin = ["Major", "Minor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// Set menu alpha to 1
        menuView.alpha = 1

// Menu styling
        menuView.layer.cornerRadius = 10
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOpacity = 0.05
        menuView.layer.shadowOffset = .zero
        menuView.layer.shadowRadius = 10
        instNum.backgroundColor = UIColor.purple.withAlphaComponent(0.02)
        bpmToggle.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        genreToggle.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        keyToggle.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        instToggle.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        instNum.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        
        
// BPM hiding init
        if defaults.bool(forKey: "BPM") == true {
            bpmToggle.isOn = true
            bpmLabel.isHidden = false
        }
        else {
            bpmToggle.isOn = false
            bpmLabel.isHidden = true
        }
        
// Genre hiding init
        if defaults.bool(forKey: "Genre") == true {
            genreToggle.isOn = true
            genreLabel.isHidden = false
        }
        else {
            genreToggle.isOn = false
            genreLabel.isHidden = true
        }
        
// Key hiding init
        if defaults.bool(forKey: "Key") == true {
            keyToggle.isOn = true
            keyLabel.isHidden = false
        }
        else {
            keyToggle.isOn = false
            keyLabel.isHidden = true
        }
        
// Instrument hiding init
        if defaults.bool(forKey: "Instruments") == true {
            instToggle.isOn = true
            instView.isHidden = false
            includeLabel.isHidden = false
        }
        else {
            instToggle.isOn = false
            instView.isHidden = true
            includeLabel.isHidden = true
        }
        

// Selected instrument number index is pulled from user defaults
        let instSelect = defaults.integer(forKey: "Instrument Number")
        instNum.selectedSegmentIndex = instSelect-1
        if defaults.integer(forKey: "Instrument Number") == 0 {
            instNum.selectedSegmentIndex = 2
        }
        
// Hide instrument titles based on value in user defaults
        if defaults.integer(forKey: "Instrument Number") == 1 {
            inst2Label.isHidden = true
            inst3Label.isHidden = true
            inst4Label.isHidden = true
            inst5Label.isHidden = true
        }
        else if defaults.integer(forKey: "Instrument Number") == 2 {
            inst2Label.isHidden = true
            inst3Label.isHidden = true
            inst4Label.isHidden = true
            inst5Label.isHidden = false
        }
        else if defaults.integer(forKey: "Instrument Number") == 3 {
            inst2Label.isHidden = true
            inst3Label.isHidden = true
            inst4Label.isHidden = false
            inst5Label.isHidden = false
        }
        else if defaults.integer(forKey: "Instrument Number") == 4 {
            inst2Label.isHidden = true
            inst3Label.isHidden = false
            inst4Label.isHidden = false
            inst5Label.isHidden = false
        }
        else if defaults.integer(forKey: "Instrument Number") == 5 {
            inst2Label.isHidden = false
            inst3Label.isHidden = false
            inst4Label.isHidden = false
            inst5Label.isHidden = false
        }
        else if defaults.integer(forKey: "Instrument Number") == 0 {
            inst2Label.isHidden = true
            inst3Label.isHidden = true
            inst4Label.isHidden = false
            inst5Label.isHidden = false
            instView.isHidden = false
        }
        
// Defaults for hiding labels until a userdefault is set
        if defaults.bool(forKey: "bpmDidToggle") == false {
            bpmLabel.isHidden = false
            bpmToggle.isOn = true
            
        }
        
        if defaults.bool(forKey: "genreDidToggle") == false {
            genreLabel.isHidden = false
            genreToggle.isOn = true
        }
        
        if defaults.bool(forKey: "keyToggled") == false {
            keyLabel.isHidden = false
            keyToggle.isOn = true
        }
        
        if defaults.bool(forKey: "instDidToggle") == false {
            instLabel.isHidden = false
            instToggle.isOn = true
        }
        
// Refresh on load
        refreshButton((Any).self)
        
        
    }
    
// Menu toggle
    @IBAction func menuButton(_ sender: Any) {
        menuView.isHidden = !menuView.isHidden
        if menuView.isHidden == false {
            generatorView.alpha = 0
            refresh.alpha = 0
            produceLabel.alpha = 0
            includeLabel.alpha = 0
            menuIcon.alpha = 0.5
            
        }
        else {
            generatorView.alpha = 1.0
            refresh.alpha = 1.0
            produceLabel.alpha = 1.0
            includeLabel.alpha = 1.0
            menuIcon.alpha = 1.0
        }
    }
    
//   BPM toggle
    @IBAction func bpmToggleAction(_ sender: Any) {
        defaults.set(true, forKey: "bpmDidToggle")
        if bpmToggle.isOn == false {
            bpmLabel.isHidden = true
            defaults.set(false, forKey: "BPM")
        }
        else {
            bpmLabel.isHidden = false
            defaults.set(true, forKey: "BPM")
        }
    }
    
//    Genre toggle
    @IBAction func genreToggleAction(_ sender: Any) {
        defaults.set(true, forKey: "genreDidToggle")
        if genreToggle.isOn == false {
            genreLabel.isHidden = true
            defaults.set(false, forKey: "Genre")
        }
        else {
            genreLabel.isHidden = false
            defaults.set(true, forKey: "Genre")
        }
    }
    
//   Key Toggle
    @IBAction func keyToggleAction(_ sender: Any) {
        defaults.set(true, forKey: "keyToggled")
        if keyToggle.isOn == false {
            keyLabel.isHidden = true
            defaults.set(false, forKey: "Key")
        }
        else {
            keyLabel.isHidden = false
            defaults.set(true, forKey: "Key")
        }
    }
    
//    Instrument toggle
    @IBAction func instToggleAction(_ sender: Any) {
        defaults.set(true, forKey: "instDidToggle")
        if instToggle.isOn == false {
            instView.isHidden = true
            instNum.isEnabled = false
            includeLabel.isHidden = true
            defaults.set(false, forKey: "Instruments")
        }
        else {
            instView.isHidden = false
            instNum.isEnabled = true
            includeLabel.isHidden = false
            defaults.set(true, forKey: "Instruments")
        }
    }
    

//   Segmented control index change action for instruments
    @IBAction func instNumAction(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
        case 0:
            inst2Label.isHidden = true
            inst3Label.isHidden = true
            inst4Label.isHidden = true
            inst5Label.isHidden = true
        defaults.set("1", forKey: "Instrument Number")
        case 1:
            inst2Label.isHidden = true
            inst3Label.isHidden = true
            inst4Label.isHidden = true
            inst5Label.isHidden = false
        defaults.set("2", forKey: "Instrument Number")
        case 2:
            inst2Label.isHidden = true
            inst3Label.isHidden = true
            inst4Label.isHidden = false
            inst5Label.isHidden = false
        defaults.set("3", forKey: "Instrument Number")
        case 3:
            inst2Label.isHidden = true
            inst3Label.isHidden = false
            inst4Label.isHidden = false
            inst5Label.isHidden = false
        defaults.set("4", forKey: "Instrument Number")
        case 4:
            inst2Label.isHidden = false
            inst3Label.isHidden = false
            inst4Label.isHidden = false
            inst5Label.isHidden = false
        defaults.set("5", forKey: "Instrument Number")
            
        default:
            break
        }

        
    } //End of viewdidload
    
    
//  Refresh function
    @IBAction func refreshButton(_ sender: Any) {
        menuView.isHidden = true
        refresh.alpha = 1.0
        generatorView.alpha = 1.0
        let randomBPM = Int.random(in: 50..<150)
        bpmLabel.text = "\(randomBPM) BPM"
        genreLabel.text = genre.randomElement()
        keyLabel.text = "\(key.randomElement()!) \(majMin.randomElement()!)"
        instLabel.text = instrument.randomElement()
        
//          Inst 2
        repeat {
            inst2Label.text = instrument.randomElement() }
        while inst2Label.text == instLabel.text
                
//          Inst 3
        repeat {
        inst3Label.text = instrument.randomElement() }
        while inst3Label.text == instLabel.text || inst3Label.text == inst2Label.text
        
//          Inst 4
        repeat {
                inst4Label.text = instrument.randomElement() }
        while inst4Label.text == instLabel.text || inst4Label.text == inst2Label.text || inst4Label.text == inst3Label.text
                
//          Inst 5
        repeat {
                inst5Label.text = instrument.randomElement() }
        while inst5Label.text == instLabel.text || inst5Label.text == inst2Label.text || inst5Label.text == inst3Label.text || inst5Label.text == inst4Label.text
                
// Various conditional statements, mostly based on genre
        if genreLabel.isHidden == true {
            bpmLabel.text = "\(randomBPM) BPM"
            }
        
        if genreLabel.text == "Dubstep" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 140..<150)) BPM"
            }
       
        if genreLabel.text == "Hip Hop" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 70..<110)) BPM"
            }
        
        if genreLabel.text == "Rap" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 70..<110)) BPM"
            }
        
        if genreLabel.text == "Trap" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 130..<170)) BPM"
            }
        
        if genreLabel.text == "Jazz Rap" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 70..<110)) BPM"
            }
        
        if genreLabel.text == "Lo-fi Hip Hop" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 70..<110)) BPM"
            }
        
        if genreLabel.text == "Chillhop" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 70..<110)) BPM"
            }
        
        if genreLabel.text == "Old School Hip Hop" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 70..<110)) BPM"
            }
        
        if genreLabel.text == "Drum & Bass" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 160..<180)) BPM"
            }
        
        if genreLabel.text == "Future Bass" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 80..<160)) BPM"
            }
        
        if genreLabel.text == "Indie Folk" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 80..<120)) BPM"
            }
        
        if genreLabel.text == "Blues" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 40..<110)) BPM"
            }
        
        if genreLabel.text == "Reggae" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 80..<110)) BPM"
            }
        
        if genreLabel.text == "J-Pop" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 80..<160)) BPM"
            }
        
        if genreLabel.text == "K-Pop" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 80..<160)) BPM"
            }
        
        if genreLabel.text == "Neo-Soul" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 60..<120)) BPM"
            }
        
        if genreLabel.text == "House" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 115..<130)) BPM"
            }
        
        if genreLabel.text == "R&B" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 60..<90)) BPM"
            }
        
        if genreLabel.text == "Techno" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 120..<150)) BPM"
            }
        
        if genreLabel.text == "Electro" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 120..<150)) BPM"
            }
        
        if genreLabel.text == "Funk" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 80..<130)) BPM"
            }
        
        if genreLabel.text == "Grime" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 130..<150)) BPM"
            }
        
        if genreLabel.text == "Shoegaze" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 90..<130)) BPM"
            }
        
        if genreLabel.text == "Punk" && genreToggle.isOn == true {
            bpmLabel.text = "\(Int.random(in: 140..<220)) BPM"
            }
            
    }
    
    
    @IBAction func pullDownRefresh(_ sender: Any) {
        refreshButton((Any).self)
    }
    
    @IBAction func outsideTouch(_ sender: Any) {
        generatorView.alpha = 1.0
        refresh.alpha = 1.0
        produceLabel.alpha = 1.0
        includeLabel.alpha = 1.0
        menuIcon.alpha = 1.0
        menuView.isHidden = true
        produceLabel.isHidden = false
        includeLabel.isHidden = false
    }
    
    @IBAction func topOutsideTouch(_ sender: Any) {
        generatorView.alpha = 1.0
        refresh.alpha = 1.0
        produceLabel.alpha = 1.0
        includeLabel.alpha = 1.0
        menuIcon.alpha = 1.0
        menuView.isHidden = true
        produceLabel.isHidden = false
        includeLabel.isHidden = false
    }
    
    
}
