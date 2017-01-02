clearvars -except d K
close all

%% Pré-traitement
test = imread('test.tif');

% d est le nombre de partition de l'image
if (exist('d','var') == 0)  
    d = 25;
end

% K est le nbre de classe
if (exist('K','var') == 0)  
    K=10;
end

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
symbols_prob2=zeros(0,K);
symbol_prob = zeros(1,K);
% On parcourt les symboles à identifier
for i=1:size(test_symbole_coords,1)
    % On cherche les densités de chaque symbole d'entrée
    test_density = find_densities( test,test_symbole_coords(i,:),d);
    % On calcule les distances par rapport aux classes d'apprentissage
    D = recognize2(test_density);
    % On récupère les K vecteurs plus proche
    [sorted_D, D_indices] = sort(D);
    D_indices =  floor(D_indices(1:K)/K_width)
    % On calcule la probabilité de chaque classe
    for j = 0:9
       symbol_prob(j+1) = sum(D_indices==j)/K; 
    end
   symbols_prob2 = [symbols_prob2 ; symbol_prob]; 
end 

save('Recognizer2_data.mat','symbols_prob2');
