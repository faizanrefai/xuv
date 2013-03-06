//
//  Client_History_More.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Client_History_More.h"
#import "Service_Listing.h"
#import "Formulla.h"
#import "Client_History.h"
#import "ContactDetail.h"
#import "En_Large_Image.h"
#import "Repeat_Service.h"
#import "Hiar_Style_NewAppDelegate.h"
#import "TableCell.h"

@implementation Client_History_More
@synthesize scrl,tblViewCell;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewWillAppear:(BOOL)animated{

    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	
	//[objappdel createEditableCopyOfDatabaseIfNeeded];
    objdatabase=[[DataBase alloc]init];
    
    
    arrlistservice=[[NSMutableArray alloc]init];
    
    arrliformula=[[NSMutableArray alloc]init];
    arrliimage=[[NSMutableArray alloc]init];
    
    
	[self showdata];
	[self showformula];
	[self showimage];
        lbl=TRUE;
    total=0;
    
    
	lbldate.text=objappdel.strdate;
 
   
	arr=[[NSArray alloc] initWithObjects:@"Formula Type",@"Color Line",@"Color Formulation",@"Additional Color",@"Developer Formula",@"Processing Time",nil];
	
    
	int size;
	size=(([arrlistservice count]+2)*50);
	////nslog(@"%d",size);
	
	
	
	tblservice = [[UITableView alloc]initWithFrame:CGRectMake(0,200, 320,size+200) style:UITableViewStyleGrouped];
	//[RegScroll addSubview:countryTable];
	tblservice.delegate=self;
	tblservice.dataSource=self;
	//tblservice.backgroundColor=[UIColor clearColor];
	//tblstate.d
	[scrl addSubview:tblservice];
	tblservice.hidden=FALSE;
	[tblservice reloadData];
	tblservice.scrollEnabled=NO;
    
    tblform = [[UITableView alloc]initWithFrame:CGRectMake(0,tblservice.frame.size.height, 320,320) style:UITableViewStyleGrouped];
	//[RegScroll addSubview:countryTable];
	tblform.delegate=self;
	tblform.dataSource=self;
	//tblstate.d
	//tblform.backgroundColor=[UIColor clearColor];
	
	[scrl addSubview:tblform];
	tblform.hidden=FALSE;
	tblform.scrollEnabled=YES;

    if(objappdel.tabmainsub.selectedIndex==2)
    {
        btnedit.enabled=FALSE;
        
        
    }
    else{
    
        btnedit.enabled=TRUE;
        
    }
    
    
    
    
//	int lbl2;
//	lbl2=size+250;
    
//	CGRect nameLabelRect = CGRectMake(24,lbl2,200,15);
//	
//	UILabel *label = [[UILabel alloc] initWithFrame:nameLabelRect];
//	label.text=@"Formula";
//	label.textColor=[UIColor darkGrayColor];
//    
//	label.backgroundColor=[UIColor clearColor];
//    label.font=[UIFont fontWithName:@"Arial" size:14.0];
//    label.font=[UIFont boldSystemFontOfSize:14];
//    
//	[self.scrl addSubview:label];
//	[label release];
    
    
    
//    tot=size+230;
//    
//	CGRect nameLabelRect1 = CGRectMake(12,tot,200,15);
//	
//	UILabel *label1 = [[UILabel alloc] initWithFrame:nameLabelRect1];
//	label1.text=@"Total";
//	label1.textColor=[UIColor blackColor];
//    
//	label1.backgroundColor=[UIColor clearColor];
//    label1.font=[UIFont fontWithName:@"Arial" size:14.0];
//    label1.font=[UIFont boldSystemFontOfSize:14];
//    
//
//	[self.scrl addSubview:label1];
//    label2.hidden=TRUE;
//    label1.hidden=TRUE;
//    
//	[label1 release];    
//    
    
//	btnfrml = [UIButton buttonWithType:UIButtonTypeCustom];
//	[btnfrml addTarget:self action:@selector(select_formula:) forControlEvents:UIControlEventTouchUpInside];
//    
//	[btnfrml setImage:[UIImage imageNamed:@"editbarbutton.png"] forState:UIControlStateNormal];
//	int ia;
//	ia=lbl2-10;
//	
//	btnfrml.frame = CGRectMake(199, ia, 53, 33);
//	[self.scrl addSubview:btnfrml];
	
	
	
//	int demo;
//	demo=290+size;
	
		lblname.text=objappdel.strclientname;
	lblname.textColor=[UIColor blackColor];
    
    int scr;
    scr=tblform.frame.size.height+tblservice.frame.size.height+100;
    
    
    [scrl setScrollEnabled:YES];
	[scrl setContentSize:CGSizeMake(320, scr)];
	
	
	if([arrliimage count]==0){
        
        [btnimage1 setImage:nil forState:UIControlStateNormal];
        [btnimage2 setImage:nil forState:UIControlStateNormal];
        
        
    }
    else if([arrliimage count]==1) {
		
        
        NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,    NSUserDomainMask, YES);
        NSString *path = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrliimage objectAtIndex:0]valueForKey:@"name"]];
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
        image = [[UIImage alloc] initWithData:imageData];
       
        //[btnimage1 setImage:image forState:UIControlStateNormal];
        [btnimage1 setTitle:@"" forState:UIControlStateNormal];
        
        
         [btnimage1 setImage:[self resizeImage:image width:btnimage1.frame.size.width height:btnimage1.frame.size.height] forState:UIControlStateNormal];
        [imageData release];
        [image release];
        
        
        
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            btnimage1.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        image=nil;

    }
	else if([arrliimage count]==2) {
		
		
		NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,    NSUserDomainMask, YES);
		NSString *path = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrliimage objectAtIndex:0]valueForKey:@"name"]];
		
		NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
		image = [[UIImage alloc] initWithData:imageData];
		//[btnimage1 setImage:image forState:UIControlStateNormal];
        [btnimage1 setImage:[self resizeImage:image width:btnimage1.frame.size.width height:btnimage1.frame.size.height] forState:UIControlStateNormal];
        
        [btnimage1 setTitle:@"" forState:UIControlStateNormal];
        
        
        
	[imageData release];
        
        [image release];
        
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            btnimage1.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        image=nil;
        
		
		NSString *path1 = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrliimage objectAtIndex:1]valueForKey:@"name"]];
        
        NSData *imageData1 = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path1]];
        image = [[UIImage alloc] initWithData:imageData1];
        //[btnimage2 setImage:image forState:UIControlStateNormal];
        [btnimage2 setTitle:@"" forState:UIControlStateNormal];
        [btnimage2 setImage:[self resizeImage:image width:btnimage1.frame.size.width height:btnimage1.frame.size.height] forState:UIControlStateNormal];
        
  [imageData1 release];
        [image release];
        
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            btnimage2.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        image=nil;

	}

	
    
    
    else if([arrliimage count]==3) {
		
		
		NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,    NSUserDomainMask, YES);
		NSString *path = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrliimage objectAtIndex:0]valueForKey:@"name"]];
		
		NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
		image = [[UIImage alloc] initWithData:imageData];
		//[btnimage1 setImage:image forState:UIControlStateNormal];
        [btnimage1 setImage:[self resizeImage:image width:btnimage1.frame.size.width height:btnimage1.frame.size.height] forState:UIControlStateNormal];
        
        [btnimage1 setTitle:@"" forState:UIControlStateNormal];
        
        
        
        [imageData release];
        
        [image release];
        
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            btnimage1.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        image=nil;
        
		
		NSString *path1 = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrliimage objectAtIndex:1]valueForKey:@"name"]];
        
        NSData *imageData1 = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path1]];
        image = [[UIImage alloc] initWithData:imageData1];
        //[btnimage2 setImage:image forState:UIControlStateNormal];
        [btnimage2 setTitle:@"" forState:UIControlStateNormal];
        [btnimage2 setImage:[self resizeImage:image width:btnimage2.frame.size.width height:btnimage2.frame.size.height] forState:UIControlStateNormal];
        
        [imageData1 release];
        [image release];
        
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            btnimage2.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        image=nil;
        
        
        
        
        
        
		NSString *path2 = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrliimage objectAtIndex:2]valueForKey:@"name"]];
        
        NSData *imageData2 = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path2]];
        image = [[UIImage alloc] initWithData:imageData2];
        //[btnimage2 setImage:image forState:UIControlStateNormal];
        [btnimage3 setTitle:@"" forState:UIControlStateNormal];
        [btnimage3 setImage:[self resizeImage:image width:btnimage3.frame.size.width height:btnimage3.frame.size.height] forState:UIControlStateNormal];
        
        [imageData1 release];
        [image release];
        
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            btnimage3.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        image=nil;

        
        
        
        
	}

    
    
    
    
    
    
    
    
    
    [tblservice reloadData];
    
    
    CGRect nameLabelRect2 = CGRectMake(210,tot,300,15);
    
    if(!label2)
    {
        label2 = [[UILabel alloc] initWithFrame:nameLabelRect2];
    }
    label2.backgroundColor=[UIColor clearColor];
    label2.textColor=[UIColor blackColor];
    
    
    [self.scrl addSubview:label2];

    [tblform reloadData];
	

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section    {


    return 44;
    

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view1;
    view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    CGRect nameLabelRect = CGRectMake(24,0,200,33);
	
	UILabel *label = [[UILabel alloc] initWithFrame:nameLabelRect];
    label.textColor=[UIColor darkGrayColor];
    
	label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont fontWithName:@"Arial" size:14.0];
    label.font=[UIFont boldSystemFontOfSize:14];
    
	    
	btnfrml = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnfrml setImage:[UIImage imageNamed:@"editbarbutton.png"] forState:UIControlStateNormal];
    
	
	btnfrml.frame = CGRectMake(199, 0, 53, 33);
	
