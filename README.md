# HKVideoPlayerPlugin
ionic/cordova Plugin to Play native Video Player (SWIFT)

## Installation

```
cordova plugin add cordova-plugin-add-swift-support //Swift Bridging Hook
cordova plugin add cordova-plugin-hkvideoplayer
```

### iOS specifics
* Uses the AVPlayer.
* Tested on iOS 10.X
* Swift 3

## Usage

```javascript
 	
// Define On Top 
declare var HKVideoPlayer;

// Play Video from Application Directory or Stream Online
HKVideoPlayer.play("full path");

// Play Video from Assets
HKVideoPlayer.playLocal("video.mp4");


```
