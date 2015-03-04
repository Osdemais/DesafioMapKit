//
//  FilhosSingleton.h
//  OndeEstaMeuFilho
//
//  Created by Ana Elisa Pessoa Aguiar on 03/03/15.
//  Copyright (c) 2015 Ana Elisa Pessoa Aguiar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilhosSingleton : NSObject

@property NSMutableArray *filhos;

/**
 * gets singleton object.
 * @return singleton
 */
+ (FilhosSingleton*)sharedInstance;

@end
