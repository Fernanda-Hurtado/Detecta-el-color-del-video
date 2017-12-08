//import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
//OpenCV opencv;
figura triang;
Movie movie;

ArrayList <figura> figuras;
color Color;
float threshold=25;

 void setup(){
   
   size(400,300);
   figuras = new ArrayList<figura> ();
   figuras.add(triang);
   
  triang=new triangulo(mouseX-15,mouseY+30*sqrt(3)/4,30);
   
   String[] cameras=Capture.list();
   printArray(cameras);
   //video=new Capture(this, cameras[3]);
   //video.start();
   movie = new Movie(this, "video1_4.mp4");
   movie.loop();
   Color=color(255,0,0);
 }//cierre setup
 
 void movieEvent(Movie m){m.read();}

 
 void draw(){
   
  // video.loadPixels();
   image(movie,0,0);
     
   threshold = map(mouseX,0,width,0,10);

   int count=0;   
   
   for (int x=0; x<movie.width;x++){
     for(int y=0; y<movie.height; y++){
       int loc= x+y*movie.width;
       color currentColor=movie.pixels[loc];
       float r1=red(currentColor);
       float g1=green(currentColor);
       float b1=blue(currentColor);
       float r2=red(Color);
       float g2=green(Color);
       float b2=blue(Color);
       
       float d=dist(r1,g1,b1,r2,g2,b2);
       
       if(d < threshold){
         noStroke();
         strokeWeight(1);
         point(x,y);
        count++;
       }//cierre if threshold
     }// cierre for y
   }//cierre for x
   
   if(count>5){     
     fill(Color);
     stroke(0); 
 triang.mostrar();
   }
 }//cierre draw

 