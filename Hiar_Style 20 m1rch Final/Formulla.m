//
//  Formulla.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Formulla.h"
#import "ColorLIne.h"
#import "Client_History_More.h"
#import "Repeat_Service.h"
@implementation Formulla


@synthesize tblformulla;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arr count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
	
	
	//if(i==1 || i==2 | i==3){
//	return 1;
//	}
	if(i==4 || i==3)
	{
		return 3;
		
}
else {
	return 1;
}

		
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if (i==1) {
		lblvalue.text=[arrformula objectAtIndex:row];
		objappdel.strformula=lblvalue.text;
		
	}	
	if (i==2) {
		lblvalue1.text=[arrformula objectAtIndex:row];
	
	
	}	
	if (i==3) {
		strcolor=[strcolor stringByAppendingFormat:@"%@",[arrformula objectAtIndex:row]];
        lblvalue2.text=strcolor;
        
		objappdel.strcolorform=lblvalue2.text;
		
	
	}	
	if (i==4) {
		strcolor2=[strcolor2 stringByAppendingFormat:@"%@",[arrformula objectAtIndex:row]];
        
	lblvalue3.text=strcolor2;
		objappdel.stradicolor=lblvalue3.text;
		
	}	
	if (i==5) {
		lblvalue4.text=[arrformula objectAtIndex:row];
		objappdel.strvolume=lblvalue4.text;
		
	
	}	
	if (i==6) {
		lblvalue5.text=[arrformula objectAtIndex:row];
		objappdel.strtime=lblvalue5.text;
		
	
	}	
	
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
	return [arrformula count];
	
	//return [arrformula count];
	//if (i==1) {
//
//	return [arrformula count];
//
//	}
//
//	if (i==2) {
//			return [arrvolume count];
//	
//	}
//	if (i==3) {
//		
//		return [arrtime count];
//		
//	}
//	if (i==4) {
//		
//		return [arrlistchar count];
//		
//	}
//	

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
	
	return [arrformula objectAtIndex:row];	

//	if(i==1) {
//	
//	return [arrformula objectAtIndex:row];	
//}
//	
//	if (i==2){
//		return [arrvolume objectAtIndex:row];
//		
//	}
//	if(i==3) {
//		return [arrtime objectAtIndex:row];
//		
//	}
//	if(i==4)
//	{
//		return [arrlistchar objectAtIndex:row];
//		
//	
//	}
//	
	
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
	
	static NSString *CellTableIdentifier = @"CellTableIdentifier";
   
   
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
	if (cell == nil) {
		
		CGRect cellFrame = CGRectMake(0,0,300,65);
		cell = [[[UITableViewCell alloc] initWithFrame: cellFrame
									   reuseIdentifier:CellTableIdentifier] autorelease];
		CGRect nameLabelRect = CGRectMake(160,15,200,15);
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];		
		nameLabel.tag=kNameValueTag;
		nameLabel.backgroundColor=[UIColor clearColor];
		nameLabel.textColor=[UIColor blackColor];
        nameLabel.font=[UIFont fontWithName:@"Arial" size:14.0];

		nameLabel.textAlignment = UITextAlignmentLeft;
		//nameLabel.font = [UIFont boldSystemFontOfSize:12];
		[cell.contentView addSubview: nameLabel];
		[nameLabel release];		
		
		//lblvalue= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		
		//lblvalue.text=[arrformula objectAtIndex:indexPath.row];
		
       
        
     	
		
	}
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    //cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell.png"]] autorelease];
   // cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:14.0];

	if (indexPath.row==0) {
		
		lblvalue= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		lblvalue.textColor=[UIColor blueColor];
        
		lblvalue.text=objappdel.strformula;
        lblvalue.font=[UIFont fontWithName:@"Arial" size:14.0];

		//[arrformula objectAtIndex:indexPath.row];
		
	}
	if(indexPath.row==1)
	{
		lblvalue1= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		lblvalue1.textColor=[UIColor blueColor];
        
		lblvalue1.text=objappdel.strcolor;
        lblvalue1.font=[UIFont fontWithName:@"Arial" size:14.0];

		//[arrformula objectAtIndex:indexPath.row];
		
	
	}
	
	
	if(indexPath.row==2)
	{
		lblvalue2= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		lblvalue2.textColor=[UIColor blueColor];
        
		lblvalue2.text=objappdel.strcolorform;
        lblvalue2.font=[UIFont fontWithName:@"Arial" size:14.0];
        

		//[arrformula objectAtIndex:indexPath.row];
		
		
	}
	if(indexPath.row==3)
	{
		lblvalue3= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		lblvalue3.textColor=[UIColor blueColor];
        
		lblvalue3.text=objappdel.stradicolor;
		lblvalue3.font=[UIFont fontWithName:@"Arial" size:14.0];
        
		//[arrformula objectAtIndex:indexPath.row];
		
		
	}
	if(indexPath.row==4)
	{
		lblvalue4= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		lblvalue4.textColor=[UIColor blueColor];
        
		lblvalue4.text=objappdel.strvolume;
		lblvalue4.font=[UIFont fontWithName:@"Arial" size:14.0];
        
		//[arrformula objectAtIndex:indexPath.row];
		
		
	}
	if(indexPath.row==5)
	{
		lblvalue5= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		lblvalue5.textColor=[UIColor blueColor];
        
		lblvalue5.text=objappdel.strtime;
		lblvalue5.font=[UIFont fontWithName:@"Arial" size:14.0];
        
		//[arrformula objectAtIndex:indexPath.row];
		
		
	}
	
	//	
	cell.textLabel.textColor=[UIColor blackColor];
    
	
	cell.textLabel.text=[arr objectAtIndex:indexPath.row];
    
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
//	cell.textLabel.text=objappdel.strtime;
    
    
	// Configure the cell.
	
    return cell;
	
	
	
	
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     

