//
//  DataBase.m
//  Hiar_Style_New
//
//  Created by apple on 12/23/11.
//  Copyright 2011 354456. All rights reserved.
//

#import "DataBase.h"


@implementation DataBase
@synthesize catchArray;



-(void)createEditableCopyOfDatabaseIfNeeded 
{
  	objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
   paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];

    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
	//	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"FishApp.sqlite"];
	//	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (success) 
		return;
    else
	{
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Hairstyle.sqlite"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if (!success) 
		{
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
		}
	}
}


-(void)InsertIntoColorLine:(NSString *)Name{

  
    
    [self createEditableCopyOfDatabaseIfNeeded];
    
    
    
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		static sqlite3_stmt *statement;
		statement = nil;
		
		
		const char *sql="insert into Add_Color(Name) values(?)";
		
		if(sqlite3_prepare_v2(database, sql , -1, &statement, NULL) == SQLITE_OK)
		{
			
			sqlite3_bind_text(statement, 1, [Name UTF8String], -1, SQLITE_TRANSIENT);
			
		}
		else
		{
			
			NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
		}
		
		if(sqlite3_step(statement) == SQLITE_DONE) 
		{
			sqlite3_finalize(statement);
			
			
		}
		else
		{
			NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
		}
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}



}

-(void)ShowData:(NSString *)TableName:(NSString *)Condition{

    [self createEditableCopyOfDatabaseIfNeeded];
    
    self.catchArray=[[NSMutableArray alloc]init];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		static sqlite3_stmt *statement;
		statement = nil;
		
		NSString *s = [NSString stringWithFormat:@"SELECT * FROM %@ %@",TableName,Condition];
		
		if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				// Read the data from the result row
				
				temp =[[NSMutableDictionary alloc]init];
				
				[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"name"];
				
				
				
				[self.catchArray addObject:temp];
				[temp release];
				temp=nil;
			}
			
		}
		else
		{
			NSAssert1(0, @"Error while Execute statement. '%s'", sqlite3_errmsg(database));
		}
		
		sqlite3_finalize(statement);
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}		
	

    
    
    
}

-(void)ShowDataForService{
    [self createEditableCopyOfDatabaseIfNeeded];
    
    self.catchArray=[[NSMutableArray alloc]init];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		static sqlite3_stmt *statement;
		statement = nil;
		
		NSString *s = [NSString stringWithFormat:@"SELECT * FROM Add_Service"];
        
		
		if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				// Read the data from the result row
				
				temp =[[NSMutableDictionary alloc]init];
                [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"id"];
                

                if((char *)sqlite3_column_text(statement, 1)!=NULL){
                    
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"name"];
                    
                }
                if((char *)sqlite3_column_text(statement, 2)!=NULL){
                    
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"price"];
                    
                }

				
				
				[self.catchArray addObject:temp];
				[temp release];
				temp=nil;
			}
			
		}
		else
		{
			NSAssert1(0, @"Error while Execute statement. '%s'", sqlite3_errmsg(database));
		}
		
		sqlite3_finalize(statement);
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}		
	


}



