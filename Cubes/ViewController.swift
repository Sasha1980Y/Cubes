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
    var countOfCubes = 5
    
    let newCubes = CubesView()
    var arrayOfCubes = [CubesView]()
   
    
    @IBOutlet weak var countOfTapLabel: UILabel!
    @IBOutlet weak var cuontOfAllLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let viewTablo = UIView()
        viewTablo.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.size.width), height: Int(self.view.frame.size.height * 0.1))
        viewTablo.backgroundColor = UIColor.red
        view.addSubview(viewTablo)
        */
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
            countOfTapLabel.text = String(countOfTaps)
            
        
            for indexCub in 0..<self.countOfCubes {
                
                let newCub = CubesView()
                //newCub.layer.zPosition = CGFloat(indexCub)
                
                
                arrayOfCubes.append(newCub)
                
                
                
                self.addCub(cubItem: self.arrayOfCubes[indexCub])
                
                
            }
        
        
        
    }
 
    // tap while cub go down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch?.location(in: self.view)
        
        
        
        
        for view in (self.view.subviews).reversed() {
            if let _ = view.layer.presentation()?.hitTest(touchLocation!)  /*, view.tag == 999*/ {
                
                
                print("Ok")
                countOfTaps += 1
                countOfTapLabel.text = String(countOfTaps)
                view.removeFromSuperview()
                return
                
            }
            
        }
    
    }
    
    func addCub(cubItem: CubesView) {
        
        //newCubes.tag = 999
        
        self.view.addSubview(cubItem)
        
        
        
        let horConst = NSLayoutConstraint(item: cubItem,
                                          attribute: .left ,
                                          relatedBy: .equal,
                                          toItem: self.view ,
                                          attribute: .left,
                                          multiplier: 1,
                                          constant: (CGFloat(0.0 + Double( arc4random_uniform(UInt32(self.view.frame.size.width))))) - self.view.frame.size.width * 0.1)
        let verConst = NSLayoutConstraint(item: cubItem,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: self.view,
                                          attribute: .top,
                                          multiplier: 1.0,
                                          constant: self.view.frame.size.height * 0.1    )
        let widConst = NSLayoutConstraint(item: cubItem,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: self.view ,
                                          attribute: .width,
                                          multiplier: 0.2,
                                          constant: 0.0)
        let heiConst = NSLayoutConstraint(item: cubItem,
                                          attribute: .height,
                                          relatedBy: .equal,
                                          toItem: self.view ,
                                          attribute: .height,
                                          multiplier: 0.1,
                                          constant: 0.0)
        
        self.view.addConstraints([horConst, verConst, widConst, heiConst])
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) {_ in
            
            
            UIView.animate(withDuration: 10.0, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
                verConst.constant = self.view.frame.size.height - self.view.frame.size.height * 0.1
                self.view.layoutIfNeeded()
                
            }, completion: {_ in
                
            })
        }
        
        //}
        RunLoop.current.add(timer, forMode: .commonModes)
        
    }
    
    

}

