//
//  ViewController.swift
//  FallingLetters
//
//  Created by Stephen Brennan on 7/13/16.
//  Copyright © 2016 Stephen Brennan. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textBox: UITextField!
    
    var topScene : TopScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBox.delegate = self
        
        topScene = TopScene(fileNamed: "TopScene")
        let tbFrame = textBox.frame
        print("tbFrame: \(tbFrame)")
        print("viewFrame: \(view.frame)")
        
        let skOrigin = CGPoint(x: 0, y: 0)
        let skDy = 75 + view.frame.height - textBox.frame.origin.y
        let skRect = CGRect(origin: skOrigin, size: CGSize(width: view.frame.width, height: skDy))
        
        print("skRect: \(skRect)")
            
        if true {
            let skView = SKView(frame: skRect)
            skView.backgroundColor = UIColor.redColor()
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            topScene.scaleMode = .ResizeFill
            skView.presentScene(topScene)
            view.addSubview(skView)
        } else {
            print(skRect)
            let v = UIView(frame: skRect)
//            v.backgroundColor = UIColor.greenColor()
            self.view.addSubview(v)
        }
        
        textBox.becomeFirstResponder()
    }
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        topScene.someText(string)
//        return true
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let t = textField.text {
            topScene.someText(t)
            textField.text = nil
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }


}

