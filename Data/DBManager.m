//
//  DBManager.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager

static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;


+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}


-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"4.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        char* errorMessage;
        sqlite3_exec(database, "BEGIN TRANSACTION", NULL, NULL, NULL);
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open_v2(dbpath, &database,SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL) == SQLITE_OK)
        {
            
            char *errMsg;
            const char *sql_stmt =
            "create table if not exists agencies_list (name text)";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Agencies");
            }

            char *errMsg2;
            const char *sql_stmt2 =
            "create table if not exists mc_list (id integer primary key autoincrement, name text, email text, phone text, avatar text)";
            if (sqlite3_exec(database, sql_stmt2, NULL, NULL, &errMsg2) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table MC List");
            }

            char *errMsg3;
            const char *sql_stmt3 =
            "create table if not exists bank_list (id integer primary key autoincrement, path text, bank text, bankName text, productName text, image text, imageAlt text, flexiLoan real, lockInPeriod integer, marginOfFinance integer)";
            if (sqlite3_exec(database, sql_stmt3, NULL, NULL, &errMsg3) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Bank List");
            }

            char *errMsg4;
            const char *sql_stmt4 =
            "create table if not exists rate_list (id integer primary key autoincrement, bank_id integer, loanAmount integer, interestRate real)";
            if (sqlite3_exec(database, sql_stmt4, NULL, NULL, &errMsg4) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Rate List");
            }
            
            char *errMsg5;
            const char *sql_stmt5 =
            "create table if not exists state_list ( name text )";
            if (sqlite3_exec(database, sql_stmt5, NULL, NULL, &errMsg5) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table State");
            }
            
            char *errMsg6;
            const char *sql_stmt6 =
            "create table if not exists lot_list ( name text )";
            if (sqlite3_exec(database, sql_stmt6, NULL, NULL, &errMsg6) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Lot");
            }
            
            char *errMsg7;
            const char *sql_stmt7 =
            "create table if not exists landed_property_list ( name text )";
            if (sqlite3_exec(database, sql_stmt7, NULL, NULL, &errMsg7) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Landed");
            }
            
            char *errMsg8;
            const char *sql_stmt8 =
            "create table if not exists nonlanded_property_list ( name text )";
            if (sqlite3_exec(database, sql_stmt8, NULL, NULL, &errMsg8) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Non-Landed");
            }
            
            
            char *errMsg9;
            const char *sql_stmt9 =
            "create table if not exists referral_list (id integer primary key autoincrement, user_id integer , mc_id integer , name text , phone text , address text , state text , valuation_id integer , status text , assigned text , contacted text , text price)";
            if (sqlite3_exec(database, sql_stmt9, NULL, NULL, &errMsg9) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Referral");
            }
            
            char *errMsg10;
            const char *sql_stmt10 =
            "create table if not exists submission_list (id integer primary key autoincrement, referral_id integer , bank_id integer , submited text , approved text , rejected text , decline text , executed text , status text )";
            if (sqlite3_exec(database, sql_stmt10, NULL, NULL, &errMsg10) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Submission ");
            }
            
            
            char *errMsg11;
            const char *sql_stmt11 =
            "create table if not exists valuation_list (id integer primary key autoincrement, is_valuated integer , property_type text , is_landed integer , storeys text , land_lot text , built_up text , land_area text , is_bumilot integer , address text , postcode text , state text , price text , is_renovated integer , renovation_cost text , confirm_dae text , renovation_info text )";
            if (sqlite3_exec(database, sql_stmt11, NULL, NULL, &errMsg11) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Valuation ");
            }
            
            char *errMsg12;
            const char *sql_stmt12 =
            "create table if not exists valuated_list (id integer primary key autoincrement, valuation_id integer , bank_id integer , obtained text )";
            if (sqlite3_exec(database, sql_stmt12, NULL, NULL, &errMsg12) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Valuated ");
            }
            
            char *errMsg13;
            const char *sql_stmt13 =
            "create table if not exists valuation_saved_list (id integer primary key autoincrement, is_valuated integer , property_type text , is_landed integer , storeys text , land_lot text , built_up text , land_area text , is_bumilot integer , address text , postcode text , state text , price text , is_renovated integer , renovation_cost text , confirm_dae text , renovation_info text )";
            if (sqlite3_exec(database, sql_stmt13, NULL, NULL, &errMsg13) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Saved Valuation ");
            }
            
            char *errMsg14;
            const char *sql_stmt14 =
            "create table if not exists notification_list (id integer primary key autoincrement, user_id integer , date text , message text , is_read integer , type text )";
            if (sqlite3_exec(database, sql_stmt14, NULL, NULL, &errMsg14) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Notification ");
            }
            
            char *errMsg15;
            const char *sql_stmt15 =
            "create table if not exists rates_list (id integer primary key autoincrement, user_id integer , mc_id integer , rating text )";
            if (sqlite3_exec(database, sql_stmt15, NULL, NULL, &errMsg15) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table Rate ");
            }

//
            sqlite3_exec(database, "COMMIT TRANSACTION", NULL, NULL, &errorMessage);
            sqlite3_close(database);
        } else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
            sqlite3_close(database);
        }
        sqlite3_close(database);
        return  isSuccess;
    }
    sqlite3_close(database);
    return isSuccess;
}


