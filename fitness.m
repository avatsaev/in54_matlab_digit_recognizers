function [ output ] = fitness(actual_symbols, symbols_probs )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

[max_prob max_prob_indice] = max(symbols_probs');
output = (actual_symbols == (max_prob_indice-1));
end

