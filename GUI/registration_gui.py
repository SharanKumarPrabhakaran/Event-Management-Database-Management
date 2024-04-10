import tkinter as tk
from tkinter import ttk, messagebox
from datetime import datetime
import database

class RegistrationGUI:
    def __init__(self, root):
        self.root = root
        self.style = ttk.Style()
        self.style.theme_use('clam')  
        self.root.title("Registration Management System")
        self.frame = ttk.Frame(root)
        self.frame.pack(fill=tk.BOTH, expand=True)
        self.setup_entry_fields()
        self.setup_operation_buttons()
        self.setup_treeview()
        self.load_registrations()
        self.apply_styling()

    def apply_styling(self):
        self.root.configure(bg="#e0f0ff")  # Set background color to light blue

        self.style.configure('TButton', font=('Helvetica', 12), borderwidth='4', background='#4b86b4', foreground='white')
        self.style.map('TButton', foreground=[('pressed', 'red'), ('active', 'blue')], background=[('pressed', '!disabled', 'black'), ('active', 'white')])
        
        self.style.configure('TEntry', foreground='blue', background='white', borderwidth='2', relief=tk.SOLID)

        self.style.configure('Treeview', background='white', foreground='black', rowheight=25)
        self.style.map('Treeview', background=[('selected', '#4b86b4')])

    def setup_entry_fields(self):
        labels = {
            "Event_ID": "Event ID:",
            "Attendee_ID": "Attendee ID:",
            "Registration_Date": "Registration Date (YYYY-MM-DD):",
            "Payment_Status": "Payment Status:",
            "Price": "Price:",
            "Discount": "Discount:",
            "Ticket_Type": "Ticket Type:"
        }

        self.entry_widgets = {}
        self.entry_frame = ttk.Frame(self.frame)  
        self.entry_frame.pack(side=tk.TOP, fill=tk.BOTH, expand=True, padx=20, pady=20)  

        for field_name, label_text in labels.items():
            label = ttk.Label(self.entry_frame, width=25, justify='center', text=label_text)
            label.pack(side=tk.TOP, padx=5, pady=5)

            entry = ttk.Entry(self.entry_frame, width=25, justify='center')  
            entry.pack(side=tk.TOP, padx=5, pady=5)

            self.entry_widgets[field_name] = entry

    def setup_operation_buttons(self):
        self.button_frame = ttk.Frame(self.frame)  # Create a frame to contain the buttons
        self.button_frame.pack(side=tk.TOP, pady=20)  # Pack it at the top with some padding

        self.register_button = ttk.Button(self.button_frame, text="Register", command=self.register)
        self.register_button.pack(side=tk.TOP, padx=5, pady=5)  # Pack the button to the top with some padding


    def setup_treeview(self):
        columns = ("Registration_ID", "Event_ID", "Attendee_ID", "Registration_Date", "Payment_Status", "Price", "Discount", "Ticket_Type")
        self.registration_tree = ttk.Treeview(self.frame, columns=columns, show="headings", xscrollcommand=lambda f, l: self.hsb.set(f, l))
        
        self.registration_tree.heading("Registration_ID", text="Registration ID")
        self.registration_tree.heading("Event_ID", text="Event ID")
        self.registration_tree.heading("Attendee_ID", text="Attendee ID")
        self.registration_tree.heading("Registration_Date", text="Registration Date")
        self.registration_tree.heading("Payment_Status", text="Payment Status")
        self.registration_tree.heading("Price", text="Price")
        self.registration_tree.heading("Discount", text="Discount")
        self.registration_tree.heading("Ticket_Type", text="Ticket Type")
        
        for col in columns:
            self.registration_tree.column(col, width=100)

        self.registration_tree.pack(fill=tk.BOTH, expand=True)

        self.hsb = ttk.Scrollbar(self.frame, orient="horizontal", command=self.registration_tree.xview)
        self.hsb.pack(fill=tk.X, side=tk.BOTTOM)

        self.registration_tree.configure(xscrollcommand=self.hsb.set)

    def register(self):
        try:
            event_id = int(self.entry_widgets['Event_ID'].get())
            attendee_id = int(self.entry_widgets['Attendee_ID'].get())
            registration_date = self.entry_widgets['Registration_Date'].get()
            payment_status = int(self.entry_widgets['Payment_Status'].get())
            price = float(self.entry_widgets['Price'].get())
            discount = float(self.entry_widgets['Discount'].get())
            ticket_type = self.entry_widgets['Ticket_Type'].get()

            if not self.validate_date(registration_date):
                messagebox.showerror("Error", "Registration Date must be in YYYY-MM-DD format.")
                return

            if payment_status == 0:
                messagebox.showwarning("Warning", "Payment status is unsuccessful.")

            database.add_registration(
                event_id, 
                attendee_id, 
                registration_date, 
                payment_status,
                price,
                discount,
                ticket_type
            )
            self.load_registrations()
            # messagebox.showinfo("Success", "Registration added successfully")
        except ValueError as e:
            messagebox.showerror("Error", f"Invalid input: {e}")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to add registration: {e}")


    def validate_date(self, date_text):
        try:
            datetime.strptime(date_text, '%Y-%m-%d')
            return True
        except ValueError:
            return False

    def load_registrations(self):
        self.registration_tree.delete(*self.registration_tree.get_children())
        for registration in self.fetch_registrations():
            self.registration_tree.insert('', 'end', values=registration)

    def fetch_registrations(self):
        return database.fetch_registrations()


if __name__ == "__main__":
    root = tk.Tk()
    app = RegistrationGUI(root)
    root.mainloop()
