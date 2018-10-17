//
//  VersaPlayer.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/11/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import UIKit
import CoreMedia
import AVFoundation
import AVKit

open class VersaPlayer: UIView {

    /// VersaPlayer presentation context
    public var context: VersaPlayerController!
    
    /// VersaPlayer extension dictionary
    public var extensions: [String: VersaPlayerExtension] = [:]
    
    /// AVPlayer used in VersaPlayer implementation
    public var player: VPlayer!
    
    /// VPlayerRenderingView instance
    public var renderingView: VPlayerRenderingView!
    
    /// VersaPlayerPlaybackDelegate instance
    public var playbackDelegate: VersaPlayerPlaybackDelegate? = nil

    /// Whether player is prepared
    public var ready: Bool = false
    
    /// Whether it should autoplay when adding a VPlayerItem
    public var autoplay: Bool = true

    /// Whether Player is currently playing
    public var isPlaying: Bool = false
    
    /// Whether Player is seeking time
    public var isSeeking: Bool = false
    
    /// Whether Player is presented in Fullscreen
    public var isFullscreenModeEnabled: Bool = false
    
    /// Whether Player is Fast Forwarding
    public var isForwarding: Bool {
        return player.rate > 1
    }
    
    /// Whether Player is Rewinding
    public var isRewinding: Bool {
        return player.rate < 0
    }
    
    /// Requires linear playback
    public var requiresLinearPlayback: Bool {
        get {
            return controls?.requiresLinearPlayback ?? false
        }
        set(value) {
            controls?.requiresLinearPlayback = value
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    /// Add a VersaPlayerExtension instance to the current player
    ///
    /// - Parameters:
    ///     - ext: The instance of the extension.
    ///     - name: The name of the extension.
    public func addExtension(extension ext: VersaPlayerExtension, with name: String) {
        ext.player = self
        ext.prepare()
        extensions[name] = ext
    }
    
    /// Retrieves the instance of the VersaPlayerExtension with the name given
    ///
    /// - Parameters:
    ///     - name: The name of the extension.
    public func getExtension(with name: String) -> VersaPlayerExtension? {
        return extensions[name]
    }
    
    /// Prepares the player to play
    public func prepare() {
        ready = true
        player = VPlayer()
        player.handler = self
        player.preparePlayerPlaybackDelegate()
        renderingView = VPlayerRenderingView(with: self)
        layout(view: renderingView, into: self)
    }
    
    /// Layout a view within another view stretching to edges
    ///
    /// - Parameters:
    ///     - view: The view to layout.
    ///     - into: The container view.
    public func layout(view: UIView, into: UIView) {
        into.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: into.topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: into.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: into.rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: into.bottomAnchor).isActive = true
    }
    
    /// Sets the item to be played
    ///
    /// - Parameters:
    ///     - item: The VPlayerItem instance to add to player.
    public func set(item: VPlayerItem?) {
        if !ready {
            prepare()
        }
        
        player.replaceCurrentItem(with: item)
        if autoplay && item?.error == nil {
            play()
        }
    }
    
    /// Play
    @IBAction public func play() {
        if playbackDelegate?.playbackShouldBegin(forPlayer: player) ?? true {
            player.play()
            isPlaying = true
        }
    }
    
    /// Pause
    @IBAction public func pause() {
        player.pause()
        isPlaying = false
    }
    
    /// Toggle Playback
    @IBAction public func togglePlayback() {
        if isPlaying {
            pause()
        }else {
            play()
        }
    }
    
}
