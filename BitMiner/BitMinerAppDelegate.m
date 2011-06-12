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

#import "BitMinerAppDelegate.h"
#import "MtRed.h"
#import "BitcoinCZ.h"
#import "SharedSettings.h"

#import "SettingsWindowController.h"
#import "SettingsWindow.h"

@implementation BitMinerAppDelegate

@synthesize stats;
@synthesize cancelThread;

- (void)awakeFromNib {    
	sharedSettingManager = [SharedSettings sharedSettingManager];
	
    settingsWindowController = [[SettingsWindowController alloc] init];

	menuController = [[MenuController alloc] init];

    MSLog(@"Starting");
	
	bitcoincz = [[BitcoinCZ alloc] initWithDelegate:menuController];
    bitcoinczTimer = [[NSTimer scheduledTimerWithTimeInterval:30 target:bitcoincz selector:@selector(fetchMiner) userInfo:nil repeats:YES] retain];
	[bitcoincz fetchMiner];
	[menuController createMenuForMiningPool:bitcoincz];
	
	[menuController addSelectorItems];
}

#pragma mark Application delegate

- (void)applicationWillTerminate:(NSNotification *)notification {
    [settingsWindowController release]; 
	[menuController release];   
}

-(void)settingsWindowClosed {
    
}

#pragma mark Actions

- (IBAction)quitProgram:(id)sender {
	[NSApp terminate:self];
}

- (IBAction)showAbout:(id)sender {
	[NSApp orderFrontStandardAboutPanel:nil];
	[NSApp activateIgnoringOtherApps:YES];
}

- (IBAction)showSettings:(id)sender {
    [settingsWindowController.window makeKeyAndOrderFront:nil];
	[NSApp activateIgnoringOtherApps:YES];
}

@end
