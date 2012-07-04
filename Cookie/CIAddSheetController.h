//
//  CIAddSheetController.h
//  Cookie
//
//  Created by Simon Relet on 04/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CIAddSheetController : NSWindowController

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *sheet;

-(IBAction)open:(id)sender;
-(IBAction)close:(id)sender;

@end
