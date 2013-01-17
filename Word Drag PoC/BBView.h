//
//  BBView.h
//  BubbleButtonView
//
//  Created by Benjamin Gordon on 1/8/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "TKDragView.h"
#import <UIKit/UIKit.h>

@class ViewController;

@interface BBView : UIView

@property (nonatomic, retain) NSMutableArray *bubbleButtonArray;

@property (nonatomic, strong) NSMutableArray *dragViews;

@property (nonatomic, strong) NSMutableArray *goodFrames;

@property (nonatomic, strong) NSMutableArray *badFrames;


-(void)fillBubbleViewWithButtons:(NSArray *)strings bgColor:(UIColor *)bgColor textColor:(UIColor *)textColor fontSize:(float)fsize viewController:(ViewController *)vc;
-(void)addBubbleButtonsWithInterval:(float)ftime;
-(void)removeBubbleButtonsWithInterval:(float)ftime;
-(void)didClickBubbleButton:(UIButton *)bubble;

@end
