//
//  GameSprite.swift
//  TestGame
//
//  Created by Mark Janes on 24/04/2017.
//  Copyright © 2017 The Light Machine. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas:SKTextureAtlas { get set }
    var initialSize: CGSize { get set }
    func onTap()
}
