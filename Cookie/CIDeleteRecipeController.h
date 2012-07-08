//
//  CIDeleteRecipeController.h
//  Cookie
//
//  Created by Simon Relet on 08/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CIRecipe.h"
#import "CIRecipeDataSource.h"

@interface CIDeleteRecipeController : NSWindowController

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *sheet;
@property (assign) IBOutlet NSTextField *recipeName;
@property (assign) IBOutlet NSTableView *recipeList;

-(IBAction)open:(id)sender;
-(IBAction)close:(id)sender;
-(IBAction)deleteRecipe:(id)sender;

@end
