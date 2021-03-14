//
//  SceneDelegate.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/10/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = CalculatorView().environmentObject(DependencyInjectionFactory.createCalculatorEnvironmentObject())

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

