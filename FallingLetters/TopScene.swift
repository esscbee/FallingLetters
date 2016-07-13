//
//  TopScene.swift
//  FallingLetters
//
//  Created by Stephen Brennan on 7/13/16.
//  Copyright © 2016 Stephen Brennan. All rights reserved.
//

import Foundation
import SpriteKit

let textColors = [ UIColor.redColor(), UIColor.cyanColor(), UIColor.greenColor(), UIColor.magentaColor(), UIColor.purpleColor() ]

class TopScene : SKScene {
    override func didMoveToView(view: SKView) {
    }
    
    func someText(text : String) {
        let label = SKLabelNode(text: text)
        label.position.y = frame.height
        label.position.x = CGFloat(random() % Int(frame.width))
        label.fontColor = textColors[random() % textColors.count ]
        self.addChild(label)
        
        let fall = SKAction.moveToY(0, duration: 1)
        let remove = SKAction.removeFromParent()
        let seq = SKAction.sequence([fall, remove])
        label.runAction(seq)
    }
}
