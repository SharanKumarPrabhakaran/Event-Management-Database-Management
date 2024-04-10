import tkinter as tk
from tkinter import ttk, messagebox
import database

class ReportGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Report Viewer")
        self.frame = ttk.Frame(root)
        self.frame.pack(fill=tk.BOTH, expand=True)
        self.setup_buttons()
        self.setup_treeview()
    def apply_styling(self):
        self.root.configure(bg="#f0f0f0")  # Set background color of the root window

        self.style = ttk.Style()
        self.style.theme_use('clam')

        # Button styling
        self.style.configure('TButton', font=('Helvetica', 12), borderwidth='2', background='#4b86b4', foreground='white')
        self.style.map('TButton', background=[('active', '#6699cc'), ('pressed', '#003366')])

        # Treeview styling
        self.style.configure('Treeview', background='white', foreground='black', rowheight=25)
        self.style.map('Treeview', background=[('selected', '#b0e0e6')])
    def setup_buttons(self):
        self.button_frame = ttk.Frame(self.frame)
        self.button_frame.pack(side=tk.TOP, pady=10)

        self.event_summary_button = ttk.Button(self.button_frame, text="Event Summary", command=self.show_event_summary)
        self.event_summary_button.grid(row=0, column=0, padx=5)

        self.sponsor_contribution_button = ttk.Button(self.button_frame, text="Sponsor Contribution Summary", command=self.show_sponsor_contribution_summary)
        self.sponsor_contribution_button.grid(row=0, column=1, padx=5)

        self.attendee_registration_button = ttk.Button(self.button_frame, text="Attendee Registration Summary", command=self.show_attendee_registration_summary)
        self.attendee_registration_button.grid(row=0, column=2, padx=5)

        self.event_feedback_button = ttk.Button(self.button_frame, text="Event Feedback Analysis", command=self.show_event_feedback_analysis)
        self.event_feedback_button.grid(row=0, column=3, padx=5)

        self.ticket_sales_button = ttk.Button(self.button_frame, text="Ticket Sales Analysis", command=self.show_ticket_sales_analysis)
        self.ticket_sales_button.grid(row=0, column=4, padx=5)

        self.speaker_engagement_button = ttk.Button(self.button_frame, text="Speaker Engagement", command=self.show_speaker_engagement)
        self.speaker_engagement_button.grid(row=0, column=5, padx=5)

    def setup_treeview(self):
        self.tree_frame = ttk.Frame(self.frame)
        self.tree_frame.pack(side=tk.TOP, fill=tk.BOTH, expand=True)

        self.treeview = ttk.Treeview(self.tree_frame, show="headings")
        self.treeview.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        self.tree_scroll = ttk.Scrollbar(self.tree_frame, orient="vertical", command=self.treeview.yview)
        self.tree_scroll.pack(side=tk.RIGHT, fill=tk.Y)

        self.treeview.configure(yscrollcommand=self.tree_scroll.set)

    def show_event_summary(self):
        self.clear_treeview()
        columns = ("Event ID", "Title", "Start Date", "End Date", "Venue", "City", "State", "Registrations", "Average Rating", "Ranking")
        data = database.fetch_event_summary()
        self.populate_treeview(columns, data)

    def show_sponsor_contribution_summary(self):
        self.clear_treeview()
        columns = ("Sponsor Name", "Events Sponsored", "Total Contribution")
        data = database.fetch_sponsor_contribution_summary()
        self.populate_treeview(columns, data)

    def show_attendee_registration_summary(self):
        self.clear_treeview()
        columns = ("Attendee ID", "First Name", "Last Name", "Total Registrations", "Registered Events")
        data = database.fetch_attendee_registration_summary()
        self.populate_treeview(columns, data)

    def show_event_feedback_analysis(self):
        self.clear_treeview()
        columns = ("Event ID", "Title", "Total Feedback", "Average Rating", "Rating Category", "Feedback Comments")
        data = database.fetch_event_feedback_analysis()
        self.populate_treeview(columns, data)

    def show_ticket_sales_analysis(self):
        self.clear_treeview()
        columns = ("Event ID", "Title", "Total Tickets Sold", "Total Sales")
        data = database.fetch_ticket_sales_analysis()
        self.populate_treeview(columns, data)

    def show_speaker_engagement(self):
        self.clear_treeview()
        columns = ("Event ID", "Event Title", "Speaker Name", "Sessions Spoken")
        data = database.fetch_speaker_engagement()
        self.populate_treeview(columns, data)

    def clear_treeview(self):
        for item in self.treeview.get_children():
            self.treeview.delete(item)

    def populate_treeview(self, columns, data):
        self.treeview["columns"] = columns
        for col in columns:
            self.treeview.heading(col, text=col)
            self.treeview.column(col, width=100, anchor="center")

        for row in data:
            self.treeview.insert("", "end", values=row)

if __name__ == "__main__":
    root = tk.Tk()
    app = ReportGUI(root)
    root.mainloop()
