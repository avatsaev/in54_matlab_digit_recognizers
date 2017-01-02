clearvars -except d K
close all

 load('Recognizer1_data.mat');
 load('Recognizer2_data.mat');
 
 symbols_prob_sum = symbols_prob1 + symbols_prob2;
 symbols_prob_prod = symbols_prob1 .* symbols_prob2;
 
 save('Classifieur_combo_data.mat','symbols_prob_sum','symbols_prob_prod');
 
 actual_symbols = reshape(repmat((0:9)',1,10)',1,[]);
 
 test1 = sum(fitness(actual_symbols, symbols_prob1))/100; 
 test2 = sum(fitness(actual_symbols, symbols_prob2))/100; 
 test3 = sum(fitness(actual_symbols, symbols_prob_sum))/100; 
 test4 = sum(fitness(actual_symbols, symbols_prob_prod))/100;