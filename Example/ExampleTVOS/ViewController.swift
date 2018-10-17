//
//  ViewController.swift
//  ExampleTVOS
//
//  Created by Jose Quintero on 10/16/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import TVersaPlayer

class ViewController: VersaPlayerController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL.init(string: "http://rmcdn.2mdn.net/Demo/html5/output.mp4") {
            let item = VPlayerItem(url: url)
            player.set(item: item)
        }
    }

}

