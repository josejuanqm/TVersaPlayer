//
//  VersaPlayerGestureRecieverViewDelegate.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/11/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import Foundation
import UIKit

public protocol VersaPlayerGestureRecieverViewDelegate {
    /// Tap was recognized
    ///
    /// - Parameters:
    ///     - scale: CGPoin at wich touch was recognized
    func didTap(at point: CGPoint)
    
    /// Swipe was recognized
    ///
    /// - Parameters:
    ///     - direction: gestureDirection
    func didSwipe(with direction: UISwipeGestureRecognizerDirection)
}
