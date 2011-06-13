#import <Foundation/Foundation.h>

#import "MiningPoolDelegate.h"
#import "RequestHandlerDelegate.h"
#import "SharedSettings.h"

enum kMiningPools {
    ePoolMtRed = 0,
	ePoolBitcoinCz = 1,
	ePoolBTCGuild = 2,
    eNumberOfPools = 3
};

@class RequestHandler;

@interface MiningPool : NSObject <RequestHandlerDelegate> {
    RequestHandler *requestHandler;
    id<MiningPoolDelegate> _delegate;
    
    NSMutableDictionary *_selectorMap;
	SharedSettings *sharedSettingManager;
	
	NSString *_minerURL;

}
-(id)initWithDelegate:(id<MiningPoolDelegate>)delegate;

-(void)downloadJsonDataFromURL:(NSURL*)url callback:(SEL)callback;
-(void)downloadJsonDataFromURL:(NSURL*)url withPostData:(NSDictionary*)postData callback:(SEL)callback;

-(void)fetchMiner;

@property (nonatomic, assign) id<MiningPoolDelegate> delegate;

@property (readonly,nonatomic,retain) NSString *minerURL;

@end