-(void)DeleteData:(NSString *)TableName:(NSString *)ConditionName:(NSString *)Condition
{

    [self createEditableCopyOfDatabaseIfNeeded];
    
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		NSString *sql =[NSString stringWithFormat:@"delete from %@ where %@=%@",TableName,ConditionName,Condition];
		
		sqlite3_stmt *statement;
		statement = nil;
		
		if(sqlite3_prepare_v2(database,[sql UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			sqlite3_step(statement); 
		}
		
		sqlite3_finalize(statement);
		
		
		sqlite3_close(database);
		
	} 


}

-(void)InsertintoService:(NSString *)ServiceName:(NSString *)Price{

    [self createEditableCopyOfDatabaseIfNeeded];
    
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		static sqlite3_stmt *statement;
		statement = nil;
		
        NSString *sql=[NSString stringWithFormat:@"insert into Add_Service(Name,Price) Values('%@','%@')",ServiceName,Price];
        
		
		if(sqlite3_prepare_v2(database, [sql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
		{
			
            
			
            
		}
		else
		{
			
			NSAssert1(0, @"Error while creating update statement. '%s'", sqlite3_errmsg(database));
		}
		
		if(sqlite3_step(statement) == SQLITE_DONE) 
		{
			sqlite3_finalize(statement);
			
			
		}
		else
		{
			NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
		}
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}
	



}

-(void)InsertintoServiceDetails:(NSString *)strdate:(NSString *)strname:(NSString *)strprice:(NSString *)count{
    [self createEditableCopyOfDatabaseIfNeeded];
    
    
    
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
    {
        
        static sqlite3_stmt *statement;
        statement = nil;
        
        
        const char *sql="insert into Service_Detail(CID,Date,Service_Name,Price,Total) values(?,?,?,?,?)";
        
        if(sqlite3_prepare_v2(database, sql , -1, &statement, NULL) == SQLITE_OK)
        {
            
            sqlite3_bind_int(statement, 1, [objappdel.idvalue intValue]);
            sqlite3_bind_text(statement, 2, [strdate UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, [strname UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, [strprice UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_int(statement, 5, [count intValue]);
            
            
        }
        else
        {
            
            NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
        }
        
        if(sqlite3_step(statement) == SQLITE_DONE) 
        {
            sqlite3_finalize(statement);
            
            
        }
        else
        {
            NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
        }
        sqlite3_close(database);
        
    }
    else 
    {
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
    

}
-(void)ShowDataForImage:(NSString *)Condition
{
    [self createEditableCopyOfDatabaseIfNeeded];
    self.catchArray=[[NSMutableArray alloc]init];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		static sqlite3_stmt *statement;
		statement = nil;
		
		NSString *s = [NSString stringWithFormat:@"SELECT * FROM Image %@",Condition];
		
		if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				// Read the data from the result row
				
				temp =[[NSMutableDictionary alloc]init];
				
                [temp setValue:[NSString stringWithFormat:@"%d",sqlite3_column_int(statement, 0)] forKey:@"id"];
                
                if((char *)sqlite3_column_text(statement, 2)!=NULL){
                    
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"name"];
                    
                }
                if((char *)sqlite3_column_text(statement, 3)!=NULL){
                    
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"date"];
                    
                }
				
				
				
				[self.catchArray addObject:temp];
				[temp release];
				temp=nil;
			}
			
		}
		else
		{
			NSAssert1(0, @"Error while Execute statement. '%s'", sqlite3_errmsg(database));
		}
		
		sqlite3_finalize(statement);
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}		
	


}


-(void)ShowDataForClientname:(NSString *)condition{
 
    [self createEditableCopyOfDatabaseIfNeeded];
    
self.catchArray=[[NSMutableArray alloc]init];
	
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		static sqlite3_stmt *statement;
		statement = nil;
		NSString *s = [NSString stringWithFormat:@"SELECT * FROM AddClient %@",condition];
		
		if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				// Read the data from the result row
				
				temp =[[NSMutableDictionary alloc]init];
                
				[temp setValue:[NSString stringWithFormat:@"%d",sqlite3_column_int(statement, 0)] forKey:@"id"];
                if((char *)sqlite3_column_text(statement, 1)!=NULL){
                    
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"image"];
				}
				if((char *)sqlite3_column_text(statement, 2)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"name"];
					
				}
				if((char *)sqlite3_column_text(statement, 3)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"lname"];
					
                    
				}
				if((char *)sqlite3_column_text(statement, 4)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)] forKey:@"cmpnname"];
					
				}
				if((char *)sqlite3_column_text(statement, 5)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)] forKey:@"homenum"];
					
				}
				if((char *)sqlite3_column_int(statement, 6)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)] forKey:@"mobnum"];
					
				}
				if((char *)sqlite3_column_text(statement, 7)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)] forKey:@"add"];
					
				}
				if((char *)sqlite3_column_text(statement, 8)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)] forKey:@"email"];
					
				}
				if((char *)sqlite3_column_text(statement, 9)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 9)] forKey:@"notes"];
					
				}
				if((char *)sqlite3_column_text(statement, 10)!=NULL){
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 10)] forKey:@"date"];
					
				}
				[self.catchArray addObject:temp];
				[temp release];
				temp=nil;
			}
			
		}
		else
		{
			NSAssert1(0, @"Error while Execute statement. '%s'", sqlite3_errmsg(database));
		}
		
		sqlite3_finalize(statement); 
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}		
	


}

