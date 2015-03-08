//
//  CadastrarFilhosViewController.m
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 03/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import "CadastrarFilhosViewController.h"
#import "FilhoTableViewController.h"


@implementation CadastrarFilhosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_novoFilhoTextField setDelegate:self];
    // Do any additional setup after loading the view.
    [_confirmarButton setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)confirmar:(id)sender
{

    NSString* novoFilho = self.novoFilhoTextField.text;
    NSLog(@"%@", novoFilho);
    FilhosSingleton *fs = [FilhosSingleton sharedInstance];
    [fs.filhos addObject:novoFilho];
    
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Filho"];
    [query whereKey:@"Coluna_Filho" equalTo:novoFilho];
    ///Retrieve the object by id
    [query findObjects];
    
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (!error) {
            
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            
            PFObject *testObject = [PFObject objectWithClassName:@"Filho"];
            testObject[@"Coluna_FilhoLatitude"] = @"00000";
            testObject[@"Coluna_FilhoLongitude"] = @"00000";
            testObject[@"Coluna_Filho"] = (@"%@",novoFilho);
            testObject[@"Coluna_Pai"] = (@"%@",_paiParse);
            [testObject saveInBackground];
            
            // Do something with the found objects
            for (PFObject *object in objects) {
                //    NSString* nome = [query ]
                NSLog(@"NA tabela: %@", object [@"Coluna_Pai"]);
                
                
                
            }
            
        }else{
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
    

    
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    //    [self performSegueWithIdentifier:@"Voltar" sender:self];
}

//- (IBAction)imagem:(id)sender
//{
//    if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeSavedPhotosAlbum)])
//    {
//        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
//        imagePicker.delegate = self;
//        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeImage, nil];
//        imagePicker.allowsEditing = NO;
//        [self presentViewController:imagePicker animated:YES completion:nil];
//    }
//}
//
//-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
//    {
//        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//        _imagemFilho.image = image;
//    }
//}
//
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
////    celulaTableViewCell * seg = (celulaTableViewCell*)segue.destinationViewController;
//    UIImage *foto = _imagemFilho.image;
//    FilhosViewController *otherView = segue.destinationViewController;
//    [otherView setNovaFoto:foto];
//}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.novoFilhoTextField resignFirstResponder];
    //    [novoFilho resignFirstResponder]; //resignFirstResponder faz com que o teclado suma, faz perder o foco
}

#pragma mark - TextField Delegate
//Fecha o textField quando aperta return
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [_novoFilhoTextField resignFirstResponder];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([string length] !=0)
        [_confirmarButton setEnabled:YES];
    else
        [_confirmarButton setEnabled:NO];
    
    return YES;
}


@end
