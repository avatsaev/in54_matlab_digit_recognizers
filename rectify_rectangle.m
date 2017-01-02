function [ output ] = rectify_rectangle( image, rect )
% rectify_rectangle( image, rect ) redimensionne le rectangle rect
% englobant un symbole en laissant au moins un cadre blanc d'au moins un  
% pixel autour du symbole 

    lin = search_line(image(rect(1,2):rect(1,4),rect(1,1):rect(1,3)));
    output = [ rect(1,1)-2 lin(1,1)+rect(1,2)-3 rect(1,3)+1 lin(1,2)+rect(1,2)]; 
    
end

