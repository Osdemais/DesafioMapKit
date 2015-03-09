//
//  MapaViewController.m
//  OndeEstaMeuFilho
//
//  Created by Orleans Klaus on 3/4/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import "MapaViewController.h"

@implementation MapaViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Filho"];
    [query whereKey:@"Coluna_Filho" equalTo: _filhoParse];// Rafael Cavalcante Adicionado para testes
    ///Retrieve the object by id
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (!error) {
            
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                //    NSString* nome = [query ]
                NSLog(@"NA tabela: %@", object [@"Coluna_Filho"]);
                //object[@"Coluna_FilhoLatitude"] = latitude;
                //object[@"Coluna_FilhoLongitude"] = longitude;
                // NSString *CO = object [@"Coluna_FilhoLongitude"];
                
                
                NSLog(object [@"Coluna_FilhoLatitude"]);
                NSLog(object [@"Coluna_FilhoLongitude"]);
                //NSLog(object[@"Coluna_FilhoLongitude"]);
                NSString* y = object [@"Coluna_FilhoLongitude"];
                NSString* x = object [@"Coluna_FilhoLatitude"];
                _latitude = [x doubleValue];
                _longitude = [y doubleValue];
                
                CLLocationCoordinate2D coordenadasFilho = CLLocationCoordinate2DMake(_latitude ,_longitude);
                MKCoordinateSpan zoom = MKCoordinateSpanMake(0.07, 0.07);
                MKCoordinateRegion regiao = MKCoordinateRegionMake(coordenadasFilho, zoom);
                [self.mapa setRegion:regiao];
               
                MKPointAnnotation* pinoFilho= [[MKPointAnnotation alloc] init];
                
                pinoFilho.coordinate = coordenadasFilho;

                [self.mapa addAnnotation:pinoFilho];
                
                
               
                
                // Método que altera uma região exibida no mapa
              
                
                
            }
            
        }else{
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
    
    
    
    
    
    
//    
//    NSLog(_filhoParse);
// 
//    self.gerenciadorGPS = [[CLLocationManager alloc] init];
//    self.gerenciadorGPS.delegate = self;
//    // Propriedade que define a intensidade de atualizações
//    self.gerenciadorGPS.desiredAccuracy = kCLLocationAccuracyBest;
//    
//    // Tipo de dado que controla coordenadas
//    
//    //-(void)consultaBD (NSString*) nome
//    CLLocationCoordinate2D coordenadasPai = CLLocationCoordinate2DMake(-23.5471434,-46.6402232);
//    [self.gerenciadorGPS startUpdatingLocation];
//    CLLocationCoordinate2D coordenadasFilho = CLLocationCoordinate2DMake(-23.5471434,-46.6502232);
//    
//    NSLog(@"Pai: %@", _paiParse);
//    
//    // Tipo de dado que controla o zoom
//    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.07, 0.07);
//    
//    // Criar a região que será exibida no mapa
//    // Uma região é criada a partir de uma coordenada e do zoom
//    //MKCoordinateRegion regiao = MKCoordinateRegionMake(coordenadasPai, zoom);
//    MKCoordinateRegion regiao = MKCoordinateRegionMake(coordenadasFilho, zoom);
//    
//    // Método que altera uma região exibida no mapa
//    [self.mapa setRegion:regiao];
//    
//    // Tipo de dado que controla um pino no mapa
//    MKPointAnnotation* pinoPai = [[MKPointAnnotation alloc] init];
//    MKPointAnnotation* pinoFilho= [[MKPointAnnotation alloc] init];
//    
//    // Propriedade que controla o título do pino
//    pinoPai.title = @"GPS do Pai";
//    pinoFilho.title = @"GPS do Filho";
//    
//    // Propriedade que define as coordenadas de um pino
//    pinoPai.coordinate = coordenadasPai;
//    pinoFilho.coordinate = coordenadasFilho;
//    
//    
//    
    
    
    
    
    
//    // Método que adiciona o pino no mapa
//    //[self.mapa addAnnotation:pinoPai];
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self.gerenciadorGPS stopUpdatingLocation];
//}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mudarOpcaoMapa:(UISegmentedControl *)sender {
    
    // Resgate da posição do UISegmentedControl
    NSInteger indice = sender.selectedSegmentIndex;
    
    switch (indice) {
        case 0:
            // Propriedade que controla o tipo visual do mapa
            self.mapa.mapType = MKMapTypeStandard;
            break;
            
        case 1:
            self.mapa.mapType = MKMapTypeSatellite;
            break;
            
        case 2:
            self.mapa.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}


// https://www.parse.com/docs/ios_guide#queries-strings/iOS
//-(void)consultaBD (NSString*) nome
//{
//    String myID = "12345";
//    ParseQuery query = new ParseQuery("Players");
//    query.getInBackground(myID, new GetCallback() {
//        @Override
//        public void done(ParseObject object, ParseException e) {
//            if (object != null) {
//                // Get object
//            } else {
//                // Not found
//            }
//        }
//}

- (IBAction)rastrearLocalizacao:(UIBarButtonItem *)sender {
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Filho"];
    [query whereKey:@"Coluna_Filho" equalTo: _filhoParse];// Rafael Cavalcante Adicionado para testes
    ///Retrieve the object by id
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (!error) {
            
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                //    NSString* nome = [query ]
                NSLog(@"NA tabela: %@", object [@"Coluna_Filho"]);
                //object[@"Coluna_FilhoLatitude"] = latitude;
                //object[@"Coluna_FilhoLongitude"] = longitude;
               // NSString *CO = object [@"Coluna_FilhoLongitude"];
                

                NSLog(object [@"Coluna_FilhoLatitude"]);
                //NSLog(object[@"Coluna_FilhoLongitude"]);
                
                NSString* y = object [@"Coluna_FilhoLongitude"];
                NSString* x = object [@"Coluna_FilhoLatitude"];
                _latitude = [x doubleValue];
                _longitude = [y doubleValue];
                
                
                
            }
            
        }else{
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
    
   
    
    CLLocationCoordinate2D coordenadasFilho = CLLocationCoordinate2DMake(_latitude ,_longitude);
    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.07, 0.01);
    
    MKPointAnnotation* pinoFilho= [[MKPointAnnotation alloc] init];
    pinoFilho.coordinate = coordenadasFilho;
    [self.mapa addAnnotation:pinoFilho];
    
    
    MKCoordinateRegion regiao = MKCoordinateRegionMake(coordenadasFilho, zoom);
    
    // Método que altera uma região exibida no mapa
    [self.mapa setRegion:regiao];
    
    
//    
//    // Propriedade que liga o rastreamento do usuário no mapa
//    self.mapa.showsUserLocation = YES;
//    
//    // Ligamos o delegate do gerenciado do GPS
//    self.gerenciadorGPS.delegate = self;
//    
//    // Método que liga o resgate  de valores de posição do device
//    [self.gerenciadorGPS startUpdatingLocation];
}


#pragma mark - CLLocationManagerDelegate
// Método disparado quando a localização é atualizada
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
//{
//    CLLocation* novaLocalizacao = [locations lastObject];
//    
//    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.01, 0.01);
//    
//    MKCoordinateRegion regiao = MKCoordinateRegionMake(novaLocalizacao.coordinate, zoom);
//    
//    
//    
    //[self.mapa setRegion:regiao animated:YES];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

