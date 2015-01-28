//
//  UXMapView.h
//  GeneralHospital
//
//  Created by 夏科杰 on 14-9-28.
//  Copyright (c) 2014年 夏科杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapDebugView.h"

typedef void(^MapSelectId)(long);
@interface UXMapView : UIImageView
{
    NSMutableArray *AreaArray;
    NSMutableArray *PointArray;
    MapDebugView   *DebugView;
    MapSelectId    MapID;
    BOOL           IsDebug;
}
-(void)setMapping:(NSArray *)inArrMapping
        doneBlock:(void (^)(UXMapView *mapView))inBlockDone;
-(void)setMapSelectID:(MapSelectId)mapId;
-(void)BeginDebug;
-(void)ClearArea;
@end
