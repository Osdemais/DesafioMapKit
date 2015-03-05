//
//  MapaViewController.h
//  OndeEstaMeuFilho
//
//  Created by Orleans Klaus on 3/4/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapaViewController : UIViewController <CLLocationManagerDelegate>

// Gerenciador do GPS
@property (strong, nonatomic) CLLocationManager* gerenciadorGPS;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property NSString *paiParse;
@property NSString *filhoParse;

- (IBAction)mudarOpcaoMapa:(UISegmentedControl *)sender;
- (IBAction)rastrearLocalizacao:(UIBarButtonItem *)sender;

@end
