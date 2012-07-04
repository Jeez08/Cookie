//
//  CIAddSheetController.m
//  Cookie
//
//  Created by Simon Relet on 04/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIAddSheetController.h"

@implementation CIAddSheetController

@synthesize window;
@synthesize sheet;

-(IBAction)open:(id)sender {
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)close:(id)sender {
    [sheet orderOut:nil];
    [NSApp endSheet:sheet];
}

@end
