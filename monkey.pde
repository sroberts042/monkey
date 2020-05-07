//CS3451 Project 0 - Base Code
//author - Alex Clegg

//Global variable declarations:
//Note: these are visible to any method/class/object in the program
float time = 0; //this will increment in draw
boolean debug = false; //if true, all vector math test will print exact operations as well as success and failure. Use this to debug your functions.
int happiness = 20;
float brownShade = 0.545098;
int eyeSize = 20;
int mouthWidth = 50;
//This function is called once by Processing when the program is first run
void setup(){
  
  //set the size of the window in pixels
  //Note: these values can be retrieved at any time via the system variables height and width
  size(400, 400);
  
  //set the color mode to RGB, with max value 1.0 (0-1 scale)
  colorMode(RGB, 1);
  
  //clear the screen to black
  background(color(0,0,0));
  
  //test your vector math functions
  testVectorMath();
}

//This function is a while loop called by Processing once every 1/60th of a second
//Note: the FrameRate(float f) function sets the number of times per second draw will be called
void draw(){
  //clear the screen back to black
  background(0, 0.807843, 0.819608);
  
  //change the color of future objects interiors
  fill(color(brownShade, 0.270588, 0.0745098)); //darker brown
  stroke(color(brownShade, 0.270588, 0.0745098)); //darker brown
  
  //ears/body background
  ellipse(100, 150, 150, 150);
  ellipse(300, 150, 150, 150);
  ellipse(200, 500, 200, 500);
  
  //ears/body front
  fill(color(0.803922, 0.521569, 0.247059)); //lighter brown
  stroke(color(0.803922, 0.521569, 0.247059)); //lighter brown
  ellipse(100, 150, 100, 100);
  ellipse(300, 150, 100, 100);
  ellipse(200, 500, 150, 450);
  
  //draw face 
  fill(color(brownShade, 0.270588, 0.0745098)); //darker brown
  stroke(color(brownShade, 0.270588, 0.0745098)); //darker brown
  ellipse(200, 200, 200, 200);
  
  fill(color(0.803922, 0.521569, 0.247059)); //lighter brown
  stroke(color(0.803922, 0.521569, 0.247059)); //lighter brown
  ellipse(170, 180, 110, 110);
  ellipse(230, 180, 110, 110);
  ellipse(200, 220, 130, 130);
  
  fill(color(0, 0, 0)); //black
  stroke(color(0, 0, 0)); //black
  
  ellipse(170, 200, eyeSize, eyeSize);
  ellipse(230, 200, eyeSize, eyeSize);
  triangle(190, 220, 210, 220, 200, 230);
  
  noFill();
  strokeWeight(2);
  arc(200, 250, mouthWidth, happiness, 0, PI);

}

//called once when a mouse button is clicked
void mousePressed(){
  eyeSize += 15;
  mouthWidth -= 30;
}

//called once when a mouse button is released
void mouseReleased(){
  eyeSize -= 15;
  mouthWidth += 30;
}

//called every time the mouse is moved when a mouse buttong is held down
void mouseDragged(){
  if (mouseX > pmouseX) brownShade += 0.01;
  else brownShade -= 0.01;
//  println("  Mouse dragged in direction: (" + (mouseX-pmouseX) + "," + (mouseY-pmouseY) + ")." );
}

//called once when any key is pressed.
//the key variables holds the key information
void keyPressed(){
  
  if(key == CODED){ //this is true for arrow keys, SHIFT, CTRL and other special non-ascii keys
    if(keyCode == SHIFT) //you can check coded keys against defined processing constants
      happiness += 2;
      if(happiness > 50) happiness = 50;
      
  }else{
    if(key == 'w'){
      happiness = 20;
      brownShade = 0.545098;
    }else if(key == ' '){
      happiness -= 2;
      if (happiness < 0) happiness = 0;
    }
  }
}

