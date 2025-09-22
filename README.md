# Washing Machine Production Optimization

## 📌 Project Overview
This project formulates and solves an **Integer Linear Programming (ILP)** model to optimize the production plan of a company that manufactures **three types of washing machines**:

- **Type A**  
- **Type B**  
- **Type C**

The company aims to **maximize revenue** by carefully choosing how many machines of each type to produce, while considering **manufacturing costs**, **iron availability**, and additional **production constraints**.

The project is implemented in **AMPL** and solved using optimization solvers such as **CPLEX** or **Gurobi**.

---

## 🏭 Problem Description

The company faces the following production conditions:

- **Profit per machine**:  
  - Type A → €27  
  - Type B → €21  
  - Type C → €33  

- **Manufacturing cost per machine**:  
  - Type A → €11  
  - Type B → €6  
  - Type C → €5  

- **Iron required per machine**:  
  - Type A → 1 kg  
  - Type B → 1 kg  
  - Type C → 2 kg  

- **Iron availability**:  
  - Up to **4800 kg** at **€4/kg**.  

- **Constraints**:  
  1. The number of Type A machines must be **at least twice** the number of Type B machines:  
     ```
     xA ≥ 2 × xB
     ```
  2. The number of Type A machines must be **less than or equal to** the number of Type C machines:  
     ```
     xA ≤ xC
     ```
  3. Non-negativity constraint:  
     ```
     xA, xB, xC ≥ 0
     ```

---

## 📐 Mathematical Formulation (ILP)

##### Decision Variables
- **xA** → Number of Type A machines to produce  
- **xB** → Number of Type B machines to produce  
- **xC** → Number of Type C machines to produce  

##### Objective Function
Maximize **net revenue**:

\[
\text{Maximize: } (27x_A + 21x_B + 33x_C) - (11x_A + 6x_B + 5x_C + 4(x_A + x_B + 2x_C))
\]

This represents **sales profit – manufacturing cost – iron cost**.

##### Constraints
1. **Iron Availability**  
   \[
   x_A + x_B + 2x_C \leq 4800
   \]
2. **Type A ≥ 2 × Type B**  
   \[
   x_A \geq 2x_B
   \]
3. **Type A ≤ Type C**  
   \[
   x_A \leq xC
   \]
4. **Non-negativity**  
   \[
   x_A, x_B, x_C \geq 0
   \]

---

## 📊 Results

##### 🔹 Original Problem (No Extra Budget)
- **Production Plan**:  
  - Type A → **1372**  
  - Type B → **684**  
  - Type C → **1372**  

- **Optimal Revenue**:  
  \[
  \text{Total Revenue} = €51,428
  \]

---

##### 🔹 With Extra Budget (€800 for Additional Iron)
The company invests in additional iron from another supplier at **€7/kg**.  
This allows purchasing ≈ **114.29 kg** of extra iron, raising total availability to ≈ **4914.29 kg**.

- **Production Plan**:  
  - Type A → **1404**  
  - Type B → **702**  
  - Type C → **1404**  

- **Optimal Revenue**:  
  \[
  \text{Total Revenue} = €52,650
  \]

---

## 🧾 Analysis

- The model successfully balances **profit margins** with **resource constraints**.  
- In the **base case**, the company maximizes revenue at €51,428.  
- With the **extra €800 budget**, revenue increases by €1,222, reaching €52,650.  
- This shows that **investing in raw materials** (iron) has a **positive marginal return**, making additional budgets highly beneficial when constraints are tight.

---

## 📂 Repository Structure
washing-machine-optimization/
##### │── README.md # Project documentation
##### │── LICENSE # License file
##### │── .gitignore # Git ignore rules
##### │
##### ├── docs/
##### │ ├── Washing Machine Production.pdf # Original problem statement
##### │ ├── Logistics-3.pdf # Final report with results
##### │
##### ├── ampl/
##### │ ├── model.mod # AMPL model (ILP formulation)
##### │ ├── data.dat # Problem data
##### │ ├── run.run # Execution script for AMPL
##### │
##### ├── results/
##### │ ├── solution_base.txt # Solver output (no extra budget)
##### │ ├── solution_extra_budget.txt # Solver output (with extra budget)
##### │
##### └── scripts/
##### └── convert_to_cplex.py # Example script to run with CPLEX


---

## 🚀 How to Run

1. Install **AMPL** and a solver (e.g., **CPLEX** or **Gurobi**).  
2. Navigate to the `ampl/` directory.  
3. Run the model:  
   ```bash
   ampl run.run
