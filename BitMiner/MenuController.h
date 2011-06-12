//
//  MenuController.h
//  BitTicker
//
//  Created by steve on 6/10/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MiningPoolDelegate.h"
#import "SharedSettings.h"
@class StatusItemView;
@class Ticker;
@class MiningPool;

@interface MenuController : NSObject <MiningPoolDelegate> {
	SharedSettings *sharedSettingManager;
	NSMenu *trayMenu;
	NSMutableDictionary *_viewDict;
	NSMutableDictionary *_itemDict;
	StatusItemView *statusItemView;
	NSStatusItem *_statusItem;
	
	NSNumberFormatter *currencyFormatter;
	
	NSNumber *_tickerValue;
	
	NSMenuItem *quitItem;
    NSMenuItem *aboutItem;
	NSMenuItem *settingsItem;
    NSMenuItem *refreshItem;
	NSMenuItem *preferenceItem;
	
	NSInteger _currentMenuStop;
    
}

-(void)createMenuForMiningPool:(MiningPool*)pool;

-(void)addSelectorItems;

@property (retain, nonatomic) NSNumber *tickerValue;
@property () NSInteger currentMenuStop;
@property (retain) NSMutableDictionary *viewDict;
@property (retain) NSMutableDictionary *itemDict;
@end
