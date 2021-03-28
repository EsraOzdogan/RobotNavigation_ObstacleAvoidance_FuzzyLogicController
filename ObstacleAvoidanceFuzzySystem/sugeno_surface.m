%Sugeno surface

global mu_input

lowerbound_angle=0; upperbound_angle=40;
lowerbound_distance=0; upperbound_distance=20;
lowerbound_speed=0; upperbound_speed=100;

X=lowerbound_angle:upperbound_angle;
Y=lowerbound_distance:upperbound_distance;
%angle_value=15;
%distance_value=15;


c1=8; c2=25; c3=45; c4=60; c5=75; c6=91;%c7=60; c8=45; c9=8; 

for i=1:size(Y,2)
    for j=1:size(X,2)
        
    total_weight = 0;
    
angle_value=X(j); distance_value=Y(i);


%angle membership inputs

trapezoidFISInput(lowerbound_angle,0, 0, 10, 20,upperbound_angle,angle_value);%small graphic
mu_x_small = mu_input;

triangleFISInput(lowerbound_angle,10, 20, 30,upperbound_angle,angle_value); %medium graphic
mu_x_medium = mu_input;

trapezoidFISInput(lowerbound_angle,25, 35, 40, 40,upperbound_angle,angle_value);% large graphic
mu_x_large = mu_input;


%distance membership functions
trapezoidFISInput(lowerbound_distance,0, 0, 6, 8,upperbound_distance,distance_value);% near graphic
mu_y_near = mu_input;
triangleFISInput(lowerbound_distance,5, 0, 15,upperbound_distance,distance_value);% far graphic
mu_y_far = mu_input;
trapezoidFISInput(lowerbound_distance,12, 15, 20, 20,upperbound_distance,distance_value);% very_far graphic
mu_y_very_far = mu_input;



z1=c1; z2=c2; z3=c3; z4=c4; z5=c5; z6=c6;
%z7=c7;z8=c8;z9=c9;



mu_rule1 = min (mu_x_small,mu_y_near);
mu_rule2 = min (mu_x_small,mu_y_far);
mu_rule3 = min (mu_x_small,mu_y_very_far);

mu_rule4 = min (mu_x_medium,mu_y_near);
mu_rule5 = min (mu_x_medium,mu_y_far);
mu_rule6 = min (mu_x_medium,mu_y_very_far);

mu_rule7 = min (mu_x_large,mu_y_near);
mu_rule8 = min (mu_x_large,mu_y_far);
mu_rule9 = min (mu_x_large,mu_y_very_far);


mu_s1 = mu_rule1 * z1;
mu_s2 = mu_rule2 * z2;
mu_s3 = mu_rule3 * z4;

mu_s4 = mu_rule4 * z1;
mu_s5 = mu_rule5 * z3;
mu_s6 = mu_rule6 * z5;

mu_s7 = mu_rule7 * z3;
mu_s8 = mu_rule8 * z5;
mu_s9 = mu_rule9 * z6;

%Sonuçların ağırlıklı toplamı

SAT=mu_s1+mu_s2+mu_s3+mu_s4+mu_s5+mu_s6+mu_s7+mu_s8+mu_s9;
%Durulastırma

total_weight = mu_rule1+mu_rule2+mu_rule3+mu_rule4+mu_rule5+mu_rule6+mu_rule7+mu_rule8+mu_rule9;

if total_weight == 0 
    'Total area is zero in the Center of Weight method';
end


z(i,j)=SAT/total_weight;

    end %j
end %i

%[X,Y] = meshgrid(X,Y);
figure
surf(X,Y,z);
ylabel('Distance');
xlabel('Angle');
zlabel('Speed');





