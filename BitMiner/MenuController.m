//
//  MenuController.m
//  BitTicker
//
//  Created by steve on 6/10/11.
//  Copyright 2011 none. All rights reserved.
//

#import "MenuController.h"
#import "Miner.h"
#import "StatusItemView.h"
#import "CustomMenuView.h"
#import "SharedSettings.h"

#import "BitcoinCZMenuView.h"

#define MENU_VIEW_HEIGHT 105
#define MENU_VIEW_WIDTH 180

@implementation MenuController

@synthesize tickerValue = _tickerValue;
@synthesize currentMenuStop = _currentMenuStop;
@synthesize viewDict = _viewDict;
@synthesize itemDict = _itemDict;

- (id)init
{
    self = [super init];
    if (self) {	
		self.viewDict = [NSMutableDictionary dictionaryWithCapacity:10];
		sharedSettingManager = [SharedSettings sharedSettingManager];
		currencyFormatter = [[NSNumberFormatter alloc] init];
		currencyFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
		currencyFormatter.currencyCode = @"USD"; // TODO: Base on market currency
		currencyFormatter.thousandSeparator = @","; // TODO: Base on local seperator for currency
		currencyFormatter.alwaysShowsDecimalSeparator = YES;
		currencyFormatter.hasThousandSeparators = YES;
		currencyFormatter.minimumFractionDigits = 4; // TODO: Configurable
		
		
		_statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
		[_statusItem retain];
    
		statusItemView = [[StatusItemView alloc] init];
		statusItemView.statusItem = _statusItem;
		[statusItemView setToolTip:NSLocalizedString(@"BitTicker", @"Status Item Tooltip")];
		
		[_statusItem setView:statusItemView];
		
		trayMenu = [[NSMenu alloc] initWithTitle:@"Ticker"];
		[statusItemView setMenu:trayMenu];
		self.currentMenuStop = 0;
    }
	
    return self;
}

-(void)hideMenuForMiningPool:(MiningPool*)pool {
	NSMenuItem *menuItem = [self.itemDict objectForKey:NSStringFromClass([pool class])];
	[trayMenu removeItem:menuItem];
}

-(void)createMenuForMiningPool:(MiningPool*)pool {
	NSMenuItem *menuItem  = [[NSMenuItem alloc] init];
	NSString *poolClass = NSStringFromClass([pool class]);
	
	// NOTE: The next line creates an instance of a CustomMenuView 
	// subclass by looking at the name of the market passed in to 
	// this method. 
	CustomMenuView *menuView = [[NSClassFromString([NSString stringWithFormat:@"%@MenuView",poolClass]) alloc] initWithFrame:CGRectMake(0,self.currentMenuStop,MENU_VIEW_WIDTH,MENU_VIEW_HEIGHT)];
	[menuItem setView:menuView];
	[trayMenu addItem:menuItem];
	[trayMenu addItem:[NSMenuItem separatorItem]];
	[self.viewDict setObject:menuView forKey:NSStringFromClass([pool class])];
	[self.itemDict setObject:menuItem forKey:NSStringFromClass([pool class])]; 
	[menuItem release];
}

-(void)addSelectorItems {
	aboutItem = [trayMenu addItemWithTitle: @"About"  
                                    action: @selector (showAbout:)  
                             keyEquivalent: @"a"];
	settingsItem = [trayMenu addItemWithTitle: @"Settings"  
                                    action: @selector (showSettings:)  
                             keyEquivalent: @"s"];


	quitItem = [trayMenu addItemWithTitle: @"Quit"  
								   action: @selector (quitProgram:)  
							keyEquivalent: @"q"];
}

- (void)dealloc {	
	[currencyFormatter release];
	[_statusItem release];
    [statusItemView release];
    [trayMenu release];
    [super dealloc];
}

#pragma mark Bitcoin market delegate
// A request failed for some reason, for example the API being down
-(void)miningPool:(MiningPool*)market requestFailedWithError:(NSError*)error {
    MSLog(@"Error: %@",error);
}

// Request wasn't formatted as expected
-(void)miningPool:(MiningPool*)market didReceiveInvalidResponse:(NSData*)data {
    MSLog(@"Invalid response: %@",data);
}

-(void)miningPool:(MiningPool*)pool didReceiveMiner:(Miner*)minerdata {
	[statusItemView setTickerValue:minerdata.confirmed_reward];
	self.tickerValue = minerdata.confirmed_reward;
	CustomMenuView *view = [self.viewDict objectForKey:NSStringFromClass( [pool class] ) ] ;
	[view setUnconfirmedReward:[minerdata.unconfirmed_reward stringValue]];
	[view setConfirmedReward:[minerdata.confirmed_reward stringValue]];
	[view setEstimatedReward:[minerdata.estimated_reward stringValue]];
	double hashcount;
	for (NSDictionary *worker in minerdata.workers) {
		hashcount = hashcount + [[worker objectForKey:@"hashrate"] doubleValue];
	}
	NSNumberFormatter *hashFormatter = [[NSNumberFormatter alloc] init];
    hashFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    hashFormatter.hasThousandSeparators = YES;
   	[view setHashOutput:[hashFormatter stringFromNumber:[NSNumber numberWithDouble:hashcount]]];
    
    [hashFormatter release];
}


@end
