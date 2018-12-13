boolean[][] showPixel = new boolean[640][360];

void setup()
{
  size(640,360);
  for (float y = -1.8; y < 1.8; y+=0.01)
  {
    for (float x = -3.2; x < 3.2; x+=0.01)
    {
      float a = 0;
      float b = 0;
      float c1 = x;
      float c2 = y;
      float [] calcOut; 
      boolean setPoint = true;
      
      for (float i = 0; i < 100; i++)
      {
        calcOut = calculate(a,b,c1,c2);
        a = calcOut[0];
        b = calcOut[1];
        if (a > 20 || a < -20 || b > 20 || b < -20)
        {
          setPoint = false;
          break;
        }
      }
      showPixel[int(100*x+320)][int(100*y+180)] = setPoint;
    }
  }
}
void draw()
{
  background(255);
  for (int i = 0; i < 320; i++)
  {
    for (int j = 0; j < 640; j++)
    {
      if (showPixel[j][i] == true)
      {
        stroke(0);
      }
      else
      {
        stroke(255);
      }
      point(j,i);
    }
  }
}
float[]calculate (float a, float b, float c1, float c2)
{
  float[] array = new float[2];
  array[0] = sq(a)-sq(b)+c1;
  array[1] = 2*a*b+c2;
  return array;
}
