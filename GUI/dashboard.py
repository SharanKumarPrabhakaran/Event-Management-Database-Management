import tkinter as tk
from registration_gui import RegistrationGUI  # Import the RegistrationGUI class from registration_gui.py
from events_gui import EventsGUI
from organizer_gui import OrganizerGUI
from venue_gui import VenueGUI
from reports_gui import ReportGUI

class Dashboard:
    def __init__(self, root):
        self.root = root
        self.root.title("Dashboard")
        self.root.geometry("400x400")  # Set the initial size of the window

        # Set the background color
        self.root.config(bg="lightblue")

        # Create a frame to hold the buttons
        self.button_frame = tk.Frame(self.root, bg="lightblue")
        self.button_frame.pack(expand=True)

        # Create buttons with custom styling
        button_style = {"font": ("Helvetica", 16), "padx": 20, "pady": 10, "bg": "white", "fg": "black", "relief": "raised"}
        self.events_button = tk.Button(self.button_frame, text="Events", command=self.open_events_gui, **button_style)
        self.events_button.pack(expand=True, pady=10)

        self.organizers_button = tk.Button(self.button_frame, text="Organizers", command=self.open_organizers, **button_style)
        self.organizers_button.pack(expand=True, pady=10)

        self.venue_button = tk.Button(self.button_frame, text="Venue", command=self.open_venue, **button_style)
        self.venue_button.pack(expand=True, pady=10)

        self.reports_button = tk.Button(self.button_frame, text="Reports", command=self.open_reports, **button_style)
        self.reports_button.pack(expand=True, pady=10)

        self.registration_button = tk.Button(self.button_frame, text="Registration", command=self.open_registration, **button_style)
        self.registration_button.pack(expand=True, pady=10)

        # Center the frame in the window
        self.button_frame.place(relx=0.5, rely=0.5, anchor=tk.CENTER)

    def open_events_gui(self):
        events_window = tk.Toplevel(self.root)
        events_gui = EventsGUI(events_window)   # Open the EventsGUI application
        # root.mainloop()

    def open_organizers(self):
        organizer_window = tk.Toplevel(self.root)
        organizer_gui = OrganizerGUI(organizer_window)  # Instantiate the RegistrationGUI class
        # root.mainloop()

    def open_venue(self):
        venue_window = tk.Toplevel(self.root)
        venue_gui = VenueGUI(venue_window)  # Instantiate the RegistrationGUI class
        # root.mainloop()

    def open_reports(self):
        reports_window = tk.Toplevel(self.root)
        reports_gui = ReportGUI(reports_window) # Instantiate the RegistrationGUI class
        # root.mainloop()

    def open_registration(self):
        registration_window = tk.Toplevel(self.root)
        registration_gui = RegistrationGUI(registration_window)  # Instantiate the RegistrationGUI class
        # root.mainloop()

if __name__ == "__main__":
    root = tk.Tk()
    dashboard = Dashboard(root)
    root.mainloop()
