//
//  BitcoinCZ.h
//  BitTicker
//
//  Created by steve on 6/8/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MiningPool.h"
#import "Miner.h"

@interface BitcoinCZ : MiningPool {
    
}

-(id)initWithDelegate:(id<MiningPoolDelegate>)delegate;

@end
