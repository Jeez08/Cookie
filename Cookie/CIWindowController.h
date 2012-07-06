//
//  CIWindowController.h
//  Cookie
//
//  Created by  on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "defineChange.h"
#import "CIRecipe.h"
#import "CIRecipeDataSource.h"

@interface CIWindowController : NSWindowController

@property (assign) IBOutlet NSTableView * tableView;
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSImageView *currentImage;
@property (assign) IBOutlet NSTextField *currentTitle;
@property (assign) IBOutlet NSTextField *currentType;
@property (assign) IBOutlet NSTextField *currentDescription;
@property (assign) IBOutlet NSScrollView *currentIngredient;
@property (assign) IBOutlet NSTextField *currentSteps;

-(IBAction)selectedRecipe:(id)sender;

@end
