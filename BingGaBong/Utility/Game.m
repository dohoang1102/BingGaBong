//
//  Game.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "GameSettings.h"
#import "SimpleAudioEngine.h"
#import "SplashScreen.h"
#import "MainMenuScene.h"
#import "InGameMenu.h"
#import "Scene001.h"

typedef NSMutableArray Chapter;

static Game* ourSharedInstance= nil;
static CGSize winSize;

@implementation Game

@synthesize gameSettings;

+(void)initialize
{
    // Create game singleton
    if(!ourSharedInstance) {
        ourSharedInstance= [[Game alloc] init];
    }
    
    winSize= [[CCDirector sharedDirector] winSize];
    
    // Create user defaults for game settings.
    NSMutableDictionary *defaultValues= [NSMutableDictionary dictionary];
    [defaultValues setObject:[NSNumber numberWithFloat:0.8] forKey:keySfxVolume];
    [defaultValues setObject:[NSNumber numberWithFloat:0.8] forKey:keyMusicVolume];
    [defaultValues setObject:[NSNumber numberWithFloat:0.8] forKey:keyBrightness];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];

}

+(Game*)sharedInstance
{
    return ourSharedInstance;
}

-(id)init
{
    self= [super init];
    if(!self) return nil;
    
    backgroundMusic= nil;
    audioEngine= [SimpleAudioEngine sharedEngine];
    audioEngine.backgroundMusicVolume= 0.8f;
    audioEngine.effectsVolume= 0.8f;
    
    // Create each chapter
    Chapter *chapter0= [[Chapter alloc] init];
    [chapter0 addObject:[SplashScreen class]];
    [chapter0 addObject:[MainMenuScene class]];
    
    Chapter *chapter1= [[Chapter alloc] init];
    [chapter1 addObject:[Scene001 class]];
    
    chapters= [[[Chapter alloc] initWithObjects:chapter0, chapter1, nil] retain];
    [chapter0 release];
    [chapter1 release];
    
    return self;
}

-(void)dealloc
{
    // Stop sound engine
    [SimpleAudioEngine end];
    
    // Release attributes.
    [backgroundMusic release];
    [chapters release];
    [super dealloc];
}

-(Class)firstSceneClass
{
    return [[chapters objectAtIndex:0] objectAtIndex:0];
}

-(Class)nextSceneClass:(CCScene*)currentScene
{
    Class toFind= [currentScene class];
    BOOL found= NO;
    for(Chapter *chapter in chapters) {
        for(Class sceneClass in chapter) {
            if(found) {
                return sceneClass;
            }
            if(sceneClass == toFind) {
                found= YES;
            }
        }
    }
    return nil;
}

-(CCScene*)createScene:(Class)sceneClass
{
    return [[[sceneClass alloc] init] autorelease];
}
-(CCScene*)createFirstScene
{
    return [self createScene:[self firstSceneClass]];
}

-(CCScene*)createNextScene:(CCScene*)currentScene
{
    return [self createScene:[self nextSceneClass:currentScene]];
}

-(int)chapterIndexFromScene:(GameScene*)scene
{
    Class toFind= [scene class];
    for(int i= 0; i < [chapters count]; ++i) {
        for(Class sceneClass in [chapters objectAtIndex:i]) {
            if(sceneClass == toFind) {
                return i;
            }
        }
    }
    return -1;
}

-(void)loadBackDropForScene:(GameScene*)scene
{
    NSBundle *mainBundle= [NSBundle mainBundle];
    
    // Try to load the backdrop specific to the given scene
    NSString *fileExt= @"png";
    NSString *fileName= [[scene sceneName] stringByAppendingString:@"Backdrop"];
    if(![mainBundle pathForResource:fileName ofType:fileExt]) {
        // Try to load backdrop specific for the chapter
        int i= [self chapterIndexFromScene:scene];
        fileName= i >=0 ? [NSString stringWithFormat:@"Chapter%dBackdrop",i] : nil;
        if(!fileName || ![mainBundle pathForResource:fileName ofType:fileExt]) {
            // Try to load default backdrop
            fileName= @"DefaultBackdrop";
            if(![mainBundle pathForResource:fileName ofType:fileExt]) {
                fileName= nil;            
            }
        }
    }
    if(!fileName) return;
    CCSprite *backdrop= [CCSprite spriteWithFile:[fileName stringByAppendingFormat:@".%@", fileExt]];
    
    // Readjust to screen resolution.
    CGRect backdropRect= [backdrop textureRect];
    
    if(winSize.width != backdropRect.size.width) {
        backdrop.scaleX= (winSize.width / backdropRect.size.width);
    }
    if(winSize.height != backdropRect.size.height) {
        backdrop.scaleY= (winSize.height / backdropRect.size.height);
    }
    backdrop.position= ccp(0.5 * winSize.width, 0.5 * winSize.height);
    [scene addChild:backdrop z:-100];    
}
-(CCLayer*)getInGameMenuForScene:(GameScene*)scene
{
    return [InGameMenu createInstance];
}

-(void)playBackgroundMusicForScene:(GameScene*)scene
{
    NSBundle *mainBundle= [NSBundle mainBundle];
    
    // Try to load the background music specific to the given scene
    NSString *fileExt= @"m4a";
    NSString *fileName= [[scene sceneName] stringByAppendingString:@"BackgroundMusic"];
    if(![mainBundle pathForResource:fileName ofType:fileExt]) {
        // Try to load backdrop specific for the chapter
        int i= [self chapterIndexFromScene:scene];
        fileName= i >=0 ? [NSString stringWithFormat:@"Chapter%dBackgroundMusic",i] : nil;
        if(!fileName || ![mainBundle pathForResource:fileName ofType:fileExt]) {
            // Try to load default backdrop
            fileName= @"DefaultBackgroundMusic";
            if(![mainBundle pathForResource:fileName ofType:fileExt]) {
                fileName= nil;            
            }
        }
    }
    if(!fileName) return;
    
    // Don't play our background music if the user is already playing music from a different source.
    if([[CDAudioManager sharedManager] isOtherAudioPlaying] == YES) return;
    
    if([fileName isEqualToString:backgroundMusic] == YES) return;
    backgroundMusic= [fileName retain];
    
    if([audioEngine isBackgroundMusicPlaying] == YES) {
        [audioEngine stopBackgroundMusic];
    }
    [audioEngine playBackgroundMusic:[fileName stringByAppendingFormat:@".%@", fileExt] loop:YES];
}

+(float)xRatioToPixel:(float)xRatio
{
    return xRatio * winSize.width;
}
+(float)yRatioToPixel:(float)yRatio
{
    return yRatio * winSize.height;
}
+(float)xPixelToRatio:(float)xPixel
{
    return xPixel / winSize.width;
}
+(float)yPixelToRatio:(float)yPixel
{
    return yPixel / winSize.height;
}
+(CGPoint)ratioToPixel:(CGPoint)ratio
{
    return ccp(ratio.x * winSize.width, ratio.y * winSize.height);
}
+(CGPoint)pixelToRatio:(CGPoint)pixel
{
    return ccp(pixel.x / winSize.width, pixel.y / winSize.height);
}

@end
