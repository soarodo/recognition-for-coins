function [wallet,sum,stats,type]=S4v1(f,cal)


%% 2 Segmentation of coins
result=segmentCoins(f);
figure;imshow(result.*double(rgb2gray(f)),[]);


%% distuiguish coins by the diameter
[wallet,type]=distinguishCoins(result,cal);

%% count the value of coins
sum=wallet(1,1)*0.01+wallet(1,2)*0.02+wallet(1,3)*0.05+...
    wallet(1,4)*0.1+wallet(1,5)*0.2+wallet(1,6)*0.5...
    +wallet(1,7)*1+wallet(1,8)*2;
stats = regionprops(result,'EquivDiameter','Centroid','PixelList');

