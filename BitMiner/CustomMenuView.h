//
//  CustomMenuView.h
//  BitTicker
//
//  Created by steve on 6/10/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CustomMenuView : NSView {

    
}

- (id)initWithFrame:(NSRect)frame;

@property (retain) NSString *confirmedReward;
@property (retain) NSString *unconfirmedReward;
@property (retain) NSString *estimatedReward;
@property (retain) NSString *username;
@property (retain) NSString *workers;
@property (retain) NSString *hashOutput;

@end
