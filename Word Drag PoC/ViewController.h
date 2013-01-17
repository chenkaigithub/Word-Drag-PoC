//
//  ViewController.h
//  Word Drag PoC
//
//  Created by Mike Patteson on 17/01/2013.
//  Copyright (c) 2013 Lucky Gecko Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BBView.h"

@interface ViewController : UIViewController <TKDragViewDelegate> {
    
    __weak IBOutlet BBView *bubbleView;
    
}

@end
