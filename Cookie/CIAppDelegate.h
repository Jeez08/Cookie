//
//  CIAppDelegate.h
//  Cookie
//
//  Created by Matthieu Cote on 7/3/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CIAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (unsafe_unretained) IBOutlet NSToolbarItem *addRecipeButton;
@property (unsafe_unretained) IBOutlet NSWindow *addRecipeWindow;
@property (unsafe_unretained) IBOutlet NSButton *cancelAddRecipe;
@property (unsafe_unretained) IBOutlet NSButton *addIngredientButton;
@property (unsafe_unretained) IBOutlet NSWindow *addIngredientWindow;
@property (unsafe_unretained) IBOutlet NSButton *cancelAddIngredient;
@property (unsafe_unretained) IBOutlet NSWindow *editRecipeWindow;
@property (unsafe_unretained) IBOutlet NSButton *cancelEditRecipeButton;
@property (unsafe_unretained) IBOutlet NSToolbarItem *editRecipeButton;

- (IBAction)closeAddIngredient:(id)sender;

- (IBAction)openAddIngredient:(id)sender;

- (IBAction)closeAddRecipe:(id)sender;

- (IBAction)openAddRecipe:(id)sender;

- (IBAction)openEditRecipe:(id)sender;

- (IBAction)closeEditRecipe:(id)sender;

@end
