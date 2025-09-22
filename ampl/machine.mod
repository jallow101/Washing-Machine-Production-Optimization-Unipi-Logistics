model;

set machines;

param IronCostPerKg >= 0;  # Cost of iron per kg
param MaxIronAvailability >= 0;  # Maximum available iron

param extra_budget >= 0;
param extra_iron_cost >=0;

#with extra budget 
param extra_iron :=  extra_budget / extra_iron_cost;

#new iron constrain 
param max_iron := MaxIronAvailability + extra_iron;


param IronPerMachine{machines};

param Profit{machines};


param CostManufacturing{machines};

var quantity {machines} integer;

var cost {machines} integer;

# Objective function to maximize profit
## Profi - Cost (Manufaturing cost and Iron Cost) 
maximize Sales:
 sum{j in machines} (Profit[j] * quantity[j]) - sum{j in machines} ( (CostManufacturing[j] * quantity[j])+   (IronPerMachine[j] * IronCostPerKg * quantity[j]) );
  
# Constraints
subject to Iron_Constraint:
    sum{j in machines} (IronPerMachine[j] * quantity[j]) <= MaxIronAvailability;
        

subject to Production_Constraint_A:
        quantity['type_A'] >= 2 * quantity['type_B'];

subject to Production_Constraint_B:
    quantity['type_A'] <= quantity['type_C'];
    

subject to nonzero {j in machines} : quantity[j] >= 0;
    
# Update iron Constraint
subject to Iron_Constrainta:
    sum{j in machines} (IronPerMachine[j] * quantity[j]) <= max_iron;    
    
                   