# GrowFlow – Habit & Personal Growth Tracker

**GrowFlow** is a **smart, cross-platform application** designed to help users **track habits, build consistency, and visualize personal growth**. The app transforms daily routines into measurable progress through an intuitive interface and actionable analytics.

---

## 📌 Key Features

* Create daily or weekly **habits** with **title, description, icon, color, and interval**
* Track **habit completion history** to monitor performance over time
* **Dashboard** to view all active habits and their current status
* **Habit Details** pages showing streaks, progress indicators, and full event logs
* Interactive, modern **Material Design 3 UI**
* **Cross-platform support**: Android, iOS, Web

---

## 🛠️ Technologies Used

* **Flutter & Dart**: single codebase for all platforms
* **Cubit/BLoC**: efficient state management separating business logic from UI
* **SQLite (`sqflite`)**: local data storage for offline access
* **Clean Architecture**: modular structure with Models, Repositories, Cubits, Widgets, and Screens
* **Material Design 3**: modern, consistent user interface

---

## 📂 Project Structure

```
lib/
│
├─ models/          # Core objects like Habit and HabitHistory
├─ cubits/          # State management using Cubit
├─ repositories/    # Data handling and database operations
├─ screens/         # App screens like HomeScreen & HabitDetails
├─ widgets/         # Reusable UI components
└─ main.dart        # Entry point of the application
```
🖼️ Screenshots

Example Markdown to add images:
<img width="325" height="726" alt="Screenshot 2025-10-26 231549" src="https://github.com/user-attachments/assets/07a38d84-a468-4bf5-8636-fd332e51d35f" />
<img width="337" height="725" alt="Screenshot 2025-10-26 231513" src="https://github.com/user-attachments/assets/d41b42c5-32a3-4be4-95c6-db62acb7a8cf" />
<img width="338" height="728" alt="Screenshot 2025-10-26 231526" src="https://github.com/user-attachments/assets/54e00a3a-a5ab-467e-b988-2067e939c1d1" />
<img width="335" height="724" alt="Screenshot 2025-10-26 231612" src="https://github.com/user-attachments/assets/75445b4b-a444-4f8e-b01a-7419b9aa141d" />

---

## 🚀 How to Run

1. Make sure [Flutter](https://flutter.dev) is installed and set up
2. Clone the repository:

```bash
git clone https://github.com/Ahmed-Alimahdy/GrowFlow.git
cd GrowFlow
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app on emulator or device:

```bash
flutter run
```

---

## 💡 Concept

GrowFlow helps users **turn small daily actions into long-term growth** by tracking habits, visualizing progress, and providing insights. The app’s **reactive UI** updates automatically as habits are completed, while the modular architecture ensures maintainability and scalability.

---

## 🤝 Contribution

Contributions, feedback, and suggestions are welcome! Please fork the repository and open a pull request for improvements or bug fixes.

---

## 📄 License

This project is open-source and available under the **MIT License**.

