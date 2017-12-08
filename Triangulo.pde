interface figura{
void mostrar();
}

class triangulo implements figura{
float x,y,l,xp1,deltax,deltay;

triangulo(float x_, float y_, float l_){
x=x_;
y=y_;
l=l_;

}
  
  void mostrar(){
            
  beginShape();
  vertex(x,y);
  translate(mouseX,mouseY);
  xp1=x+l;
  vertex(xp1,y);
  for(float a=radians(0) ; a<=radians(60) ; a=a+radians(60)){
     
     deltax=x+l*cos(a);
     deltay=y-l*sin(a);
     
   vertex(deltax,deltay);
   }  
  endShape(CLOSE);
  }//fin vertice 
}//fin clase