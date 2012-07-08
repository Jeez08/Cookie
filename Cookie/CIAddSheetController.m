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
@synthesize numberOfPeople;
@synthesize preparation;
@synthesize baking;
@synthesize rest;
@synthesize rating;

@synthesize nameLabel;
@synthesize summaryLabel;
@synthesize categoryLabel;
@synthesize ingredientsLabel;
@synthesize recipeLabel;
@synthesize nameIngreLabel;
@synthesize quantityIngreLabel;
@synthesize numberOfPeopleLabel;
@synthesize preparationLabel;
@synthesize bakingLabel;
@synthesize restLabel;

@synthesize isModif;

- (void) awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshRecipeList:) name:RECIPECHANGE object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshIngredientList:) name:ADDINGRECHANGE object:nil];
}

-(void)resetAllField {
    self.name.stringValue = @"";
    self.summary.stringValue = @"";
    self.category.stringValue = @"";
    [self.recipe setString:@""];
    self.picture.image = nil;
    self.nameIngre.stringValue = @"";
    self.quantityIngre.stringValue = @"";
    self.mesureIngre.stringValue = @"";
    self.preparation.stringValue = @"";
    self.baking.stringValue = @"";
    self.rest.stringValue = @"";
    self.numberOfPeople.stringValue = @"";
}

-(void)resetAllFieldColor {
    [self.nameLabel setTextColor:[NSColor controlTextColor]];
    [self.summaryLabel setTextColor:[NSColor controlTextColor]];
    [self.categoryLabel setTextColor:[NSColor controlTextColor]];
    [self.recipeLabel setTextColor:[NSColor controlTextColor]];
    [self.ingredientsLabel setTextColor:[NSColor controlTextColor]];
    [self.nameIngreLabel setTextColor:[NSColor controlTextColor]];
    [self.quantityIngreLabel setTextColor:[NSColor controlTextColor]];
    [self.preparationLabel setTextColor:[NSColor controlTextColor]];
    [self.bakingLabel setTextColor:[NSColor controlTextColor]];
    [self.restLabel setTextColor:[NSColor controlTextColor]];
    [self.numberOfPeopleLabel setTextColor:[NSColor controlTextColor]];
}

-(IBAction)openAdd:(id)sender {
    [self.ingredients reloadData];
    isModif = NO;
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)openModif:(id)sender {
    [self.ingredients reloadData];
    isModif = YES;
    
    if (-1 == recipeList.selectedRow)
        return;
    
    CIRecipeDataSource *recipedataSource = (CIRecipeDataSource*)recipeList.dataSource;
    CIRecipe *selectedRecipe = [recipedataSource tableView:recipeList objectValueForTableColumn:recipeList.highlightedTableColumn row:recipeList.selectedRow];
    
    self.name.stringValue = [selectedRecipe Name];
    self.summary.stringValue = [selectedRecipe Summary];
    self.category.stringValue = [selectedRecipe Category];
    self.picture.image = [selectedRecipe Picture];
    [self.recipe setString:[selectedRecipe Recipe]];
    self.numberOfPeople.stringValue = [NSString stringWithFormat:@"%d", [selectedRecipe NumberOfPeople]];
    self.preparation.stringValue = [NSString stringWithFormat:@"%d", [selectedRecipe Preparation]];
    self.baking.stringValue = [NSString stringWithFormat:@"%d", [selectedRecipe Baking]];
    self.rest.stringValue = [NSString stringWithFormat:@"%d", [selectedRecipe Rest]];
    
    CIAddIngredientDataSource *ingreDataSource = (CIAddIngredientDataSource*)ingredients.dataSource;
    for (CIIngredient *ingre in [selectedRecipe Ingredients]) {
        [ingreDataSource addIngredientWithName:[ingre name] quantity:[NSString stringWithFormat:@"%f", [ingre quantity]] mesure:[ingre unit]];
    }
    
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)close:(id)sender {
    [self resetAllField];
    [self resetAllFieldColor];
    
    CIAddIngredientDataSource *dataSource = (CIAddIngredientDataSource*)ingredients.dataSource;
    [dataSource deleteAllIngredients];
    [sheet orderOut:nil];
    [NSApp endSheet:sheet];
}

