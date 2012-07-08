//
//  CIIngredientDataSource.m
//  Cookie
//
//  Created by Simon Relet on 07/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIIngredientDataSource.h"

@implementation CIIngredientDataSource

@synthesize ingredientsList = _ingredientsList;
@synthesize nameColumn = _nameColumn;
@synthesize quantityColumn = _quantityColumn;
@synthesize mesureColumn = _mesureColumn;
@synthesize selectedRecipe = _selectedRecipe;
@synthesize numberOfPeople = _numberOfPeople;

-(id) init {
    self = [super init];
    if (self) {
        self.ingredientsList = [NSMutableArray array];
    }
    return self;
}

-(void) dealloc {
    _ingredientsList = nil;
    [super dealloc];
}

-(NSString*)getSmoothValue:(float)value {
    NSString *tmp = [NSString stringWithFormat:@"%f", value];
    NSString *result = [tmp substringToIndex:(tmp.length - 4)];
    
    if ([result hasSuffix:@".00"]) {
        result = [result substringToIndex:(result.length - 3)];
    }
    
    return result;
}

-(void)selectRecipe:(CIRecipe *)recipe numberOfPeople:(int)numberOfPeople {
    _selectedRecipe = recipe;
    self.numberOfPeople = numberOfPeople;
    [self deleteAllIngredients];
    
    for (CIIngredient* ingre in [recipe Ingredients]) {
        [_ingredientsList addObject:ingre];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:INGRECHANGE object:self];
}

-(void)deleteAllIngredients {
    [_ingredientsList removeAllObjects];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView*) tableView {
    return [_ingredientsList count];
}

- (NSTableCellView*) tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSTableCellView *cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    CIIngredient *i = [_ingredientsList objectAtIndex:row];
    if (tableColumn == _nameColumn)
        cell.textField.stringValue = i.name;
    else if (tableColumn == _quantityColumn)
        cell.textField.stringValue = [self getSmoothValue:((i.quantity * self.numberOfPeople) / [self.selectedRecipe NumberOfPeople])];
    else if (tableColumn == _mesureColumn)
        cell.textField.stringValue = i.unit;
    
    return cell;
}

@end
