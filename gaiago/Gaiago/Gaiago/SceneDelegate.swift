//
//  SceneDelegate.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 11/10/2020.
//

import UIKit
import SwiftUI

internal class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  internal var window: UIWindow?
  
    internal func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = scene as? UIWindowScene else { return }
    let providerViewList = ProviderListView(viewModel: ProviderViewModel())
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = UIHostingController(rootView: providerViewList)
    window.makeKeyAndVisible()
    self.window = window
  }
}
