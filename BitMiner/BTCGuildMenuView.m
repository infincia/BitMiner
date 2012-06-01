//
//  BTCGuildMenuView.m
//  BitMiner
//
//  Created by steve on 6/13/11.
//  Copyright 2011 none. All rights reserved.
//

#import "BTCGuildMenuView.h"

#define menuFont @"LucidaGrande"
#define menuFontSize 12
#define headerFont @"LucidaGrande-Bold"
#define headerFontSize 13

#define menuHeight 15
#define labelWidth 70
#define headerWidth 120
#define valueWidth 60

#define labelOffset 20
#define valueOffset 110

@implementation BTCGuildMenuView

- (id)initWithFrame:(NSRect)frame {
	CGRect newFrame = frame;
	newFrame.size.height = frame.size.height - 30;
    self = [super initWithFrame:newFrame];
    if (self) {
		//section header
		NSTextField *minerSectionLabel = [[NSTextField alloc] initWithFrame:CGRectMake(labelOffset,64,headerWidth,menuHeight)];
		[minerSectionLabel setEditable:FALSE];
		[minerSectionLabel setBordered:NO];
		[minerSectionLabel setAlignment:NSLeftTextAlignment];
		[minerSectionLabel setBackgroundColor:[NSColor clearColor]];
		[minerSectionLabel setStringValue:@"BTC Guild Miner"];
		[minerSectionLabel setTextColor:[NSColor blueColor]];
		[minerSectionLabel setFont:[NSFont fontWithName:headerFont size:headerFontSize]];
		[self addSubview:minerSectionLabel];
		[minerSectionLabel release];
		
		confirmedReward = [[NSTextField alloc] initWithFrame:CGRectMake(valueOffset, 45, valueWidth, menuHeight)];
		[confirmedReward setEditable:FALSE];
		[confirmedReward setBordered:NO];
		[confirmedReward setAlignment:NSRightTextAlignment];
		[confirmedReward setBackgroundColor:[NSColor clearColor]];
		[confirmedReward setTextColor:[NSColor blackColor]];
		[confirmedReward setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:confirmedReward];
		
		NSTextField *confirmedRewardLabel = [[NSTextField alloc] initWithFrame:CGRectMake(labelOffset,45,labelWidth,menuHeight)];
		[confirmedRewardLabel setEditable:FALSE];
		[confirmedRewardLabel setBordered:NO];
		[confirmedRewardLabel setAlignment:NSLeftTextAlignment];
		[confirmedRewardLabel setBackgroundColor:[NSColor clearColor]];
		[confirmedRewardLabel setStringValue:@"Confirmed:"];
		[confirmedRewardLabel setTextColor:[NSColor blackColor]];
		[confirmedRewardLabel setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:confirmedRewardLabel];
		[confirmedRewardLabel release];
		
		unconfirmedReward = [[NSTextField alloc] initWithFrame:CGRectMake(valueOffset, 30, valueWidth, menuHeight)];
		[unconfirmedReward setEditable:FALSE];
		[unconfirmedReward setBordered:NO];
		[unconfirmedReward setAlignment:NSRightTextAlignment];
		[unconfirmedReward setBackgroundColor:[NSColor clearColor]];
		[unconfirmedReward setTextColor:[NSColor blackColor]];
		[unconfirmedReward setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:unconfirmedReward];
		
		NSTextField *unconfirmedRewardLabel = [[NSTextField alloc] initWithFrame:CGRectMake(labelOffset,30,labelWidth,menuHeight)];
		[unconfirmedRewardLabel setEditable:FALSE];
		[unconfirmedRewardLabel setBordered:NO];
		[unconfirmedRewardLabel setAlignment:NSLeftTextAlignment];
		[unconfirmedRewardLabel setBackgroundColor:[NSColor clearColor]];
		[unconfirmedRewardLabel setStringValue:@"Unconfirmed:"];
		[unconfirmedRewardLabel setTextColor:[NSColor blackColor]];
		[unconfirmedRewardLabel setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:unconfirmedRewardLabel];
		[unconfirmedRewardLabel release];		
		
		
		
		estimatedReward = [[NSTextField alloc] initWithFrame:CGRectMake(valueOffset, 15, valueWidth, menuHeight)];
		[estimatedReward setEditable:FALSE];
		[estimatedReward setBordered:NO];
		[estimatedReward setAlignment:NSRightTextAlignment];
		[estimatedReward setBackgroundColor:[NSColor clearColor]];
		[estimatedReward setTextColor:[NSColor blackColor]];
		[estimatedReward setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:estimatedReward];
		
		NSTextField *estimatedRewardLabel = [[NSTextField alloc] initWithFrame:CGRectMake(labelOffset,15,labelWidth,menuHeight)];
		[estimatedRewardLabel setEditable:FALSE];
		[estimatedRewardLabel setBordered:NO];
		[estimatedRewardLabel setAlignment:NSLeftTextAlignment];
		[estimatedRewardLabel setBackgroundColor:[NSColor clearColor]];
		[estimatedRewardLabel setStringValue:@"Estimated:"];
		[estimatedRewardLabel setTextColor:[NSColor blackColor]];
		[estimatedRewardLabel setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:estimatedRewardLabel];
		[estimatedRewardLabel release];				
		
		
		
		hashOutput = [[NSTextField alloc] initWithFrame:CGRectMake(valueOffset, 0, valueWidth, menuHeight)];
		[hashOutput setEditable:FALSE];
		[hashOutput setBordered:NO];
		[hashOutput setAlignment:NSRightTextAlignment];
		[hashOutput setBackgroundColor:[NSColor clearColor]];
		[hashOutput setTextColor:[NSColor blackColor]];
		[hashOutput setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:hashOutput];
		
		NSTextField *hashOutputLabel = [[NSTextField alloc] initWithFrame:CGRectMake(labelOffset,0,labelWidth,menuHeight)];
		[hashOutputLabel setEditable:FALSE];
		[hashOutputLabel setBordered:NO];
		[hashOutputLabel setAlignment:NSLeftTextAlignment];
		[hashOutputLabel setBackgroundColor:[NSColor clearColor]];
		[hashOutputLabel setStringValue:@"MHash/s:"];
		[hashOutputLabel setTextColor:[NSColor blackColor]];
		[hashOutputLabel setFont:[NSFont fontWithName:menuFont size:menuFontSize]];
		[self addSubview:hashOutputLabel];
		[hashOutputLabel release];
    }
	
    return self;
}

- (id)init {
    self = [super init];
    if (self) {

    }
    
    return self;
}
	
-(void)setConfirmedReward:(NSString *)string {
	[confirmedReward setStringValue:string];

}

-(void)setUnconfirmedReward:(NSString *)string {
	[unconfirmedReward setStringValue:string];

}

-(void)setEstimatedReward:(NSString *)string {
	[estimatedReward setStringValue:string];

}

-(void)setUsername:(NSString *)string {
	//
}

-(void)setWorkers:(NSString *)string {
	//[workers setStringValue:string];

}

-(void)setHashOutput:(NSString *)string {
	[hashOutput setStringValue:string];

}

- (void)dealloc
{
    [super dealloc];
}

@end
