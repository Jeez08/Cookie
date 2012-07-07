//
//  CIIngredient.h
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIIngredient : NSObject<NSCoding>  

@property (nonatomic, copy) NSString *name;
@property (nonatomic) float quantity;
@property (nonatomic, copy) NSString *unit;

-(id)initWithName:(NSString*)name quantity:(float)quantity unit:(NSString*)unit;
+(id)ingredientWithName:(NSString*)name quantity:(float)quantity unit:(NSString*)unit;

-(id)initWithCoder:(NSCoder *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;

- (void)dealloc;

@end
