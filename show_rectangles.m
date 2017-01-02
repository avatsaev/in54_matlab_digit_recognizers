 lines=search_line(app);

symboles=zeros(4,0);

figure
imshow(app)
hold on

for i=1:size(lines,1)
    
    cols=search_col(app,lines(i,:));
    
    for j=1:size(cols,1)
        
         h = search_rectangle(lines(i,:),cols(j,:) );
         h = rectify_rectangle(app,h);
         symboles= [symboles;h];
         rectangle('position',[h(1,1) h(1,2) h(1,3)-h(1,1) h(1,4)-h(1,2)])
            
    end
    
   
       
end

%rectangle('position',[h(1,1) h(1,2) h(1,3)-h(1,1) h(1,4)-h(1,2)])