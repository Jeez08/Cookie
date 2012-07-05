//
//  CIRecipe.h
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIRecipe : NSObject

@property (nonatomic, copy) NSString *UniqueId;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Category;
@property (nonatomic, copy) NSString *Summary;
@property (nonatomic, retain) NSImage *Picture;
@property (nonatomic, copy) NSNumber *Rating;
@property (nonatomic, copy) NSMutableArray *Ingredients;
@property (nonatomic, copy) NSTextField *Recipe;

- (id) initWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSMutableArray*)ingredients recipe:(NSTextField*)recipe;
+ (id) recipeWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSMutableArray*)ingredients recipe:(NSTextField*)recipe;

- (void)dealloc;

@end
