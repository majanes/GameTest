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
    let bee = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        // Lower left starting position, colour, size and position
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        self.camera = cam
        self.addTheFlyingBee()
    }
    
    override func didSimulatePhysics() {
        self.camera!.position = bee.position
    }
    
    func addTheFlyingBee() {
        bee.size = CGSize(width: 28, height: 24)
        bee.position = CGPoint(x: 250, y: 250)
        self.addChild(bee)
        
        let beeAtlas = SKTextureAtlas(named: "Enemies")
        let beeFrames:[SKTexture] = [beeAtlas.textureNamed("bee"), beeAtlas.textureNamed("bee-fly")]
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        let beeAction = SKAction.repeatForever(flyAction)
        bee.run(beeAction)
        
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y:10, duration: 2)
        let flipTextureNegative = SKAction.scaleX(to: -1, duration: 0)
        let flipTexturePositive = SKAction.scale(to: 1, duration: 0)
        
        let flightOfTheBee = SKAction.sequence([pathLeft, flipTextureNegative, pathRight, flipTexturePositive])
        let neverEndingFlight = SKAction.repeatForever(flightOfTheBee)
        bee.run(neverEndingFlight)
    }
}
