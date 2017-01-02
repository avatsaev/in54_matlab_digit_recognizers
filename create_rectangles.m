function [ output ] = create_rectangles( image, lines )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    symboles=zeros(4,0);

    figure
    imshow(image)
    hold on

    for i=1:size(lines,1)
        cols=search_col(image,lines(i,:));
        for j=1:size(cols,1)
             h = search_rectangle(image,lines(i,:),cols(j,:) );
             h = rectify_rectangle(image,h);
             symboles = [symboles;h];
             rectangle('position',[h(1,1) h(1,2) h(1,3)-h(1,1) h(1,4)-h(1,2)])    
        end     
    end
    output = symboles;
end

