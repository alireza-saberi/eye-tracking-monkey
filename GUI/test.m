% test bin maker
clc
clear all;
steps =1;
x= [-12.2:0.5:5 -1:0.2:3 6:1:9]
seeds = [1:steps:10];
      
x_binned = fix((x)/steps)*steps
