/*
 BitTicker is Copyright 2011 Stephen Oliver
 http://github.com/mrsteveman1
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
 */

#import <Cocoa/Cocoa.h>
#import "SharedSettings.h"
#import "MenuController.h"
@class RequestHandler;
@class SettingsWindow;
@class BitcoinCZ;
@class MtRed;

@interface BitMinerAppDelegate : NSObject <NSApplicationDelegate> {
	MenuController *menuController;
	SharedSettings *sharedSettingManager;
    MtRed *mtred;
	BitcoinCZ *bitcoincz;
	NSTimer *mtredTimer;
	NSTimer *bitcoinczTimer;
    NSMutableArray *stats;
	
    NSWindowController *settingsWindowController;
}

- (void) quitProgram:(id)sender;
- (IBAction)showSettings:(id)sender;
- (IBAction)showAbout:(id)sender;

@property (retain) NSMutableArray *stats;
@property (nonatomic) NSInteger cancelThread;

@end
