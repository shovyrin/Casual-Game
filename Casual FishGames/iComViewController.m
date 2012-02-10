//
// iComViewController.m
// Casual FishGames
//
// Created by Apple Air on 25.01.12.
// Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iComViewController.h"

#import "EnemyClass.h"

@implementation iComViewController
@synthesize StatusLabel;

@synthesize enemyArray, activeOne, activeTwo;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) createElement:(int) X andY:(int) Y{
    
    int posX = X;
    int posY = Y;
    
    EnemyClass *enemy = [[EnemyClass alloc]init];
    
    UIButton *_button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //set the position of the button
    _button.frame = CGRectMake(posX, posY, 53, 53);
    
    
    int rNumber = rand()%5;
    
    switch (rNumber) {
        case 0:
            [_button setImage:[UIImage imageNamed:@"Flu_Movement_1.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_button setImage:[UIImage imageNamed:@"cold_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_button setImage:[UIImage imageNamed:@"dustMite_Move_1.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_button setImage:[UIImage imageNamed:@"pollen_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_button setImage:[UIImage imageNamed:@"sailor_movement_1.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //---установка тэга
    [_button setTag:rNumber];
    
    // NSString *tempText = [[NSString alloc] initWithFormat:@"%d",rNumber];
    //[_button setTitle:tempText forState:UIControlStateNormal];
    
    
    //добавляем кнопке обработчик (оригинал)
    
    [_button addTarget:self action:@selector(tap1:) forControlEvents:UIControlEventTouchUpInside];
    
    //add the button to the view
    //записываем ссылку на кнопку в игровой объект
    //---TODO переименовать gameObject в button. Путает.
    //---Т.к. enemy - это игровой объект, а gameObject - ссылка на кнопку
    enemy.gameObject = _button;
    /*
     enemy.objectX = _button.center.x;
     enemy.objectY = _button.center.y;
     */
    
    [self.view addSubview:enemy.gameObject];
    
    //добавим элемент в массив
    [enemyArray addObject:enemy];
    
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    srand(time(0));
    
    //---TODO Вынести константы в define или в переменные класса
    int posX = 30;
    int posY = 80;
    
    enemyArray = [[NSMutableArray alloc]init];
    for (int j = 0; j < 7; j++)
    {
        
        for(int i = 0; i < 5; i++)
        {
            
            [self createElement:posX andY:posY];
            posX +=53;
            
        }
        posY += 53;
        posX = 30;
    }
    
    
}

-(IBAction)tap1:(id)sender{
    
    UIButton *btn = (UIButton *) sender;
    
    [self imageAnimation:btn];
    
    for (int i = 0; i < [enemyArray count]; i++)
    {
        EnemyClass *enemy;
        enemy = [enemyArray objectAtIndex:i];
        if (btn == enemy.gameObject)
        {
            if (activeOne == nil)
            {
                activeOne = enemy;
                
                /*
                 //Работа с статусной строкой
                 int index = [enemyArray indexOfObject:enemy];
                 StatusLabel.text = [[NSString alloc] initWithFormat:@"IndexOne: %d - ",index];
                 */
                
            }
            else
            {
                activeTwo = enemy;
                /*
                 //Работа с статусной строкой
                 int index = [enemyArray indexOfObject:enemy];
                 NSString *str = [StatusLabel.text stringByAppendingFormat:@"IndexTwo: %d", index];
                 StatusLabel.text = str;
                 */
            }
        }
    }
    
    
    /*
     NSLog(@"Enemy Pressed coord: %g : %g", x, y);
     NSLog(@"ELements ONE Pressed coord: %g : %g", activeOne.gameObject.center.x,
     activeOne.gameObject.center.y);
     NSLog(@"ELements TWO Pressed coord: %g : %g", activeTwo.gameObject.center.x,
     activeTwo.gameObject.center.y);
     */
    if ([self isTwoSelected ] == YES)
    {
        //TODO:
        NSLog(@"Two Selected");
        
        if ([self isNeborgElements] == YES)
        {
            //TODO:
            NSLog(@"Two Neighbor elements");
            
            //меняем местами элементы
            [self changeActiveElements];
            
        }
        else
        {
            
            [self setDefaultPicture: activeOne];
            [self setDefaultPicture: activeTwo];
            
            activeOne = nil;
            activeTwo = nil;
        }
        
    }
    
}

-(void) imageAnimation:(UIButton *)btn{
    
    NSInteger num = btn.tag;
    
    
    switch (num) {
        case 0:
            btn.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"Flu_Movement_1.png"],
                                             [UIImage imageNamed:@"Flu_Movement_2.png"],
                                             [UIImage imageNamed:@"Flu_Movement_3.png"],
                                             [UIImage imageNamed:@"Flu_Movement_4.png"],
                                             nil];
            break;
        case 1:
            btn.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"cold_movement_1.png"],
                                             [UIImage imageNamed:@"cold_movement_2.png"],
                                             [UIImage imageNamed:@"cold_movement_3.png"],
                                             [UIImage imageNamed:@"cold_movement_4.png"],
                                             nil];
            break;
        case 2:
            btn.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"dustMite_Move_1.png"],
                                             [UIImage imageNamed:@"dustMite_Move_2.png"],
                                             [UIImage imageNamed:@"dustMite_Move_3.png"],
                                             [UIImage imageNamed:@"dustMite_Move_4.png"],
                                             nil];
            break;
        case 3:
            btn.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"pollen_movement_1.png"],
                                             [UIImage imageNamed:@"pollen_movement_2.png"],
                                             [UIImage imageNamed:@"pollen_movement_3.png"],
                                             [UIImage imageNamed:@"pollen_movement_4.png"],
                                             nil];
            break;
        case 4:
            btn.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"sailor_movement_1.png"],
                                             [UIImage imageNamed:@"sailor_movement_2.png"],
                                             [UIImage imageNamed:@"sailor_movement_3.png"],
                                             [UIImage imageNamed:@"sailor_movement_4.png"],
                                             nil];
            break;
            
        default:
            break;
    }
    
    btn.imageView.animationDuration = .6;
    //btn.imageView.animationRepeatCount = 50;
    [btn.imageView startAnimating];
    
    
    
}

