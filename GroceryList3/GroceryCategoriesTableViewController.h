//
//  GroceryCategoriesTableViewController.h
//  GroceryList3
//
//  Created by Matt Milner on 7/10/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroceryList.h"
#import "AddCategoryViewController.h"
#import "ItemListTableViewController.h"



@interface GroceryCategoriesTableViewController : UITableViewController
{
    NSMutableArray *_groceryCategories;
    NSInteger currentRow;
}



@end