- (IBAction)addRecipe:(id)sender {
    BOOL error = NO;
    [self resetAllFieldColor];
    
    CIRecipeDataSource *dataSourceRecipe = (CIRecipeDataSource*)recipeList.dataSource;
    CIAddIngredientDataSource *dataSourceIngredient = (CIAddIngredientDataSource*)ingredients.dataSource;
    
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
    
    if ([[recipe textStorage] string] == (id)[NSNull null] || [[[recipe textStorage] string] length] == 0) {
        error = YES;
        [self.recipeLabel setTextColor:[NSColor redColor]];
    }
    
    if ([ingredients numberOfRows] == 0) {
        error = YES;
        [self.ingredientsLabel setTextColor:[NSColor redColor]];
    }
    
    if (preparation.stringValue == (id)[NSNull null] || preparation.stringValue.length == 0) {
        error = YES;
        [self.preparationLabel setTextColor:[NSColor redColor]];
    }
    
    if (baking.stringValue == (id)[NSNull null] || baking.stringValue.length == 0) {
        error = YES;
        [self.bakingLabel setTextColor:[NSColor redColor]];
    }
    
    if (rest.stringValue == (id)[NSNull null] || rest.stringValue.length == 0) {
        error = YES;
        [self.restLabel setTextColor:[NSColor redColor]];
    }
    
    if (numberOfPeople.stringValue == (id)[NSNull null] || numberOfPeople.stringValue.length == 0) {
        error = YES;
        [self.numberOfPeopleLabel setTextColor:[NSColor redColor]];
    }
    
    if (error)
        return;
    
    if (isModif) {
        CIRecipe *selectedRecipe = [dataSourceRecipe tableView:recipeList objectValueForTableColumn:recipeList.highlightedTableColumn row:recipeList.selectedRow];
        
        [dataSourceRecipe updateRecipe:selectedRecipe name:name.stringValue category:category.stringValue summary:summary.stringValue picture:picture.image rating:[NSNumber numberWithInt:[self.rating intValue]] ingredients:[dataSourceIngredient ingredientsList] recipe:[[self.recipe textStorage] string] preparation:[preparation.stringValue intValue] baking:[baking.stringValue intValue] rest:[rest.stringValue intValue] numberOfPeople:[numberOfPeople.stringValue intValue]];
        
        [self close:sender];
        return;
    }
    
    [dataSourceRecipe addRecipeWithName:name.stringValue category:category.stringValue summary:summary.stringValue picture:picture.image rating:[NSNumber numberWithInt:[self.rating intValue]] ingredients:[dataSourceIngredient ingredientsList] recipe:[[self.recipe textStorage] string] preparation:[preparation.stringValue intValue] baking:[baking.stringValue intValue] rest:[rest.stringValue intValue] numberOfPeople:[numberOfPeople.stringValue intValue]];
    
    [self close:sender];
}

-(IBAction)addIngredient:(id)sender {
    BOOL error = NO;
    [self.nameIngreLabel setTextColor:[NSColor controlTextColor]];
    [self.quantityIngreLabel setTextColor:[NSColor controlTextColor]];
    
    CIAddIngredientDataSource *dataSource = (CIAddIngredientDataSource*)ingredients.dataSource;
    
    if (nameIngre.stringValue == (id)[NSNull null] || nameIngre.stringValue.length == 0) {
        error = YES;
        [self.nameIngreLabel setTextColor:[NSColor redColor]];
    }
    
    if ((quantityIngre.stringValue == (id)[NSNull null] || quantityIngre.stringValue.length == 0)
        || (mesureIngre.stringValue == (id)[NSNull null] || mesureIngre.stringValue.length == 0)) {
        error = YES;
        [self.quantityIngreLabel setTextColor:[NSColor redColor]];
    }
    
    if (error)
        return;
    
    [dataSource addIngredientWithName:nameIngre.stringValue quantity:quantityIngre.stringValue mesure:mesureIngre.stringValue];
    
    self.nameIngre.stringValue = @"";
    self.quantityIngre.stringValue = @"";
    self.mesureIngre.stringValue = @"";
}

- (void) refreshRecipeList:(NSNotification*)n {
    [self.recipeList reloadData];
}

- (void) refreshIngredientList:(NSNotification*)n {
    [self.ingredients reloadData];
}

@end
