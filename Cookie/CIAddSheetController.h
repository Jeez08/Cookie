//
//  CIAddSheetController.h
//  Cookie
//
//  Created by Simon Relet on 04/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "defineChange.h"
#import "CIRecipeDataSource.h"
#import "CIIngredientDataSource.h"

@interface CIAddSheetController : NSWindowController

// Main List
@property (assign) IBOutlet NSTableView *recipeList;

@property (assign) IBOutlet NSTextField *name;
@property (assign) IBOutlet NSTextField *summary;
@property (assign) IBOutlet NSComboBox *category;
@property (assign) IBOutlet NSImageView *picture;
@property (assign) IBOutlet NSTableView *ingredients;
@property (assign) IBOutlet NSTextField *recipe;
@property (assign) IBOutlet NSTextField *nameIngre;
@property (assign) IBOutlet NSTextField *quantityIngre;
@property (assign) IBOutlet NSTextField *mesureIngre;

@property (assign) IBOutlet NSTextFieldCell *nameLabel;
@property (assign) IBOutlet NSTextFieldCell *summaryLabel;
@property (assign) IBOutlet NSTextFieldCell *categoryLabel;
@property (assign) IBOutlet NSTextFieldCell *ingredientsLabel;
@property (assign) IBOutlet NSTextFieldCell *recipeLabel;
@property (assign) IBOutlet NSTextFieldCell *nameIngreLabel;
@property (assign) IBOutlet NSTextFieldCell *quantityIngreLabel;
@property (assign) IBOutlet NSTextFieldCell *mesureIngreLabel;

// Main Window
@property (assign) IBOutlet NSWindow *window;
// The Sheet
@property (assign) IBOutlet NSWindow *sheet;
// The Sheet Modif
@property (assign) IBOutlet NSWindow *sheetModif;

-(IBAction)open:(id)sender;
-(IBAction)close:(id)sender;
-(IBAction)cancel:(id)sender;

-(IBAction)openModif:(id)sender;
-(IBAction)closeModif:(id)sender;

-(IBAction)addRecipe:(id)sender;
-(IBAction)addIngredient:(id)sender;

@end
