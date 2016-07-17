//
//  GroceryCategoriesTableViewController.m
//  GroceryList3
//
//  Created by Matt Milner on 7/10/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "GroceryCategoriesTableViewController.h"

@interface GroceryCategoriesTableViewController () <AddCategoryDelegate>

@end

@implementation GroceryCategoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   // _groceryCategories = [[NSMutableArray alloc] init];
    
    // User Defaults for the grocery categories Name list
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *categorgyData = [defaults objectForKey:@"GroceryCategories"];
    
    if(categorgyData == nil) {
        
        _groceryCategories = [NSMutableArray array];
    }
    else {
        
        _groceryCategories = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:categorgyData];
    }
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *categories = [defaults objectForKey:@"GroceryCategories"];
    NSMutableArray *catArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:categories];
    return catArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroceryCategoryCell" forIndexPath:indexPath];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *categories = [defaults objectForKey:@"GroceryCategories"];
    NSArray *catArray = [NSKeyedUnarchiver unarchiveObjectWithData:categories];
    
    
    GroceryList *currentList = catArray[indexPath.row];
    cell.textLabel.frame = CGRectMake(5, 5, 150, 20);
    cell.textLabel.text = currentList.title;
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"AddCategorySegue"]){
        
        AddCategoryViewController *addCategory = segue.destinationViewController;
        addCategory.delegate = self;
        
    } else if ([segue.identifier isEqualToString:@"ListViewSegue"]) {
        
        NSIndexPath *selectedCell = [self.tableView indexPathForSelectedRow];
        ItemListTableViewController *itemListController = segue.destinationViewController;
        itemListController.groceryList = _groceryCategories[selectedCell.row];

    }
    
    
    
}


-(void) saveButtonWasPressed:(GroceryList *)list{
    
    [_groceryCategories addObject:list];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *categories = [defaults objectForKey:@"GroceryCategories"];
//    NSMutableArray *catArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:categories];
//    catArray = [catArray mutableCopy];
//    [catArray addObject:list];
    
    NSData *catData = [NSKeyedArchiver archivedDataWithRootObject:_groceryCategories];
    [defaults setObject:catData forKey:@"GroceryCategories"];
    [defaults synchronize];
    
    [self.tableView reloadData];
    
    
}


-(IBAction)clearDefaults:(id)sender{
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];

    [self.tableView reloadData];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
