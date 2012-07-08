//
//  CIExportController.h
//  Cookie
//
//  Created by Simon Relet on 08/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "defineChange.h"
#import "CIRecipeDataSource.h"
#import "CIRecipe.h"

@interface CIExportController : NSWindowController

@property (assign) IBOutlet NSTextField *textField;
@property (assign) IBOutlet NSTextField *textLabel;
@property (assign) IBOutlet NSTextField *recipeName;
@property (assign) IBOutlet NSTableView *recipeList;
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *sheet;

@property (nonatomic, copy) NSString *destinationDirectory;

-(IBAction)openDialog:(id)sender;
-(IBAction)open:(id)sender;
-(IBAction)close:(id)sender;
-(IBAction)exportRecipe:(id)sender;
@end
