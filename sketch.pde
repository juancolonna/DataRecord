//The MIT License (MIT)
//
//Copyright (c) 2015 Juan Gabriel Colonna (UFAM)
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import ketai.sensors.*;

KetaiSensor sensor;
float proximity, light;
float GyroscopeX, GyroscopeY, GyroscopeZ;
float AccelerometerX, AccelerometerY, AccelerometerZ; 
float OrientationX, OrientationY, OrientationZ;
float Pitch, Roll, Yaw;
float GravityX, GravityY, GravityZ;
float linearAccelerometerX, linearAccelerometerY, linearAccelerometerZ;
float RotationX, RotationY, RotationZ; 
float magneticFieldX, magneticFieldY, magneticFieldZ;
long time1, time2, time3, time4, time5, time6, time7, time8, time9;
String FileID;
PrintWriter output;
float data = 0.0;
float mu = 0.0;

void setup()
{
  sensor = new KetaiSensor(this);
  sensor.stop();
  sensor.list();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(28);
  frameRate(12);
}

void draw()
{
  background(78, 93, 75);
  text("Accelerometer :" + "\n" 
    + "x: " + nfp(AccelerometerX,1,2) + "\n" 
    + "y: " + nfp(AccelerometerY,1,2) + "\n" 
    + "z: " + nfp(AccelerometerZ,1,2) + "\n"
    + "LinearAccelerometer :" + "\n" 
    + "x: " + nfp(linearAccelerometerX,1,2) + "\n" 
    + "y: " + nfp(linearAccelerometerY,1,2) + "\n" 
    + "z: " + nfp(linearAccelerometerZ,1,2) + "\n"
    + "Orientation :" + "\n"
    + "pitch: " + nfp(Pitch,1,2) + "\n"
    + "roll: " + nfp(Roll,1,2) + "\n"
    + "yaw: " + nfp(Yaw,1,2) + "\n"
    + "Gyroscope :" + "\n"
    + "x: " + nfp(GyroscopeX,1,2) + "\n"
    + "y: " + nfp(GyroscopeY,1,2) + "\n"
    + "z: " + nfp(GyroscopeZ,1,2) + "\n"
    + "Gravity :" + "\n"
    + "x: " + nfp(GravityX,1,2) + "\n"
    + "y: " + nfp(GravityY,1,2) + "\n"
    + "z: " + nfp(GravityZ,1,2) + "\n"
    + "Rotation :" + "\n"
    + "x: " + nfp(RotationX,1,2) + "\n"
    + "y: " + nfp(RotationY,1,2) + "\n"
    + "z: " + nfp(RotationZ,1,2) + "\n"
    + "MagneticField :" + "\n" 
    + "x: " + nfp(magneticFieldX,1,2) + "\n"
    + "y: " + nfp(magneticFieldY,1,2) + "\n" 
    + "z: " + nfp(magneticFieldZ,1,2) + "\n"
    + "Light Sensor : " + nfp(light,1,2) + "\n" 
    + "Proximity Sensor : " + proximity + "\n"
    + "Time : " + time1 + "\n"
    , 20, 0, width, height);
}

void onAccelerometerEvent(float x, float y, float z, long t, int b)
{
  AccelerometerX = x;
  AccelerometerY = y;
  AccelerometerZ = z;
  time1 = t;
  
  if(sensor.isStarted() && proximity == 3.0){
     output.println("Accel," + time1 + "," + nfp(AccelerometerX,1,2) + "," + nfp(AccelerometerY,1,2) + "," + nfp(AccelerometerZ,1,2));
   }
} 

void onLinearAccelerationEvent(float x, float y, float z, long t, int b)
{
  linearAccelerometerX = x;
  linearAccelerometerY = y;
  linearAccelerometerZ = z;
  time2 = t;
  
  if(sensor.isStarted() && proximity == 3.0){
    output.println("linearAccel," + time2 + "," +  nfp(linearAccelerometerX,1,2) + "," +  nfp(linearAccelerometerY,1,2) + "," +  nfp(linearAccelerometerZ,1,2) );
  }
} 

void onOrientationEvent(float x, float y, float z, long t, int b)
{
  Pitch = x;
  Roll = y;
  Yaw = z;
  time3 = t;
  
  //data = Yaw;
  //data += 0.2 * ( Yaw - data);
  //mu = 0.8*mu + ((1-0.8)*data);
  //data -= mu;
  
  if(sensor.isStarted() && proximity == 3.0){
    output.println("Orientation," + time3 + "," +  nfp(Pitch,1,2) + "," +  nfp(Roll,1,2) + "," +  nfp(Yaw,1,2) );
  }
}

void onGyroscopeEvent(float x, float y, float z, long t, int b)
{
  GyroscopeX = x;
  GyroscopeY = y;
  GyroscopeZ = z;
  time4 = t;
  
  if(sensor.isStarted() && proximity == 3.0){
     output.println("Gyroscope," + time4 + "," +  nfp(GyroscopeX,1,2) + "," + nfp(GyroscopeY,1,2) + "," +  nfp(GyroscopeZ,1,2) );
  }
}

void onGravityEvent(float x, float y, float z, long t, int b)
{
  GravityX = x;
  GravityY = y;
  GravityZ = z;
  time5 = t;
  
  if(sensor.isStarted() && proximity == 3.0){
    output.println("Gravity," + time5 + "," +  nfp(GravityX,1,2) + "," +  nfp(GravityY,1,2) + "," +  nfp(GravityZ,1,2) );
  }
}

void onRotationVectorEvent( float x, float y, float z, long t, int b)
{
  RotationX = x;
  RotationY = y;
  RotationZ = z;
  time6 = t;
  
  if(sensor.isStarted() && proximity == 3.0){
    output.println("Rotation," + time6 + "," +  nfp(RotationX,1,2) + "," +  nfp(RotationY,1,2) + "," +  nfp(RotationZ,1,2) );
  }
}

void onMagneticFieldEvent(float x, float y, float z, long t, int b)
{
  magneticFieldX = x;
  magneticFieldY = y;
  magneticFieldZ = z;
  time7 = t;
   
  if(sensor.isStarted() && proximity == 3.0){
    output.println("magneticField," + time7 + "," +  nfp(magneticFieldX,1,2) + "," +  nfp(magneticFieldY,1,2) + "," +  nfp(magneticFieldZ,1,2) );
  }
}

void onLightEvent(float l, long t, int b)
{
   light = l;
   time8 = t;
   
   if(sensor.isStarted() && proximity == 3.0){
     output.println("Light," + time8 + "," +  nfp(light,1,2));
   }
}

void onProximityEvent(float v, long t, int b)
{
  proximity = v;
  time9 = t;
  
  if(sensor.isStarted()){
    output.println("Prox," + time9 + "," +  nfp(proximity,1,1) );
  }
}

public void mousePressed() {     
  if (sensor.isStarted()){
    sensor.stop();
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
  }
  else{
    FileID = "/sdcard/SensorLog/" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".csv";
    output = createWriter(FileID);
    sensor.start();
  }
  //println(day);
  //println("KetaiSensor isStarted: " + sensor.isStarted());
}

void keyPressed() {
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  exit();  // Stops the program
}

float toFixed(float x, float e){
  return round(x*pow(10.0,e))/pow(10.0,e);
}
