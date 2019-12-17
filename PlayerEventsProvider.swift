//
//  PlayerEventsProvider.swift
//

import Foundation
import ZappPlugins

/// A PlayerEventsProvider is a plugin that listen to different notifications that the player can trigger and execute logic according to them.
/// A typical use case is to implement a continue watching system, where the player will trigger events of where the position of the stream is during the reproduction of a video, and the PlayerEventsProvider plugin listen to these notifications to communicate the position of the stream to a backend. Then the DSP (or another plugin) can request from the backend the position of the stream of a video and append in the extensions dictionary. The player plugin will read from the extension and will launch the player in that certain point in time.
@objc public protocol PlayerEventsProvider: ZPAdapterProtocol {
    
    /// This method is being called everytime that the player trigger an event. Typical events are play, pause, stop, etc.
    ///
    /// - Parameters:
    ///   - event: name of the event triggered.
    ///   - properties: dictionary with extra parameters about the player event.
    func onPlayerEvent(_ event:String, properties:[String: AnyHashable])
}
