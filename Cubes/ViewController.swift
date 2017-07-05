//
//  ViewController.swift
//  Cubes
//
//  Created by AlexanderYakovenko on 7/3/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countOfAll = 0
    var countOfTaps = 0
    var countOfCubes = 3
    
    
    
    var arrayOfCubes = [CubesView]()
   
    
    @IBOutlet weak var countOfTapLabel: UILabel!
    @IBOutlet weak var cuontOfAllLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let constWidthView = self.view.frame.size.width
        print(constWidthView)
        let constHeigthView = self.view.frame.size.height
        print(constHeigthView)
        let constWidthCub = Int(constWidthView * 0.177)
        print(constWidthCub)
        let constHeigthCub = Int(constHeigthView * 0.1)
        print(constHeigthCub)
        */
        
        
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
            
        countOfTapLabel.text = String(countOfTaps)
        
        for item in 0..<countOfCubes {
            let newCub = CubesView()
            arrayOfCubes.append(newCub)
            view.addSubview(newCub)
            addNewCub(sender: arrayOfCubes[item], superview: self.view)
            
            
        }
        
        
        
        
        
    }
    
 
    // tap while cub go down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch?.location(in: self.view)
        
        
        print("subview \(self.view.subviews)")
        print("end")
        
        for view in (self.view.subviews).reversed() {
            
        
            
        
            if let _ = view.layer.presentation()?.hitTest(touchLocation!)  /*, view.tag == 999*/ {
                
                if view.layer != countOfTapLabel.layer && view.layer != cuontOfAllLabel.layer   {
                    print("Ok")
                    countOfTaps += 1
                    countOfTapLabel.text = String(countOfTaps)
                
                    
                    
                        for (key, value) in arrayOfCubes.enumerated() {
                            if view.layer == value.layer {
                                print("create new cub")
                            print(value.frame)
                                
                                addNewCub(sender: value, superview: self.view)
                                print("*****")
                                print(key)
                                print("*****")
                            
                            }
                    

                        }
                                        
                
                //view.removeFromSuperview()
                return
                }
                
            }
            
        }
        
        
        
        
        
    
    }
    
    
    func addNewCub(sender: UIView, superview: UIView) {
        let horConstr = NSLayoutConstraint(item: sender,
                                           attribute: .left,
                                           relatedBy: .equal ,
                                           toItem: superview,
                                           attribute: .left,
                                           multiplier: 1.0,
                                           constant: CGFloat(arc4random_uniform(UInt32(superview.frame.size.width)-UInt32(superview.frame.size.height * 0.1))))
        let verConstr = NSLayoutConstraint(item: sender,
                                           attribute: .top,
                                           relatedBy: .equal,
                                           toItem: superview,
                                           attribute: .top,
                                           multiplier: 1.0,
                                           constant: superview.frame.size.height * 0.1)
        let widConstr = NSLayoutConstraint(item: sender, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 0.2, constant: 0.0)
        let heiConstr = NSLayoutConstraint(item: sender, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 0.1, constant: 0.0)
        superview.addConstraints([horConstr, verConstr, widConstr, heiConstr])
        
        
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) {_ in
            
            UIView.animate(withDuration: 5.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.allowUserInteraction,
            animations: {
                verConstr.constant = superview.frame.size.height
                superview.layoutIfNeeded()
            }, completion: {_ in
                
             
                // SKSpriteMode
                
                   
                if sender.frame.origin.y >= 300 {
                    verConstr.constant = 100
                }
                    
                
                
                //self.arrayOfCubesItem(sender: sender, superview: self.view)
                //verConstr.constant = superview.frame.size.height * 0.1
            })
            
            
            
            /*
            UIView.animate(withDuration: 5.0, delay: 0.0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
                verConstr.constant = superview.frame.size.height
                superview.layoutIfNeeded()
            }, completion: {_ in
                
                
                
            })
            */
        }
        RunLoop.current.add(timer, forMode: .commonModes)
        
        
    }
    
    func arrayOfCubesItem(sender: UIView, superview: UIView) {
        
        let horConstr = NSLayoutConstraint(item: sender,
                                           attribute: .left,
                                           relatedBy: .equal ,
                                           toItem: superview,
                                           attribute: .left,
                                           multiplier: 1.0,
                                           constant: CGFloat(arc4random_uniform(UInt32(superview.frame.size.width)-UInt32(superview.frame.size.height * 0.1))))
        let verConstr = NSLayoutConstraint(item: sender,
                                           attribute: .top,
                                           relatedBy: .equal,
                                           toItem: superview,
                                           attribute: .top,
                                           multiplier: 1.0,
                                           constant: superview.frame.size.height * 0.1)
        let widConstr = NSLayoutConstraint(item: sender, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 0.2, constant: 0.0)
        let heiConstr = NSLayoutConstraint(item: sender, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 0.1, constant: 0.0)
        superview.addConstraints([horConstr, verConstr, widConstr, heiConstr])
        
    }


}

