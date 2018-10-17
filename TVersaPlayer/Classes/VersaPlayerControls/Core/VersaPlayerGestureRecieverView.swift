//
//  VersaPlayerGestureRecieverView.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/11/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import UIKit

open class VersaPlayerGestureRecieverView: UIView {
    
    internal var handler: VersaPlayer!

    /// VersaPlayerGestureRecieverViewDelegate instance
    public var delegate: VersaPlayerGestureRecieverViewDelegate? = nil
    
    /// UITapGestureRecognizer
    public var tapGesture: UITapGestureRecognizer? = nil
    
    /// UIPanGestureRecognizer
    public var swipeGestureUp: UISwipeGestureRecognizer? = nil
    public var swipeGestureDown: UISwipeGestureRecognizer? = nil
    public var swipeGestureLeft: UISwipeGestureRecognizer? = nil
    public var swipeGestureRight: UISwipeGestureRecognizer? = nil
    
    /// Whether or not reciever view is ready
    public var ready: Bool = false
    
    /// Should become focused
    public var shouldBecomeFocused: Bool = true
    
    private var initialSwipeLocation: CGPoint = .zero
    
    open override var canBecomeFocused: Bool {
         return shouldBecomeFocused
    }
    
    open override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        initialSwipeLocation = touches.first?.location(in: self) ?? .zero
    }
    
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        translatesAutoresizingMaskIntoConstraints = false
        if let parent = superview {
            topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
            leftAnchor.constraint(equalTo: parent.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: parent.rightAnchor).isActive = true
            bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        }
        if !ready {
            prepare()
        }
    }
    
    /// Prepare the view gesture recognizers
    public func prepare() {
        ready = true
        isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler(with:)))
        tapGesture?.allowedPressTypes = [NSNumber(value: UIPressType.menu.rawValue), NSNumber(value: UIPressType.select.rawValue)]
        tapGesture?.numberOfTapsRequired = 1
        
        let playPause = UITapGestureRecognizer(target: self, action: #selector(togglePlayback))
        playPause.allowedPressTypes = [NSNumber(value: UIPressType.playPause.rawValue)]
        playPause.numberOfTapsRequired = 1
        
        swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(with:)))
        swipeGestureUp?.direction = UISwipeGestureRecognizerDirection.up
        
        swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(with:)))
        swipeGestureDown?.direction = UISwipeGestureRecognizerDirection.down
        
        swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(with:)))
        swipeGestureLeft?.direction = UISwipeGestureRecognizerDirection.left
        
        swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(with:)))
        swipeGestureRight?.direction = UISwipeGestureRecognizerDirection.right
        
        addGestureRecognizer(tapGesture!)
        addGestureRecognizer(playPause)
        addGestureRecognizer(swipeGestureUp!)
        addGestureRecognizer(swipeGestureDown!)
        addGestureRecognizer(swipeGestureLeft!)
        addGestureRecognizer(swipeGestureRight!)
    }
    
    @objc private func togglePlayback() {
        self.handler.togglePlayback()
    }
    
    @objc public func tapHandler(with sender: UITapGestureRecognizer) {
        delegate?.didTap(at: sender.location(in: self))
    }
    
    @objc public func swipeHandler(with sender: UISwipeGestureRecognizer) {
        let direction: UISwipeGestureRecognizerDirection = sender.direction
        delegate?.didSwipe(with: direction)
    }

}
