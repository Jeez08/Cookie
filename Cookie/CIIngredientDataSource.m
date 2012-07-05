//
//  CIIngredientDataSource.m
//  Cookie
//
//  Created by Simon Relet on 05/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIIngredientDataSource.h"

@implementation CIIngredientDataSource

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

-(void)addIngredientWithName:(NSString*)name quantity:(NSString*)quantity mesure:(NSString*)mesure {
    CIIngredient *i = [[CIIngredient ingredientWithName:name quantity:quantity unit:mesure] retain];
    [_ingredientsList addObject:i];
    [[NSNotificationCenter defaultCenter] postNotificationName:INGRECHANGE object:self];
}

- (void) deleteIngredientAtIndex:(NSInteger)row {
    [_ingredientsList removeObjectAtIndex:row];
    [[NSNotificationCenter defaultCenter] postNotificationName:INGRECHANGE object:self];
}

-(void)deleteAllIngredients {
    [_ingredientsList removeAllObjects];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView*) tableView {
    return [_ingredientsList count];
}

-(NSMutableArray*)getCurrentIngredients {
    NSMutableArray *newArray = [[[NSMutableArray alloc] initWithArray:_ingredientsList] autorelease];
    
    return newArray;
}

- (NSTableCellView*) tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSTableCellView *cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];

    CIIngredient *i = [_ingredientsList objectAtIndex:row];
    if (tableColumn == nameColumn)
        cell.textField.stringValue = i.name;
    else if (tableColumn == quantityColumn)
        cell.textField.stringValue = i.quantity;
    else if (tableColumn == mesureColumn)
        cell.textField.stringValue = i.unit;
    
    return cell;
}

@end
