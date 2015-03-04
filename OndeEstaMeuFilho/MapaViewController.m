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
    
    self.gerenciadorGPS = [[CLLocationManager alloc] init];
    
    // Propriedade que define a intensidade de atualizações
    self.gerenciadorGPS.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Tipo de dado que controla coordenadas
    CLLocationCoordinate2D coordenadasPai = CLLocationCoordinate2DMake(-23.5459346,-46.6647445);
    CLLocationCoordinate2D coordenadasFilho = CLLocationCoordinate2DMake(-23.5471434,-46.6502232);
    
    // Tipo de dado que controla o zoom
    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.07, 0.07);
    
    // Criar a região que será exibida no mapa
    // Uma região é criada a partir de uma coordenada e do zoom
    //MKCoordinateRegion regiao = MKCoordinateRegionMake(coordenadasPai, zoom);
    MKCoordinateRegion regiao = MKCoordinateRegionMake(coordenadasFilho, zoom);
    
    // Método que altera uma região exibida no mapa
    [self.mapa setRegion:regiao];
    
    // Tipo de dado que controla um pino no mapa
    MKPointAnnotation* pinoPai = [[MKPointAnnotation alloc] init];
    MKPointAnnotation* pinoFilho= [[MKPointAnnotation alloc] init];
    
    // Propriedade que controla o título do pino
    pinoPai.title = @"GPS do Pai";
    pinoFilho.title = @"GPS do Filho";
    
    // Propriedade que define as coordenadas de um pino
    pinoPai.coordinate = coordenadasPai;
    pinoFilho.coordinate = coordenadasFilho;
    
    // Método que adiciona o pino no mapa
    [self.mapa addAnnotation:pinoPai];
    [self.mapa addAnnotation:pinoFilho];
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


- (IBAction)rastrearLocalizacao:(UIBarButtonItem *)sender {
    
    // Propriedade que liga o rastreamento do usuário no mapa
    self.mapa.showsUserLocation = YES;
    
    // Ligamos o delegate do gerenciado do GPS
    self.gerenciadorGPS.delegate = self;
    
    // Método que liga o resgate  de valores de posição do device
    [self.gerenciadorGPS startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
// Método disparado quando a localização é atualizada
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* novaLocalizacao = [locations lastObject];
    
    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.01, 0.01);
    
    MKCoordinateRegion regiao = MKCoordinateRegionMake(novaLocalizacao.coordinate, zoom);
    
    [self.mapa setRegion:regiao animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

