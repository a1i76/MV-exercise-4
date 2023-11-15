clc; clear; close all;

img= imread("toRotate.jpg");
h1 =size(img,1);
w1 =size(img,2);
imshow(img);
% img = imrotate(img,45);

d=255; %rotation degree
d=-d;

%midpoints
midx=ceil((w1)/2);
midy=ceil((h1)/2);

% set canvas size to contain image
w2= ceil(abs(w1*cosd(d)) + abs(h1*cosd(90-d)));
h2= ceil(abs(w1*sind(d)) + abs(h1*sind(90-d)));
img2 = zeros(h2,w2,3);

% shift image into canvas frame
xshift= floor((w2-w1)/2);
yshift= floor((h2-h1)/2);

for i=1:.5:w1
    for j=1:.5:h1

         x=(i-midx)*cosd(d)-(j-midy)*sind(d);
         y=(i-midx)*sind(d)+(j-midy)*cosd(d);
         x=floor(x)+midx+xshift;
         y=floor(y)+midy+yshift;

         if (x>=1 && y>=1)
              img2(y,x,:)=img(round(j),round(i),:);        
         end

    end
end
d=-d;
img2 = uint8(img2);
figure
imshow(img2);