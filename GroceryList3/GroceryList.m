//
//  GroceryList.m
//  GroceryList3
//
//  Created by Matt Milner on 7/10/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "GroceryList.h"

@implementation GroceryList

-(instancetype) initWithCoder:(NSCoder *) coder{
    self.listItems = [coder decodeObjectForKey:@"listItems"];
    self.title = [coder decodeObjectForKey:@"listTitle"];
    return self;
}

-(void) encodeWithCoder: (NSCoder *) coder{
    [coder encodeObject:@"listItems" forKey:@"listItems"];
    [coder encodeObject:self.title forKey:@"listTitle"];
}





@end
