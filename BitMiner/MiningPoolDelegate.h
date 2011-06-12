#import <Foundation/Foundation.h>

@class MiningPool;
@class Miner;

@protocol MiningPoolDelegate <NSObject>

@required

// A request failed for some reason, for example the API being down
-(void)miningPool:(MiningPool*)pool requestFailedWithError:(NSError*)error;

// Request wasn't formatted as expected
-(void)miningPool:(MiningPool*)pool didReceiveInvalidResponse:(NSData*)data;

@optional

-(void)miningPool:(MiningPool*)pool didReceiveMiner:(Miner*)minerdata;
@end
