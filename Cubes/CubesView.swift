//
//  CubesView.swift
//  Cubes
//
//  Created by AlexanderYakovenko on 7/3/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class CubesView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.frame = CGRect(x: 20, y: 220, width: 50, height: 50)
        frameMyCub()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func frameMyCub() {
        
        self.backgroundColor = getRandomColor()
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        /*
        let horConst = NSLayoutConstraint(item: self,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: superview ,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0.0)
        let verConst = NSLayoutConstraint(item: self,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: superview,
                                          attribute: .top,
                                          multiplier: 1.0,
                                          constant: -superview!.frame.size.height * 0.1    )
        let widConst = NSLayoutConstraint(item: self,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: superview ,
                                          attribute: .width,
                                          multiplier: 0.2,
                                          constant: 0.0)
        let heiConst = NSLayoutConstraint(item: self,
                                          attribute: .height,
                                          relatedBy: .equal,
                                          toItem: superview ,
                                          attribute: .height,
                                          multiplier: 0.1,
                                          constant: 0.0)
        
        superview!.addConstraints([horConst, verConst, widConst, heiConst])
        */
        
        /*
        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) {_ in
            
            UIView.animate(withDuration: 5.0, delay: 2.0, animations: {
                const.constant = (self.superview!.frame.size.height)
                self.superview!.layoutIfNeeded()
            }, completion: {_ in
                
                //self.removeFromSuperview()
            })
            
        }
        RunLoop.current.add(timer, forMode: .commonModes)
        
        */
        
        
        
        

    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            
            
            
        }
    }
    
    
    func getRandomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
}
