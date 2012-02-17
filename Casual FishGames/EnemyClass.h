//
//  EnemyClass.h
//  Casual FishGames
//
//  Created by Apple Air on 25.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnemyClass : UIView

@property (nonatomic, retain) UIButton *gameObject;
@property (nonatomic) int objectX;
@property (nonatomic) int objectY;

//меняем картинку и элемент
-(void)changePicture;
//установка картинки
-(void)setDefaultPicture;

@end
