//
//  CIRecipeDataSource.h
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CIRecipeDataSource : NSObject<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, retain) NSDictionary *recipeList;

@end
