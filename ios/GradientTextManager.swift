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

  let view = GradientText()

  override func view() -> UIView! {
    return view
  }

}

