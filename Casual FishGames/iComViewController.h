//
//  iComViewController.h
//  Casual FishGames
//
//  Created by Apple Air on 25.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>

#define animateDuration 0.3 + 0
#define animateDelay 0.3 + 0
#define animateDelayIn 1.3 + 0
#define animateSecondVerify 2.1 + 0
#define sizeAndStep 53

typedef enum{
    CanSelect,
    OneSelected,
    TwoSelected,
    GameBusy
    
} GameState;

@class EnemyClass;

@interface iComViewController : UIViewController

@property (nonatomic, retain) NSMutableArray *enemyArray;
@property (nonatomic, strong) EnemyClass *activeOne;
@property (nonatomic, strong) EnemyClass *activeTwo;
@property (nonatomic) NSInteger Scores;
@property (nonatomic, retain) NSMutableArray *indexMass;
@property (nonatomic) GameState gameState;
//Audio
@property (readwrite) CFURLRef		soundBulleURLRef;
@property (readonly) SystemSoundID	soundBulleObject;
@property (readwrite) CFURLRef		soundCoinURLRef;
@property (readonly) SystemSoundID	soundCoinObject;

- (IBAction)resetButton:(id)sender;

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
-(BOOL) verifyThreeInLine:(int) sender;
//Удаляем строку X
-(void) deleteStringRow:(NSMutableArray *) mass;
//Удаляем строку Y
-(void) deleteStringColumn:(NSMutableArray *) mass;
//Падение элементов
-(void) elementDownLoop:(int) index;
//Ставим элемент в начало строки
-(void) elementGoUP:(int) index;
//Рисуем очки
-(void)addScores:(int) tagIndex andCount:(int)Count;
//Анимационное добавление очков
-(void) animateScore;
//Добавление взрыва
-(void)addBoomEffect:(NSMutableArray *) mass;
//Повторный пробег по строкам
-(void)secondVerifyLine;
//Повторный пробег по строкам
-(void)secondVerifyLineVert;

@end
