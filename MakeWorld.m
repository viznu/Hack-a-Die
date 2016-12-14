function MakeWorld
%create a new figure
playground  = imread('factory.jpg')
warning('off', 'Images:initSize:adjustingMag');
RGB = insertShape(playground,'line',[150 280  23 49],'LineWidth',5);
figure,imshow(RGB)
