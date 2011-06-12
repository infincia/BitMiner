//
//  MtGoxMarketMenuView.h
//  BitTicker
//
//  Created by steve on 6/10/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomMenuView.h"

@interface BitcoinCZMenuView : CustomMenuView {

	//miner stuff
	NSTextField *confirmedReward;
	NSTextField *unconfirmedReward;
	NSTextField *estimatedReward;
    NSTextField *username;
	NSTextField *workers;
	NSTextField *hashOutput;	
    
}

@end
