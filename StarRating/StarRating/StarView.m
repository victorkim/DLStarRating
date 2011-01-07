//
//  StarView.m
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 furryfishApps.com. All rights reserved.
//

#import "StarView.h"


@implementation StarView

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)index {
	self = [super initWithFrame:CGRectMake(((star.size.width/2)*index), 0, star.size.width/2, star.size.height/2)];
	if (self) {
		[self setImage:star forState:UIControlStateNormal];
		[self setImage:highlightedStar forState:UIControlStateSelected];
		[self setImage:highlightedStar forState:UIControlStateHighlighted];
		[self setTag:index];
		[self setBackgroundColor:[UIColor clearColor]];
	}
	return self;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	return self.superview;
}

- (void)centerVertical:(CGRect)_frame {
	CGPoint position = self.frame.origin;
	CGSize size = self.frame.size;
	
	float height = self.frame.size.height;
	float frameHeight = _frame.size.height;
	float gapToApply = (frameHeight-height)/2;
	
	self.frame = CGRectMake(position.x, gapToApply, size.width, size.height);
}

- (void)centerHorizontal:(CGRect)_frame :(int)numberOfStars {
	CGPoint position = self.frame.origin;
	CGSize size = self.frame.size;
	
	float widthOfStars = self.frame.size.width * numberOfStars;
	float frameWidth = _frame.size.width;
	float gapToApply = (frameWidth-widthOfStars)/2;
	
	self.frame = CGRectMake(position.x + gapToApply, position.y, size.width, size.height);
}

- (void)centerIn:(CGRect)_frame with:(int)numberOfStars {
	CGPoint position = self.frame.origin;
	CGSize size = self.frame.size;
	
	float height = self.frame.size.height;
	float frameHeight = _frame.size.height;
	float newY = (frameHeight-height)/2;
	
	float widthOfStars = self.frame.size.width * numberOfStars;
	float frameWidth = _frame.size.width;
	float gapToApply = (frameWidth-widthOfStars)/2;
	
	self.frame = CGRectMake(position.x + gapToApply, newY, size.width, size.height);	
}

@end