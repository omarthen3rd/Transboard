//
//  LinguaboardTableViewController.swift
//  Linguaboard
//
//  Created by Omar Abbasi on 2017-02-13.
//  Copyright © 2017 Omar Abbasi. All rights reserved.
//

import UIKit

class LinguaboardTableViewController: UITableViewController {

    // 0 == nil
    // 1 == true
    // 2 == false
    
    // TODO
    // update switches based on UserDefaults when loading app
    
    @IBOutlet var allLabels: [UILabel]!
    @IBOutlet var darkModeSwitch: UISwitch!
    @IBOutlet var whiteMinimalMode: UISwitch!
    @IBOutlet var darkMinimalMode: UISwitch!
    @IBOutlet var keyBackgroundSwitch: UISwitch!
    @IBOutlet var spaceDoubleTapSwitch: UISwitch!

    @IBAction func darkModeAction(_ sender: Any) {
        
        if darkModeSwitch.isOn && darkModeSwitch.isEnabled {
            
            whiteMinimalMode.isEnabled = false
            // whiteMinimalBool.set("nil", forKey: "whiteMinimalBool")
            whiteMinimalBool.set(0, forKey: "whiteMinimalBool")
            whiteMinimalBool.synchronize()
            
            darkMinimalMode.isEnabled = false
            // darkMinimalModeBool.set("nil", forKey: "darkMinimalBool")
            darkMinimalModeBool.set(0, forKey: "darkMinimalBool")
            darkMinimalModeBool.synchronize()
            
            // darkModeBool.set("true", forKey: "darkBool")
            darkModeBool.set(1, forKey: "darkBool")
            darkModeBool.synchronize()
            
        } else if !(darkModeSwitch.isOn) && darkModeSwitch.isEnabled {
            
            whiteMinimalMode.isEnabled = true
            // whiteMinimalBool.set("nil", forKey: "whiteMinimalBool")
            whiteMinimalBool.set(0, forKey: "whiteMinimalBool")
            whiteMinimalBool.synchronize()
            
            darkMinimalMode.isEnabled = true
            // darkMinimalModeBool.set("nil", forKey: "darkMinimalBool")
            darkMinimalModeBool.set(0, forKey: "darkMinimalBool")
            darkMinimalModeBool.synchronize()
            
            // darkModeBool.set("false", forKey: "darkBool")
            darkModeBool.set(2, forKey: "darkBool")
            darkModeBool.synchronize()
            
        }
        
    }
    
    var darkModeBool: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    var whiteMinimalBool: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    var darkMinimalModeBool: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    var keyBackgroundBool: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    var spaceDoubleTapBool: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    var firstRemeberedLanguage: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    var secondRemeberedLanguage: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    var lastUsedLanguage: UserDefaults = UserDefaults(suiteName: "group.Linguaboard")!
    
