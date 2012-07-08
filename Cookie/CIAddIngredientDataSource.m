//
//  CIIngredientDataSource.m
//  Cookie
//
//  Created by Simon Relet on 05/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIAddIngredientDataSource.h"

@implementation CIAddIngredientDataSource

@synthesize ingredientsList = _ingredientsList;
@synthesize nameColumn;
@synthesize quantityColumn;
@synthesize mesureColumn;

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

-(void)addIngredientWithName:(NSString*)name quantity:(NSString*)quantity mesure:(NSString*)mesure {
    CIIngredient *i = [[CIIngredient ingredientWithName:name quantity:[quantity floatValue] unit:mesure] retain];
    [_ingredientsList addObject:i];
    [[NSNotificationCenter defaultCenter] postNotificationName:ADDINGRECHANGE object:self];
}

- (void) deleteIngredientAtIndex:(NSInteger)row {
    [_ingredientsList removeObjectAtIndex:row];
    [[NSNotificationCenter defaultCenter] postNotificationName:ADDINGRECHANGE object:self];
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
    if (tableColumn == nameColumn)
        cell.textField.stringValue = i.name;
    else if (tableColumn == quantityColumn)
        cell.textField.stringValue = [self getSmoothValue:i.quantity];
    else if (tableColumn == mesureColumn)
        cell.textField.stringValue = i.unit;
    
    return cell;
}

@end
