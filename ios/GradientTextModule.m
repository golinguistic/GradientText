//
//  GradientTextModule.m
//  GradientText
//
//  Created by Viktor Gardart on 2017-08-20.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(GradientTextManager, RCTViewManager)

RCT_CUSTOM_VIEW_PROPERTY(title, NSString, GradientTextManager)
{
  [view set_title:json forView:view withDefaultView:defaultView];
}

RCT_CUSTOM_VIEW_PROPERTY(configuration, NSDictionary, GradientTextManager) {
  [view set_configuration:json forView:view withDefaultView:defaultView];
}

@end
