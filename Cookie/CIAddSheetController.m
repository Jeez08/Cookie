//
//  CIAddSheetController.m
//  Cookie
//
//  Created by Simon Relet on 04/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIAddSheetController.h"

@implementation CIAddSheetController

@synthesize window;
@synthesize sheet;
@synthesize sheetModif;
@synthesize recipeList;
@synthesize name;
@synthesize summary;
@synthesize category;
@synthesize picture;
@synthesize ingredients;
@synthesize recipe;
@synthesize nameIngre;
@synthesize quantityIngre;
@synthesize mesureIngre;

@synthesize nameLabel;
@synthesize summaryLabel;
@synthesize categoryLabel;
@synthesize ingredientsLabel;
@synthesize recipeLabel;
@synthesize nameIngreLabel;
@synthesize quantityIngreLabel;
@synthesize mesureIngreLabel;

- (void) awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshRecipeList:) name:RECIPECHANGE object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshIngredientList:) name:INGRECHANGE object:nil];
}

-(IBAction)open:(id)sender {
    [self.ingredients reloadData];
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)openModif:(id)sender {
    [NSApp beginSheet:sheetModif modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)close:(id)sender {
    [self.nameLabel setTextColor:[NSColor controlTextColor]];
    [self.summaryLabel setTextColor:[NSColor controlTextColor]];
    [self.categoryLabel setTextColor:[NSColor controlTextColor]];
    [self.recipeLabel setTextColor:[NSColor controlTextColor]];
    [self.ingredientsLabel setTextColor:[NSColor controlTextColor]];
    
    self.name.stringValue = @"";
    self.summary.stringValue = @"";
    self.category.stringValue = @"";
    self.recipe.stringValue = @"";
    self.picture.image = nil;
    self.nameIngre.stringValue = @"";
    self.quantityIngre.stringValue = @"";
    self.mesureIngre.stringValue = @"";
    
    CIIngredientDataSource *dataSource = ingredients.dataSource;
    [dataSource deleteAllIngredients];
    [sheet orderOut:nil];
    [NSApp endSheet:sheet];
}

-(IBAction)closeModif:(id)sender {
    [sheetModif orderOut:nil];
    [NSApp endSheet:sheetModif];
}

- (IBAction)addRecipe:(id)sender {
    BOOL error = NO;
    [self.nameLabel setTextColor:[NSColor controlTextColor]];
    [self.summaryLabel setTextColor:[NSColor controlTextColor]];
    [self.categoryLabel setTextColor:[NSColor controlTextColor]];
    [self.recipeLabel setTextColor:[NSColor controlTextColor]];
    [self.ingredientsLabel setTextColor:[NSColor controlTextColor]];
    
    CIRecipeDataSource *dataSourceRecipe = recipeList.dataSource;
    CIIngredientDataSource *dataSourceIngredient = ingredients.dataSource;
    
    if (name.stringValue == (id)[NSNull null] || name.stringValue.length == 0) {
        error = YES;
        [self.nameLabel setTextColor:[NSColor redColor]];
    }
    
    if (summary.stringValue == (id)[NSNull null] || summary.stringValue.length == 0) {
        error = YES;
        [self.summaryLabel setTextColor:[NSColor redColor]];
    }
    
    if (category.stringValue == (id)[NSNull null] || category.stringValue.length == 0) {
        error = YES;
        [self.categoryLabel setTextColor:[NSColor redColor]];
    }
    
    if (recipe.stringValue == (id)[NSNull null] || recipe.stringValue.length == 0) {
        error = YES;
        [self.recipeLabel setTextColor:[NSColor redColor]];
    }
    
    if ([ingredients numberOfRows] == 0) {
        error = YES;
        [self.ingredientsLabel setTextColor:[NSColor redColor]];
    }
    
    if (error)
        return;
    
    [dataSourceRecipe addRecipeWithName:name.stringValue category:category.stringValue summary:summary.stringValue picture:picture.image rating:[NSNumber numberWithInt:1] ingredients:[dataSourceIngredient ingredientsList] recipe:recipe];
    
    [self close:sender];
}

-(IBAction)addIngredient:(id)sender {
    BOOL error = NO;
    [self.nameIngreLabel setTextColor:[NSColor controlTextColor]];
    [self.quantityIngreLabel setTextColor:[NSColor controlTextColor]];
    [self.mesureIngreLabel setTextColor:[NSColor controlTextColor]];
    
    CIIngredientDataSource *dataSource = ingredients.dataSource;
    
    if (nameIngre.stringValue == (id)[NSNull null] || nameIngre.stringValue.length == 0) {
        error = YES;
        [self.nameIngreLabel setTextColor:[NSColor redColor]];
    }
    
    if (quantityIngre.stringValue == (id)[NSNull null] || quantityIngre.stringValue.length == 0) {
        error = YES;
        [self.quantityIngreLabel setTextColor:[NSColor redColor]];
    }
    
    if (mesureIngre.stringValue == (id)[NSNull null] || mesureIngre.stringValue.length == 0) {
        error = YES;
        [self.mesureIngreLabel setTextColor:[NSColor redColor]];
    }
    
    if (error)
        return;
    
    [dataSource addIngredientWithName:nameIngre.stringValue quantity:quantityIngre.stringValue mesure:mesureIngre.stringValue];
}

- (void) refreshRecipeList:(NSNotification*)n {
    [self.recipeList reloadData];
}

- (void) refreshIngredientList:(NSNotification*)n {
    [self.ingredients reloadData];
}

@end
