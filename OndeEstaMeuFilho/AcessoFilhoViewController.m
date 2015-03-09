//
//  AcessoFilhoViewController.m
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 06/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import "AcessoFilhoViewController.h"




@implementation AcessoFilhoViewController

CLLocationManager *locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    [self dispatch];
    // Do any additional setup after loading the view.
}

-(void) dispatch {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self changeBgColor];
    });
    
}

-(void) changeBgColor {
    
    switch (self.flagColor) {
        case 0:
            self.view.backgroundColor = [UIColor redColor]; self.flagColor++;
            break;
            
        case 1:
            self.view.backgroundColor = [UIColor blueColor];self.flagColor++;
            break;
            
        case 2:
            self.view.backgroundColor = [UIColor greenColor];self.flagColor++;
            break;
            
        case 3:
            self.view.backgroundColor = [UIColor purpleColor];self.flagColor++;
            break;
            
        case 4: {
            self.view.backgroundColor = [UIColor yellowColor];
            self.flagColor = 0;
        }
            break;
            
        default:
            break;
    }
    
    
    [self dispatch];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getCurrentLocation:(id)sender{
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        double longitudex = currentLocation.coordinate.longitude;
        double latitudex = currentLocation.coordinate.latitude;
        
        NSString *latitude = [NSString stringWithFormat:@"%f", latitudex];
        NSString *longitude = [NSString stringWithFormat:@"%f",longitudex];
        
//        PFObject *testObject = [PFObject objectWithClassName:@"Filho"];
//        testObject[@"Coluna_FilhoLatitude"] = latitude;
//        testObject[@"Coluna_FilhoLongitude"] = longitude;
//        [testObject saveInBackground];
        
        
        
        
        PFQuery *query = [PFQuery queryWithClassName:@"Filho"];
            [query whereKey:@"Coluna_Filho" equalTo:_nome];
         ///Retrieve the object by id

        
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
            if (!error) {
                
                    // The find succeeded.
                    NSLog(@"Successfully retrieved %d scores.", objects.count);
                    // Do something with the found objects
                    for (PFObject *object in objects) {
                        //    NSString* nome = [query ]
                        NSLog(@"NA tabela: %@", object [@"Coluna_Pai"]);
                        
                        object[@"Coluna_FilhoLatitude"] = latitude;
                        object[@"Coluna_FilhoLongitude"] = longitude;
                        [object saveInBackground];
                        
                    
                }
                
            }else{
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
                
            }
        }];
    }
}

    
        
            // Now let's update it with some new data. In this case, only cheatMode and score
            // will get sent to the cloud. playerName hasn't changed.

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

