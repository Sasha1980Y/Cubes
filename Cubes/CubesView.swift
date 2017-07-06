//
//  CubesView.swift
//  Cubes
//
//  Created by AlexanderYakovenko on 7/3/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class CubesView: UIView {

    var horConstraint: NSLayoutConstraint?
    var verConstraint: NSLayoutConstraint?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        frameMyCub()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func frameMyCub() {
        
        self.backgroundColor = getRandomColor()
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func getRandomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
}
