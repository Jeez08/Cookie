//
//  CIAppDelegate.m
//  Cookie
//
//  Created by Matthieu Cote on 7/3/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIAppDelegate.h"

@implementation CIAppDelegate

@synthesize window = _window;
@synthesize addRecipeButton;
@synthesize addRecipeWindow;
@synthesize editRecipeWindow;
@synthesize editRecipeButton;
@synthesize cancelAddRecipe;
@synthesize addIngredientButton;
@synthesize addIngredientWindow;
@synthesize cancelAddIngredient;
@synthesize cancelEditRecipeButton;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)closeAddRecipe:(id)sender {
    if([addRecipeWindow isVisible] )
    {
        [addRecipeWindow setReleasedWhenClosed:FALSE];
        [addRecipeWindow close];
    }
}

- (IBAction)openAddRecipe:(id)sender {
    if(! [addRecipeWindow isVisible] )
    {
        [[addRecipeWindow standardWindowButton:NSWindowCloseButton]
         setHidden:TRUE];
        [[addRecipeWindow standardWindowButton:NSWindowMiniaturizeButton]
         setHidden:TRUE];
        [[addRecipeWindow standardWindowButton:NSWindowZoomButton]
         setHidden:TRUE];
        [addRecipeWindow makeKeyAndOrderFront:sender];
    }
}

- (IBAction)openEditRecipe:(id)sender {
    if (! [editRecipeWindow isVisible]) 
    {
        [[editRecipeWindow standardWindowButton:NSWindowCloseButton]
         setHidden:TRUE];
        [[editRecipeWindow standardWindowButton:NSWindowMiniaturizeButton] 
         setHidden:TRUE];
        [[editRecipeWindow standardWindowButton:NSWindowZoomButton] 
         setHidden:TRUE];
        [editRecipeWindow makeKeyAndOrderFront:sender];
    }
}

- (IBAction)closeEditRecipe:(id)sender {
    if ([editRecipeWindow isVisible]) {
        [editRecipeWindow setReleasedWhenClosed:FALSE];
        [editRecipeWindow close];
    }
}

- (IBAction)closeAddIngredient:(id)sender {
    if([addIngredientWindow isVisible] )
    {
        [addIngredientWindow setReleasedWhenClosed:FALSE];
        [addIngredientWindow close];
    }
}

- (IBAction)openAddIngredient:(id)sender {
    if(! [addIngredientWindow isVisible] )
    {
        [[addIngredientWindow standardWindowButton:NSWindowCloseButton]
         setHidden:TRUE];
        [[addIngredientWindow standardWindowButton:NSWindowMiniaturizeButton]
         setHidden:TRUE];
        [[addIngredientWindow standardWindowButton:NSWindowZoomButton]
         setHidden:TRUE];
        [addIngredientWindow makeKeyAndOrderFront:sender];
    }
}




@end