-(void)ShowDataForServiceDetails:(NSString *)condition{

    
    [self createEditableCopyOfDatabaseIfNeeded];
    
    self.catchArray=[[NSMutableArray alloc]init];
	
    
    
    
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		static sqlite3_stmt *statement;
		statement = nil;
		  
		NSString *s = [NSString stringWithFormat:@"SELECT * FROM Service_Detail %@",condition];
		
		if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				// Read the data from the result row
				
				temp =[[NSMutableDictionary alloc]init];
				
				[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"date"];
				[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"name"];
				[temp setValue:[NSString stringWithFormat:@"%d",sqlite3_column_int(statement, 4)] forKey:@"price"];
				
				
				[self.catchArray addObject:temp];
				[temp release];
				temp=nil;
			}
			
		}
		else
		{
			NSAssert1(0, @"Error while Execute statement. '%s'", sqlite3_errmsg(database));
		}
		
		sqlite3_finalize(statement);
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}		
	
	



}
-(void)ShowFormullaDetail{

    
    [self createEditableCopyOfDatabaseIfNeeded];
    
    self.catchArray=[[NSMutableArray alloc]init];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		static sqlite3_stmt *statement;
		statement = nil;
		int i;
		i=[objappdel.idvalue intValue];
		//nslog(@"%d",i);
		
		NSString *s = [NSString stringWithFormat:@"SELECT * FROM Formula_Detail where CID=%d and Date='%@'",i,objappdel.strdate];
		//nslog(@"%@",s);
		if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				// Read the data from the result row
				
				temp =[[NSMutableDictionary alloc]init];
                
                
                [temp setValue:[NSString stringWithFormat:@"%d",sqlite3_column_int(statement, 0)] forKey:@"FID"];
                
				if((char *)sqlite3_column_text(statement, 2)!=NULL){
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"Formula_Type"];
				}
				if((char *)sqlite3_column_text(statement, 3)!=NULL){
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"color"];
				}
				if((char *)sqlite3_column_text(statement, 4)!=NULL){
                    [temp setValue:[NSString stringWithFormat:@"%.2f",sqlite3_column_double(statement, 4)] forKey:@"colorvalue"];
				}
				if((char *)sqlite3_column_text(statement, 5)!=NULL)
				{
                    [temp setValue:[NSString stringWithFormat:@"%.2f",sqlite3_column_double(statement, 5)] forKey:@"adicolor"];
				}
				if((char *)sqlite3_column_text(statement, 6)!=NULL){
					
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)] forKey:@"volume"];
				}
				if((char *)sqlite3_column_text(statement, 7)!=NULL){
					
                    [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)] forKey:@"time"];
				}
                //[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)] forKey:@"date"];
                
				[self.catchArray addObject:temp];
				[temp release];
				temp=nil;
			}
			
		}
		else
		{
			NSAssert1(0, @"Error while Execute statement. '%s'", sqlite3_errmsg(database));
		}
		
		sqlite3_finalize(statement);
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}		

}

-(void)InsertIntoImage:(NSString *)ImageName:(NSString *)date{

    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		static sqlite3_stmt *statement;
		statement = nil;
		
		
		
		const char *sql="insert into Image(CID,Image,Date) values(?,?,?)";
		
		if(sqlite3_prepare_v2(database, sql , -1, &statement, NULL) == SQLITE_OK)
		{
			sqlite3_bind_int(statement, 1, [objappdel.idvalue intValue]);
			
			sqlite3_bind_text(statement, 2, [ImageName UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 3, [date UTF8String], -1, SQLITE_TRANSIENT);
			
		}
		else
		{
			
			NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
		}
		
		if(sqlite3_step(statement) == SQLITE_DONE) 
		{
			sqlite3_finalize(statement);
			
			
		}
		else
		{
			NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
		}
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}



}

@end
