function[wallet,type]=distinguishCoins(result,calZ)


coinsStandard=[16.25 18.75 21.25 19.75 22.25 24.25 23.25 25.75];
wallet=zeros(1,8);
stats = regionprops(result,'EquivDiameter','Centroid','PixelList');
diameter=zeros(1,size(stats,1));
type=cell(1,size(stats,1));

for i=1:size(stats,1)
diameter(i) = stats(i).EquivDiameter;
diameter(i) =diameter(i)*calZ;
if(diameter(i)>=25)
    wallet(1,8)=wallet(1,8)+1;
    type(i)={'2e'};
else
    coinsDiff=abs(coinsStandard-diameter(i));
    [M,I]=min(coinsDiff(:));
    if(I==1)
        type(i)={'1C'};
    end
    if(I==2)
        type(i)={'2C'};
    end
    if(I==3)
        type(i)={'5C'};
    end
    if(I==4)
        type(i)={'10C'};
    end
    if(I==5)
        type(i)={'20C'};
    end
    if(I==6)
        type(i)={'50C'};
    end
    if(I==7)
        type(i)={'1E'};
    end
    wallet(I)=wallet(I)+1;
end
end

