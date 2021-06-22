import processing.serial.*; 

Serial myPort;                   
Float ygrasia;                    
PImage prasino1,prasino2,xero1,xero2; 
int metritis=0;

void setup()                     
{
 size(800,500);                   //ανοίγει ένα παράθυρο με πλάτος 800 και ύψος 500                           
 myPort  =  new Serial (this, "COM4",  9600);   //όπως καθορίζονται από το arduino            
 myPort.bufferUntil('\n');                           
 prasino1=loadImage("prasino1.png");       
 prasino2=loadImage("prasino2.png");  
 xero1=loadImage("xero1.png");
 xero2=loadImage("xero2.png");
}

void draw()                              
{
 
  if ( myPort.available() > 0)     
  {    
    if (ygrasia<400)  {          //ξερό φυτό
       if (metritis % 2==0) {    //ζυγή γραμμή    
         image(xero2,400,0);     
       }                                   
       else {                    //μονή γραμμή
         image(xero1,0,0);  
       } 
    }                    
     else {                      //πράσινο φυτό          
      if (metritis % 2==0) {     //ζυγή γραμμή
         image(prasino2,400,0); 
       }                                   
       else {                    //μονή γραμμή
         image(prasino1,0,0); 
       }       
    }
  } 
}
 
void serialEvent (Serial myPort)
{
 ygrasia = float(myPort.readStringUntil('\n'));  //διαβάζεται o αριθμός και αποθηκεύεται στην ygrasia          
 metritis=metritis+1;            // ο μετρητής αυξάνεται κατά 1

}                                                
