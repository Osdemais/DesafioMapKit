//
//  ViewController.m
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 03/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import "ViewController.h"
#import "FilhoTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
    
    if ([[segue.destinationViewController class] isEqual: [FilhoTableViewController class]]){
        FilhoTableViewController * segundaTela = (FilhoTableViewController*)segue.destinationViewController;
        segundaTela.pai = self.nome;
    }

    
    
}

-(void) loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    
    _nome = user.name;
    
    NSLog(@"%@", user.name);
    
}

-(void) loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    NSLog(@"You are Logged in!");
    
}
-(void) loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    NSLog(@"You are Logged out!");
}



-(void) loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSString *alertMessage , *alertTitle;
    if ([FBErrorUtility shouldNotifyUserForError:error]){
        
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
    }
    else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
        alertTitle = @"Session error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
    }
    else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled){
        NSLog(@"User cancelled login");
    }
    else{
        alertTitle = @"Something went wrong.";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage){
        [[[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

- (IBAction)cadastrarPai:(UIButton *)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Pai"];
    [query whereKey:@"Coluna_Pai" equalTo:_nome];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
if (!error) {
    if (objects.count >0){
        // The find succeeded.
        NSLog(@"Successfully retrieved %d scores.", objects.count);
        // Do something with the found objects
        for (PFObject *object in objects) {
            //    NSString* nome = [query ]
            NSLog(@"NA tabela: %@", object [@"Coluna_Pai"]);
        }
    }else{
        PFObject *testObject = [PFObject objectWithClassName:@"Pai"];
        testObject[@"Coluna_Pai"] = (@"%@", _nome);
        [testObject saveInBackground];
        
            NSLog(@"Gravado: %@", _nome);
        
    }
    
    

} else {
// Log details of the failure
NSLog(@"Error: %@ %@", error, [error userInfo]);
    
    
    
    
}
    }];
    
    
    
   
    
}

- (IBAction)cadastrarFilho:(UIButton *)sender {
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Filho"];
    [query whereKey:@"Coluna_Filho" equalTo:_nome];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (objects.count >0){
                // The find succeeded.
                [self performSegueWithIdentifier:@"telaFilho" sender:self];
                

                
                NSLog(@"Successfully retrieved %d scores.", objects.count);
                // Do something with the found objects
                for (PFObject *object in objects) {
                    //    NSString* nome = [query ]
                    NSLog(@"NA tabela: %@", object [@"Coluna_Filho"]);
                }
            }else{
                NSLog(@"Seu pai nao cadastrou você");
            }
            
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
            
            
            
        }
    }];
    
    
}
@end
