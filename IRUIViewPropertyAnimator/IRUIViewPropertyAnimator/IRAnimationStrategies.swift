//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

enum IRAnimationStrategyType {
    case SingleProperty
}

protocol IRAnimationStrategy {
    func animate(view:UIView)
}

struct IRAnimationStrategyFactory {
    let model = [IRAnimationStrategyType.SingleProperty : SinglePropertyStrategy()]

    func strategyFor(type: IRAnimationStrategyType) -> IRAnimationStrategy {
        return model[type]!
    }
}

struct SinglePropertyStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            [unowned view] in
            let currentCenter = view.center
            let finalCenter = CGPoint(x: currentCenter.x + 250.0, y: currentCenter.y)
            view.center = finalCenter
        }

        animator.startAnimation()
    }
}
