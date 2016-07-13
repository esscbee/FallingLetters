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
        
        let rotate = SKAction.rotateByAngle(CGFloat(M_PI), duration: 1)
        let scale = SKAction.scaleBy(2, duration: 3)
        let fall = SKAction.moveToY(0, duration: 3)
        let remove = SKAction.removeFromParent()
        let code = SKAction.runBlock({
            print("Done!")
        })

        let group = SKAction.group([rotate, fall, scale ])
        let seq = SKAction.sequence([group, remove, code])
        label.runAction(seq)
    }
    
    var nextTime = 0.0
    
    override func update(currentTime: NSTimeInterval) {
        let now = NSDate().timeIntervalSince1970
        
        if now > nextTime {
            nextTime = now + 3 + Double(random() % 25) / 10.0
            // spawn
        }
    }
}
