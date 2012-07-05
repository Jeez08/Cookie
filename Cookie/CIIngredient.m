//
//  CIIngredient.m
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIIngredient.h"

@implementation CIIngredient

@synthesize name = _name;
@synthesize unit = _unit;
@synthesize quantity = _quantity;

- (id) initWithName:(NSString*)name quantity:(NSString*)quantity unit:(NSString*)unit {
    self = [super init];
    
    if (nil != self) {
        _name = name;
        _unit = unit;
        _quantity = quantity;
    }
    
    return self;
}

+ (id) ingredientWithName:(NSString*)name quantity:(NSString*)quantity unit:(NSString*)unit {
    
    return [[[self alloc] initWithName:name quantity:quantity unit:unit] autorelease];
}

- (void)dealloc {
    _name = nil;
    _quantity = nil;
    _unit = nil;
    
    [super dealloc];
}

@end
