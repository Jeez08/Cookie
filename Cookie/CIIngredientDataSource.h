//
//  CIIngredientDataSource.h
//  Cookie
//
//  Created by Simon Relet on 07/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CIIngredient.h"
#import "CIRecipe.h"
#import "defineChange.h"

@interface CIIngredientDataSource : NSObject<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, retain) NSMutableArray *ingredientsList;
@property (assign) IBOutlet NSTableColumn *nameColumn;
@property (assign) IBOutlet NSTableColumn *quantityColumn;
@property (assign) IBOutlet NSTableColumn *mesureColumn;
@property (nonatomic, retain) CIRecipe *selectedRecipe;
@property (nonatomic) int numberOfPeople;

-(void)selectRecipe:(CIRecipe*)recipe numberOfPeople:(int)numberOfPeople;
-(void)deleteAllIngredients;
-(NSString*)getSmoothValue:(float)value;

- (void) dealloc;

@end
