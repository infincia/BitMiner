//
//  MtRed.m
//  BitMiner
//
//  Created by steve on 6/11/11.
//  Copyright 2011 none. All rights reserved.
//

#import "MtRed.h"
#import "MiningPoolDelegate.h"
#import "Miner.h"
#define MTRED_MINING_URL @"https://mtred.com/api/user/key/"

@implementation MtRed

-(id)initWithDelegate:(id<MiningPoolDelegate>)delegate {
    if (!(self = [super initWithDelegate:delegate])) return self;
	_minerURL = MTRED_MINING_URL;
    return self;
}

-(void)fetchMiner {
    MSLog(@"Fetching miner...");
	NSString *apiKey = [sharedSettingManager apiKeyForMarket:ePoolMtRed];
	if ([apiKey isEqualToString:@""] || apiKey == nil) {
		return;
	}
	NSString *url = [NSString stringWithFormat:@"%@%@",self.minerURL,apiKey];
	[self downloadJsonDataFromURL:[NSURL URLWithString:url] callback:@selector(didFetchMiner:)];
}

-(void)didFetchMiner:(NSDictionary *)minerdata {
	Miner *newminer = [[Miner alloc] init];
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	newminer.confirmed_reward = [formatter numberFromString:[minerdata objectForKey:@"balance"]];
	newminer.pool = self;
	NSMutableArray *workerArray = [NSMutableArray arrayWithCapacity:10];
	NSDictionary *dict = [minerdata objectForKey:@"workers"];
	for(NSString *key in dict) {
		NSDictionary *value = [dict objectForKey:key];
		NSMutableDictionary *tempDict = [NSMutableDictionary dictionaryWithDictionary:value];
		[tempDict setObject:key forKey:@"worker_name"];
		[workerArray addObject:tempDict];
	}
	newminer.workers = workerArray;
	[formatter release];
	[_delegate miningPool:self didReceiveMiner:newminer];
}
- (void)dealloc
{
    [super dealloc];
}

@end
