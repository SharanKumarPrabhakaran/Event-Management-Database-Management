import tkinter as tk
from tkinter import ttk, messagebox
import database

class VenueGUI:
    def __init__(self, root):
        self.root = root
        self.style = ttk.Style()
        self.style.theme_use('clam')
        self.root.title("Venue Management System")
        self.frame = ttk.Frame(root)
        self.frame.pack(fill=tk.BOTH, expand=True)
        self.setup_entry_fields()
        self.setup_operation_buttons()
        self.setup_treeview()
        self.load_venues()
        self.apply_styling()

    def apply_styling(self):
        self.style.configure('TButton', font=('Helvetica', 12), borderwidth='4')
        self.style.map('TButton', foreground=[('pressed', 'red'), ('active', 'blue')], background=[('pressed', '!disabled', 'black'), ('active', 'white')])
        
        self.style.configure('TEntry', foreground='blue', background='yellow')
        
        self.style.configure('Treeview', background='silver', foreground='black', rowheight=25)
        self.style.map('Treeview', background=[('selected', 'green')])

    def setup_entry_fields(self):
        labels = {
            "Name": "Venue Name:",
            "Address": "Address:",
            "City": "City:",
            "State": "State:",
            "Capacity": "Capacity:",
            "Amenities": "Amenities:"
        }

        self.entry_widgets = {}
        self.entry_frame = ttk.Frame(self.frame)
        self.entry_frame.pack(side=tk.TOP, fill=tk.BOTH, expand=True)

        for field_name, label_text in labels.items():
            label = ttk.Label(self.entry_frame, width=25, justify='center', text=label_text)
            label.pack(side=tk.TOP, padx=5, pady=2)

            entry = ttk.Entry(self.entry_frame, width=25, justify='center')
            entry.pack(side=tk.TOP, padx=5, pady=2)

            self.entry_widgets[field_name] = entry

    def setup_operation_buttons(self):
        self.button_frame = ttk.Frame(self.frame)
        self.button_frame.pack(side=tk.TOP, pady=20)

        self.insert_button = ttk.Button(self.button_frame, text="Insert", command=self.insert)
        self.insert_button.pack(side=tk.LEFT, padx=5)

        self.update_button = ttk.Button(self.button_frame, text="Update", command=self.update)
        self.update_button.pack(side=tk.LEFT, padx=5)

        self.delete_button = ttk.Button(self.button_frame, text="Delete", command=self.delete)
        self.delete_button.pack(side=tk.LEFT, padx=5)

    def setup_treeview(self):
        columns = ("Venue_ID", "Name", "Address", "City", "State", "Capacity", "Amenities")
        self.venue_tree = ttk.Treeview(self.frame, columns=columns, show="headings", xscrollcommand=lambda f, l: self.hsb.set(f, l))
        
        for col in columns:
            self.venue_tree.heading(col, text=col)
            self.venue_tree.column(col, width=100)

        self.venue_tree.pack(fill=tk.BOTH, expand=True)

        self.hsb = ttk.Scrollbar(self.frame, orient="horizontal", command=self.venue_tree.xview)
        self.hsb.pack(fill=tk.X, side=tk.BOTTOM)

        self.venue_tree.configure(xscrollcommand=self.hsb.set)

        self.venue_tree.bind("<ButtonRelease-1>", self.on_select)


    def on_select(self, event):
        selected_item = self.venue_tree.selection()
        if selected_item:
            item = selected_item[0]
            # Rest of your code to retrieve and display details of the selected item
        else:
            # Handle case where no item is selected
            messagebox.showinfo("Info", "Please select a venue.")


    def insert(self):
        try:
            name = self.entry_widgets['Name'].get()
            address = self.entry_widgets['Address'].get()
            city = self.entry_widgets['City'].get()
            state = self.entry_widgets['State'].get()
            capacity = int(self.entry_widgets['Capacity'].get())
            amenities = self.entry_widgets['Amenities'].get()

            database.add_venue(name, address, city, state, capacity, amenities)
            self.load_venues()
            messagebox.showinfo("Success", "Venue added successfully")
        except ValueError as e:
            messagebox.showerror("Error", f"Invalid input: {e}")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to add venue: {e}")

    def update(self):
        try:
            # Retrieve the selected item from the treeview
            selected_item = self.venue_tree.selection()[0]
            # Extract the Venue_ID from the selected item
            venue_id = self.venue_tree.item(selected_item)['values'][0]

            # Retrieve other data from entry widgets
            name = self.entry_widgets['Name'].get()
            address = self.entry_widgets['Address'].get()
            city = self.entry_widgets['City'].get()
            state = self.entry_widgets['State'].get()
            capacity = int(self.entry_widgets['Capacity'].get())
            amenities = self.entry_widgets['Amenities'].get()

            # Call update_venue with the extracted venue_id
            database.update_venue(venue_id, name, address, city, state, capacity, amenities)
            self.load_venues()
            messagebox.showinfo("Success", "Venue updated successfully")
        except IndexError:
            messagebox.showerror("Error", "Please select a venue to update")
        except ValueError as e:
            messagebox.showerror("Error", f"Invalid input: {e}")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to update venue: {e}")


    def delete(self):
        try:
            # Retrieve the selected item from the treeview
            selected_item = self.venue_tree.selection()[0]
            # Extract the Venue_ID from the selected item
            venue_id = self.venue_tree.item(selected_item)['values'][0]

            database.delete_venue(venue_id)
            self.load_venues()
            messagebox.showinfo("Success", "Venue deleted successfully")
        except IndexError:
            messagebox.showerror("Error", "Please select a venue to delete")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to delete venue: {e}")



    def load_venues(self):
        for i in self.venue_tree.get_children():
            self.venue_tree.delete(i)
        for venue in self.fetch_venues():
            self.venue_tree.insert('', 'end', values=venue)

    def fetch_venues(self):
        return database.fetch_venues()

if __name__ == "__main__":
    root = tk.Tk()
    app = VenueGUI(root)
    root.mainloop()
