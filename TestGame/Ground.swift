//
//  Ground.swift
//  TestGame
//
//  Created by Mark Janes on 25/04/2017.
//  Copyright © 2017 The Light Machine. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode, GameSprite {
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named: "Environment")
    var initialSize = CGSize.zero
    
    func createChildren() {
        self.anchorPoint = CGPoint(x:0, y:1)
        let texture = textureAtlas.textureNamed("ground")
        var tileCount:CGFloat = 0
        let tileSize = CGSize(width: 35, height: 300)
        
        while tileCount * tileSize.width < self.size.width {
            let tileNode = SKSpriteNode(texture: texture)
            tileNode.size = tileSize
            tileNode.position.x = tileCount * tileSize.width
            tileNode.anchorPoint = CGPoint(x: 0, y: 1)
            
            self.addChild(tileNode)
            tileCount += 1
        }
    }
    
    func onTap() { }
}
