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

@interface SceneDelegate ()<UITabBarControllerDelegate>

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

    NewsViewController *news = [[NewsViewController alloc] init];

    RecommendViewController *recommend = [[RecommendViewController alloc] init];
    
    SettingsViewController *settings = [[SettingsViewController alloc] init];

    tab.view.backgroundColor = UIColor.whiteColor;
    tab.viewControllers = @[home, news, recommend, settings];
    // 将 UITabarController 委托给当前实例
    tab.delegate = self;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tab];
    // 根节点
    self.window.rootViewController = nav;
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

// 代理的方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"Select Bar");
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