if(tableView==tblservice)
{
  	label.text=@"Service Detail";
	
	[btnfrml addTarget:self action:@selector(select_service:) forControlEvents:UIControlEventTouchUpInside];


}
else{
    
    
   	label.text=@"Formula";
	
	[btnfrml addTarget:self action:@selector(select_formula:) forControlEvents:UIControlEventTouchUpInside];
    
	}
    [view1 addSubview:label];
	[label release];
    [view1 addSubview:btnfrml];

    return view1;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=TRUE;
	 
	
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	
   
}

-(void)showimage{
    
    NSString *s = [NSString stringWithFormat:@"where CID=%@ and Date='%@'",objappdel.idvalue,objappdel.strdate];

    [objdatabase ShowDataForImage:s];
    
    [arrliimage addObjectsFromArray:objdatabase.catchArray];
    
    
	
	
}



-(void)showdata{
    
    NSString *s = [NSString stringWithFormat:@"where CID=%@ and Date='%@'",objappdel.idvalue,objappdel.strdate];
    
    [objdatabase ShowDataForServiceDetails:s];
    [arrlistservice addObjectsFromArray:objdatabase.catchArray];
    
    
    
}



-(void)showformula{

    [objdatabase ShowFormullaDetail];
    [arrliformula addObjectsFromArray:objdatabase.catchArray];
    
	
	
	
	

}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

	return 40;
	
}

