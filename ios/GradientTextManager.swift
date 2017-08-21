//
//  GradientTextManager.swift
//  GradientText
//
//  Created by Viktor Gardart on 2017-08-20.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit

@objc(GradientTextManager)
class GradientTextManager: RCTViewManager {

  let label = GradientText()

  override func view() -> UIView! {
    return label
  }

  @objc(set_title:forView:withDefaultView:)
  func set(title: String, forView: GradientTextManager, defaultView: GradientTextManager) {
    label.title = title
  }

}

