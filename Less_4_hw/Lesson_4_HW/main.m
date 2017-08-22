//
//  main.m
//  Lesson_4_HW
//
//  Created by Nikita Vintonovich on 8/22/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UkrainianCarsShops.h"
#import "Parameters.h"
#import "CarModel.h"


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSArray *ukrainianCitiesShops = [UkrainianCarsShops generateCitiesWithShops]; // получаем массив городов с магазинами для парсинга данных
        
        for (NSInteger cityIndex = 0; cityIndex < ukrainianCitiesShops.count; cityIndex++)
        {
            NSMutableArray *redAndYellowCars = [NSMutableArray array]; // в этот массив буем записывать найденные авто для текущего города
            
            NSString *currentCityName = ukrainianCitiesShops[cityIndex][cityNameKey];                   // название города, необходимое для вывода <----
            NSArray *shopsOfCurrentCity = ukrainianCitiesShops[cityIndex][carShopKey];
            
            for (NSInteger carShopIndex = 0; carShopIndex < shopsOfCurrentCity.count; carShopIndex++)
            {
                NSString *currentShopName = shopsOfCurrentCity[carShopIndex][carShopKey];               // название магазина, необходимое для вывода <----
                NSArray *modelsOfCurrentShop = shopsOfCurrentCity[carShopIndex][modelsKey];
                
                for (NSInteger modelIndex = 0; modelIndex < modelsOfCurrentShop.count; modelIndex++)
                {
                    NSString *currentModelName = modelsOfCurrentShop[modelIndex][carModelKey];          // название модели, необходимое для вывода <----
                    
                    NSDictionary *currentModelParameters = modelsOfCurrentShop[modelIndex][carParametersKey]; // достаем параметры модели для проверки
                    NSString *color = currentModelParameters[carColorKey]; // достаем цвет машины из параметров и делее проверям желтый он или красный:
                    
                    // если цвет желтый или красный содаем объект класса CarModel и записывем его в наш маасив redAndYellowCars
                    if ([color isEqualToString:@"Yellow"] || [color isEqualToString:@"Red"])
                    {
                        NSNumber *price = currentModelParameters[carPriceKey];
                        
                        // переписываем параметры авто из словаря в экземпляр класса Parameters
                        Parameters *parameters = [Parameters new];
                        parameters.color = color;
                        parameters.price = price;
                        
                        // создаем класс CarModel и заполняем его данными
                        CarModel *car = [CarModel new];
                        car.parameters = parameters;
                        car.model = currentModelName;
                        car.brand = currentShopName;
                        car.city = currentCityName;
                        
                        // добавляем полученную car в redAndYellowCars
                        [redAndYellowCars addObject:car];
                    }
                }
            }
            
            // теперь, если массив redAndYellowCars содержит автомобили - выводим из в лог,
            // если массив redAndYellowCars пуст - пишем, что в данном городе нет красных или желтых машин
            
            if (redAndYellowCars.count > 0)
            {
                for (NSInteger i = 0; i < redAndYellowCars.count; i++)
                {
                    CarModel *car = redAndYellowCars[i];    // достаем автомобиль и записываем его в переменную класса CarModel
                    [car printDescription];                 // выводим в лог информацию об авто, используюя метод printDescription в классе CarModel
                }
            }
            else
            {
                NSLog(@"There are no any cars with red or yellow color...");
            }
        }
    }
    return 0;
}
