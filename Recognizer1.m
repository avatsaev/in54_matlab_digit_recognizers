clearvars -except d K
close all

%% Pré-traitement
test = imread('test.tif');
% test = uint8(im2bw(test))*255;
% test = imerode(test,[0 1 0;1 1 1;0 1 0]);
% d est le nombre de partition de l'image
d = 10;
% K est le nbre de classe
K=10;
% K_width est le nombre d'exemples pour chaque classe
K_width = 20;

 figure
 imshow(test)
 hold on
 
lines = search_line(test);
cols = search_col(test,lines);

test_symbole_coords=zeros(4,0);

% On parcourt les lignes
for i=1:size(lines,1)
    %On cherche les colonnes de chaque lignes
    cols=search_col(test,lines(i,:));
    % On parcours chaque symbole de la ligne
    for j=1:size(cols,1)
        % On cherche le rectangle qui encadre le symbole
         h = search_rectangle(lines(i,:),cols(j,:) );
         % On rectifie au niveau de la hauteur le rectangle
         h = rectify_rectangle(test,h);
         % On sauvegarde les coorndonnées du rectangle
         test_symbole_coords = [test_symbole_coords;h];
          rectangle('position',[h(1,1) h(1,2) h(1,3)-h(1,1) h(1,4)-h(1,2)])    
    end     
end

%% Décision

% On initialise les tableaux de probabilités
symbols_prob1=zeros(0,K);

% On parcourt les symboles à identifier
for i=1:size(test_symbole_coords,1)
    % On cherche les distances de chaque symbole d'entrée
    test_distance = find_distances( test,test_symbole_coords(i,:),d);
    % On calcule les distances par rapport aux classes d'apprentissage
    D = recognize1(test_distance');

   symbols_prob1 = [symbols_prob1 ; D]; 
end 

save('Recognizer1_data.mat','symbols_prob1');
