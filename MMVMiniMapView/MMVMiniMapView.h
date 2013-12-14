//
//  MMVMiniMapView.h
//  MMVMiniMapView
//
//  Created by Paul Schifferer on 12/14/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MMVMiniMapView;

typedef NS_ENUM(NSInteger, MMVMiniMapBlockType) {
    MMVMiniMapBlockTypeNone,
    MMVMiniMapBlockTypeHollow,
    MMVMiniMapBlockTypeHollowDotted,
    MMVMiniMapBlockTypeSolid,
};

@protocol MMVMiniMapViewDelegate <NSObject>

@optional
- (UIColor*)miniMapView:(MMVMiniMapView*)miniMapView
       colorForLocation:(CGPoint)location;
- (MMVMiniMapBlockType)miniMapView:(MMVMiniMapView*)miniMapView
              blockTypeForLocation:(CGPoint)location;

@end

@interface MMVMiniMapView : UIView

@property (weak, nonatomic) id<MMVMiniMapViewDelegate> delegate;

@property (assign, nonatomic) CGSize size;

@end