    var globalTintColor: UIColor = UIColor.white // UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
    var altGlobalTintColor: UIColor = UIColor.darkGray
    var backgroundColor: UIColor = UIColor.clear // UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
    var blurEffect: UIBlurEffect = UIBlurEffect.init(style: UIBlurEffectStyle.light)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.darkMinimalMode.addTarget(self, action: #selector(self.minimalMode(_:)), for: .touchUpInside)
        self.whiteMinimalMode.addTarget(self, action: #selector(self.minimalMode(_:)), for: .touchUpInside)
        self.keyBackgroundSwitch.addTarget(self, action: #selector(self.keyBackground(_:)), for: .touchUpInside)
        self.spaceDoubleTapSwitch.addTarget(self, action: #selector(self.spaceDoubleTap(_:)), for: .touchUpInside)
        loadInterface()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInterface() {
        
        let darkMode = darkModeBool.double(forKey: "darkBool")
        let whiteMinimal = whiteMinimalBool.double(forKey: "whiteMinimalBool")
        let darkMinimal = darkMinimalModeBool.double(forKey: "darkMinimalBool")
        let keyBackground = keyBackgroundBool.double(forKey: "keyBackgroundBool")
        let spaceDoubleTapDouble = spaceDoubleTapBool.double(forKey: "spaceDoubleTapBool")
        
        if darkMode == 1 {
            
            darkModeSwitch.isOn = true
            darkModeSwitch.isEnabled = true
            
            whiteMinimalMode.isOn = false
            whiteMinimalMode.isEnabled = false
            darkMinimalMode.isOn = false
            darkMinimalMode.isEnabled = false
            
        } else if whiteMinimal == 1 {
            
            whiteMinimalMode.isOn = true
            whiteMinimalMode.isEnabled = true
            
            darkModeSwitch.isOn = false
            darkModeSwitch.isEnabled = false
            darkMinimalMode.isOn = false
            darkMinimalMode.isEnabled = false
            
        } else if darkMinimal == 1 {
            
            darkMinimalMode.isOn = true
            darkMinimalMode.isEnabled = true
            
            darkModeSwitch.isOn = false
            darkModeSwitch.isEnabled = false
            whiteMinimalMode.isOn = false
            whiteMinimalMode.isEnabled = false

        } else {
            
            darkMinimalMode.isOn = false
            darkMinimalMode.isEnabled = true
            darkModeSwitch.isOn = false
            darkModeSwitch.isEnabled = true
            whiteMinimalMode.isOn = false
            whiteMinimalMode.isEnabled = true
            
        }
        
        if keyBackground == 1 {
            
            keyBackgroundSwitch.isOn = true
            keyBackgroundSwitch.isEnabled = true
            
        } else {
            
            keyBackgroundSwitch.isOn = false
            keyBackgroundSwitch.isEnabled = true
            
        }
        
        if spaceDoubleTapDouble == 1 {
            
            spaceDoubleTapSwitch.isOn = true
            spaceDoubleTapSwitch.isEnabled = true
            
        } else {
            
            spaceDoubleTapSwitch.isOn = false
            spaceDoubleTapSwitch.isEnabled = true
            
        }
        
    }
    
    func spaceDoubleTap(_ sender: UISwitch) {
        
        if sender == spaceDoubleTapSwitch {
            
            if sender.isOn && sender.isEnabled {
                
                spaceDoubleTapBool.set(1, forKey: "spaceDoubleTapBool")
                spaceDoubleTapBool.synchronize()
                
            } else if !(sender.isOn) && sender.isEnabled {
                
                spaceDoubleTapBool.set(2, forKey: "spaceDoubleTapBool")
                spaceDoubleTapBool.synchronize()
                
            }
            
        }
        
    }

    func keyBackground(_ sender: UISwitch) {
        
        if sender == keyBackgroundSwitch {
            
            if sender.isOn && sender.isEnabled {
                
                keyBackgroundBool.set(1, forKey: "keyBackgroundBool")
                keyBackgroundBool.synchronize()
                
            } else if !(sender.isOn) && sender.isEnabled {
                
                keyBackgroundBool.set(2, forKey: "keyBackgroundBool")
                keyBackgroundBool.synchronize()
                
            }
            
        }
        
    }
    
    func minimalMode(_ sender: UISwitch) {
        
        if sender == whiteMinimalMode {
            
            if sender.isOn && sender.isEnabled {
                
                print("ran white on")
                
                darkMinimalMode.isEnabled = false
                // darkMinimalModeBool.set("nil", forKey: "darkMinimalBool")
                darkMinimalModeBool.set(0, forKey: "darkMinimalBool")
                darkMinimalModeBool.synchronize()
                
                darkModeSwitch.isEnabled = false
                // darkModeBool.set("nil", forKey: "darkBool")
                darkModeBool.set(0, forKey: "darkBool")
                darkModeBool.synchronize()
                
                // whiteMinimalBool.set("true", forKey: "whiteMinimalBool")
                whiteMinimalBool.set(1, forKey: "whiteMinimalBool")
                whiteMinimalBool.synchronize()
                
                loadInterface()
                
            } else if !(sender.isOn) && sender.isEnabled {
                
                print("ran white off")
                
                darkMinimalMode.isEnabled = true
                // darkMinimalModeBool.set("nil", forKey: "darkMinimalBool")
                darkMinimalModeBool.set(0, forKey: "darkMinimalBool")
                darkMinimalModeBool.synchronize()
                
                darkModeSwitch.isEnabled = true
                // darkModeBool.set("nil", forKey: "darkBool")
                darkModeBool.set(0, forKey: "darkBool")
                darkModeBool.synchronize()
                
                // whiteMinimalBool.set("false", forKey: "whiteMinimalBool")
                whiteMinimalBool.set(2, forKey: "whiteMinimalBool")
                whiteMinimalBool.synchronize()
                
                loadInterface()
                
            }
            
            
        } else if sender == darkMinimalMode {
            
            if sender.isOn && sender.isEnabled {
                
                print("ran dark on")
                
                whiteMinimalMode.isEnabled = false
                // whiteMinimalBool.set("nil", forKey: "whiteMinimalBool")
                whiteMinimalBool.set(0, forKey: "whiteMinimalBool")
                whiteMinimalBool.synchronize()
                
                darkModeSwitch.isEnabled = false
                // darkModeBool.set("nil", forKey: "darkBool")
                darkModeBool.set(0, forKey: "darkBool")
                darkModeBool.synchronize()
                
                // darkMinimalModeBool.set("true", forKey: "darkMinimalBool")
                darkMinimalModeBool.set(1, forKey: "darkMinimalBool")
                darkMinimalModeBool.synchronize()
                
                loadInterface()
                
            } else if !(sender.isOn) && sender.isEnabled {
                
                print("ran dark off")
                
                whiteMinimalMode.isEnabled = true
                // whiteMinimalBool.set("nil", forKey: "whiteMinimalBool")
                whiteMinimalBool.set(0, forKey: "whiteMinimalBool")
                whiteMinimalBool.synchronize()
                
                darkModeSwitch.isEnabled = true
                // darkModeBool.set("nil", forKey: "darkBool")
                darkModeBool.set(0, forKey: "darkBool")
                darkModeBool.synchronize()
                
                // darkMinimalModeBool.set("false", forKey: "darkMinimalBool")
                darkMinimalModeBool.set(2, forKey: "darkMinimalBool")
                darkMinimalModeBool.synchronize()
                
                loadInterface()
                
            }
            
        }
        
    }

}
