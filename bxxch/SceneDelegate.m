//
//  SceneDelegate.m
//  bxxch
//
//  Created by ByteDance on 2023/6/21.
//

#import "SceneDelegate.h"
#import "views/DemoViewController.h"
#import "views/NewsViewController.h"
#import "views/RecommendViewController.h"
#import "views/SettingsViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // 底部 Tab
    UITabBarController *tab = [[UITabBarController alloc] init];
    
    
    DemoViewController *home = [[DemoViewController alloc] init];
    home.tabBarItem.title = @"Home";
    home.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x"];

    NewsViewController *news = [[NewsViewController alloc] init];
    news.tabBarItem.title = @"News";
    news.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x"];
    news.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x"];

    RecommendViewController *recommend = [[RecommendViewController alloc] init];
    recommend.tabBarItem.title = @"Recommend";
    recommend.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x"];
    recommend.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x"];
    
    SettingsViewController *settings = [[SettingsViewController alloc] init];
    settings.tabBarItem.title = @"Settings";
    settings.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x"];
    settings.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x"];

    tab.view.backgroundColor = UIColor.whiteColor;
    tab.viewControllers = @[home, news, recommend, settings];
    // 根节点
    self.window.rootViewController = tab;
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
