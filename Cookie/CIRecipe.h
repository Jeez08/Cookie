//
//  CIRecipe.h
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIRecipe : NSObject

@property (nonatomic, retain) NSString *UniqueId;
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *Category;
@property (nonatomic, retain) NSString *Summary;
@property (nonatomic, retain) NSImage *Picture;
@property (nonatomic, retain) NSNumber *Rating;
@property (nonatomic, retain) NSArray *Ingredients;
@property (nonatomic, retain) NSData *Recipe;

- (id) initWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSArray*)ingredients recipe:(NSData*)recipe;
+ (id) recipeWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSArray*)ingredients recipe:(NSData*)recipe;

- (void)dealloc;

@end
