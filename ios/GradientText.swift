//
//  GradientText.swift
//  GradientText
//
//  Created by Viktor Gardart on 2017-08-21.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit

class GradientTextView: RCTView {

  var label: GradientTextLabel? = nil

  var config: GradientTextConfiguration = .standard {
    didSet {
      setNeedsDisplay()
    }
  }
  var title: String = "" {
    didSet {
      label?.text = title
    }
  }

  override func layoutSubviews() {
    if label == nil {
      label = GradientTextLabel()
      addSubview(label!)
    }
    label?.bounds = bounds
    label?.config = config
  }

  @objc(set_title:forView:withDefaultView:)
  func setTitle(text: NSString, view: GradientTextView, default: GradientTextView) {
    title = text as String
  }

  @objc(set_configuration:forView:withDefaultView:)
  func setConfiguration(data: NSDictionary, view: GradientTextView, default: GradientTextView) {
    guard let data = data as? [String: AnyObject] else {
      config = .standard
      return
    }

    let font = UIFont(name: (data["fontName"] as? String ?? config.font.fontName),
                      size: (data["fontSize"] as? CGFloat ?? config.font.pointSize))

    var colors: [CGColor] = []

    for color in data["colors"] as? [String] ?? [] {
      colors.append(hexStringToUIColor(hex: color).cgColor)
    }

    if colors.isEmpty {
      colors = config.colors
    }

    let newConfig = GradientTextConfiguration(font: (font ?? self.config.font),
                                              colors: colors,
                                              locations: nil)
    config = newConfig
  }


}