switch (indexPath.row) {
	case 0:{
		pickerView1.hidden=FALSE;
        
		i=1;
		arrformula=[[NSArray alloc]initWithObjects:@"Corn row highlights",@"Highlights (partial)",@"Highlights (full)",@"Perm colour",@"others",nil];

		[pickerView1 reloadAllComponents];
		
	}
		
		break;
	case 1:

	{
		
        if(objColor)
        {
            [objColor release];
            
        
        }
        
        objColor=[[ColorLIne alloc]initWithNibName:@"ColorLIne" bundle:nil];
        [self.navigationController pushViewController:objColor animated:YES];
       
        
	}
		//cell.textLabel.text=@"Color Line";
		break;
	case 2:
	{
		arrformula=[[NSArray alloc]initWithObjects:@"+",@"-",@".",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];

		pickerView1.hidden=FALSE;
//		
	i=3;
//		
		[pickerView1 reloadAllComponents];
////		
	}
		
				
		//cell.textLabel.text=@"Color Formulation";
		break;
	case 3:
	{
		arrformula=[[NSArray alloc]initWithObjects:@"+",@"-",@".",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
		
		pickerView1.hidden=FALSE;
		//		
				i=4;
		//		
		[pickerView1 reloadAllComponents];
		////	
	}
		
		break;
		
	case 4:
	{
		arrformula=[[NSArray alloc]initWithObjects:@"Volume 10",@"Volume 20",@"Volume 30",@"Volume 40",@"Volume 50",nil];
		//	
		
		pickerView1.hidden=FALSE;
//		
		i=5;
//		
	[pickerView1 reloadAllComponents];

	}
		//cell.textLabel.text=@"Developer Formula";
		break;
	case 5:
		
	{
		arrformula=[[NSArray alloc]initWithObjects:@"5 Minutes",@"10 Minutes",@"15 Minutes",@"20 Minutes",@"25 Minutes",@"30 Minutes",@"35 Minutes",@"40 Minutes",@"45 Minutes",@"50 Minutes",@"55 Minutes",@"60 Minutes",nil];
		
		//
		pickerView1.hidden=FALSE;
	i=6;
////		
		[pickerView1 reloadAllComponents];			
	}
		break;
		
	default:
		break;
}

}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(void)viewWillAppear:(BOOL)animated{

    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	//[objappdel createEditableCopyOfDatabaseIfNeeded];
	self.navigationController.navigationBar.hidden=TRUE;
	
	
	
	
//	pickerView1.hidden=TRUE;
    //		
	
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	tblformulla.backgroundColor=[UIColor clearColor];
	
	arr=[[NSArray alloc] initWithObjects:@"Formula Type",@"Color Line",@"Color Formulation",@"Additional Color",@"Developer Formula",@"Processing Time",nil];
	[tblformulla reloadData];
    

}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//	
//	//tblcolorfor.hidden=TRUE;
//	arrformula==[[NSArray alloc]initWithObjects:@"CornRowHighlights",@"Highlights(Partial)",@"Highlights(Full)",@"PermColor",@"others",nil];
			
	strcolor=@"";
    strcolor2=@"";
    
		 }


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)viewDidUnload {
    [super viewDidUnload];
		// Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)done{
	
	
	NSDate *now = [NSDate date];
	
	NSDate *earlierDate =now;
	
	////nslog(@"%@",earlierDate);
	
	
	
	NSString *strDate = [[NSString alloc] initWithFormat:@"%@",earlierDate];
	NSArray *arrq = [strDate componentsSeparatedByString:@" "];
    [strDate release];
    
    
	NSString *str;
	str = [arrq objectAtIndex:0];
	//nslog(@"strdate: %@",str); // strdate: 2011-02-28
	
	strdate=str;
	
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		static sqlite3_stmt *statement;
		statement = nil;
		
		
		
//		int a;
//		a=[objappdel.idvalue intValue];
//		//nslog(@"%d",a);
		NSString *sql;
        
        if(![objappdel.strupdateFormulla isEqualToString:@"No"])
        {
        
            sql=[NSString stringWithFormat:@"update Formula_Detail set Formula_Type='%@',Color_Line='%@',Color_Formulation='%@',Additional_Color='%@',Developer_Formula='%@',Processing_Time='%@',Date='%@' where FID=%@",objappdel.strformula,objappdel.strcolor,objappdel.strcolorform,objappdel.stradicolor,objappdel.strvolume,objappdel.strtime,strdate,objappdel.strupdateFormulla];
            
            
            
            
            if(sqlite3_prepare_v2(database, [sql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
            {
                
                
            }
            else
            {
                
                NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
            }

        
        }
        else{
		sql=[NSString stringWithFormat:@"insert into Formula_Detail(CID,Formula_Type,Color_Line,Color_Formulation,Additional_Color,Developer_Formula,Processing_Time,Date) values(?,?,?,?,?,?,?,?)"];
        
		
		if(sqlite3_prepare_v2(database, [sql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
		{
			
			sqlite3_bind_int(statement, 1, [objappdel.idvalue intValue]);
			sqlite3_bind_text(statement, 2, [objappdel.strformula UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 3, [objappdel.strcolor UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 4, [objappdel.strcolorform UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 5, [objappdel.stradicolor UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 6, [objappdel.strvolume UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 7, [objappdel.strtime UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 8, [strdate UTF8String], -1, SQLITE_TRANSIENT);

			
			objappdel.strformula=@"";
			
			objappdel.strcolor=@"";
			objappdel.strcolorform=@"";
			objappdel.stradicolor=@"";
			objappdel.strvolume=@"";
			objappdel.strtime=@"";
		
		}
		else
		{
			
			NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
		}
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
	
    if(objappdel.tabmainsub.selectedIndex==2)
    {
        
        //	CGRect newFrame = objappdel.tabmainsub.view.frame;
        //    newFrame.size.height -= objappdel.tabmainsub.tabBar.frame.size.height;
        //    objappdel.tabmainsub.view.frame = newFrame;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
    	CGRect newFrame = objappdel.tabmainsub.view.frame;
        newFrame.size.height -= objappdel.tabmainsub.tabBar.frame.size.height;
        objappdel.tabmainsub.view.frame = newFrame;
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
    }
 
   // objappdel.window.rootViewController = objappdel.tabmainsub;
    
  	
}
-(IBAction)cancel{
    
    
    
    if(objappdel.tabmainsub.selectedIndex==2)
    {
    
    //	CGRect newFrame = objappdel.tabmainsub.view.frame;
//    newFrame.size.height -= objappdel.tabmainsub.tabBar.frame.size.height;
//    objappdel.tabmainsub.view.frame = newFrame;
    [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
    	CGRect newFrame = objappdel.tabmainsub.view.frame;
            newFrame.size.height -= objappdel.tabmainsub.tabBar.frame.size.height;
           objappdel.tabmainsub.view.frame = newFrame;
        [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    }
    //objappdel.window.rootViewController = objappdel.tabmainsub;
    
}


- (void)dealloc {
    [super dealloc];

	[tblformulla release];
	[arrformula release];
	
	
	[pickerView1 release];
	
	[arr release];
	[arrlistchar release];
	[arrvolume release];
	[arrtime release];
	
	
}


@end
