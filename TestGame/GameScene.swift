//
//  GameScene.swift
//  TestGame
//
//  Created by Mark Janes on 23/04/2017.
//  Copyright © 2017 The Light Machine. All rights reserved.
//

import SpriteKit
//import GameplayKit

class GameScene: SKScene {
    let cam = SKCameraNode()
    let ground = Ground()
    let player = Player()
    
    override func didMove(to view: SKView) {
        // Lower left starting position, colour, size and position
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        self.camera = cam
        
        let bee2 = Bee()
        bee2.position = CGPoint(x:325, y: 325)
        self.addChild(bee2)
        
        let bee3 = Bee()
        bee3.position = CGPoint(x:200, y: 325)
        self.addChild(bee3)
        
        ground.position = CGPoint(x: -self.size.width * 2, y: 150)
        ground.size = CGSize(width: self.size.width * 6, height: 0)
        ground.createChildren()
        self.addChild(ground)
        
        player.position = CGPoint(x: 150, y: 250)
        self.addChild(player)
    }
    
    override func didSimulatePhysics() {
        self.camera!.position = player.position
    }
}
