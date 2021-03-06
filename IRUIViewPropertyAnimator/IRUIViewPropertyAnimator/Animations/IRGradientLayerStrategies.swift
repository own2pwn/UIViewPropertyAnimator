//
//  IRGradientAnimationStrategies.swift
//  IRUIViewPropertyAnimator
//

import UIKit
import QuartzCore

private func createGradientLayer(view : UIView) -> CAGradientLayer{
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [UIColor.yellow.cgColor, view.backgroundColor!.cgColor]
    
    return gradientLayer
}

struct GradientStartEndPointStrategy : IRAnimationStrategy{
    let startValue = CGPoint(x: 0.0, y: 0.0)
    let endValue = CGPoint(x: 1.0, y: 1.0)
    
    func animate(view: UIView) {
        
        let gradientLayer = createGradientLayer(view: view)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let animation1 = CABasicAnimation(keyPath: "startPoint")
        animation1.duration = 2.0
        animation1.fromValue = startValue
        animation1.toValue = endValue
        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        gradientLayer.add(animation1, forKey: "startpointAnimation")
        gradientLayer.startPoint = endValue
        
        
        let animation2 = CABasicAnimation(keyPath: "endPoint")
        animation2.duration = 2.0
        animation2.fromValue = startValue
        animation2.toValue = endValue
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        gradientLayer.add(animation2, forKey: "endpointAnimation")
        gradientLayer.endPoint = endValue
        
    }
}

struct GradientLocationStrategy : IRAnimationStrategy{

    let startValue : [NSNumber] = [-0.3, 0.0]
    let endValue : [NSNumber] = [0.7, 1.5]
    
    func animate(view: UIView) {
        
        let gradientLayer = createGradientLayer(view: view)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let animation1 = CABasicAnimation(keyPath: "locations")
        animation1.duration = 2.0
        animation1.fromValue = startValue
        animation1.toValue = endValue
        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        gradientLayer.add(animation1, forKey: "locationsAnimation")
        gradientLayer.locations = endValue
        
    }
}

struct GradientColorsStrategy : IRAnimationStrategy{
    
    func animate(view: UIView) {
        
        let gradientLayer = createGradientLayer(view: view)
        let startValue = [view.backgroundColor!.cgColor, UIColor.yellow.cgColor]
        let endValue = [UIColor.yellow.cgColor, UIColor.red.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let animation1 = CABasicAnimation(keyPath: "colors")
        animation1.duration = 2.0
        animation1.fromValue = startValue
        gradientLayer.colors = endValue
        animation1.toValue = gradientLayer.colors
        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        gradientLayer.add(animation1, forKey: "colorsAnimation")
        gradientLayer.colors = endValue
        
    }
}
