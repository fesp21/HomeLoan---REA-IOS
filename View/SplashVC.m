//
//  SplashVC.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "SplashVC.h"

@interface SplashVC ()

@end

@implementation SplashVC


MBProgressHUD *hud;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"img_bg_triangle_loop"]];
    
    [self loadConfig];
}




-(void)loadConfig
{
    self.txtLoading.text = @"Loading Application Config";
    NSString *APIURL = @"http://mobileapi.imoney.my/home_loan/public/config";
    NSURL *URL = [NSURL URLWithString:APIURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *listJSON = (NSDictionary*)responseObject;
        [[DBManager getSharedInstance]updateSettings:listJSON];
        [self loadAgencies];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [RecentUtilities showAlert:@"ERROR" message:[NSString stringWithFormat:@"%@",[error localizedDescription] ]cancelBtn:nil];
    }];
    [operation start];
}

-(void)loadAgencies{
    self.txtLoading.text = @"Loading Agencies";
    NSString *APIURL = @"http://mobileapi.imoney.my/home_loan/public/agencies";
    NSURL *URL = [NSURL URLWithString:APIURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *listJSON = (NSDictionary*)responseObject;
        NSDictionary *list = [listJSON objectForKey:@"data"];
        [[DBManager getSharedInstance]updateAgencies:list];
        [self loadMCs];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [RecentUtilities showAlert:@"ERROR" message:[NSString stringWithFormat:@"%@",[error localizedDescription] ]cancelBtn:nil];
    }];
    [operation start];
}

-(void)loadMCs{
    self.txtLoading.text = @"Loading iMoney Consultant List";
    NSString *APIURL = @"http://mobileapi.imoney.my/home_loan/public/mcs";
    NSURL *URL = [NSURL URLWithString:APIURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *listJSON = (NSDictionary*)responseObject;
        NSArray *list = [listJSON objectForKey:@"data"];
        [[DBManager getSharedInstance]updateMCs:list];
        [self loadBanks];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [RecentUtilities showAlert:@"ERROR" message:[NSString stringWithFormat:@"%@",[error localizedDescription] ]cancelBtn:nil];
    }];
    [operation start];
}

-(void)loadBanks{
    self.txtLoading.text = @"Loading Bank List";
    NSString *APIURL = @"http://www.imoney.my/home-loan-mobile.json";
    NSURL *URL = [NSURL URLWithString:APIURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *listJSON = (NSDictionary*)responseObject;
        NSNumber *brlS = [listJSON objectForKey:@"blr"];
        [DataManager setBRL:[brlS floatValue]];
        NSLog(@"BLR : %f",[DataManager getBRL]);
        NSArray *list = [listJSON objectForKey:@"rates"];
        [[DBManager getSharedInstance]updateBanks:list];
        [self checkIsLogin];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [RecentUtilities showAlert:@"ERROR" message:[NSString stringWithFormat:@"%@",[error localizedDescription] ]cancelBtn:nil];
    }];
    [operation start];
}

-(void)checkIsLogin
{
    if([DataManager isUserLogin]){
        NSLog(@"USER IS LOGIN");
    }else{
        NSLog(@"USER IS NOT LOGIN");
        
        
        RegisterVC *regName = [[RegisterVC alloc]initWithNibName:@"RegisterVC" bundle:nil];
        [self presentViewController:regName animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
