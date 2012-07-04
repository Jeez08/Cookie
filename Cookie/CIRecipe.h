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

@end
