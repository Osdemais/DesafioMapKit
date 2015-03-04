//
//  CadastrarFilhosViewController.h
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 03/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "Filho.h"
#import "FilhosSingleton.h"

@interface CadastrarFilhosViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> 

@property (weak, nonatomic) IBOutlet UITextField *novoFilho;
@property (weak, nonatomic) IBOutlet UIImageView *imagemFilho;
@property (weak, nonatomic) IBOutlet UIButton *escolherImagem;

- (IBAction)confirmar:(id)sender;
- (IBAction)imagem:(id)sender;

@end
