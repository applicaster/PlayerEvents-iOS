# PlayerEvents - iOS
## OVERVIEW

A PlayerEventsProvider is a plugin that listen to different notifications that the player can trigger and execute logic according to them.

A typical use case is to implement a continue watching system, where the player will trigger events of where the position of the stream is during the reproduction of a video, and the PlayerEventsProvider plugin listen to these notifications to communicate the position of the stream to a backend. Then the DSP (or another plugin) can request from the backend the position of the stream of a video and append in the extensions dictionary. The player plugin will read from the extension and will launch the player in that certain point in time.

## IMPLEMENTATION EXAMPLE

#### Player plugin

Here is an example on how to implement the call to the PlayerEventsManager.

``` swift
import PlayerEvents

// {. . .}

let playerEventsManager = PlayerEventsManager()

// {. . .}

playerEventsManager.onPlayerEvent("heartbeat", properties: ["elapsed_time" : 2000]) //in miliseconds
```

Typical events that you should send for a continue watching system should be: "play", "pause", "stop", "heartbeat", and typical properties should be the elapsed time.


#### PlayerEvents plugin

Here is an example on how to implement the player events plugin.

``` swift
import PlayerEvents

public class MyPlugin: PlayerEventsProvider {

    // ZPAdapterProtocol
    // {. . .}

    // PlayerEventsProvider
    public func onPlayerEvent(_ event:String, properties:[String: AnyHashable]) {
        // Your logic to handle that event
    }

}
```

In your player manifest you should include the PlayerEvents dependency
```
"dependency_repository_url": [
	"https://github.com/applicaster/PlayerEvents-iOS.git"
]
```

In your podspec remember to include the dependency

```
s.dependency 'PlayerEvents'
```

In your podfile remember to include the dependency

```
pod 'PlayerEvents'
```