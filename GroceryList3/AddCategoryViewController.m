//
//  AddCategoryViewController.m
//  GroceryList3
//
//  Created by Matt Milner on 7/10/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "AddCategoryViewController.h"

@interface AddCategoryViewController ()

@end

@implementation AddCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)save:(id)sender{
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *categories = [defaults objectForKey:@"GroceryCategories"];
//    NSMutableArray *catArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:categories];
//    catArray = [catArray mutableCopy];
    
    GroceryList *groceryList = [[GroceryList alloc] init];
    groceryList.title = self.categoryNameTextField.text;
    
//    [catArray addObject:groceryList];
//    
//    NSData *categoryData = [NSKeyedArchiver archivedDataWithRootObject:catArray];
//    
//    [defaults setObject:categoryData forKey:@"GroceryCategories"];
//    [defaults synchronize];
    
    [self.delegate saveButtonWasPressed:groceryList];
    [self dismissViewControllerAnimated:YES completion:nil];

}


-(IBAction)cancel:(id)sender{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
