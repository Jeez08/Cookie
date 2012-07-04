//
//  CIRecipeDataSource.m
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIRecipeDataSource.h"

@implementation CIRecipeDataSource

@synthesize recipeList = _recipeList;

- (id) init {
    self = [super init];
    if (self) {
        _recipeList = [NSMutableArray array];
    }
    return self;
}

- (void) dealloc {
    _recipeList = nil;
    [super dealloc];
}

- (void) addRecipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSArray *)ingredients recipe:(NSData *)recipe {
    CIRecipe *r = [CIRecipe recipeWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe];
    [_recipeList addObject:r];
    [[NSNotificationCenter defaultCenter] postNotificationName:MODIDCHANGE object:self];
}

- (void) deleteRecipeAtIndex:(NSInteger)row {
    [_recipeList removeObjectAtIndex:row];
    [[NSNotificationCenter defaultCenter] postNotificationName:MODIDCHANGE object:self];
}

- (NSInteger) numberOfRowsInTableView:(NSTableView*) tableView {
    return [_recipeList count];
}

/*
- (NSTableCellView*) tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Movie *m = [self.items objectAtIndex:row];
    
    MovieCell *mc = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
    
    mc.textField.stringValue = m.title;
    mc.detailsField.stringValue = m.director;
    mc.imageView.image = [NSImage imageNamed:@"steve"];
    
    return mc;
}
 */

@end
