%Sugeno

global X mu_X mu_xi ;

lowerbound_angle=0; upperbound_angle=40;
lowerbound_distance=0; upperbound_distance=20;
lowerbound_speed=0; upperbound_speed=100;

angle_value=15; distance_value=15; speed_value=0;

c1=8; c2=25; c3=45; c4=60; c5=75; c6=91;%c7=60; c8=45; c9=8; 


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


z1=c1;
z2=c2;
z3=c3;
z4=c4;
z5=c5;
z6=c6;



%Rules
w1 = min (mu_xi_small,mu_yi_near);
w2 = min (mu_xi_small,mu_yi_far);
w3 = min (mu_xi_small,mu_yi_very_far);

w4 = min (mu_xi_medium,mu_yi_near);
w5 = min (mu_xi_medium,mu_yi_far);
w6 = min (mu_xi_medium,mu_yi_very_far);

w7 = min (mu_xi_large,mu_yi_near);
w8 = min (mu_xi_large,mu_yi_far);
w9 = min (mu_xi_large,mu_yi_very_far);



%Sonuçlarýn aðýrlýklý toplamý

SAT=w1*z1+w2*z2+w3*z4+w4*z1+w5*z3+w6*z5+w7*z3+w8*z5+w9*z6;
%plot(X,SAT);
%Durulastýrma
total_weight=w1+w2+w3+w4+w5+w6+w7+w8+w9;
if total_weight == 0
    'Aðýrlýk Merkezi Yönteminde Toplam Alan Sýfýr!';
end
z=SAT/total_weight;

h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['Speed = ',num2str(z)]);
display(z)


