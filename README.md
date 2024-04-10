# final_project_group15
# Event Management Database Management

## Introduction
This document outlines the steps required to set up and run the GUI application. Follow the instructions carefully to ensure a smooth setup process.


**About the project**
The Event Management System is a database management application designed to simplify and streamline the organization, coordination, and management of events. It serves as a centralized platform for event planners, organizers, and attendees, offering a wide range of features to facilitate every stage of the event lifecycle. With this system, organizers can effortlessly create new events, specifying details such as title, description, date, venue, category, and status. Attendees can easily register for events through an intuitive interface, while organizers can efficiently manage registrations, track payment status, and access attendee information.

One of the key functionalities of the system is its robust reporting capabilities, providing various insightful analyses and summaries. These reports include event summaries, attendee registration summaries, sponsor contribution summaries, event feedback analysis, ticket sales analysis, and speaker engagement analysis. By leveraging these comprehensive reports, organizers can gain valuable insights into the performance and success of their events, allowing for data-driven decision-making and strategic planning.

Built using Python and the Tkinter library for the graphical user interface, the Event Management System offers a user-friendly and intuitive experience for users. The system utilizes Microsoft SQL Server as the backend database management system, storing and managing event-related data efficiently. Additionally, stored procedures are employed to encapsulate database operations, ensuring a seamless and secure interaction with the database.

To get started with the Event Management System, users can follow simple steps such as installing dependencies, setting up the database schema, and running the application. Once launched, users can explore the various features and functionalities of the system, including event creation, registration management, reporting, and user management. 


## Prerequisites
- Python 3.x installed on your system.

## Setup Instructions

### 1. Install Python
If you do not have Python installed on your system, download and install it from the official Python website: https://www.python.org/downloads/

Ensure that Python and pip are correctly installed by running the following commands in your terminal or command prompt:

```bash
python --version
pip --version

**2. Install Required Python Packages**

To install the necessary Python package `pyodbc`, navigate to your project's directory in the terminal or command prompt and run the following command:

```bash
pip3 install pyodbc

**Update Database Connection Details**:
Before running the application, it is crucial to configure your database connection details within the database.py file. You will need to specify the following:

Host
Database name
User
Password


**Run the Application**:
After completing the setup steps above, you can start the application. First, navigate to the folder containing your .py files in the terminal or command prompt. Then, execute the application by running:

python app.py
