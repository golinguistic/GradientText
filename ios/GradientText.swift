//
//  GradientText.swift
//  GradientText
//
//  Created by Viktor Gardart on 2017-08-20.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit

public struct GradientTextConfiguration {
  static let standard = GradientTextConfiguration(font: UIFont(name: "Helvetica", size: 14)!,
                                                  colors: [UIColor.blue.cgColor, UIColor.orange.cgColor],
                                                  locations: [0.0, 1.0])
  let font: UIFont
  let colors: [CGColor]
  let locations: [CGFloat]?
}

@objc(GradientText)
class GradientText: UILabel {

  var config: GradientTextConfiguration = .standard {
    didSet {
      updateConfig()
      setNeedsDisplay()
    }
  }
  var title: String = "" {
    didSet {
      text = title
      sizeToFit()
    }
  }

  @objc(set_title:forView:withDefaultView:)
  func setTitle(text: NSString, view: GradientText, default: GradientText) {
    title = text as String
  }

  @objc(set_configuration:forView:withDefaultView:)
  func setConfiguration(data: NSDictionary, view: GradientText, default: GradientText) {
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

  init() {
    super.init(frame: .zero)
    updateConfig()
  }

  func updateConfig() {
    font = config.font
    textAlignment = .center
  }

  override func draw(_ rect: CGRect) {
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
    do {
      let ctx = UIGraphicsGetCurrentContext()

      ctx?.scaleBy(x: 1, y: -1)
      ctx?.translateBy(x: 0, y: -bounds.size.height)
      super.draw(rect)
    }

    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    let ctx = UIGraphicsGetCurrentContext()

    ctx?.clip(to: bounds, mask: img!.cgImage!)

    let locations = config.locations ?? [0.0, 1.0]

    let grad = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                          colors: config.colors as CFArray,
                          locations: locations)

    // draw gradient
    ctx?.drawLinearGradient(grad!,
                            start: CGPoint(x: 0, y: bounds.size.height / 2),
                            end: CGPoint(x: bounds.size.width, y: bounds.size.height / 2),
                            options: CGGradientDrawingOptions(rawValue: 0))
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

func hexStringToUIColor (hex:String) -> UIColor {
  var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

  if (cString.hasPrefix("#")) {
    cString.remove(at: cString.startIndex)
  }

  if ((cString.characters.count) != 6) {
    return UIColor.gray
  }

  var rgbValue:UInt32 = 0
  Scanner(string: cString).scanHexInt32(&rgbValue)

  return UIColor(
    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    alpha: CGFloat(1.0)
  )
}
