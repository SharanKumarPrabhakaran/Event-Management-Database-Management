import tkinter as tk
from tkinter import messagebox, ttk
from datetime import datetime
import database


# Utility function for date validation
def validate_date(date_text):
    try:
        datetime.strptime(date_text, '%Y-%m-%d')
        return True
    except ValueError:
        return False

class EventsGUI:
    def __init__(self, root):
        self.root = root
        self.style = ttk.Style()
        self.style.theme_use('clam')  # Try 'alt', 'default', 'clam', 'classic', 'vista', 'xpnative'
        self.root.title("Event Management System")
        self.frame = ttk.Frame(root)
        self.frame.pack(fill=tk.BOTH, expand=True)
        self.setup_entry_fields()
        self.setup_operation_buttons()
        self.setup_treeview()
        self.load_events()
        self.apply_styling()
    def apply_styling(self):
        # Set the background color of the root window
        self.root.config(bg="lightblue")

        # Set the background color of the frame
        self.frame.config(bg="lightblue")

        # Configure the style for the buttons
        self.style.configure('TButton', font=('Helvetica', 12), borderwidth='4')
        self.style.map('TButton', foreground=[('pressed', 'red'), ('active', 'blue')], background=[('pressed', '!disabled', 'black'), ('active', 'white')])

        # Configure the style for the entry fields
        self.style.configure('TEntry', foreground='blue', background='white')

        # Configure the style for the Treeview
        self.style.configure('Treeview', background='lightblue', foreground='black', rowheight=25)
        self.style.map('Treeview', background=[('selected', 'black')])

    def setup_entry_fields(self):
        labels = {
            "Organizer_ID": "Organizer ID:",
            "Venue_ID": "Venue ID:",
            "Category_ID": "Category ID:",
            "Title": "Title:",
            "Description": "Description:",
            "Start_Date": "Start Date (YYYY-MM-DD):",
            "End_Date": "End Date (YYYY-MM-DD):",
            "Event_Status": "Event Status:"
        }

        self.entry_widgets = {}
        self.entry_frame = ttk.Frame(self.frame)
        self.entry_frame.pack(side=tk.TOP, fill=tk.BOTH, expand=True)

        for field_name, label_text in labels.items():
            label = ttk.Label(self.entry_frame, width=25, justify='center', text=label_text)
            label.pack(side=tk.TOP, padx=5, pady=2)

            if field_name == "Event_Status":
                # Create a Combobox for the Event_Status field
                event_status_combobox = ttk.Combobox(self.entry_frame, values=["Scheduled", "Concluded", "Ongoing"])
                event_status_combobox.pack(side=tk.TOP, padx=5, pady=2)
                self.entry_widgets[field_name] = event_status_combobox
            else:
                # For other fields, create Entry widgets
                entry = ttk.Entry(self.entry_frame, width=25, justify='center')
                entry.pack(side=tk.TOP, padx=5, pady=2)
                self.entry_widgets[field_name] = entry
    def setup_operation_buttons(self):
        self.button_frame = ttk.Frame(self.frame)  # Create a frame to contain the buttons
        self.button_frame.pack(side=tk.TOP)  # Pack it below the entry_frame

        # Create the operation buttons
        self.add_button = ttk.Button(self.button_frame, text="Add Event", command=self.add_event)
        self.add_button.pack(side=tk.TOP, padx=5, pady=5)

        self.update_button = ttk.Button(self.button_frame, text="Update Selected Event", command=self.update_event)
        self.update_button.pack(side=tk.TOP, padx=5, pady=5)

        self.delete_button = ttk.Button(self.button_frame, text="Delete Selected Event", command=self.delete_event)
        self.delete_button.pack(side=tk.TOP, padx=5, pady=5)

    
    def setup_treeview(self):
        columns = ("Event_ID", "Organizer_ID", "Venue_ID", "Category_ID", "Title", "Description", "Start_Date", "End_Date", "Event_Status")
        self.events_tree = ttk.Treeview(self.frame, columns=columns, show="headings", xscrollcommand=lambda f, l: self.hsb.set(f, l))
        
        # Configure the column widths
        self.events_tree.heading("Event_ID", text="Event ID")
        self.events_tree.heading("Organizer_ID", text="Organizer ID")
        self.events_tree.heading("Venue_ID", text="Venue ID")
        self.events_tree.heading("Category_ID", text="Category ID")
        self.events_tree.heading("Title", text="Title")
        self.events_tree.heading("Description", text="Description")
        self.events_tree.heading("Start_Date", text="Start Date")
        self.events_tree.heading("End_Date", text="End Date")
        self.events_tree.heading("Event_Status", text="Event Status")
        
        # Set the width of specific columns
        self.events_tree.column("Event_ID", width=10)
        self.events_tree.column("Organizer_ID", width=10)
        self.events_tree.column("Venue_ID", width=10)
        self.events_tree.column("Category_ID", width=10)
        self.events_tree.column("Start_Date", width=10)
        self.events_tree.column("End_Date", width=10)
        self.events_tree.column("Event_Status", width=10)

        # Set the width of the "Title" column to fill remaining space
        self.events_tree.column("Title", minwidth=100)
        self.events_tree.column("Description", minwidth=200)
        self.events_tree.pack(fill=tk.BOTH, expand=True)

        # Horizontal scrollbar
        self.hsb = ttk.Scrollbar(self.frame, orient="horizontal", command=self.events_tree.xview)
        self.hsb.pack(fill=tk.X, side=tk.BOTTOM)

        # Link the scrollbar to the treeview
        self.events_tree.configure(xscrollcommand=self.hsb.set)

    def add_event(self):
        try:
            organizer_id = int(self.entry_widgets['Organizer_ID'].get())
            venue_id = int(self.entry_widgets['Venue_ID'].get())
            category_id = int(self.entry_widgets['Category_ID'].get())
            title = self.entry_widgets['Title'].get()
            description = self.entry_widgets['Description'].get()
            start_date = self.entry_widgets['Start_Date'].get()
            end_date = self.entry_widgets['End_Date'].get()
            event_status = self.entry_widgets['Event_Status'].get()


            if not validate_date(start_date) or not validate_date(end_date):
                messagebox.showerror("Error", "Start Date and End Date must be in YYYY-MM-DD format.")
                return

            database.add_event(
                organizer_id, 
                venue_id, 
                category_id, 
                title, 
                description, 
                start_date, 
                end_date, 
                event_status
            )
            self.load_events()
            messagebox.showinfo("Success", "Event added successfully")
        except ValueError as e:
            messagebox.showerror("Error", f"Invalid input: {e}")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to add event: {e}")

    def clean_event_id(self, event_id_str):
        """Clean and convert event ID string to integer."""
        clean_str = event_id_str.strip("(),'")
        try:
            return int(clean_str)
        except ValueError:
            raise ValueError(f"Invalid event ID format: {clean_str}")
    def update_event(self):
        selected_items = self.events_tree.selection()
        if not selected_items:
            messagebox.showinfo("Update Event", "Please select an event to update.")
            return

        selected_item = selected_items[0]
        event_id_str = self.events_tree.item(selected_item)['values'][0]
        try:
            Event_id = int(event_id_str)  # Convert to integer directly
        except ValueError as e:
            messagebox.showerror("Error", str(e))
            return

        try:
            Organizer_ID = int(self.entry_widgets['Organizer_ID'].get())
            Venue_ID = int(self.entry_widgets['Venue_ID'].get())
            Category_ID = int(self.entry_widgets['Category_ID'].get())

        except ValueError:
            messagebox.showerror("Error", "Organizer ID, Venue ID, and Category_ID must be integer values.")
            return

        Title = self.entry_widgets['Title'].get()
        Description = self.entry_widgets['Description'].get()
        Start_Date = self.entry_widgets['Start_Date'].get()
        End_Date = self.entry_widgets['End_Date'].get()
        Event_Status = self.entry_widgets['Event_Status'].get()

        try:
            database.update_event(Event_id, Organizer_ID, Venue_ID, Category_ID, Title, Description, Start_Date, End_Date, Event_Status)
            self.load_events()
            messagebox.showinfo("Success", "Event updated successfully")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to update event: {e}")


    def delete_event(self):
        selected_items = self.events_tree.selection()
        if not selected_items:
            messagebox.showinfo("Delete Event", "Please select an event to delete.")
            return

        selected_item = selected_items[0]
        event_id_str = str(self.events_tree.item(selected_item)['values'][0])

        # Attempt to strip unwanted characters and convert to int
        clean_event_id_str = event_id_str.strip("(),'")
        try:
            event_id = int(clean_event_id_str)
        except ValueError:
            messagebox.showerror("Error", f"Invalid event ID format: {event_id_str}")
            return

        try:
            database.delete_event(event_id)
            self.load_events()
            messagebox.showinfo("Success", "Event deleted successfully")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to delete event: {e}")
    def load_events(self):
        for i in self.events_tree.get_children():
            self.events_tree.delete(i)
        for event in self.fetch_events():
            # Extract values for each event
            event_id = event["Event_ID"]
            organizer_id = event["Organizer_ID"]
            venue_id = event["Venue_ID"]
            category_id = event["Category_ID"]
            title = event["Title"]
            description = event["Description"]
            start_date = event["Start_Date"]
            end_date = event["End_Date"]
            event_status = event["Event_Status"]

            # Insert the event into the Treeview as a tuple
            self.events_tree.insert('', 'end', values=(event_id, organizer_id, venue_id, category_id, title, description, start_date, end_date, event_status))


    # def load_events(self):
    #     for i in self.events_tree.get_children():
    #         self.events_tree.delete(i)
    #     for event in database.fetch_events():
    #         self.events_tree.insert('', 'end', values=event)
    def fetch_events(self):
        with database.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT Event_ID, Organizer_ID, Venue_ID, Category_ID, Title, Description, Start_Date, End_Date, Event_Status FROM Event")
            columns = [column[0] for column in cursor.description]
            return [dict(zip(columns, row)) for row in cursor.fetchall()]

    # def fetch_events():
    #     with get_connection() as conn:
    #         cursor = conn.cursor()
    #         cursor.execute("SELECT Event_ID, Organizer_ID, Venue_ID, Category_ID, Title, Description, Start_Date, End_Date, Event_Status FROM Event")
    #         columns = [column[0] for column in cursor.description]
    #         return [dict(zip(columns, row)) for row in cursor.fetchall()]


if __name__ == "__main__":
    root = tk.Tk()
    app = EventsGUI(root)
    root.mainloop()
