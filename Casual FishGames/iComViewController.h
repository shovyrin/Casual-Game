//
//  iComViewController.h
//  Casual FishGames
//
//  Created by Apple Air on 25.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define animateDuration 0.8
#define animateDelay 1.0
#define animateDelayIn 1.3

@class EnemyClass;

@interface iComViewController : UIViewController

@property (nonatomic, retain) NSMutableArray *enemyArray;
@property (nonatomic, strong) EnemyClass *activeOne;
@property (nonatomic, strong) EnemyClass *activeTwo;

@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;
//Создание объектов
-(void) createElement:(int) X andY:(int) Y;
//Проверка два элемента выделены
-(BOOL) isTwoSelected;
//Проверка стоят ли рядом элементы
-(BOOL)isNeborgElements;
//Animation
-(void) changeActiveElements;
//проверка на линии в ряд
-(void) verifyThreeInLine:(int) sender;
//Animate Images
-(void) imageAnimation:(UIButton *) btn;
//Удаляем строку X
-(void) deleteStringRow:(NSMutableArray *) mass;
//Удаляем строку Y
-(void) deleteStringColumn:(NSMutableArray *) mass;
//Падение элементов
-(void) elementDownLoop:(int) index;
//Ставим элемент в начало строки
-(void) elementGoUP:(int) index;
//меняем картинку и элемент
-(void)changePicture:(EnemyClass *) activeObject;
//установка картинки
-(void)setDefaultPicture:(EnemyClass *) activeObject;
//Рисуем очки
-(void)addScores:(int) tagIndex andCount:(int)Count;
//Добавление взрыва
-(void)addBoomEffect:(EnemyClass *) activeObject;

@end