-(BOOL) isTwoSelected{
    
    if (activeOne != nil && activeTwo !=nil) {
        //проверка не равны ли элементы
        if (activeOne == activeTwo) {
            if ([activeOne.gameObject.imageView isAnimating]) [activeOne.gameObject.imageView stopAnimating];
            if ([activeTwo.gameObject.imageView isAnimating]) [activeTwo.gameObject.imageView stopAnimating];
            
            [self setDefaultPicture: activeOne];
            [self setDefaultPicture: activeTwo];
            
            activeOne = nil;
            activeTwo = nil;
            return NO;
        }
        else
            return YES;
    }
    
    return NO;
}

-(BOOL)isNeborgElements{
    
    int indexObjectOne = [enemyArray indexOfObject: activeOne];
    
    int indexObjectTwo = [enemyArray indexOfObject: activeTwo];
    
    int objectOneX = indexObjectOne % 5;
    int objectOneY = indexObjectOne / 5;
    
    int objectTwoX = indexObjectTwo % 5;
    int objectTwoY = indexObjectTwo / 5;
    
    //vefiry up/Down
    if ((objectOneX == objectTwoX) && (((objectOneY - 1) == objectTwoY) || (objectOneY == (objectTwoY - 1)))) {
        return YES;
    }
    //vefiry left/right
    else if ((objectOneY == objectTwoY) && ((objectOneX == (objectTwoX - 1)) || objectTwoX == (objectOneX - 1))) {
        return YES;
    }
    
    
    if ([activeOne.gameObject.imageView isAnimating]) [activeOne.gameObject.imageView stopAnimating];
    if ([activeTwo.gameObject.imageView isAnimating]) [activeTwo.gameObject.imageView stopAnimating];
    
    [self setDefaultPicture: activeOne];
    [self setDefaultPicture: activeTwo];
    
    activeOne = activeTwo = nil;
    return NO;
}

