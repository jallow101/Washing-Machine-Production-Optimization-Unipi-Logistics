# Washing-Machine-Production-Optimization-Unipi-Logistics
This project formulates and solves an Integer Linear Programming (ILP) model for optimizing the production of three types of washing machines under resource and budget constraints. It uses AMPL and solvers like CPLEX / Gurobi.

# washing-machine-optimization/
# │── README.md
# │── LICENSE
# │── .gitignore
# │
# ├── docs/
# │   ├── Washing Machine Production.pdf        # Original problem statement
# │   ├── Logistics-3.pdf                       # Final project report
# │
# ├── ampl/
# │   ├── model.mod                             # AMPL model file
# │   ├── data.dat                              # Data file (profits, costs, constraints)
# │   ├── run.run                               # Run file for solver execution
# │
# ├── results/
# │   ├── solution_base.txt                     # Output without extra budget
# │   ├── solution_extra_budget.txt             # Output with extra budget
# │
# └── scripts/
#     └── convert_to_cplex.py                   # (Optional) script to run model via CPLEX

