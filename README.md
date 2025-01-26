
# **AI-Driven Trajectory Prediction and Optimization for UAV Swarm**

This repository provides a sophisticated framework for the prediction, and collision avoidance of UAV swarm trajectories. It integrates advanced algorithms like **minjerkpolytraj** and custom neural network architectures, ensuring precise trajectory planning and efficient collision handling for UAV operations.

---

## **Table of Contents**
1. [Data Generation](#1-data-generation)
2. [Training and Testing](#2-training-and-testing-the-neural-network)
3. [Collision Detection and Avoidance](#3-collision-detection-and-avoidance)
4. [Features](#features)

---

## **1. Data Generation**

### **Requirements**
- MATLAB version **R2022a** or **R2023a**.
- Necessary toolboxes: **Simulink**, **Deep Learning Toolbox**.

### **Steps**
1. **Set the number of UAVs** and generate input data using the `minjerkpolytraj` algorithm:
   ```bash
   cd Data_generation/Simulink/code
   input_generation.m
   ```
   This script generates the input dataset for UAV trajectory simulation using the **minjerkpolytraj** algorithm.

2. **Run the main simulation script** to generate the dataset:
   ```bash
   main.m
   ```
   This script generates the UAV trajectories, including the positions over time, which will be used in subsequent steps for training and testing the neural network.

---

## **2. Training and Testing the Neural Network**

### **Pre-requisites**
- Install the **Deep Learning Toolbox** in MATLAB:
   ```bash
   nnstart
   ```

### **Training Workflow**
1. **Load the dataset** generated in the previous step. For example, load the `generated_trajectories.mat` file.
2. Configure the **Feed Forward Neural Network (FFNN)** to train on the specific coordinate axis (e.g., X-coordinate):
   - Input: Dataset for the desired coordinate axis (e.g., `X_input`).
   - Output: Corresponding predicted values (e.g., `X_output`).
   - The number of hidden layers and nodes will be automatically determined by the network.
3. Replace the default activation function with the proprietary **AdaptoSwelligauss** for improved convergence and performance:
   ```bash
   start training
   ```

---

### **Alternate Training Approach**
For a simplified training process, you can use the provided scripts in the `Training_and_testing` folder.

1. **Load the dataset** and configure the training script for specific coordinates (e.g., X, Y, or Z).
2. Example for X-coordinate:
   ```bash
   Xpredict.m
   ```
3. Repeat for other coordinates (e.g., Y or Z).

---

## **3. Collision Detection and Avoidance**

This module implements robust mechanisms to detect and resolve potential collisions in the UAV swarm.

### **Collision Detection**
1. Run the **collision detection script** to identify potential collisions in the generated dataset:
   ```bash
   collision_check.m
   ```
2. Batch UAVs for collision analysis using:
   ```bash
   batching_main.m
   ```

### **Collision Avoidance**
Once collisions are detected, apply avoidance strategies to resolve the conflicts:
```bash
Collision_detectionWithAvoidance.m
```

---

## **Features**
- **Advanced Trajectory Modeling**: Utilizes the **minjerkpolytraj** algorithm for smooth and optimized UAV trajectories.
- **Custom Neural Network Activation**: Implements the proprietary **AdaptoSwelligauss** activation function to enhance training performance and convergence.
- **Collision Handling**: Features robust collision detection and real-time avoidance mechanisms for UAVs operating in swarms.


---
