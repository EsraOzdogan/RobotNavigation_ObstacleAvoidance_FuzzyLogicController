%Mamdani

global X mu_X mu_xi;

lowerbound_angle=0; upperbound_angle=40;
lowerbound_distance=0; upperbound_distance=20;
lowerbound_speed=0; upperbound_speed=100;

%inputs
angle_value=20; distance_value=10; speed_value=0;

%angle membership functions
trapezoid(lowerbound_angle,0, 0, 10, 20,upperbound_angle,angle_value);%small graphic
x_small = X; mu_small = mu_X; mu_xi_small = mu_xi;
triangle(lowerbound_angle,10, 20, 30,upperbound_angle,angle_value); %medium graphic
x_medium = X; mu_medium = mu_X; mu_xi_medium = mu_xi;
trapezoid(lowerbound_angle,25, 35, 40, 40,upperbound_angle,angle_value);% large graphic
x_large = X; mu_large = mu_X; mu_xi_large = mu_xi;


%distance membership functions
trapezoid(lowerbound_distance,0, 0, 6, 8,upperbound_distance,distance_value);% near graphic
y_near = X; mu_near = mu_X; mu_yi_near = mu_xi;
triangle(lowerbound_distance,5, 10, 15,upperbound_distance,distance_value);% far graphic
y_far= X; mu_far = mu_X; mu_yi_far = mu_xi;
trapezoid(lowerbound_distance,12, 15, 20, 20,upperbound_distance,distance_value);% very far graphic
y_very_far = X; mu_very_far = mu_X; mu_yi_very_far = mu_xi;



%speed membership functions 
trapezoid(lowerbound_speed,0, 0, 10, 20,upperbound_speed,speed_value);% very_slow graphic
z_very_slow = X; mu_very_slow = mu_X; 
triangle(lowerbound_speed,10, 25, 40,upperbound_speed,speed_value);% slow graphic
z_slow = X; mu_slow = mu_X;
triangle(lowerbound_speed,30, 45, 60,upperbound_speed,speed_value);% fast graphic
z_fast = X; mu_fast = mu_X;
triangle(lowerbound_speed,50, 60, 70,upperbound_speed,speed_value);% very_fast graphic
z_fast_fast = X; mu_fast_fast = mu_X;
triangle(lowerbound_speed,65, 75, 90,upperbound_speed,speed_value);% fast_fast graphic
z_very_fast = X; mu_very_fast = mu_X;
trapezoid(lowerbound_speed,75, 90, 100, 100,upperbound_speed,speed_value);% Top_speed graphic
z_top_speed = X; mu_top_speed = mu_X;



%Rules
mu_rule1 = min (mu_xi_small,mu_yi_near);
mu_rule2 = min (mu_xi_small,mu_yi_far);
mu_rule3 = min (mu_xi_small,mu_yi_very_far);

mu_rule4 = min (mu_xi_medium,mu_yi_near);
mu_rule5 = min (mu_xi_medium,mu_yi_far);
mu_rule6 = min (mu_xi_medium,mu_yi_very_far);

mu_rule7 = min (mu_xi_large,mu_yi_near);
mu_rule8 = min (mu_xi_large,mu_yi_far);
mu_rule9 = min (mu_xi_large,mu_yi_very_far);


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
%mu_tmp3 = max(mu_result9,mu_tmp2);
mu_tmp3 = max(mu_tmp1,mu_tmp2);
mu_union = max(mu_result9,mu_tmp3);
%mu_union =  max(mu_tmp1,mu_tmp3);
plot(X,mu_union);

total_area = sum(mu_union);

if total_area == 0
    'Total area is zero in the Center of Weight method';
end

z = sum(mu_union.*X)/total_area;
%line([z z],[0 1]);
h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['Speed = ',num2str(z)]);
display(z)






























