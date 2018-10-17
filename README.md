[![CI Status](https://img.shields.io/travis/jose.juan.qm@gmail.com/TVersaPlayer.svg?style=flat)](https://travis-ci.org/jose.juan.qm@gmail.com/TVersaPlayer)
[![Version](https://img.shields.io/cocoapods/v/TVersaPlayer.svg?style=flat)](https://cocoapods.org/pods/TVersaPlayer)
[![License](https://img.shields.io/cocoapods/l/TVersaPlayer.svg?style=flat)](https://cocoapods.org/pods/TVersaPlayer)
[![Platform](https://img.shields.io/cocoapods/p/TVersaPlayer.svg?style=flat)](https://cocoapods.org/pods/TVersaPlayer)

<div>
  <p align="center">
    <img src="https://github.com/josejuanqm/TVersaPlayer/blob/master/logo.png" />
  </p>
</div>

<div>
  <ol>
    <li>
      <a href="#example">Example</a>
    </li>
    <li>
      <a href="#installation">Installation</a>
    </li>
    <li>
      <a href="#usage">Usage</a>
    </li>
    <ol>
      <li>
        <a href="#basic-usage">Basic Usage</a>
      </li>
      <li>
        <a href="#adding-controls">Adding Controls</a>
      </li>
    </ol>
    <li>
      <a href="#extensions">Extensions</a>
    </li>
    <ol>
      <li>
        <a href="#extensions">Overlay Content Extension</a>
      </li>
    </ol>
    <li>
      <a href="#documentation">Documentation</a>
    </li>
    <li>
      <a href="#donation">Donation</a>
    </li>
  </ol>
</div>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Example             |
:-------------------------:
![](https://github.com/josejuanqm/TVersaPlayer/blob/master/screenshot.png)  |

## Installation

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.
You can install it with the following command:

```bash
$ gem install cocoapods
```

TVersaPlayer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TVersaPlayer'
```

## Usage

### Basic Usage

VersaPlayer for tvOS comes with a VersaPlayerController so no need for autolayout on the player side.

TVersaPlayer aims to be simple to use but also flexible, to start using VersaPlayer first create a view programatically or via storyboard. Then add this few lines of code to start playing your video.

<div>
  <p align="center">
    <img src="https://github.com/josejuanqm/VersaPlayer/blob/master/RepoAssets/simple_example.png" />
  </p>
</div>

### Adding Controls

To add controls for your player use the VersaPlayerControls class, which comes packed with outlets to control your player, you can also add as many as you like by making a custom implementation.

VersaPlayerControls class include the following outlets:

Outlet Name             | Type             |  Action
------------------------- | ------------------------- | -------------------------
playPauseButton | VersaStatefullButton | Toggle playback
rewindButton | VersaStatefullButton | Rewind playback
forwardButton | VersaStatefullButton | Fast forward playback
skipForwardButton | VersaStatefullButton | Skip forward the time specified in second at skipSize (found in VersaPlayerControls)
skipBackwardButton | VersaStatefullButton | Skip backward the time specified in second at skipSize (found in VersaPlayerControls)
seekbarSlider | VersaSeekbarSlider | Seek through playback
currentTimeLabel | VersaTimeLabel | Indicate the current time
totalTimeLabel | VersaTimeLabel | Indicate the total time
bufferingView | UIView | Shown when player is buffering

<div>
  <p align="center">
    <img src="https://github.com/josejuanqm/VersaPlayer/blob/master/RepoAssets/controls_example.png" />
  </p>
</div>

## Extensions

Versa is aimed to be versatile, and that's why it comes with an extensions feature, that lets you customize any aspect of the player by inheriting from VersaPlayerExtension.

This class comes with a player attribute that points to the player instance from which is being used.
To add an extension use the add(extension ext:) method found in https://josejuanqm.github.io/Libraries-Documentation/VersaPlayerCore/Classes/VersaPlayer.html.

Here are some extensions for VersaPlayer that may be useful for you.

3. [Overlay Content Extension](https://github.com/josejuanqm/VersaPlayerOverlayContentExtension)


## Documentation

Full documentation avilable https://josejuanqm.github.io/Libraries-Documentation/VersaPlayerCore/

## Author

Jose Quintero - jose.juan.qm@gmail.com

## Donation

If you like this project or has been helpful to you, you can buy me a cup of coffe :)
Appreciate it!

[![paypal](https://github.com/josejuanqm/VersaPlayer/blob/master/RepoAssets/Artboard.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KGX5UDWNHBRNY)

## License

VersaPlayer is available under the MIT license. See the LICENSE file for more info.
