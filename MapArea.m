//
//  MapArea.m
//  GeneralHospital
//
//  Created by 夏科杰 on 14-9-30.
//  Copyright (c) 2014年 夏科杰. All rights reserved.
//

#ifdef DEBUG
#define MTLOG(args...)	NSLog(@"%@",[NSString stringWithFormat:args])
#define MTASSERT(cond,desc...)	NSAssert(cond, @"%@", [NSString stringWithFormat: desc])
#define SAFE_DEALLOC_CHECK(__POINTER) { MTLOG(@"%@ dealloc",self); [super dealloc]; }
#else
#define MTLOG(args...)
#define MTASSERT(cond,desc...)
#define SAFE_DEALLOC_CHECK(__POINTER) { [super dealloc]; }
#endif

#define ASSURE_DEALLOC(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define IS_NULL_STRING(__POINTER) \
(__POINTER == nil || \
__POINTER == (NSString *)[NSNull null] || \
![__POINTER isKindOfClass:[NSString class]] || \
![__POINTER length])
#import "MapArea.h"

@implementation MapArea
{
    UIBezierPath        *_mapArea;
    long                _areaID;
}
@synthesize mapArea         = _mapArea;
@synthesize areaID          = _areaID;

-(id)initWithCoordinate:(NSString*)inStrCoordinate areaID:(NSInteger)inAreaID
{
    self = [super init];
    
    if(self != nil)
    {
        _areaID = inAreaID;
        if (IS_NULL_STRING(inStrCoordinate)) {
            return self;
        }
        MTASSERT(!IS_NULL_STRING(inStrCoordinate)
                 ,@"*** 点集不能为空 ***");
        
        NSArray*    arrAreaCoordinates =[inStrCoordinate componentsSeparatedByString:@","];
        long  countTotal      = [arrAreaCoordinates count];
        long  countCoord      = countTotal/2;
        BOOL        isFirstPoint    = YES;
        
        MTASSERT(!(countTotal % 2), @"点集xy必须是偶数集合 当前%ld",countCoord);
        MTASSERT((3 <= countCoord), @"点集必须有三个点组成");
        
        UIBezierPath  *path = [UIBezierPath new];
        
        for(NSUInteger i = 0; i < countCoord; i++)
        {
            
            NSUInteger index = i<<1;
            //NSLog(@"%u,%u,%u",i,index,(index+1));
            CGPoint aPoint = CGPointMake([[arrAreaCoordinates objectAtIndex:index] floatValue],[[arrAreaCoordinates objectAtIndex:index+1] floatValue]);
            if(isFirstPoint)
            {
                [path moveToPoint:aPoint];
                isFirstPoint = NO;
            }
            [path addLineToPoint:aPoint];
        }
        [path closePath];
        self.mapArea = path;
        NSLog(@"%@",path);
    }
    return self;
}

-(BOOL)isAreaSelected:(CGPoint)inPointTouch
{
    return CGPathContainsPoint(self.mapArea.CGPath,NULL,inPointTouch,false);
}

@end



