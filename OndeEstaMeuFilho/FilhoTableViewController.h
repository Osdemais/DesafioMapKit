//
//  FilhoTableViewController.h
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 03/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilhoTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSString *pai;
@property NSMutableArray *filhos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;




@end
