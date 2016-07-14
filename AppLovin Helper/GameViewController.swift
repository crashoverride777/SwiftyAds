//
//  GameViewController.swift
//  AppLovin Helper
//
//  Created by Dominik on 18/05/2016.
//  Copyright (c) 2016 Dominik Ringler. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customAdsInventory = [
            CustomAdInventory(imageName: "AdImageVertigus", storeURL: getAppStoreURL(forAppID: "991933749")),
            CustomAdInventory(imageName:"AdImageAngryFlappies", storeURL: getAppStoreURL(forAppID: "1051292772"))
        ]
        
        CustomAd.sharedInstance.setup(viewController: self, inventory: customAdsInventory)
       
        AdsManager.sharedInstance.setup(viewController: self, customAdsInterval: 3, maxCustomAdsPerSession: 3)
        

        if let scene = GameScene(fileNamed: "GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
