//
//  AddItemViewController.h
//  GroceryList3
//
//  Created by Matt Milner on 7/13/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddItemDelegate

-(void) saveButtonWasPressed: (NSString *) itemName;

@end

@interface AddItemViewController : UIViewController

@property (nonatomic,weak) IBOutlet UITextField *itemNameTextField;

@property (nonatomic,weak) id <AddItemDelegate> delegate;

@end
