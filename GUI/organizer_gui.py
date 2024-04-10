import tkinter as tk
from tkinter import ttk, messagebox
import database

class OrganizerGUI:
    def __init__(self, root):
        self.root = root
        self.style = ttk.Style()
        self.style.theme_use('clam')
        self.root.title("Organizer Management System")
        self.frame = ttk.Frame(root)
        self.frame.pack(fill=tk.BOTH, expand=True)
        self.setup_entry_fields()
        self.setup_operation_buttons()
        self.setup_treeview()
        self.load_organizers()
        self.apply_styling()

    def apply_styling(self):
        self.root.configure(bg="#e0f0ff")  # Set background color to light blue

        self.style.configure('TButton', font=('Helvetica', 12), borderwidth='4', background='#4b86b4', foreground='white')
        self.style.map('TButton', foreground=[('pressed', 'red'), ('active', 'blue')], background=[('pressed', '!disabled', 'black'), ('active', 'white')])

        self.style.configure('TEntry', foreground='blue', background='white', borderwidth='2', relief=tk.SOLID)

        self.style.configure('Treeview', background='white', foreground='black', rowheight=25)
        self.style.map('Treeview', background=[('selected', 'blue')])

    # Remaining code stays the same

    def setup_entry_fields(self):
        labels = {
            "Name": "Name:",
            "Description": "Description:",
            "Address": "Address:",
            "Contact_Email": "Contact Email:",
            "Contact_Phone": "Contact Phone:"
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

        self.create_button = ttk.Button(self.button_frame, text="Create", command=self.create)
        self.create_button.pack(side=tk.LEFT, padx=5)

        self.update_button = ttk.Button(self.button_frame, text="Update", command=self.update)
        self.update_button.pack(side=tk.LEFT, padx=5)

        self.delete_button = ttk.Button(self.button_frame, text="Delete", command=self.delete)
        self.delete_button.pack(side=tk.LEFT, padx=5)

    def setup_treeview(self):
        columns = ("Organizer_ID", "Name", "Description", "Address", "Contact_Email", "Contact_Phone")
        self.organizer_tree = ttk.Treeview(self.frame, columns=columns, show="headings")
        for col in columns:
            self.organizer_tree.heading(col, text=col)
            self.organizer_tree.column(col, width=150)

        self.organizer_tree.pack(fill=tk.BOTH, expand=True)

    def create(self):
        try:
            name = self.entry_widgets['Name'].get()
            description = self.entry_widgets['Description'].get()
            address = self.entry_widgets['Address'].get()
            contact_email = self.entry_widgets['Contact_Email'].get()
            contact_phone = self.entry_widgets['Contact_Phone'].get()

            database.add_organizer(name, description, address, contact_email, contact_phone)
            self.load_organizers()
            messagebox.showinfo("Success", "Organizer created successfully")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to create organizer: {e}")

    def update(self):
        selected_item = self.organizer_tree.selection()
        if not selected_item:
            messagebox.showwarning("Warning", "Please select an organizer to update.")
            return

        try:
            organizer_id = self.organizer_tree.item(selected_item)['values'][0]
            name = self.entry_widgets['Name'].get()
            description = self.entry_widgets['Description'].get()
            address = self.entry_widgets['Address'].get()
            contact_email = self.entry_widgets['Contact_Email'].get()
            contact_phone = self.entry_widgets['Contact_Phone'].get()

            database.update_organizer(organizer_id, name, description, address, contact_email, contact_phone)
            self.load_organizers()
            messagebox.showinfo("Success", "Organizer updated successfully")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to update organizer: {e}")

    def delete(self):
        selected_item = self.organizer_tree.selection()
        if not selected_item:
            messagebox.showwarning("Warning", "Please select an organizer to delete.")
            return

        confirm = messagebox.askyesno("Confirm", "Are you sure you want to delete this organizer?")
        if confirm:
            try:
                organizer_id = self.organizer_tree.item(selected_item)['values'][0]
                database.delete_organizer(organizer_id)
                self.load_organizers()
                messagebox.showinfo("Success", "Organizer deleted successfully")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to delete organizer: {e}")

    def load_organizers(self):
        for i in self.organizer_tree.get_children():
            self.organizer_tree.delete(i)
        for organizer in self.fetch_organizers():
            self.organizer_tree.insert('', 'end', values=organizer)

    def fetch_organizers(self):
        return database.fetch_organizers()


if __name__ == "__main__":
    root = tk.Tk()
    app = OrganizerGUI(root)
    root.mainloop()
