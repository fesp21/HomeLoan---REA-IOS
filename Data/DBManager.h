//
//  DBManager.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#import "MCModel.h"
#import "BankModel.h"
#import "RatesModel.h"

@interface DBManager : NSObject
{
    NSString *databasePath;
}
+(DBManager*)getSharedInstance;
-(BOOL)createDB;

-(void)updateSettings:(NSDictionary*)list;
-(void)updateAgencies:(NSDictionary*)list;
-(void)updateMCs:(NSArray*)list;
-(void)updateBanks:(NSArray*)list;


@end
