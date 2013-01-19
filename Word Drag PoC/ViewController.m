//
//  ViewController.m
//  Word Drag PoC
//
//  Created by Mike Patteson on 17/01/2013.
//  Copyright (c) 2013 Lucky Gecko Apps. All rights reserved.
//

#import "TKDragView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize bubbleView, answerIndicator;

- (IBAction)checkAnswer {
    
    //First find the answer box!
    
    CGRect answerBox = CGRectMake(0, 0, 0, 0);
    
    for (UIView *subview in bubbleView.subviews) {
        
        if (subview.tag == 777) {
            
            //This is the answer box
            CGPoint answerLoc = [subview.superview convertPoint:subview.frame.origin toView:nil];
            answerBox = CGRectMake(answerLoc.x, answerLoc.y, subview.bounds.size.width, subview.bounds.size.height);
            
        }
        
    }
    
    BOOL answerBoxFull = NO;
    
    for (TKDragView *dragView in bubbleView.dragViews) {
        
        CGPoint dragViewLoc = [dragView.superview convertPoint:dragView.frame.origin toView:nil];
        
        CGRect dragViewRect = CGRectMake(dragViewLoc.x, dragViewLoc.y, dragView.bounds.size.width, dragView.bounds.size.height);
        
        if (CGRectEqualToRect(answerBox, dragViewRect)) {
            
            answerBoxFull = YES;
            
            if ([dragView.button.titleLabel.text isEqualToString:@"FORK"]) {
                answerIndicator.text = @"Correct!";
                answerIndicator.textColor = [UIColor greenColor];
            } else {
                answerIndicator.text = @"WRONG!";
                answerIndicator.textColor = [UIColor redColor];
            }
            
        }
        
    }
    
    if (!answerBoxFull) {
        
        answerIndicator.text = @"No Answer =(";
        answerIndicator.textColor = [UIColor grayColor];
        
    }
    
}

- (IBAction)shuffleWords {
    
    NSMutableArray *bubbleStringMutable = [[NSMutableArray alloc] initWithArray:bubbleStringArray];
    
    NSUInteger count = [bubbleStringMutable count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [bubbleStringMutable exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    bubbleStringArray = bubbleStringMutable;
    
    [self displayWords];
    
}

- (void)displayWords {
    
    // Create colors for buttons
    UIColor *textColor = [UIColor colorWithRed:255/255.0 green:47/255.0 blue:51/255.0 alpha:1.0];
    UIColor *bgColor = [UIColor colorWithRed:254/255.0 green:255/255.0 blue:235/255.0 alpha:1.0];
    
    // Now make them sucka's.
    [bubbleView fillBubbleViewWithButtons:bubbleStringArray bgColor:bgColor textColor:textColor fontSize:18 viewController:self];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    bubbleStringArray = @[@"THE", @"BOY", @"ATE", @"HIS", @"SANDWICH", @"MONSTROSITY!!!!", @"FORK"];
    
    [self shuffleWords];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    [self displayWords];
    
}

@end
