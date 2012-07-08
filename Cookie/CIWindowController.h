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
#import "CIIngredientDataSource.h"

@interface CIWindowController : NSWindowController

@property (assign) IBOutlet NSTableView *tableView;
@property (assign) IBOutlet NSTableView *ingredientList;
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSImageView *currentImage;
@property (assign) IBOutlet NSTextField *currentTitle;
@property (assign) IBOutlet NSTextField *currentType;
@property (assign) IBOutlet NSTextField *currentDescription;
@property (assign) IBOutlet NSScrollView *currentIngredient;
@property (assign) IBOutlet NSTextField *currentSteps;
@property (assign) IBOutlet NSSearchField *search;
@property (assign) IBOutlet NSTextField *numberOfPeople;
@property (assign) IBOutlet NSTextField *preparation;
@property (assign) IBOutlet NSTextField *baking;
@property (assign) IBOutlet NSTextField *rest;
@property (assign) IBOutlet NSTextField *total;
@property (assign) IBOutlet NSLevelIndicator *rating;
@property (assign) IBOutlet NSStepper *stepper;
@property (assign) IBOutlet NSSegmentedControl *filter;
@property (assign) IBOutlet NSComboBoxCell *grade;

-(IBAction)selectedRecipe:(id)sender;
-(IBAction)numberOfPeopleHasCahnged:(id)sender;
-(IBAction)search:(id)sender;
-(IBAction)SortRecipeList:(id)sender;
- (IBAction)sortByGrade:(id)sender;


@end
