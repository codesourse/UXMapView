//
//  MapDebugView.h
//  GeneralHospital
//
//  Created by 夏科杰 on 14-9-30.
//  Copyright (c) 2014年 夏科杰. All rights reserved.
//
#import "MapArea.h"
#import <UIKit/UIKit.h>
@interface MapDebugView : UIView
{
    NSMutableArray *AreaArray;
}
-(void)MapDrawArea:(NSArray *)drawArray;
-(void)ClearDraw;
@end