-(IBAction)back{
    
    if(objappdel.tabmainsub.selectedIndex==2)
    {
        
      }
    else{
        [self.navigationController popViewControllerAnimated:YES];
        
    
    }
    
}

-(IBAction)option:(id)sender{
	val=1;
	
	UIActionSheet *actionsheet = [[UIActionSheet alloc] 
								  initWithTitle:@""
								  delegate:self 
								  cancelButtonTitle:@"Cancel"
								  destructiveButtonTitle:nil 
								  otherButtonTitles:@"Repeat Service",@"Mark as Favourite", @"Delete Record", nil
								  ];
	[actionsheet showInView:self.parentViewController.tabBarController.view];
	[actionsheet release];
	
	
	
	
}

-(IBAction)select_service:(id)sender{
    
    
    CGRect newFrame = objappdel.tabmainsub.view.frame;
    newFrame.size.height += objappdel.tabmainsub.tabBar.frame.size.height;
    objappdel.tabmainsub.view.frame = newFrame;
if(objservice)
{

    [objservice release];

}
 objservice=[[Service_Listing alloc]initWithNibName:@"Service_Listing" bundle:nil];
    [self.navigationController pushViewController:objservice animated:YES];
    
    
   // objappdel.window.rootViewController = objappdel.editdire;
    


}
-(IBAction)select_formula:(id)sender{
	
    CGRect newFrame = objappdel.tabmainsub.view.frame;
    newFrame.size.height += objappdel.tabmainsub.tabBar.frame.size.height;
    objappdel.tabmainsub.view.frame = newFrame;
    
    if(objFormulla)
    {
    
        [objFormulla release];
        
    }
    
    if([arrliformula count]>0){
    
    objappdel.strupdateFormulla=[[arrliformula objectAtIndex:0]valueForKey:@"FID"];
		
        objappdel.stradicolor=[[arrliformula objectAtIndex:0]valueForKey:@"adicolor"];
		objappdel.strvolume=[[arrliformula objectAtIndex:0]valueForKey:@"volume"];
		objappdel.strtime=[[arrliformula objectAtIndex:0]valueForKey:@"time"];
  
        objappdel.strformula=[[arrliformula objectAtIndex:0]valueForKey:@"Formula_Type"];
		
        objappdel.strcolor=[[arrliformula objectAtIndex:0]valueForKey:@"color"];
        objappdel.strcolorform=[[arrliformula objectAtIndex:0]valueForKey:@"colorvalue"];
       
        
        
    }
    
    else{
    
        objappdel.strupdateFormulla=@"No";
        
    }
    
   objFormulla=[[Formulla alloc]initWithNibName:@"Formulla" bundle:nil];
    [self.navigationController pushViewController:objFormulla animated:YES];
    
    
	}

