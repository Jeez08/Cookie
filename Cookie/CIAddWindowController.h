//
//  CIAddWindowController.h
//  Cookie
//
//  Created by Simon Relet on 04/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CIRecipeDataSource.h"

@interface CIAddWindowController : NSWindowController

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTableView *recipeList;
@property (assign) IBOutlet NSTextField *name;
@property (assign) IBOutlet NSTextField *summary;
@property (assign) IBOutlet NSComboBox *category;
@property (assign) IBOutlet NSImageView *picture;
@property (assign) IBOutlet NSTableView *ingredients;
@property (assign) IBOutlet NSTextField *recipe;

- (IBAction)addRecipe:(id)sender;

@end