//this function will test the vector math code you implement in the math tab
void testVectorMath(){
  println("Vector Math Test:");
  Vec2 A2 = new Vec2(3.14,2.1);
  Vec2 B2 = new Vec2(0.56, -1.3);
  Vec2 C2 = new Vec2(0.56, -1.3);
  Vec2 Z2 = new Vec2(0.0,0.0);
  if(debug){
    println("  A2: " + A2.toString());
    println("  B2: " + B2.toString());
    println("  C2: " + C2.toString());
    println("  Z2: " + Z2.toString());
    println();
  }
  
  println("Test Vec2 functions");
  //dot
  float d = A2.dot(B2);
  if(debug) println("  A2.dot(B2): " + d);
  if(d != -0.9715997){ println("  dot() test FAILED"); }
  else{ println("  dot() test PASSED");}
  //norm
  float n = A2.norm();
  if(debug) println("  A2 magnitude: " + n);
  if(n != 3.7775123){ println("  norm() test FAILED"); }
  else{ println("  norm() test PASSED");}
  //sqnorm
  n = A2.sqNorm();
  if(debug) println("  A2 squared magnitude: " + n);
  if(n != 14.2696){ println("  sqNorm() test FAILED"); }
  else{ println("  sqNnorm() test PASSED");}
  //normalize
  A2.normalize();
  Vec2 T = new Vec2(0.83123493,0.5559214);
  if(debug) println("  A2 normalized: " + A2.toString());
  if(!A2.equalTo(T)){ println("  normalize() test FAILED"); }
  else{ println("  normalize() test PASSED");}
  //normalized
  if(debug) println("  B2 normalized: " + B2.normalized().toString());
  T = new Vec2(0.39562392,-0.9184126);
  if(!B2.normalized().equalTo(T)){ println("  normalized() test 1 FAILED"); }
  else{ println("  normalized() test 1 PASSED");}
  if(debug) println("  Z2 normalized: " + Z2.normalized().toString());
  if(!Z2.normalized().equalTo(Z2)){ println("  normalized() test 2 FAILED"); }
  else{ println("  normalized() test 2 PASSED");}
  println();
  println();
  
  //Vec3 setup
  Vec3 A3 = new Vec3(3.14,2.1, -0.05);
  Vec3 B3 = new Vec3(0.56, -1.3, 10.1);
  Vec3 C3 = new Vec3(0.56, -1.3, 10.1);
  Vec3 Z3 = new Vec3(0,0,0);
  if(debug){
    println("  A3: " + A3.toString());
    println("  B3: " + B3.toString());
    println("  C3: " + C3.toString());
    println();
  }
  
  println("Test Vec3 functions");
  //dot
  d = A3.dot(B3);
  if(debug) println("  A3.dot(B3): " + d);
  if(d != -1.4765997){ println("  dot() test FAILED"); }
  else{ println("  dot() test PASSED");}
  //cross
  Vec3 R3 = A3.cross(B3);
  if(debug) println("  A3.cross(B3): " + R3.toString());
  Vec3 T3 = new Vec3(21.144999,-31.742002,-5.258);
  if(!R3.equalTo(T3)){ println("  cross() test FAILED"); }
  else{ println("  cross() test PASSED");}
  
  //norm
  n = A3.norm();
  if(debug) println("  A3 magnitude: " + n);
  if(n != 3.7778432){ println("  norm() test FAILED"); }
  else{ println("  norm() test PASSED");}
  //sqnorm
  n = A3.sqNorm();
  if(debug) println("  A3 squared magnitude: " + n);
  if(n != 14.2720995){ println("  sqNorm() test FAILED"); }
  else{ println("  sqNnorm() test PASSED");}
  //normalize
  A3.normalize();
  T3 = new Vec3(0.8311621,0.5558727,-0.013235065);
  if(debug) println("  A3 normalized: " + A3.toString());
  if(!A3.equalTo(T3)){ println("  normalize() test FAILED"); }
  else{ println("  normalize() test PASSED");}
  //normalized
  if(debug) println("  B3 normalized: " + B3.normalized().toString());
  T3 = new Vec3(0.054908924,-0.12746714,0.9903217);
  if(!B3.normalized().equalTo(T3)){ println("  normalized() test 1 FAILED"); }
  else{ println("  normalized() test 1 PASSED");}
  if(debug) println("  Z3 normalized: " + Z3.normalized().toString());
  if(!Z3.normalized().equalTo(Z3)){ println("  normalized() test 2 FAILED"); }
  else{ println("  normalized() test 2 PASSED");}
  println();
  println();
  
  Mat3 M1 = new Mat3();
  Mat3 M2 = new Mat3(1.1,0.4,-6.4,3.76,-6.32,0.7,-9.123,-4.78,0);
  Mat3 M3 = new Mat3(3.14,-3.54,0,-0.321,0.543,0,0.47,-122,0.23);
  if(debug){
    println("  M1:");
    println(M1.toString());
    println("  M2:");
    println(M2.toString());
    println("  M3:");
    println(M3.toString());
  }
  
  println("Test Mat3 functions");
  //transpose
  Mat3 MT3 = new Mat3(1.1,3.76,-9.123,0.4,-6.32,-4.78,-6.4,0.7,0.0);
  if(debug){
    println("  M2.tranpose():");
    println(M2.transpose().toString());
  }
  if(!M2.transpose().equalTo(MT3)){println("  transpose() test FAILED"); }
  else{println("  transpose() test PASSED"); }
  
  //matrix multiply
  MT3 = new Mat3(0.3176,777.12317,-1.472,14.16412,-102.142166,0.161,-27.111841,29.699883,0.0);
  if(debug){
    println("  M2.mult(M3):");
    println(M2.mult(M3).toString());
  }
  if(!M2.mult(M3).equalTo(MT3)){println("  (Matrix) mult() test FAILED"); }
  else{println("  (Matrix) mult() test PASSED"); }
  //vector multiply
  T3 = new Vec3(-64.54401,17.3916,1.1051202);
  if(debug) println("  M2.mult(B3): " + M2.mult(B3).toString());
  if(!M2.mult(B3).equalTo(T3)){println("  (Vec3) mult() test FAILED"); }
  else{println("  (Vec3) mult() test PASSED"); }
  println();
  println();
  
  Mat4 M4 = new Mat4();
  Mat4 M5 = new Mat4(-4.24,4.77,-9.31,9.03,-0.38,3.86,2.68,-5.93,5.7,-1.25,-8.34,-7.5,-1.59,-2.87,-1.85,-2.25);
  Mat4 M6 = new Mat4(6.36,-5.04,-6.86,9.94,-4.98,-7.86,-2.89,-9.89,-6.73,-8.19,4.14,-9.72,0.46,-7.77,-7.2,-5.8);
  if(debug){
    println("  M4:");
    println(M4.toString());
    println("  M5:");
    println(M5.toString());
    println("  M6:");
    println(M6.toString());
  }
  
  println("Test Mat4 functions");
  //transpose
  Mat4 MT4 = new Mat4(-4.24,-0.38,5.7,-1.59,4.77,3.86,-1.25,-2.87,-9.31,2.68,-8.34,-1.85,9.03,-5.93,-7.5,-2.25);
  if(debug){
    println("  M5.tranpose():");
    println(M5.transpose().toString());
  }
  if(!M5.transpose().equalTo(MT4)){println("  transpose() test FAILED"); }
  else{println("  transpose() test PASSED"); }
  
  //matrix multiply
  MT4 = new Mat4(16.089104,-10.0368,-88.2583,-51.201683,-42.403797,-4.2975006,45.2426,-33.608196,95.1552,107.6766,-16.017105,193.5853,15.595699,63.205803,27.742699,43.611702);
  if(debug){
    println("  M5.mult(M6):");
    println(M5.mult(M6).toString());
  }
  if(!M5.mult(M6).equalTo(MT4)){println("  (Matrix) mult() test FAILED"); }
  else{println("  (Matrix) mult() test PASSED"); }
  //vector multiply
  T3 = new Vec3(5.1715665,-0.8791227,4.8035297);
  if(debug) println("  M5.mult(B3): " + M5.mult(B3).toString());
  if(!M5.mult(B3).equalTo(T3)){println("  (Vec3) mult() test FAILED"); }
  else{println("  (Vec3) mult() test PASSED"); }
  println();
  println();
 
}


