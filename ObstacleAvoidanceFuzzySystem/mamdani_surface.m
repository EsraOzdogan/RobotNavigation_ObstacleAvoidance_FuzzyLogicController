%Mamdani surface

global mu_input OUTPUT mu_OUTPUT;

lowerbound_angle=0; upperbound_angle=40;
lowerbound_distance=0; upperbound_distance=20;
lowerbound_speed=0; upperbound_speed=100;

X=lowerbound_angle:upperbound_angle;
Y=lowerbound_distance:upperbound_distance;

%angle_value=22;
%distance_value=10;

for i=1:size(Y,2)
    for j=1:size(X,2)
        
    total_area = 0;
         
    
angle_value=X(j);distance_value=Y(i);

        
%angle membership functions
trapezoidFISInput(lowerbound_angle,0, 0, 10, 20,upperbound_angle,angle_value);%small graphic
mu_x_small = mu_input;
triangleFISInput(lowerbound_angle,10, 20, 30,upperbound_angle,angle_value); %medium graphic
mu_x_medium = mu_input;
trapezoidFISInput(lowerbound_angle,25, 35, 40, 40,upperbound_angle,angle_value);% large graphic
mu_x_large = mu_input;



%distance membership functions
trapezoidFISInput(lowerbound_distance,0, 0, 6, 8,upperbound_distance,distance_value);% near graphic
mu_y_near = mu_input;
triangleFISInput(lowerbound_distance,5, 10, 15,upperbound_distance,distance_value);% far graphic
mu_y_far = mu_input;
trapezoidFISInput(lowerbound_distance,12, 15, 20, 20,upperbound_distance,distance_value);% very_far graphic
mu_y_very_far = mu_input;



%speed membership functions 
trapezoidFISOutput(lowerbound_speed,0, 0, 10, 20,upperbound_speed);% very_slow graphic
Z=OUTPUT; mu_very_slow = mu_OUTPUT; 
triangleFISOutput(lowerbound_speed,10, 25, 40,upperbound_speed);% slow graphic
mu_slow = mu_OUTPUT;
triangleFISOutput(lowerbound_speed,30, 45, 60,upperbound_speed);% fast graphic
mu_fast = mu_OUTPUT;
triangleFISOutput(lowerbound_speed,50, 60, 70,upperbound_speed);% fast_fast graphic
mu_fast_fast = mu_OUTPUT;
triangleFISOutput(lowerbound_speed,65, 75, 90,upperbound_speed);% very_fast graphic
mu_very_fast = mu_OUTPUT;
trapezoidFISOutput(lowerbound_speed,75, 90, 100, 100,upperbound_speed);% top_speed graphic
mu_top_speed = mu_OUTPUT;



%Rules
mu_rule1 = min (mu_x_small,mu_y_near);
mu_rule2 = min (mu_x_small,mu_y_far);
mu_rule3 = min (mu_x_small,mu_y_very_far);

mu_rule4 = min (mu_x_medium,mu_y_near);
mu_rule5 = min (mu_x_medium,mu_y_far);
mu_rule6 = min (mu_x_medium,mu_y_very_far);

mu_rule7 = min (mu_x_large,mu_y_near);
mu_rule8 = min (mu_x_large,mu_y_far);
mu_rule9 = min (mu_x_large,mu_y_very_far);


%Results
mu_result1 = mu_rule1 * mu_very_slow;
mu_result2 = mu_rule2 * mu_slow;
mu_result3 = mu_rule3 * mu_fast_fast;

mu_result4 = mu_rule4 * mu_slow;
mu_result5 = mu_rule5 * mu_fast;
mu_result6 = mu_rule6 * mu_very_fast;

mu_result7 = mu_rule7 * mu_fast;
mu_result8 = mu_rule8 * mu_very_fast;
mu_result9 = mu_rule9 * mu_top_speed;

%union islemi
mu_tmp1 = max(max(mu_result1,mu_result2),max(mu_result3,mu_result4));
mu_tmp2 = max(max(mu_result5,mu_result6),max(mu_result7,mu_result8));
mu_tmp3 = max(mu_result9,mu_tmp2);

mu_union =  max(mu_tmp1,mu_tmp3);
plot(Z,mu_union);

%Durulastırma
total_area = sum(mu_union);
if total_area == 0
    'Toplam Alan sıfır';
end
z(i,j) = sum(mu_union.*Z)/total_area;

    end
end

size(X)
size(Y)
size(z)
figure
%[X,Y] = meshgrid(X,Y);
surf(X,Y,z);
xlabel('Angle');
ylabel('Distance');
zlabel('Speed');
































