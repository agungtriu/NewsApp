//
//  UINavigationController+Ext.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
