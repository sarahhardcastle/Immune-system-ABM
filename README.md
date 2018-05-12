# README

# Instruction for running the simulation

This is a system for simulating the iteraction between healthy red blood cells, bacteria cells and white blood cells. In the system, bacteria infect nearby healthy cells and white blood cells kill bacteria.

The main function for using the system is ecolab().

This function takes 6 parameters;

```
ecolab(size, healthy_cells, bacteria, white_cells, iterations, fast_mode(optional), out_images(optional))
```

where:
size : The size of the model environment \n
healthy_cells : the initial number of healthy cells \n
bacteria : the intial number of bacteria \n
white_cells : the initial number of white cells \n
iterations : the number of iterations to run the simulation for \n
fast_mode(optional) : Boolean to control whether to use fast mode \n
out_images(optional) : Boolean to enable image output

# System parameters

There are some additional system paramters that can be changed to affect the simulation of the system. These are stored in the create_params.m file.

C_SPD : Speed of the healthy cells and bacteria. Controls the distance the cell can move each iteration.
WC_SPD : Speed of the white cell. Controls the distance the cell can move each iteration.
C_SPLIT : The frequency at which new healthy cells are added to the simulation.
WC_SPLIT : The frequency at which new white cells are adde to the simulation.
C_MAXAGE : The maximum age for healthy cells and bacteria. The number of iterations that the cells are included in the simulation before dying and being removed.
WC_MAXAGE : The maximum age for white cells. The number of iterations that the cells are included in the simulation before dying and being removed.

