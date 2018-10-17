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
    
    /// Pinch was recognized
    ///
    /// - Parameters:
    ///     - scale: CGFloat scale
    func didPinch(with scale: CGFloat)
    
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