-(IBAction)Add_Photo:(id)sender{
	val=2;
	
	UIActionSheet *actionsheet=[[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo or Video",@"Choose from Library",nil];
	
	[actionsheet showInView:self.parentViewController.tabBarController.view];
	
	[actionsheet release];
}

- (void) actionSheet:(UIActionSheet *)actionsheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// After saving iamge, dismiss camera
	if(val==2)
	{
	if (buttonIndex == 0) {
        Camera=TRUE;

		UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
		imagePicker.delegate = self;
		if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        else {
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        imagePicker.editing=NO;
		
		[self presentModalViewController:imagePicker animated:YES];
		
		[imagePicker release];
	}        
	if(buttonIndex ==1) {
        Camera=FALSE;
		UIImagePickerController *picker;
		picker = [[UIImagePickerController alloc]init];
		picker.delegate = self;
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		picker.editing=NO;
		
		
		[self presentModalViewController:picker animated:YES];
	}	
	
	[self dismissModalViewControllerAnimated:YES];	

	}
	if(val==1){
		switch (buttonIndex) {
			case 0:{
				
                if(objRepeatService)
                {
                
                    [objRepeatService release];
                    
                }
                objRepeatService=[[Repeat_Service alloc]initWithNibName:@"Repeat_Service" bundle:nil];
                [self.navigationController pushViewController:objRepeatService animated:YES];
                   
                
            }
				
				break;
			case 1:
				//nslog(@"Mark as Favourite");
				[self updateFavorite];
                
				
				break;
			case 2:
            {
                NSString *i;
                i=[NSString stringWithFormat:@"'%@' AND CID=%@",lbldate.text,objappdel.idvalue];
                
                
                
                
                ////nslog(@"%d",i);
                [objdatabase DeleteData:@"Service_Detail" :@"Date" :i];
                //[self.navigationController  popViewControllerAnimated:YES];
                
                
                if(objappdel.tabmainsub.selectedIndex==2)
                {
                    CGRect newFrame = objappdel.tabmainsub.view.frame;
                    newFrame.size.height += objappdel.tabmainsub.tabBar.frame.size.height;
                    objappdel.tabmainsub.view.frame = newFrame;
                    [self.navigationController popViewControllerAnimated:YES];
               
                }
                else{
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    
                    
                }
                
                
            }   

				break;
				
			case 3:
				//nslog(@"Cancel" );
				break;
				
				
			default:
				break;
		}
		
	
	}

}
-(void)updateFavorite{
    
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		int ia;
		ia=[objappdel.idvalue intValue];
		//nslog(@"%d",ia);
		
		static sqlite3_stmt *statement;
		statement = nil;
		
		NSString *sql=[NSString stringWithFormat:@"update Service_Detail set Favorite='True' Where CID=%@ and Date='%@'",objappdel.idvalue,objappdel.strdate];
        
		
		if(sqlite3_prepare_v2(database, [sql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
		{
			
            
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	[picker dismissModalViewControllerAnimated:YES];
	imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	imageView.hidden = TRUE;
	//	NSString *date1,*date2;
	//	NSString *picname1,*picname;
	NSDate *date = [NSDate date];
	
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateFormat:@"MMddYYHHMMSS"];
	
    date1= [formatter stringFromDate:date];
	
    date2=[date1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
	picname1=[@"image" stringByAppendingString:date2];
	picname=[[picname1 stringByAppendingString:@".jpg"]retain];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *dataFilePath = [[documentsDirectory stringByAppendingPathComponent:picname] retain];
	
    [UIImageJPEGRepresentation(imageView.image, 1.0) writeToFile:dataFilePath atomically:YES];
    
    
   // [UIImagePNGRepresentation(imageView.image) writeToFile:dataFilePath atomically:YES ];
	//lbldate.text=date2;
	
[btnimage2 setImage: [self resizeImage:imageView.image width:btnimage2.frame.size.width height:btnimage2.frame.size.height] forState:UIControlStateNormal];
    //[btnimage2 setImage:imageView.image forState:UIControlStateNormal];
    
    [btnimage2 setTitle:@"" forState:UIControlStateNormal];
    
    
    if(Camera)
    {
        btnimage2.transform=CGAffineTransformMakeRotation(M_PI / 2);
        
        Library =TRUE;
        
        
    }
    else{
        if(Library)
        {
            btnimage2.transform=CGAffineTransformMakeRotation(M_PI * 2);
            
            
        }
        
    }
	
	//[objappdel createEditableCopyOfDatabaseIfNeeded];
	
	[dataFilePath release];
    
	[self saveimage];
	
}	

-(UIImage *)resizeImage:(UIImage *)image3 width:(int)width height:(int)height {
	
	CGImageRef imageRef = [image3 CGImage];
	CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
	
	//if (alphaInfo == kCGImageAlphaNone)
    alphaInfo = kCGImageAlphaNoneSkipLast;
	
	CGContextRef bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef), 4 * width, CGImageGetColorSpace(imageRef), alphaInfo);
	CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
	CGImageRef ref = CGBitmapContextCreateImage(bitmap);
	UIImage *result = [UIImage imageWithCGImage:ref];
	
	CGContextRelease(bitmap);
	CGImageRelease(ref);
	
	return result;	
}

-(void)saveimage{
//    NSDate *now = [NSDate date];
//    
//    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",now];
//    NSArray *arrdate = [strDate componentsSeparatedByString:@" "];
//    NSString *str11;
//    str11 = [arrdate objectAtIndex:0];

    [objdatabase InsertIntoImage:picname :objappdel.strdate];
	
	
}




-(IBAction)View_Photo:(id)sender{
	
    [self.navigationController presentModalViewController:objappdel.enlargeimage animated:YES];
    
    
    
    
    //objappdel.window.rootViewController = objappdel.enlargeimage;
    

}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView==tblservice)
	{
		return [arrlistservice count]+1;
	
	}
	if(tableView==tblform){
		return [arr count];
		
	}
    return  7;
    
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  	
	
	static NSString *cellIdentifier = @"MyIdentifire";
//    
//    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,300, 40)];
//    [cellImg setImage:[UIImage imageNamed:@"DireCellImage.png"]];
//    
    
    
	TableCell *cell = (TableCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if(cell == nil)
	{
		[[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
		cell=self.tblViewCell;
		self.tblViewCell=nil;
        //[cell.contentView addSubview:cellImg];  
        
        
        
        
    }  
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
  //  cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DireCellImage.png"]] autorelease];
   	
    cell.MyLbl1.font=[UIFont fontWithName:@"Arial" size:14.0];
    cell.MyLbl1.font=[UIFont boldSystemFontOfSize:14];
    
    cell.myLbl2.font=[UIFont fontWithName:@"Arial" size:14.0];
    cell.myLbl2.font=[UIFont boldSystemFontOfSize:14];
    
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:14.0];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
	if(tableView==tblform)
		
	{
		
        
        [cell.textLabel setBackgroundColor:[UIColor clearColor]];
        
		
	cell.MyLbl1.text=[arr objectAtIndex:indexPath.row];
        cell.myLbl2.textColor=[UIColor blueColor];
        
		if([arrliformula count]==0){
		}else {
			
		
		
			
			if (indexPath.row==0) {
		str=[[arrliformula objectAtIndex:0]valueForKey:@"color"];
		str1=[[arrliformula objectAtIndex:0]valueForKey:@"colorvalue"];
		str2=[[arrliformula objectAtIndex:0]valueForKey:@"adicolor"];
		str3=[[arrliformula objectAtIndex:0]valueForKey:@"volume"];
		str4=[[arrliformula objectAtIndex:0]valueForKey:@"time"];

		lblvalue= (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
		
		cell.myLbl2.text=[[arrliformula objectAtIndex:0]valueForKey:@"Formula_Type"];
                
		
			}
		
		}
		
		
			}
	if(indexPath.row==1)
	{
        cell.myLbl2.text=str;
        
		
		
	}
	
	
	if(indexPath.row==2)
	{
        cell.myLbl2.text=str1;
		
		
	}
	if(indexPath.row==3)
	{
        cell.myLbl2.text=str2;
		
		
	}
	if(indexPath.row==4)
	{
		
        cell.myLbl2.text=str3;
        
	}
	if(indexPath.row==5)
	{
		
        cell.myLbl2.text=str4;
        
	}
	
		
	
	


	if(tableView==tblservice)
		{	
            cell.myLbl2.textColor=[UIColor blackColor];
            

			            
            
            if(indexPath.row>=[arrlistservice count])
            {
            cell.MyLbl1.text=@"TOTAL";
                cell.myLbl2.text=label2.text;
                
                cell.backgroundColor=[UIColor lightGrayColor];
                
                
            }
            else{
            if([arrlistservice count]==0){}
            else {
				
                cell.MyLbl1.text=[[arrlistservice objectAtIndex:indexPath.row]valueForKey:@"name"];
                cell.myLbl2.text=[NSString stringWithFormat:@"%@",[[arrlistservice objectAtIndex:indexPath.row]valueForKey:@"price"]];
                
                
                total=(total+[cell.myLbl2.text intValue]);
                cell.myLbl2.text=[NSString stringWithFormat:@"$%@",[[arrlistservice objectAtIndex:indexPath.row]valueForKey:@"price"]];
                
                
                label2.text=[NSString stringWithFormat:@"$%d",total];
                label2.font=[UIFont fontWithName:@"Arial" size:14.0];
                label2.font=[UIFont boldSystemFontOfSize:14];
                label2.hidden=TRUE;
                
                //////nslog(@"%d",total);
                
                
                
            }
            
            }   

            

	}
    
    
	return cell;
      
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
   
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
    [objdatabase release];
    
    [arrlistservice release];
    
    [arrliformula release];
    
    [arrliimage release];
    
	
}


@end
