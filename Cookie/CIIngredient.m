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

- (id) initWithName:(NSString*)name quantity:(float)quantity unit:(NSString*)unit {
    self = [super init];
    
    if (nil != self) {
        self.name = name;
        self.unit = unit;
        self.quantity = quantity;
    }
    
    return self;
}

+ (id) ingredientWithName:(NSString*)name quantity:(float)quantity unit:(NSString*)unit {
    
    return [[[self alloc] initWithName:name quantity:quantity unit:unit] autorelease];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (nil != self){
        self.name = [[aDecoder decodeObjectForKey:@"Name"] retain];
        self.unit = [[aDecoder decodeObjectForKey:@"Mesure"] retain];
        self.quantity = [aDecoder decodeFloatForKey:@"Quantity"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"Name"];
    [aCoder encodeObject:_unit forKey:@"Mesure"];
    [aCoder encodeFloat:_quantity forKey:@"Quantity"];
}

- (void)dealloc {
    self.name = nil;
    self.unit = nil;
    
    [super dealloc];
}

@end
