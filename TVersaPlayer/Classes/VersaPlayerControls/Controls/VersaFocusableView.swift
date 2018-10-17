//
//  VersaFocusableView.swift
//  TVersaPlayer
//
//  Created by Jose Quintero on 10/16/18.
//  Copyright © 2018 Quasar Studio. All rights reserved.
//

import UIKit

class VersaFocusableView: UIView {

    override var canBecomeFocused: Bool {
         return true
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
    }
    
}
