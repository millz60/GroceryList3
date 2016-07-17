//
//  ItemListTableViewController.m
//  GroceryList3
//
//  Created by Matt Milner on 7/13/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "ItemListTableViewController.h"

@interface ItemListTableViewController () <AddItemDelegate>

@end

@implementation ItemListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _groceryList = [[GroceryList alloc] init];
    _groceryList.listItems = [[NSMutableArray alloc] init];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *listData = [defaults objectForKey:_groceryList.title];
    
//    if(listData == nil) {
//        
//        _groceryList.listItems = [NSMutableArray array];
//    }
//    else {
//        
//        _groceryList.listItems = (NSMutableArray *) [NSKeyedUnarchiver unarchiveObjectWithData:listData];
//    }
    
    
    
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
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *categories = [defaults objectForKey:_groceryList.title];
//    NSMutableArray *listArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:categories];
    
    return _groceryList.listItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
    
    NSString *currentItem = _groceryList.listItems[indexPath.row];

    cell.textLabel.text = currentItem;
    
    return cell;
}




-(void) saveButtonWasPressed: (NSString *) itemName {
    
    [_groceryList.listItems addObject:itemName];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    //    NSData *categories = [defaults objectForKey:@"GroceryCategories"];
//    //    NSMutableArray *catArray = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:categories];
//    //    catArray = [catArray mutableCopy];
//    //    [catArray addObject:list];
//    
//    [defaults setObject:_groceryList.listItems forKey:_groceryList.title];
//    [defaults synchronize];
    
    [self.tableView reloadData];
    
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AddItemViewController *addItemController = segue.destinationViewController;
    addItemController.delegate = self;
    
    
    
    
    
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
