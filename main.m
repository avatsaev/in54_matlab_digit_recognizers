clear
close all

app = imread('app.tif');


lines = search_line(app);
cols = search_col(app,lines);

symbole_coords=zeros(4,0);

%  figure
%  imshow(app)
%  hold on

% On parcourt les lignes
for i=1:size(lines,1)
    %On cherche les colonnes de chaque lignes
    cols=search_col(app,lines(i,:));
    % On parcours chaque symbole de la ligne
    for j=1:size(cols,1)
        % On cherche le rectangle qui encadre le symbole
         h = search_rectangle(lines(i,:),cols(j,:) );
         % On rectifie au niveau de la hauteur le rectangle
         h = rectify_rectangle(app,h);
         % On sauvegarde les coorndonnées du rectangle
         symbole_coords = [symbole_coords;h];
%           rectangle('position',[h(1,1) h(1,2) h(1,3)-h(1,1) h(1,4)-h(1,2)])    
    end     
end

save('Symboles_coords_data.mat', 'symbole_coords');

% Classifieur1;
% Classifieur2;

% Recognizer1;
% Recognizer2;
% 
% Classifieur_combo;