-(BOOL)deleteAllTable:(NSString*)tableName
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open_v2(dbpath, &database, SQLITE_OPEN_READWRITE , NULL) == SQLITE_OK)
    {
        NSString *deleteSQL = [NSString stringWithFormat:@"delete from %@",tableName];
        const char *insert_stmt = [deleteSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            sqlite3_finalize(statement);
            sqlite3_close(database);
            return YES;
        } else {
            sqlite3_finalize(statement);
            sqlite3_close(database);
            return NO;
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(database);
        return YES;
    }
    sqlite3_close(database);
    return NO;
}

-(void)updateSettings:(NSDictionary*)list
{
    NSDictionary *settings = [list objectForKey:@"settings"];
    NSString *isActive = [settings objectForKey:@"is_active"];
    NSString *ios_version = [settings objectForKey:@"ios_version"];
    NSString *api_key = [settings objectForKey:@"api_key"];

    NSLog(@"---------- APPLICATION SETTINGS ----------");
    NSLog(@"IS ACTIVE   : %@",isActive);
    NSLog(@"IOS VERSION : %@",ios_version);
    NSLog(@"API KEY     : %@",api_key);
    NSLog(@"------------------------------------------");
    
    
}


-(void)updateAgencies:(NSDictionary*)list
{
    [self deleteAllTable:@"agencies_list"];
    NSLog(@"Updating Agencies...");
    char* errorMessage;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open_v2(dbpath, &database, SQLITE_OPEN_READWRITE , NULL) == SQLITE_OK)
    {
        sqlite3_exec(database, "BEGIN TRANSACTION", NULL, NULL, NULL);
        
        for( NSString *aKey in [list allKeys] )
        {
            NSString *insertSQL = [NSString stringWithFormat:@"insert or replace into agencies_list ( name ) values (\"%@\")", aKey];
            const char *insert_stmt = [insertSQL UTF8String];
            sqlite3_exec(database, insert_stmt, NULL, NULL, NULL);
        }
        sqlite3_exec(database, "COMMIT TRANSACTION", NULL, NULL, &errorMessage);
        sqlite3_close(database);
    }else{
        NSLog(@"Error Updating Agencies...");
    }
}

-(void)updateMCs:(NSArray*)list{
    [self deleteAllTable:@"mc_list"];
    NSLog(@"Updating MCs...");
    char* errorMessage;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open_v2(dbpath, &database, SQLITE_OPEN_READWRITE , NULL) == SQLITE_OK)
    {
        sqlite3_exec(database, "BEGIN TRANSACTION", NULL, NULL, NULL);
        
        for (int i=0; i<list.count; i++) {
            NSDictionary *modelD = [list objectAtIndex:i];
            MCModel *model = [[MCModel alloc]initWithObject:modelD];
            NSString *insertSQL = [NSString stringWithFormat:@"insert or replace into mc_list (id, name, email, phone, avatar) values (\"%@\",\"%@\",\"%@\", \"%@\", \"%@\" )", [model _id], [model name], [model email], [model phone],[model avatar]];
            const char *insert_stmt = [insertSQL UTF8String];
            sqlite3_exec(database, insert_stmt, NULL, NULL, NULL);
        }
        sqlite3_exec(database, "COMMIT TRANSACTION", NULL, NULL, &errorMessage);
        sqlite3_close(database);
    }else{
        NSLog(@"Error Updating Agencies...");
    }
}

-(void)updateBanks:(NSArray*)list
{
    [self deleteAllTable:@"bank_list"];
    [self deleteAllTable:@"rate_list"];
    NSLog(@"Updating Banks...");
    char* errorMessage;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open_v2(dbpath, &database, SQLITE_OPEN_READWRITE , NULL) == SQLITE_OK)
    {
        sqlite3_exec(database, "BEGIN TRANSACTION", NULL, NULL, NULL);
        
        for (int i=0; i<list.count; i++) {
            NSDictionary *modelD = [list objectAtIndex:i];
            BankModel *model = [[BankModel alloc]initWithObject:modelD];
            NSString *insertSQL = [NSString stringWithFormat:@"insert or replace into bank_list (id, path, bank, bankName, productName, image, imageAlt, flexiLoan, lockInPeriod, marginOfFinance) values (\"%@\",\"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\" )", [model _id], [model path], [model bank], [model bankName] ,[model productName], [model image], [model imageAlt], [model flexiLoan], [model lockInPeriod] , [model marginOfFinance]];
            const char *insert_stmt = [insertSQL UTF8String];
            sqlite3_exec(database, insert_stmt, NULL, NULL, NULL);
            NSArray *listRate = [model hlRates];
            for (int j=0; j<listRate.count; j++) {
                RatesModel *rateM = [listRate objectAtIndex:j];
                NSNumber *loanAmount = [rateM loanAmount];
                NSNumber *interestRate = [rateM interestRate];
                NSString *insertSQL2 = [NSString stringWithFormat:@"insert into rate_list ( bank_id, loanAmount, interestRate) values (\"%@\",\"%@\",\"%@\")", [model _id], loanAmount, interestRate];
                const char *insert_stmt2 = [insertSQL2 UTF8String];
                sqlite3_exec(database, insert_stmt2, NULL, NULL, NULL);
            }
        }
        sqlite3_exec(database, "COMMIT TRANSACTION", NULL, NULL, &errorMessage);
        sqlite3_close(database);
    }else{
        NSLog(@"Error Updating Agencies...");
    }
}









@end
