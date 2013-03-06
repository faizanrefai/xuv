//
//  DataBase.h
//  Hiar_Style_New
//
//  Created by apple on 12/23/11.
//  Copyright 2011 354456. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Hiar_Style_NewAppDelegate.h"


@interface DataBase : NSObject
{
    NSString *databasePath;
    
    sqlite3 *database;
	
    NSMutableArray *catchArray;
	
    NSMutableDictionary *temp;
    
    NSArray *paths;
    NSString *documentsDirectory;
    NSString *path;
    
    Hiar_Style_NewAppDelegate *objappdel;
    
    
}


-(void) createEditableCopyOfDatabaseIfNeeded;
-(void)InsertIntoColorLine:(NSString *)Name;
-(void)ShowData:(NSString *)TableName:(NSString *)Condition;
-(void)InsertintoService:(NSString *)ServiceName:(NSString *)Price;


-(void)InsertintoServiceDetails:(NSString *)strdate:(NSString *)strname:(NSString *)strprice:(NSString *)count;


-(void)DeleteData:(NSString *)TableName:(NSString *)ConditionName:(NSString *)Condition;


-(void)ShowDataForImage:(NSString *)Condition;

-(void)ShowDataForService;
-(void)ShowDataForClientname:(NSString *)condition;

-(void)ShowDataForServiceDetails:(NSString *)condition;

-(void)ShowFormullaDetail;


-(void)InsertIntoImage:(NSString *)ImageName:(NSString *)date;




@property(nonatomic,retain) NSMutableArray *catchArray;



@end