-(void)changeActiveElements
{
    
    int tempOneX = activeOne.gameObject.center.x;
    int tempOneY = activeOne.gameObject.center.y;
    
    int tempTwoX = activeTwo.gameObject.center.x;
    int tempTwoY = activeTwo.gameObject.center.y;
    
    [activeOne.gameObject.imageView stopAnimating];
    [activeTwo.gameObject.imageView stopAnimating];
    
    //[activeOne.gameObject setSelected:NO];
    //[activeTwo.gameObject setSelected:NO];
    
    [self setDefaultPicture: activeOne];
    [self setDefaultPicture: activeTwo];
    
    //Получили индексы элементов
    NSUInteger elemIndexOne = [enemyArray indexOfObject:activeOne];
    NSUInteger elemIndexTwo = [enemyArray indexOfObject:activeTwo];
    
    //---не нужно выделять память, которая не будет использована
    //---она выделяется тут: one = (EnemyClass *)[enemyArray objectAtIndex:elemIndexOne];
    //activeOne = [enemyArray objectAtIndex:elemIndexOne];
    //activeTwo = [enemyArray objectAtIndex:elemIndexTwo];
    
    //---идем :)))
    //едем в путь
    [UIView animateWithDuration:0.7
                          delay:0.2
                        options:UIViewAnimationTransitionNone
                     animations:^{
                         activeOne.gameObject.center = CGPointMake(tempTwoX, tempTwoY);
                         activeTwo.gameObject.center = CGPointMake(tempOneX, tempOneY);
                     }
                     completion:^(BOOL finished){
                         
                         [enemyArray exchangeObjectAtIndex:elemIndexOne withObjectAtIndex:elemIndexTwo];
                         
                         
                         //NSLog(@"index 1:%d index 2:%d", elemIndexOne, elemIndexTwo);
                         //-------------------------------------------------
                         
                         
                         //проверим линии
                         [self verifyThreeInLine: elemIndexOne];
                         [self verifyThreeInLine: elemIndexTwo];
                         
                         
                         activeOne = nil;
                         activeTwo = nil;
                     }
     ];
    
    
}

