// C++ code
//
void setup()
{
  pinMode(A0, INPUT);
  Serial.begin(9600);

  pinMode(A1, INPUT);
}

void loop()
{
  Serial.println(analogRead(A0));
  Serial.println(analogRead(A1));
  delay(30); // Delay a little bit to improve simulation performance
}
