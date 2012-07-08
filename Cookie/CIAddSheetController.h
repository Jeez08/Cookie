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
#import "CIAddIngredientDataSource.h"

@interface CIAddSheetController : NSWindowController

// Main List
@property (assign) IBOutlet NSTableView *recipeList;

@property (assign) IBOutlet NSTextField *name;
@property (assign) IBOutlet NSTextField *summary;
@property (assign) IBOutlet NSComboBox *category;
@property (assign) IBOutlet NSImageView *picture;
@property (assign) IBOutlet NSTableView *ingredients;
@property (assign) IBOutlet NSTextView *recipe;
@property (assign) IBOutlet NSTextField *nameIngre;
@property (assign) IBOutlet NSTextField *quantityIngre;
@property (assign) IBOutlet NSComboBox *mesureIngre;
@property (assign) IBOutlet NSTextField *numberOfPeople;
@property (assign) IBOutlet NSTextField *preparation;
@property (assign) IBOutlet NSTextField *baking;
@property (assign) IBOutlet NSTextField *rest;
@property (assign) IBOutlet NSLevelIndicator *rating;

@property (assign) IBOutlet NSTextFieldCell *nameLabel;
@property (assign) IBOutlet NSTextFieldCell *summaryLabel;
@property (assign) IBOutlet NSTextFieldCell *categoryLabel;
@property (assign) IBOutlet NSTextFieldCell *ingredientsLabel;
@property (assign) IBOutlet NSTextFieldCell *recipeLabel;
@property (assign) IBOutlet NSTextFieldCell *nameIngreLabel;
@property (assign) IBOutlet NSTextFieldCell *quantityIngreLabel;
@property (assign) IBOutlet NSTextFieldCell *numberOfPeopleLabel;
@property (assign) IBOutlet NSTextFieldCell *preparationLabel;
@property (assign) IBOutlet NSTextFieldCell *bakingLabel;
@property (assign) IBOutlet NSTextFieldCell *restLabel;

@property (assign) BOOL isModif;

// Main Window
@property (assign) IBOutlet NSWindow *window;
// The Sheet
@property (assign) IBOutlet NSWindow *sheet;

-(IBAction)openAdd:(id)sender;
-(IBAction)close:(id)sender;

-(IBAction)openModif:(id)sender;

-(IBAction)addRecipe:(id)sender;
-(IBAction)addIngredient:(id)sender;

-(void)resetAllField;
-(void)resetAllFieldColor;

@end
