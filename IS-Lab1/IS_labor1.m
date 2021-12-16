% Classification using perceptron

% Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

% Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

% Calculate for each image, colour and roundness
% For Apples
% 1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
% 2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
% 3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
% 4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
% 5th apple image(A5)hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
% 6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
% 7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
% 8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
% 9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
global x1 x2 w1 w2 b
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%Desired output vector
T=[1;1;1;-1;-1]; % <- ČIA ANKSČIAU BUVO KLAIDA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);

global y1 y2 y3 y4 y5

y1 = output(1)
e1 = T(1) - y1;

y2 = output(2)
e2 = T(2) - y2;

y3 = output(3)
e3 = T(3) - y3;

y4 = output(4)
e4 = T(4) - y4;

y5 = output(5)
e5 = T(5) - y5;

% calculate the total error for these 5 inputs 
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);
%eta tai n
eta = 0.05

% write training algorithm
while e ~= 0 % executes while the total error is not 0
    global y1 y2 y3 y4 y5
	
    TT=[1;1;1;-1;-1];

%   update parameters using current inputs ant current error

    y1 = output(1)
	y2 = output(2)
	y3 = output(3)
	y4 = output(4)
	y5 = output(5)

	e1 = TT(1) - y1;
	e2 = TT(2) - y2;
	e3 = TT(3) - y3;
	e4 = TT(4) - y4;
	e5 = TT(5) - y5;
    
	v1 = calc_y(1)
	v2 = calc_y(2)
	v3 = calc_y(3)
	v4 = calc_y(4)
	v5 = calc_y(5)
    
    w1
    w2
    b
 	w1 = w1 + eta*e1*TT(1)+eta*e2*TT(2)+eta*e3*TT(3)+eta*e4*TT(4)+eta*e5*TT(5);
    w2 = w2 + eta*e1*TT(1)+eta*e2*TT(2)+eta*e3*TT(3)+eta*e4*TT(4)+eta*e5*TT(5);
    b = b + eta*e1+eta*e2+eta*e3+eta*e4+eta*e5;
    w1
    w2
    b

	% calculate the total error for these 5 inputs 
	e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);
end


function vv = calc_y(x)
    global x1 x2 w1 w2 b
	vv = x1(x)*w1 + x2(x)*w2 + b
end

function y = output(x)
    global x1 x2 w1 w2 b
	v = x1(x)*w1 + x2(x)*w2 + b
    if v > 0
		y = 1;
	else
		y = -1;
	end
end