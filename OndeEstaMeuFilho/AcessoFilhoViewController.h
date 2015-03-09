//
//  AcessoFilhoViewController.h
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 06/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>

@interface AcessoFilhoViewController : UIViewController <CLLocationManagerDelegate>

@property NSString* nome;
@property int flagColor;


@end
