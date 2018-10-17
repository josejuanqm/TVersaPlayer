//
//  ViewController.swift
//  TVersaPlayer
//
//  Created by Jose Quintero on 10/15/18.
//  Copyright © 2018 Quasar Studio. All rights reserved.
//

import UIKit
import CoreMedia

open class VersaPlayerController: UIViewController {
    
    public var player: VersaPlayer = VersaPlayer()
    @IBOutlet public weak var controls: VersaPlayerControls? = nil
    
    open override var preferredFocusedView: UIView? {
        if controls?.behaviour.showingControls ?? false {
            return controls
        }else {
            return controls?.controlsCoordinator.gestureReciever
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        if controls != nil {
            player.use(controls: controls!)
            player.controls?.isHidden = true
        }
        player.context = self
        view.addSubview(player)
        player.translatesAutoresizingMaskIntoConstraints = false
        player.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        player.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        player.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        player.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsFocusUpdate()
    }

}

