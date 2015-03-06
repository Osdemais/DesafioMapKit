//
//  FilhoTableViewController.m
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 03/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import "FilhoTableViewController.h"
#import "Filho.h"
#import "FilhosSingleton.h"
#import "FilhoTableViewCell.h"
#import "CadastrarFilhosViewController.h"
#import "MapaViewController.h"


@interface FilhoTableViewController ()

@property (nonatomic)NSInteger rowSelected;

@end


@implementation FilhoTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.tableView setEstimatedRowHeight:144];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//_labelPai.text = _pai;
}
//-(void) viewDidAppear:(BOOL)animated
//{
//   // _labelPai.text = _pai;
//    [self.tableView reloadData];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _rowSelected = indexPath.row;
    return indexPath;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue.destinationViewController class] isEqual: [CadastrarFilhosViewController class]] ){
    CadastrarFilhosViewController * segundaTela = (CadastrarFilhosViewController*)segue.destinationViewController;
        segundaTela.paiParse = _pai;
    }else{
        MapaViewController *terceiraTela = (MapaViewController*) segue.destinationViewController;
        terceiraTela.filhoParse = [[[[FilhosSingleton sharedInstance] filhos]objectAtIndex: _rowSelected] nome];
        terceiraTela.paiParse = _pai;
        
    }
    
 

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[FilhosSingleton sharedInstance] filhos] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  Filho *f = [[[FilhosSingleton sharedInstance] filhos] objectAtIndex:[indexPath row]];
    
    
        
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celula"];
    FilhoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"filhoCellIdentifier"];
    
    [cell.imageView setImage:f.foto];
    cell.textLabel.text = f.nome;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   return 144; }
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

//[self.tableview reloaddata]
