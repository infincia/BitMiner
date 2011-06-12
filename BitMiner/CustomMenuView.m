//
//  CustomMenuView.m
//  BitTicker
//
//  Created by steve on 6/10/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CustomMenuView.h"


@implementation CustomMenuView

@dynamic confirmedReward;
@dynamic unconfirmedReward;
@dynamic estimatedReward;
@dynamic username;
@dynamic workers;
@dynamic hashOutput;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
	
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}

#pragma mark -
#pragma mark Properties

// Override these

-(void)setConfirmedReward:(NSString *)string {
	[NSException raise:@"MethodNotOverwrittenException" format:@"%s must be overwritten by CustomMenuView subclasses",__func__];

}

-(void)setUnconfirmedReward:(NSString *)string {
	[NSException raise:@"MethodNotOverwrittenException" format:@"%s must be overwritten by CustomMenuView subclasses",__func__];

}

-(void)setEstimatedReward:(NSString *)string {
	[NSException raise:@"MethodNotOverwrittenException" format:@"%s must be overwritten by CustomMenuView subclasses",__func__];

}

-(void)setUsername:(NSString *)string {
	[NSException raise:@"MethodNotOverwrittenException" format:@"%s must be overwritten by CustomMenuView subclasses",__func__];

}

-(void)setWorkers:(NSString *)string {
	[NSException raise:@"MethodNotOverwrittenException" format:@"%s must be overwritten by CustomMenuView subclasses",__func__];

}

-(void)setHashOutput:(NSString *)string {
	[NSException raise:@"MethodNotOverwrittenException" format:@"%s must be overwritten by CustomMenuView subclasses",__func__];

}

@end
