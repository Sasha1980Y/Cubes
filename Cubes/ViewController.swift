//
//  ViewController.swift
//  Cubes
//
//  Created by AlexanderYakovenko on 7/3/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countOfCubDidDown = 0
    var countOfTaps = 0
    var countOfCubes = 2
    
    
    var arrayOfCubes = [CubesView]()
   
    
    @IBOutlet weak var countOfTapLabel: UILabel!
    
    @IBOutlet weak var countOfCubDidDownLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        countOfTapLabel.text = String(countOfTaps)
        
        for _ in 0..<countOfCubes {
        let newCub = CubesView()
        arrayOfCubes.append(newCub)
        view.addSubview(newCub)
           addConstr(sender: newCub , superview: self.view)
           addAnimation(sender: newCub, superview: self.view)
        
        }
        
    }
    
 
    // tap while cub go down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch?.location(in: self.view)
        
        for view in (self.view.subviews).reversed() {
            
            
            if let _ = view.layer.presentation()?.hitTest(touchLocation!)  /*, view.tag == 999*/ {
                
                if view.layer != countOfTapLabel.layer && view.layer != countOfCubDidDownLabel.layer   {
                                        countOfTaps += 1
                    countOfTapLabel.text = String(countOfTaps)
                
                    for (_ , value) in arrayOfCubes.enumerated() {
                            if view.layer == value.layer {
                                
                                addAnimation(sender: value, superview: self.view)
                                value.layer.removeAllAnimations()
                            }
                    }
                    
                return
                }
                
            }
            
        }
        
    
    }
    
    func addConstr(sender: CubesView, superview: UIView) {
        
        sender.horConstraint = NSLayoutConstraint(item: sender,
                                           attribute: .left,
                                           relatedBy: .equal ,
                                           toItem: superview,
                                           attribute: .left,
                                           multiplier: 1.0,
                                           constant: CGFloat(arc4random_uniform(UInt32(superview.frame.size.width)-UInt32(superview.frame.size.height * 0.1))))
        sender.verConstraint = NSLayoutConstraint(item: sender,
                                           attribute: .top,
                                           relatedBy: .equal,
                                           toItem: superview,
                                           attribute: .top,
                                           multiplier: 1.0,
                                           constant: superview.frame.size.height * 0.1)
        let widConstr = NSLayoutConstraint(item: sender,
                                           attribute: .width,
                                           relatedBy: .equal,
                                           toItem: superview,
                                           attribute: .width,
                                           multiplier: 0.2,
                                           constant: 0.0)
        let heiConstr = NSLayoutConstraint(item: sender,
                                           attribute: .height,
                                           relatedBy: .equal,
                                           toItem: superview,
                                           attribute: .height,
                                           multiplier: 0.1,
                                           constant: 0.0)
        superview.addConstraints([sender.horConstraint!  , sender.verConstraint!, widConstr, heiConstr])

    }
    
    
    func addAnimation(sender: CubesView, superview: UIView) {
        // constr
        sender.horConstraint?.constant = CGFloat(arc4random_uniform(UInt32(superview.frame.size.width - superview.frame.size.width * 0.2)))
        sender.verConstraint?.constant = superview.frame.size.height * 0.1
        
        
        // animation
        
        //DispatchQueue.main.async {  // Dispatch not work correct
            
        
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) {_ in
            
            UIView.animate(withDuration: 5.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1,
                           options: [UIViewAnimationOptions.allowUserInteraction, UIViewAnimationOptions.curveLinear],
                           animations: {
                            
                            sender.verConstraint?.constant = superview.frame.size.height
                            
                            superview.layoutIfNeeded()
                            
            }, completion: { finished in
                
                if finished {
                    self.addAnimation(sender: sender, superview: superview)
                    self.countOfCubDidDown += 1
                    self.countOfCubDidDownLabel.text = String(self.countOfCubDidDown)
                }
                
            })
            
        }
        RunLoop.current.add(timer, forMode: .commonModes)
        
    }
}

