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
     FilhoTableViewController * segundaTela = (FilhoTableViewController*)segue.destinationViewController;
    
    segundaTela.pai = self.nome;
    //segundaTela. = self.nome;
    
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

@end
