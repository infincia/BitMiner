//
//  BTCGuild.h
//  BitMiner
//
//  Created by steve on 6/13/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Miner.h"
#import "MiningPool.h"

@class MiningPoolDelegate;

@interface BTCGuild : MiningPool {
@private
    
}

-(id)initWithDelegate:(id<MiningPoolDelegate>)delegate;

@end
