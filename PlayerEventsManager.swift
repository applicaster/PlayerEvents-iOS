//
//  PlayerEventsManager.swift
//
import Foundation
import ZappPlugins

/// Manager that dispatch the player events to the different plugins that can accept them.
@objc public class PlayerEventsManager: NSObject {
    
    @objc var playerEventsProviders:[PlayerEventsProvider] = []
    
    override public init() {
        guard let pluginModels = ZPPluginManager.pluginModels() else {
            return
        }
        
        for pluginModel in pluginModels {
            if let classType = ZPPluginManager.adapterClass(pluginModel) as? PlayerEventsProvider.Type {
                let playerEventsProvider = classType.init(configurationJSON:pluginModel.configurationJSON)
                playerEventsProviders.append(playerEventsProvider)
            }
        }
    }
    
    /// This method is being called everytime that the player trigger an event. It will dispatch the event to all PlayerEventsProvider plugins.
    ///
    /// - Parameters:
    ///   - event: name of the event triggered.
    ///   - properties: dictionary with extra parameters about the player event.
    public func onPlayerEvent(_ event:String, properties:[String: AnyHashable]) {
        for playerEventsProvider in playerEventsProviders {
            playerEventsProvider.onPlayerEvent(event, properties:properties)
        }
    }
}
