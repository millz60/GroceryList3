//
//  AddItemViewController.m
//  GroceryList3
//
//  Created by Matt Milner on 7/13/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)save:(id)sender{

    [self.delegate saveButtonWasPressed:_itemNameTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


-(IBAction)cancel:(id)sender{
 
    
    [self dismissViewControllerAnimated:YES completion:nil];

}








@end
