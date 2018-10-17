//
//  VersaRewindButton.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/11/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import UIKit

@IBDesignable
open class VersaStatefulButton: UIButton {
    
    @IBInspectable public var activeImage: UIImage? = nil
    @IBInspectable public var inactiveImage: UIImage? = nil {
        didSet {
            setImage(inactiveImage, for: .normal)
        }
    }
    
    public func set(active: Bool) {
        if active {
            setImage(activeImage, for: .normal)
        }else {
            setImage(inactiveImage, for: .normal)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.contentMode = .scaleAspectFit
        setFocusStateIfNeeded()
    }
    
    open override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        setFocusStateIfNeeded()
    }
    
    func setFocusStateIfNeeded() {
        if isFocused {
            alpha = 1
        } else {
            alpha = 0.5
        }
    }
        
}

