//
//  UXMapView.m
//  GeneralHospital
//
//  Created by 夏科杰 on 14-9-28.
//  Copyright (c) 2014年 夏科杰. All rights reserved.
//

#import "UXMapView.h"

@implementation UXMapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        AreaArray =[[NSMutableArray alloc] init];
        PointArray=[[NSMutableArray alloc] init];
        [self setUserInteractionEnabled:YES];
        [self setMultipleTouchEnabled:NO];
        IsDebug=NO;
        
        DebugView=[[MapDebugView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        //DebugView.mapAreasToDebug=AreaArray;
        [DebugView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:DebugView];
    }
    return self;
}

-(void)setMapSelectID:(MapSelectId)mapId
{
    MapID=mapId;
}

-(void)setMapping:(NSArray *)inArrMapping
        doneBlock:(void (^)(UXMapView *mapView))inBlockDone
{
    NSLog(@"+++%@",inArrMapping);
    [AreaArray removeAllObjects];
    for(NSUInteger index = 0; index < [inArrMapping count]; index++)
    {
        MapArea* anArea = [[MapArea alloc]initWithCoordinate:[inArrMapping objectAtIndex:index] areaID:index];
        [AreaArray addObject:anArea];
    }
}

-(void)ClearArea
{
    [DebugView ClearDraw];
    [PointArray removeAllObjects];
}

-(void)performHitTestOnArea:(NSValue *)touchValue
{
 
    for(MapArea *anArea in AreaArray)
    {
        if([anArea isAreaSelected:[touchValue CGPointValue]])
        {
           
            [DebugView MapDrawArea:[[NSArray alloc] initWithObjects:anArea, nil]];
            MapID(anArea.areaID);
            NSLog(@"----------%lu",(unsigned long)anArea.areaID);
        }
    }
}
-(void)BeginDebug
{
#if DEBUG
    IsDebug=YES;
#endif
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
    [super touchesEnded:touches withEvent:event];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
	CGPoint touchPoint  = [[touches anyObject] locationInView:self];
    NSValue*    touchValue =[NSValue valueWithCGPoint:touchPoint];
    if ([PointArray count]>1000) {
        [PointArray removeAllObjects];
    }
    [PointArray addObject:touchValue];
    [self performHitTestOnArea:touchValue];
    
    if (IsDebug) {
        if ([PointArray count]>=3) {
            NSMutableString *string=[[NSMutableString alloc] init];;
            for (int i=0;i<[PointArray count];i++) {
                CGPoint point =[[PointArray objectAtIndex:i] CGPointValue];
                if (i==0) {
                    [string appendFormat:@"%f,%f",point.x,point.y];
                }else
                {
                    [string appendFormat:@",%f,%f",point.x,point.y];
                }
                
            }
            MapArea* anArea = [[MapArea alloc]initWithCoordinate:string areaID:0];
            [DebugView MapDrawArea:[[NSArray alloc] initWithObjects:anArea, nil]];
            NSLog(@"%@",string);
        }
    }else
    {
        NSLog(@"%@",touchValue);
    }
}

@end

