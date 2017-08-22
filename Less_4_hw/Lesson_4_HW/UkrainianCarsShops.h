//
//  UkrainianCarsShops.h
//  Lesson_4_HW
//
//  Created by Nikita Vintonovich on 8/22/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const cityNameKey      = @"cityName";
static NSString *const carShopKey       = @"carShop";
static NSString *const brandNameKey     = @"brandName";
static NSString *const modelsKey        = @"models";
static NSString *const carModelKey      = @"carModel";
static NSString *const carParametersKey = @"carParameters";
static NSString *const carColorKey      = @"carColor";
static NSString *const carPriceKey      = @"carPrice";


@interface UkrainianCarsShops : NSObject

+ (NSArray *)generateCitiesWithShops;

@end
