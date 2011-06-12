//
//  MtRed.h
//  BitMiner
//
//  Created by steve on 6/11/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MiningPool.h"
#import "Miner.h"

@interface MtRed : MiningPool {

    
}

-(id)initWithDelegate:(id<MiningPoolDelegate>)delegate;

@end
