model lab06s
  parameter Real alpha = 0.01; //коэффициент заболеваемости 
  parameter Real beta = 0.02; //коэффициенты выздоровления
  parameter Real N = 12200;//общая численность популяции острова
  parameter Real I0 = 130;//количество инфицированных особей в начальный момент времени
  parameter Real R0 = 53;//количество здоровых особей с иммунитетом в начальный момент времени
  parameter Real S0 = N-I0-R0;//количество восприимчивых к болезни особей в начальный момент времени
  Real I(start=I0);//инфицированные особи
  Real R(start=R0);//здоровые особи с иммунитетом
  Real S(start=S0);//восприимчивые к болезни особи
equation
  der(S) = -alpha*S;
  der(I) = alpha*S-beta*I;
  der(R) = beta*I;
end lab06s;
