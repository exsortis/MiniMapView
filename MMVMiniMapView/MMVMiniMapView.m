//
//  MMVMiniMapView.m
//  MMVMiniMapView
//
//  Created by Paul Schifferer on 12/14/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "MMVMiniMapView.h"


@implementation MMVMiniMapView

- (void)drawRect:(CGRect)rect {

    CGFloat blockWidth = self.bounds.size.width / _size.width;
    CGFloat blockHeight = self.bounds.size.height / _size.height;

    for(CGFloat row = 0; row < _size.height; row++) {
        for(CGFloat column = 0; column < _size.width; column++) {
            CGFloat x = (column * blockWidth);
            CGFloat y = (row * blockHeight);

            CGRect blockRect = CGRectMake(x, y, blockWidth, blockHeight);

            MMVMiniMapBlockType blockType = MMVMiniMapBlockTypeSolid;
            if(_delegate) {
                if([_delegate respondsToSelector:@selector(miniMapView:blockTypeForLocation:)]) {
                    blockType = [_delegate miniMapView:self
                                  blockTypeForLocation:CGPointMake(column, row)];
                }
            }

            UIColor* blockColor = [UIColor blackColor];
            if(_delegate) {
                if([_delegate respondsToSelector:@selector(miniMapView:colorForLocation:)]) {
                    blockColor = [_delegate miniMapView:self
                                       colorForLocation:CGPointMake(column, row)];
                }
            }

            switch(blockType) {
                case MMVMiniMapBlockTypeHollow:
                    [blockColor setStroke];
                    UIRectFrame(blockRect);
                    break;

                case MMVMiniMapBlockTypeHollowDotted:
                    // TODO
                    break;

                case MMVMiniMapBlockTypeSolid:
                default:
                    [blockColor set];
                    UIRectFill(blockRect);
                    break;
            }
        }
    }
}

@end
