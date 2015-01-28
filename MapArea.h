//
//  MapArea.h
//  GeneralHospital
//
//  Created by 夏科杰 on 14-9-30.
//  Copyright (c) 2014年 夏科杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapArea : NSObject
@property (nonatomic,retain)   UIBezierPath   *mapArea;
@property (nonatomic,readonly) long           areaID;
-(id)initWithCoordinate:(NSString*)inStrCoordinate areaID:(NSInteger)inAreaID;
-(BOOL)isAreaSelected:(CGPoint)inPointTouch;
@end
