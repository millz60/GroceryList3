//
//  AddCategoryViewController.h
//  GroceryList3
//
//  Created by Matt Milner on 7/10/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroceryList.h"



@protocol AddCategoryDelegate

-(void) saveButtonWasPressed:(GroceryList *) list;

@end





@interface AddCategoryViewController : UIViewController





@property (nonatomic,weak) IBOutlet UITextField *categoryNameTextField;

@property (nonatomic,weak) id <AddCategoryDelegate> delegate;



@end
