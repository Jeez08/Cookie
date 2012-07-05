//
//  CIIngredientDataSource.h
//  Cookie
//
//  Created by Simon Relet on 05/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CIIngredient.h"
#import "defineChange.h"

@interface CIIngredientDataSource : NSObject<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, retain) NSMutableArray *ingredientsList;
@property (assign) IBOutlet NSTableColumn *nameColumn;
@property (assign) IBOutlet NSTableColumn *quantityColumn;
@property (assign) IBOutlet NSTableColumn *mesureColumn;

- (void) addIngredientWithName:(NSString*)name quantity:(NSString*)quantity mesure:(NSString*)mesure;
- (void) deleteIngredientAtIndex:(NSInteger)row;
-(void)deleteAllIngredients;

- (void) dealloc;

@end
