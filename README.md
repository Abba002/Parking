# 🚗 FPGA Parking System – Verilog Project

## 📌 Project Overview

The **FPGA Parking System** is an FPGA-based project that allows users to monitor **parking slot availability** and display the status (`OPEN` or `FULL`) on a **four-digit seven-segment display**.

Each input (`parkingslots[4:0]`) represents a **parking slot**, and the corresponding **availability** is shown using **LEDs** and a **cycling text display**.

This project demonstrates **clock division, seven-segment display control, input monitoring, and FPGA hardware design**.

---

## 🚀 Features

- 🅿️ **Parking Slot Monitoring** – Tracks the availability of 5 parking slots using input signals.
- 💡 **LED Indicators** – LEDs show which parking slots are occupied or available in real-time.
- 🖥️ **Four-Digit Seven-Segment Display Output** – Displays `OPEN` when slots are available and `FULL` when all slots are taken.
- 🕒 **Clock Divider** – A custom 100Hz slow clock drives smooth, human-readable display updates.
- 🔄 **Dynamic Display Cycling** – Letters (`O`, `P`, `E`, `N` or `F`, `U`, `L`, `L`) cycle across all four digits.

---

## 🛠️ Tech Stack

| Component | Technology Used |
|-----------|------------------|
| **Programming Language** | Verilog |
| **FPGA Board** | Nexys A7 |
| **Clock Speed** | 100 MHz |
| **Constraints File** | `.xdc` for pin mapping |
| **Development Tool** | Xilinx Vivado |

---

## 📂 Installation & Setup

### 1️⃣ **Clone the Repository**
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/FPGA-Parking-System.git
```

### 2️⃣ Navigate to the Project Directory
```sh
cd FPGA-Parking-System
```

## 📂 Installation & Setup

### 3️⃣ **Open in Vivado**
- **Open Vivado** and **create a new project**.
- **Add the Verilog source files** (`slowclock_100Hz.v`, `sevenseg.v`, `parkingsystem.v`).
- **Add the Nexys A7 constraints file** (`.xdc`) for proper pin mapping.

### 4️⃣ **Run Synthesis, Implementation, and Bitstream Generation**
- **Synthesize the design** (`Run Synthesis`).
- **Implement the design** (`Run Implementation`).
- **Generate the Bitstream** (`Generate Bitstream`).
- **Program the FPGA** using **Vivado Hardware Manager**.

---

## 📜 Usage

### **1️⃣ Set Parking Slot Status**
- **Connect 5 switches or buttons** to the `parkingslots[4:0]` inputs.
- Each switch represents a car occupying a parking slot:
  - `0` = Slot available
  - `1` = Slot occupied

### **2️⃣ Visual Feedback**
- **LEDs** indicate which parking slots are available (`1`) or occupied (`0`).
- **Seven-Segment Display Behavior**:
  - If **all parking slots are occupied**, the display cycles through: **F → U → L → L**.
  - If **any parking slots are free**, the display cycles through: **O → P → E → N**.

| **Parking Slot Status** | **Displayed Message** |
|-------------------------|------------------------|
| All 5 slots occupied (`11111`) | FULL |
| Any slot free (`< 11111`) | OPEN |
