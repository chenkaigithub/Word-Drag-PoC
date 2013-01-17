//
//  ViewController.m
//  Word Drag PoC
//
//  Created by Mike Patteson on 17/01/2013.
//  Copyright (c) 2013 Lucky Gecko Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *bubbleStringArray = @[@"Hello", @"this", @"is", @"a", @"test", @"of", @"the", @"BubbleButtonView", @"class", @"Each", @"one", @"of", @"these", @"is", @"a", @"button"];
    
    // Create colors for buttons
    UIColor *textColor = [UIColor colorWithRed:255/255.0 green:47/255.0 blue:51/255.0 alpha:1.0];
    UIColor *bgColor = [UIColor colorWithRed:254/255.0 green:255/255.0 blue:235/255.0 alpha:1.0];
    
    // Now make them sucka's.
    [bubbleView fillBubbleViewWithButtons:bubbleStringArray bgColor:bgColor textColor:textColor fontSize:14 viewController:self];
    
    for (int i = 0; i< 3; i++) {
        
        
        CGRect endFrame =   CGRectMake(6 + i * 103, 150, 100, 100);
        
        UIView *endView = [[UIView alloc] initWithFrame:endFrame];
        endView.layer.borderColor = [UIColor greenColor].CGColor;
        endView.layer.borderWidth = 1.0f;
        
        [self.view addSubview:endView];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