-(void)setDefaultPicture:(EnemyClass *) index{
    
    
    int tag = index.gameObject.tag;
    
    switch (tag) {
        case 0:
            [index.gameObject setImage:[UIImage imageNamed:@"Flu_Movement_1.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [index.gameObject setImage:[UIImage imageNamed:@"cold_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [index.gameObject setImage:[UIImage imageNamed:@"dustMite_Move_1.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [index.gameObject setImage:[UIImage imageNamed:@"pollen_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [index.gameObject setImage:[UIImage imageNamed:@"sailor_movement_1.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    index.gameObject.alpha = 1;
    [index.gameObject setEnabled:YES];
    
}


-(void) verifyThreeInLine:(int) sender{
    
    int index = sender;
    
    int objectOneY = index / 5;
    
    int enemyCountInRow = 0;
    
    //Поиск по оси Х
    //Соберем строку в массиве
    
    NSMutableArray *rowObjects = [[NSMutableArray alloc] init];
    
    //Массив для хранения индексов элементов
    NSMutableArray *indexArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        
        int rowIndex = i + 5 * objectOneY;
        //NSLog(@"Indexes: %d", rowIndex);
        
        [rowObjects addObject:[NSNumber numberWithInt:rowIndex]];
    }
    
    //Получим индекс нашего элемента в массиве
    int indexOfObject = [rowObjects indexOfObject:[NSNumber numberWithInt:index]];
    
    
    [indexArray addObject:[NSNumber numberWithInt:index]];
    
    //Идем вправо от элемента
    for (int i = indexOfObject; i < [rowObjects count] - 1; i++) {
        
        int indexOne = [[rowObjects objectAtIndex:i]intValue];
        
        int indexTwo = [[rowObjects objectAtIndex:i + 1] intValue];
        
        EnemyClass *enemyOne = [enemyArray objectAtIndex:indexOne];
        int titleIndex1 = enemyOne.gameObject.tag;
        
        EnemyClass *enemyTwo = [enemyArray objectAtIndex:indexTwo];
        int titleIndex2 = enemyTwo.gameObject.tag;
        
        if (titleIndex1 == titleIndex2) {
            
            enemyCountInRow ++;
            
            NSInteger index_elem_two = [enemyArray indexOfObject:enemyTwo];
            
            
            [indexArray addObject:[NSNumber numberWithInt:index_elem_two]];
            
            
        }
        else
            break;
    }
    
    //Идем влево
    for (int i = indexOfObject; i >= 1; i--) {
        int indexOne = [[rowObjects objectAtIndex:i]intValue];
        
        int indexTwo = [[rowObjects objectAtIndex:i - 1] intValue];
        
        EnemyClass *enemyOne = [enemyArray objectAtIndex:indexOne];
        int titleIndex1 = enemyOne.gameObject.tag;
        
        EnemyClass *enemyTwo = [enemyArray objectAtIndex:indexTwo];
        int titleIndex2 = enemyTwo.gameObject.tag;
        
        if (titleIndex1 == titleIndex2) {
            
            enemyCountInRow ++;
            
            NSInteger index_elem_two = [enemyArray indexOfObject:enemyTwo];
            
            [indexArray addObject:[NSNumber numberWithInt:index_elem_two]];
            
            
        }
        else
            break;
    }
    
    [rowObjects removeAllObjects];
    
    if (enemyCountInRow >= 2) {
        
        NSLog(@"We have take 3 in column");
        
        [self deleteStringRow:indexArray];
        
    }
    
    [indexArray removeAllObjects];
    
    if (enemyCountInRow < 2){
        
        //END Поиск по оси Х
        
        //Поиск по оси Y
        
        enemyCountInRow = 0;
        
        //Пробежимся вниз от точки
        [indexArray addObject:[NSNumber numberWithInt: index]];
        
        for (int i = index; i <= 29 ; i += 5) {
            
            //NSLog(@"Rows: %d",i);
            
            EnemyClass *enemyOne = [enemyArray objectAtIndex:i]; //12
            int titleIndex1 = enemyOne.gameObject.tag;
            
            EnemyClass *enemyTwo = [enemyArray objectAtIndex:i + 5]; //17
            int titleIndex2 = enemyTwo.gameObject.tag;
            
            if (titleIndex1 == titleIndex2) {
                
                enemyCountInRow ++;
                
                // [indexArray addObject:[NSString stringWithFormat:@"%d",i]];
                [indexArray addObject:[NSNumber numberWithInt:i+5]]; //17
                
            }
            else
                break;
        }
        
        //Пробежимся вверх от элемента
        for (int i = index; i >= 5 ; i -= 5) {
            
            //NSLog(@"Rows: %d",i);
            
            EnemyClass *enemyOne = [enemyArray objectAtIndex:i]; //12
            int titleIndex1 = enemyOne.gameObject.tag;
            
            EnemyClass *enemyTwo = [enemyArray objectAtIndex:i - 5]; //7
            int titleIndex2 = enemyTwo.gameObject.tag;
            
            if (titleIndex1 == titleIndex2) {
                
                enemyCountInRow ++;
                
                //[indexArray addObject:[NSString stringWithFormat:@"%d",i]];
                [indexArray addObject:[NSNumber numberWithInt:i-5]]; //7
                
            }
            else
                break;
        }
        
        
        [rowObjects removeAllObjects];
        
        if (enemyCountInRow >= 2) {
            
            NSLog(@"We have take 3 in row");
            
            [self deleteStringColumn:indexArray];
            
        }
        
        [indexArray removeAllObjects];
        
        //END Поиск по оси Y
        
    }
    
}


-(void) deleteStringRow:(NSMutableArray *)mass{
    
    //Найдем похожие индексы элементов
    
    [mass sortUsingSelector:@selector(compare:)];
    
    for (int i = 0; i < [mass count]-1; i++) {
        
        int temp_one = [[mass objectAtIndex:i]intValue];
        int temp_two = [[mass objectAtIndex:i+1]intValue];
        if (temp_one == temp_two)
            [mass removeObjectAtIndex:i+1];
        
    }
    
    //NSString * str = @"Del. index: ";
    
    for (int i = 0; i < [mass count]; i++) {
        int index = [[mass objectAtIndex:i] intValue];
        
        EnemyClass *element = [enemyArray objectAtIndex:index];
        
        //str = [str stringByAppendingFormat:@" %d", index];
        
        element.gameObject.alpha = 0;
        
        // NSLog(@"Del_index: %d", index);
        
    }
    
    for (int i = 0; i < [mass count]; i++) {
        int index = [[mass objectAtIndex:i] intValue];
        
        [self elementDownLoop:index];
    }
    
    
    //Кидаем взрыв
    [self addBoomEffect:mass];
    
    for (int i = 0; i < [mass count]; i++) {
        int index = [[mass objectAtIndex:i] intValue];
        
        [self elementGoUP:index];
        
    }
    
    int minIndex = [[mass objectAtIndex:0] intValue];
    
    EnemyClass *scoreElem = [enemyArray objectAtIndex:minIndex];
    
    [self addScores:scoreElem.gameObject.tag andCount:[mass count]];
    
    scoreElem = nil;
    
    //StatusLabel.text = str;
    
    //NSLog(@"Array count: %d", [enemyArray count]);
    
}


-(void) deleteStringColumn:(NSMutableArray *)mass
{
    //Найдем похожие индексы элементов
    
    //проверка не вся ли линия выделена
    
    
    if( [mass count] != 7 ){
        
        [mass sortUsingSelector:@selector(compare:)];
        
        for (int i = 0; i < [mass count]-1; i++) {
            
            int temp_one = [[mass objectAtIndex:i]intValue];
            int temp_two = [[mass objectAtIndex:i+1]intValue];
            if (temp_one == temp_two)
                [mass removeObjectAtIndex:i+1];
            
        }
        
        NSString * str = @"Del. index: ";
        
        for (int i = 0; i < [mass count]; i++) {
            int index = [[mass objectAtIndex:i] intValue];
            
            EnemyClass *element = [enemyArray objectAtIndex:index];
            
            str = [str stringByAppendingFormat:@" %d", index];
            
            element.gameObject.alpha = 0;
            
            // NSLog(@"Del_index: %d", index);
                        
        }
        
        //Кидаем взрыв
        [self addBoomEffect:mass];
        
        int minIndex = [[mass objectAtIndex:0] intValue];
        
        EnemyClass *scoreElem = [enemyArray objectAtIndex:minIndex];
        
        [self addScores:scoreElem.gameObject.tag andCount:[mass count]];
        
        scoreElem = nil;
        
        while ( minIndex > 4){
            
            minIndex -= 5;
            
            [UIView animateWithDuration:animateDuration
                                  delay:animateDelay
                                options:UIViewAnimationTransitionNone
                             animations:^{
                                 EnemyClass *element = [enemyArray objectAtIndex:minIndex];
                                 
                                 int stepDown = (53 * [mass count]) + element.gameObject.center.y;
                                 int x = element.gameObject.center.x;
                                 element.gameObject.center = CGPointMake(x, stepDown);
                             }
                             completion:^(BOOL finished){
                                 
                             }];
        }
        
        int min = [[mass objectAtIndex:0] intValue];
        
        NSLog(@"Min index: %d", min);
        
        //Верхний ряд
        if (min < 5) {
            //TODO:
            
            NSLog(@"Min index: < 5(%d), minIndex: %d", min, minIndex);
            
            for (int i = 0; i < [mass count]; i++) {
                int index = [[mass objectAtIndex:i] intValue];
                
                EnemyClass *element = [enemyArray objectAtIndex:index];
                
                [UIView animateWithDuration:animateDuration
                                      delay:animateDelay
                                    options:UIViewAnimationTransitionNone
                                 animations:^{
                                     
                                     [self changePicture:element];
                                     element.gameObject.alpha = 1;
                                     
                                 }
                                 completion:^(BOOL finished){
                                     
                                     
                                     
                                 }];
                
                //[enemyArray exchangeObjectAtIndex:minIndex withObjectAtIndex:minIndex + 5 * [mass count]];
                
                //minIndex += 5;
                
            }
            
            
        }
        //2 ряд
        else if( min > 4 && min < 15)
        {
            //TODO:
            
            //костыль для 3-го ряда
            int mnogitel = 1;
            
            //Элемент для сдвига вниз
            int maxIndex = [[mass objectAtIndex:[mass count] - 1] intValue];
            [enemyArray exchangeObjectAtIndex:min - 5 withObjectAtIndex:maxIndex];
            
            //Третий ряд
            if( min > 9 && min < 15)
            {
                int maxIndex = [[mass objectAtIndex:[mass count] - 2] intValue];
                [enemyArray exchangeObjectAtIndex:min - 10 withObjectAtIndex:maxIndex];
                
                [mass removeObjectAtIndex:[mass count] - 2];
                [mass insertObject:[NSNumber numberWithInt:min - 10] atIndex:[mass count] - 2];
                mnogitel = 2;
                
                //[mass exchangeObjectAtIndex:[mass count] - 1 withObjectAtIndex:[mass count] - 3];
                
            }
            
            [mass removeLastObject];
            [mass addObject:[NSNumber numberWithInt:min-5]];
            
            [mass sortUsingSelector:@selector(compare:)];
            
            NSLog(@"Array: %@", mass);
            
            for (int i = 0; i < [mass count]; i++) {
                
                int index = [[mass objectAtIndex:i] intValue];
                
                EnemyClass *element = [enemyArray objectAtIndex:index];
                
                [UIView animateWithDuration:animateDuration
                                      delay:animateDelay
                                    options:UIViewAnimationTransitionNone
                                 animations:^{
                                     
                                     int stepDown = element.gameObject.center.y - (53 * mnogitel);
                                     int x = element.gameObject.center.x;
                                     element.gameObject.center = CGPointMake(x, stepDown);
                                     
                                 }
                                 completion:^(BOOL finished){
                                     element.gameObject.alpha = 1;
                                     
                                     [self changePicture:element];
                                     
                                 }];
                
                
            }
            
            for (int i = 0; i < [mass count] - 1; i++) {
                int indexOne = [[mass objectAtIndex:i] intValue];
                int indexTwo = [[mass objectAtIndex:i + 1] intValue];
                //[mass exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                [enemyArray exchangeObjectAtIndex:indexOne withObjectAtIndex:indexTwo];
            }
            
            
            //Третий ряд
            if( min > 9 && min < 15)
            {
                for (int i = 0; i < [mass count] - 1; i++) {
                    int indexOne = [[mass objectAtIndex:i] intValue];
                    int indexTwo = [[mass objectAtIndex:i + 1] intValue];
                    //[mass exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                    [enemyArray exchangeObjectAtIndex:indexOne withObjectAtIndex:indexTwo];
                }
            }
            
        }
        //Четрвертый ряд 4 элемента
        else if( (min > 14 && min < 20) && [mass count] == 4 )
        {
            int index=0;
            NSLog(@"Array: %@", mass);
            
            for (int i = 0; i < [mass count]; i++) {
                
                index = [[mass objectAtIndex:i] intValue];
                
                EnemyClass *element = [enemyArray objectAtIndex:index];
                
                [UIView animateWithDuration:animateDuration
                                      delay:animateDelay
                                    options:UIViewAnimationTransitionNone
                                 animations:^{
                                     
                                     int stepDown = element.gameObject.center.y - (53 * 3);
                                     int x = element.gameObject.center.x;
                                     element.gameObject.center = CGPointMake(x, stepDown);
                                     
                                 }
                                 completion:^(BOOL finished){
                                     element.gameObject.alpha = 1;
                                     
                                     [self changePicture:element];
                                     
                                 }];
                [enemyArray exchangeObjectAtIndex:index withObjectAtIndex:i * 5 + (index % 5)];
                
            }
            [enemyArray exchangeObjectAtIndex:30 + (index % 5) withObjectAtIndex:20 + (index % 5)];
            [enemyArray exchangeObjectAtIndex:30 + (index % 5) withObjectAtIndex:25 + (index % 5)];
            
        }
        
        //Пятая строка
        else if(min > 19 && min < 25)
        {
            
            int index=0;
            NSLog(@"Array: %@", mass);
            
            for (int i = 0; i < [mass count]; i++) {
                
                index = [[mass objectAtIndex:i] intValue];
                
                EnemyClass *element = [enemyArray objectAtIndex:index];
                
                [UIView animateWithDuration:animateDuration
                                      delay:animateDelay
                                    options:UIViewAnimationTransitionNone
                                 animations:^{
                                     
                                     int stepDown = element.gameObject.center.y - (53 * 4);
                                     int x = element.gameObject.center.x;
                                     element.gameObject.center = CGPointMake(x, stepDown);
                                     
                                 }
                                 completion:^(BOOL finished){
                                     element.gameObject.alpha = 1;
                                     
                                     [self changePicture:element];
                                     
                                 }];
                [enemyArray exchangeObjectAtIndex:index withObjectAtIndex:i * 5 + (index % 5)];
                
            }
            
            [enemyArray exchangeObjectAtIndex:20 + (index % 5) withObjectAtIndex:15 + (index % 5)];
            [enemyArray exchangeObjectAtIndex:30 + (index % 5) withObjectAtIndex:20 + (index % 5)];
            [enemyArray exchangeObjectAtIndex:20 + (index % 5) withObjectAtIndex:25 + (index % 5)];
            
            
        }
        //Else
        else{
            
            while (minIndex < min) {
                
                EnemyClass *element = [enemyArray objectAtIndex:minIndex + 5 * [mass count]];
                
                [UIView animateWithDuration:animateDuration
                                      delay:animateDelay
                                    options:UIViewAnimationTransitionNone
                                 animations:^{
                                     
                                     int stepDown = element.gameObject.center.y - (53 * [mass count]);
                                     int x = element.gameObject.center.x;
                                     element.gameObject.center = CGPointMake(x, stepDown);
                                     
                                 }
                                 completion:^(BOOL finished){
                                     element.gameObject.alpha = 1;
                                     
                                     [self changePicture:element];
                                     
                                 }];
                
                [enemyArray exchangeObjectAtIndex:minIndex withObjectAtIndex:minIndex + 5 * [mass count]];
                
                minIndex += 5;
                
            }
            
        }
    }
    else
    {
        for (int i = 0; i < [mass count]; i++) {
            int index = [[mass objectAtIndex:i] intValue];
            
            EnemyClass *element = [enemyArray objectAtIndex:index];
            
            element.gameObject.alpha = 0;
            
            // NSLog(@"Del_index: %d", index);
            
        }
    }
    
}

-(void) elementDownLoop:(int)index{
    
    if (index > 4) {
        
        while (index > 4){
            // Получаем верхний элемент по индексу
            index -= 5;
            EnemyClass *enemyOne = [enemyArray objectAtIndex:index];
            
            [UIView animateWithDuration:animateDuration
                                  delay:animateDelay
                                options:UIViewAnimationTransitionNone
                             animations:^{
                                 float tempPosX = enemyOne.gameObject.center.x;
                                 float tempPosY = enemyOne.gameObject.center.y + 53;
                                 
                                 enemyOne.gameObject.center = CGPointMake(tempPosX, tempPosY);
                             }
                             completion:^(BOOL finished){
                                 
                             }];
        }
        
    }
    
}


-(void) elementGoUP:(int)index{
    
    //index = 20
    while (index > 4){
        // Получаем верхний элемент по индексу
        //Получим элемент по индексу
        
        EnemyClass *enemyTwo = [enemyArray objectAtIndex:index]; //20
        
        
        // enemyTwo.gameObject.alpha = 1;
        
        float tempPosX = enemyTwo.gameObject.center.x;
        float tempPosY = enemyTwo.gameObject.center.y - 53;
        enemyTwo.gameObject.center = CGPointMake(tempPosX, tempPosY);
        
        [enemyArray exchangeObjectAtIndex:index withObjectAtIndex:index-5];
        
        index -= 5;
        
    }
    
    EnemyClass *enemyTwo = [enemyArray objectAtIndex: index];
    
    [self changePicture:enemyTwo];
    
    [UIView animateWithDuration:animateDuration
                          delay:animateDelayIn
                        options:UIViewAnimationTransitionNone
                     animations:^{
                         enemyTwo.gameObject.alpha = 1;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

-(void)changePicture:(EnemyClass *) activeObject{
    
    
    int rNumber = rand()%5;
    
    switch (rNumber) {
        case 0:
            [activeObject.gameObject setImage:[UIImage imageNamed:@"Flu_Movement_1.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [activeObject.gameObject setImage:[UIImage imageNamed:@"cold_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [activeObject.gameObject setImage:[UIImage imageNamed:@"dustMite_Move_1.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [activeObject.gameObject setImage:[UIImage imageNamed:@"pollen_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [activeObject.gameObject setImage:[UIImage imageNamed:@"sailor_movement_1.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    [activeObject.gameObject setTag:rNumber];
    
    
}

-(void) addBoomEffect:(NSMutableArray *) mass{
    
    for (int i = 0; i < [mass count]; i++) {
        
        int index = [[mass objectAtIndex:i] intValue];
        EnemyClass *tempObject = [enemyArray objectAtIndex:index];
        int tempX = tempObject.gameObject.frame.origin.x;
        int tempY = tempObject.gameObject.frame.origin.y;
        
        tempObject = nil;
        
        EnemyClass *newObject = [[EnemyClass alloc] init];
        
        UIButton *_button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _button.frame = CGRectMake(tempX, tempY, 53, 53);
        
        _button.alpha = 1;
        
        [_button setImage:[UIImage imageNamed:@"pop_1.png"] forState:UIControlStateNormal];
        
        newObject.gameObject = _button;
        
        [self.view addSubview:newObject.gameObject];
        
        
        newObject.gameObject.imageView.animationImages = [NSArray arrayWithObjects:
                                                          [UIImage imageNamed:@"bomb_burst_1.png"],
                                                          [UIImage imageNamed:@"bomb_burst_2.png"],
                                                          [UIImage imageNamed:@"bomb_burst_3.png"],
                                                          [UIImage imageNamed:@"bomb_burst_4.png"],
                                                          nil];
        newObject.gameObject.imageView.animationDuration = .3;
        newObject.gameObject.imageView.animationRepeatCount = 1;
        [newObject.gameObject.imageView startAnimating];
        
        [UIView animateWithDuration:0.1
                              delay:0.2
                            options:UIViewAnimationTransitionNone
                         animations:^{
                              newObject.gameObject.alpha = 0;
                         }
                         completion:^(BOOL finished){
                             [newObject.gameObject removeFromSuperview];
                         }];        
    }
    
}

-(void)addScores:(int)tagIndex andCount:(int)Count{
    
    int score;
    
    switch (tagIndex) {
        case 0:
            //TODO:
            score = 5;
            break;
        case 1:
            //TODO:
            score = 7;
            break;
        case 2:
            //TODO:
            score = 8;
            break;
        case 3:
            //TODO:
            score = 10;
            break;
        case 4:
            //TODO:
            score = 12;
            break;
            
        default:
            break;
    }
    
    score *= Count;
    
    int parseScore = [StatusLabel.text intValue];
    
    score += parseScore;
    
    StatusLabel.text = [[NSString alloc] initWithFormat:@"%d", score];
    
}

- (void)viewDidUnload
{
    [self setStatusLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;//(interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end