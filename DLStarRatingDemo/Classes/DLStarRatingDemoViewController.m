/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    All rights reserved. This program and the accompanying materials
    are made available under the terms of the Eclipse Public License v1.0
    which accompanies this distribution, and is available at
    http://www.eclipse.org/legal/epl-v10.html

 */

#import "DLStarRatingDemoViewController.h"

@implementation DLStarRatingDemoViewController

@synthesize stars;

#pragma mark -
#pragma mark View setup

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Custom Number of Stars
	DLStarRatingControl *customNumberOfStars =
    [[DLStarRatingControl alloc] initWithFrame:CGRectMake(0, 154, 60, 153)
                                    withStar:[UIImage  imageNamed:@"10_star.png"]
                           withHighlightedStar:[UIImage imageNamed:@"10_star_highlighted.png"]
                                      andStars:5 isFractional:YES];
    [customNumberOfStars setUserInteractionEnabled:NO];
    customNumberOfStars.delegate = self;
	customNumberOfStars.backgroundColor = [UIColor groupTableViewBackgroundColor];
	customNumberOfStars.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
	customNumberOfStars.rating = 2.5;
    [self.view addSubview:customNumberOfStars];
    [customNumberOfStars release];
    
    // Custom Images 
    DLStarRatingControl *customStarImageControl = [[DLStarRatingControl alloc] initWithFrame:CGRectMake(0.0, 307.0, 320.0, 153.0) withStar:[UIImage  imageNamed:@"20_star.png"] withHighlightedStar:[UIImage imageNamed:@"20_star_highlighted.png"] withMargin:20.0f];
    
    customStarImageControl.backgroundColor = [UIColor lightGrayColor];
    customStarImageControl.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    customStarImageControl.rating = 3;
    [self.view addSubview:customStarImageControl];
    [customStarImageControl release];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Delegate implementation of NIB instatiated DLStarRatingControl

-(void)newRating:(DLStarRatingControl *)control :(float)rating {
	self.stars.text = [NSString stringWithFormat:@"%0.1f star rating",rating];
}


#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	self.stars = nil;
	[super dealloc];
}

@end
