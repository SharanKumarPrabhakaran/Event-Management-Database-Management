--------------------------------------------------------------------------------
-- Data Insertion Into the Tables
--------------------------------------------------------------------------------

-- Data insertion to Organizer table
INSERT INTO Organizer (Name, Description, Address, Contact_Email, Contact_Phone) VALUES
('Global Tech Conferences', 'An international organizer for technology conferences.', '1234 Tech Lane, Silicon Valley, CA', 'contact@globaltechconf.com', '800-123-4567'),
('Health & Wellness Events', 'Focused on health and wellness events around the world.', '4321 Wellness Blvd, Springfield, IL', 'info@healthwellnessevents.com', '800-234-5678'),
('Green Earth Summits', 'Organizing environmental conferences since 2005.', '9876 Green Rd, Harmony, TX', 'support@greenearthsummits.com', '800-345-6789'),
('InnovateX', 'Promoting innovation and startup culture.', '2468 Innovate St, New York, NY', 'hello@innovatex.com', '800-456-7890'),
('Code World', 'Bringing together the best in the programming world.', '1357 Code Ave, Boston, MA', 'contact@codeworld.com', '800-567-8901'),
('Future Finance Forums', 'Conferences and workshops on the future of finance.', '9753 Finance Way, Wall Street, NY', 'info@futurefinanceforums.com', '800-678-9012'),
('Creative Minds', 'Workshops and talks that unleash creativity.', '8642 Create Ln, San Francisco, CA', 'support@creativeminds.com', '800-789-0123'),
('EduLeaders Summit', 'Shaping the future of education through dialogue.', '7531 Educate Rd, Cambridge, MA', 'hello@eduleaderssummit.com', '800-890-1234'),
('Sports Management International', 'International sports events and management conferences.', '9512 Sport Ave, Chicago, IL', 'contact@sportsmanagement.com', '800-901-2345'),
('Food & Beverage Expos', 'A series of expos showcasing the latest in food and beverages.', '1598 Gourmet Blvd, New Orleans, LA', 'info@fandbexpos.com', '800-012-3456');
GO

--------------------------------------------------------------------------------

-- Data insertion to Venue table
INSERT INTO Venue (Name, Address, City, State, Capacity, Amenities) VALUES
('The Grand Hall', '123 Concert Drive', 'Metropolis', 'Rhode Island', 10, 'Parking, Catering, Audio/Visual Equipment'),
('Riverside Convention Center', '456 Riverside Avenue', 'Lakeside', 'Massachusetts', 10, 'Wi-Fi, Projectors, Sound System'),
('Central Expo', '789 Central Blvd', 'Midtown', 'Rhode Island', 10, 'Breakout Rooms, Wi-Fi, Catering'),
('Skyline Banquet', '101 Skyline Road', 'Uptown', 'Massachusetts', 10, 'Sky View, Bar Service, Modern Decor'),
('Green Outdoor Park', '202 Nature Path', 'Greenville', 'Massachusetts', 15, 'Natural Setting, Tents Available, Parking'),
('Starlight Ballroom', '303 Danceway Ave', 'Star City', 'Rhode Island', 30, 'Dance Floor, Lighting Systems, Bar'),
('Tech Pavilion', '404 Innovation Loop', 'Techtown', 'New Hampshire', 17, 'High-Speed Internet, Presentation Tools'),
('Heritage Museum', '505 History Place', 'Oldtown', 'New Hampshire', 10, 'Cultural Setting, Guided Tours, Audio Guides'),
('Oceanside Theater', '606 Seaside Road', 'Oceanview', 'Vermont', 19, 'Stage, Sound & Lighting, Dressing Rooms'),
('City Sports Arena', '707 Athlete Avenue', 'Sportstown', 'Vermont', 90, 'Large Seating, Locker Rooms, Scoreboards');
GO

--------------------------------------------------------------------------------

-- Data insertion to Sponsor table
INSERT INTO Sponsor (Name, Contact_Email, Contact_Phone) VALUES
('InnovateTech', 'contact@innovatetech.com', '123-456-7890'),
('HealthPlus', 'info@healthplus.com', '234-567-8901'),
('GreenWorld', 'support@greenworld.com', '345-678-9012'),
('FutureFinance', 'hello@futurefinance.com', '456-789-0123'),
('GlobalEducation', 'contact@globaleducation.com', '567-890-1234'),
('SportsNation', 'info@sportsnation.com', '678-901-2345'),
('FoodFiesta', 'support@foodfiesta.com', '789-012-3456'),
('TechAdventures', 'hello@techadventures.com', '890-123-4567'),
('CreativeMinds', 'contact@creativeminds.com', '901-234-5678'),
('EcoSolutions', 'info@ecosolutions.com', '012-345-6789');
GO

--------------------------------------------------------------------------------

-- Data insertion to Event_Category table
INSERT INTO Event_Category (Category_name) VALUES
('Technology & Innovation'),
('Health & Wellness'),
('Environment & Sustainability'),
('Education & Learning'),
('Sports & Fitness'),
('Food & Culinary'),
('Arts & Culture'),
('Business & Finance'),
('Science & Research'),
('Entertainment & Media');
GO

--------------------------------------------------------------------------------

-- Data insertion to Event table
INSERT INTO Event (Organizer_ID, Venue_ID, Category_ID, Title, Description, Start_Date, End_Date, Event_Status) VALUES
(1, 1, 1, 'Global Tech Symposium', 'A symposium showcasing cutting-edge technology innovations.', '2024-05-15', '2024-05-17', 'Scheduled'),
(2, 2, 2, 'Wellness and Health Expo', 'Exploring the latest trends in wellness and health.', '2024-06-20', '2024-06-22', 'Scheduled'),
(3, 3, 3, 'Green Earth Festival', 'A celebration of sustainable living and green technologies.', '2024-07-05', '2024-07-07', 'Scheduled'),
(4, 4, 4, 'Learning & Development Conference', 'A conference dedicated to innovations in education and learning.', '2024-08-15', '2024-08-17', 'Scheduled'),
(5, 5, 5, 'Annual Sports Summit', 'A summit focusing on the future of sports and fitness.', '2024-09-10', '2024-09-12', 'Scheduled'),
(6, 6, 6, 'Culinary Arts Show', 'Showcasing the latest trends and techniques in the culinary world.', '2024-10-25', '2024-10-27', 'Scheduled'),
(7, 7, 7, 'Cultural Arts Festival', 'A festival celebrating arts and culture from around the world.', '2024-11-15', '2024-11-17', 'Scheduled'),
(8, 8, 8, 'Entrepreneurship & Finance Forum', 'A forum for discussing the latest trends in business and finance.', '2024-12-05', '2024-12-07', 'Scheduled'),
(9, 1, 9, 'Science Research Conference', 'A conference presenting the latest findings in science and research.', '2025-01-20', '2025-01-22', 'Scheduled'),
(10, 2, 10, 'Media and Entertainment Expo', 'An expo exploring new trends in media and entertainment.', '2025-02-15', '2025-02-17', 'Scheduled');
GO

--------------------------------------------------------------------------------

-- Data insertion to Event_Speakers table
INSERT INTO Event_Speakers (Event_ID, Full_Name, Biography, Expertise, Contact_Email, Contact_Phone) VALUES
(1, 'Alex Johnson', 'An experienced tech innovator and speaker.', 'Technology & Innovation', 'alex.johnson@email.com', '555-0101'),
(2, 'Samantha Green', 'A renowned health and wellness advocate.', 'Health & Wellness', 's.green@email.com', '555-0202'),
(3, 'Chris Blue', 'Environmental activist with 10 years of experience.', 'Environment & Sustainability', 'c.blue@email.com', '555-0303'),
(4, 'Jamie Rivera', 'Expert in modern educational techniques.', 'Education & Learning', 'j.rivera@email.com', '555-0404'),
(5, 'Jordan Casey', 'Former professional athlete turned coach.', 'Sports & Fitness', 'j.casey@email.com', '555-0505'),
(6, 'Taylor Reed', 'Innovative chef and food industry consultant.', 'Food & Culinary', 't.reed@email.com', '555-0606'),
(7, 'Robin Lee', 'Curator and cultural historian.', 'Arts & Culture', 'r.lee@email.com', '555-0707'),
(8, 'Casey Smith', 'Entrepreneur and financial analyst.', 'Business & Finance', 'casey.smith@email.com', '555-0808'),
(9, 'Pat Morgan', 'Leading researcher in renewable energy.', 'Science & Research', 'p.morgan@email.com', '555-0909'),
(10, 'Drew Kim', 'Film director and media critic.', 'Entertainment & Media', 'd.kim@email.com', '555-1010'),
(4, 'Cole White', 'Cole White with 10 years of experience in the field.', 'Business & Finance', 'obrown@jackson-evans.com', '555-4411'),
(10, 'Samantha Hall', 'Samantha Hall with 15 years of experience in the field.', 'Education & Learning', 'hhiggins@gmail.com', '555-6054'),
(8, 'Vanessa Torres MD', 'Vanessa Torres MD with 18 years of experience in the field.', 'Arts & Culture', 'hernandezjonathan@gmail.com', '555-9847'),
(5, 'Kevin Grant', 'Kevin Grant with 8 years of experience in the field.', 'Entertainment & Media', 'parsonschristopher@king.com', '555-8206'),
(3, 'Connie Garcia', 'Connie Garcia with 17 years of experience in the field.', 'Sports & Fitness', 'bgonzalez@yahoo.com', '555-1733'),
(9, 'Lauren Webb', 'Lauren Webb with 20 years of experience in the field.', 'Entertainment & Media', 'breanna53@russo-gallagher.com', '555-8362'),
(4, 'Anthony Berry', 'Anthony Berry with 16 years of experience in the field.', 'Arts & Culture', 'markdaniels@townsend-martin.com', '555-5058'),
(1, 'Brianna Norman', 'Brianna Norman with 12 years of experience in the field.', 'Technology & Innovation', 'stephanie38@roberts-hamilton.biz', '555-5950'),
(1, 'Barbara Graham', 'Barbara Graham with 12 years of experience in the field.', 'Education & Learning', 'rburns@stephenson.com', '555-1202'),
(7, 'Shirley Barrett', 'Shirley Barrett with 20 years of experience in the field.', 'Sports & Fitness', 'huberlaura@yahoo.com', '555-5577'),
(8, 'Michael Sweeney', 'Michael Sweeney with 6 years of experience in the field.', 'Technology & Innovation', 'csteele@gmail.com', '555-1337'),
(4, 'Joseph Mckay', 'Joseph Mckay with 11 years of experience in the field.', 'Technology & Innovation', 'thompsonjohn@yahoo.com', '555-1371'),
(2, 'Denise Steele', 'Denise Steele with 9 years of experience in the field.', 'Sports & Fitness', 'cherylalvarez@carrillo-orr.com', '555-3225'),
(1, 'Michele Morgan', 'Michele Morgan with 19 years of experience in the field.', 'Arts & Culture', 'bushdeborah@gmail.com', '555-2722'),
(10, 'Laurie Turner', 'Laurie Turner with 7 years of experience in the field.', 'Entertainment & Media', 'bradshawamanda@williams.com', '555-5646'),
(9, 'Dr. William Blankenship', 'Dr. William Blankenship with 5 years of experience in the field.', 'Business & Finance', 'chavezdonna@davis-collins.net', '555-8784'),
(4, 'Stephanie Williams', 'Stephanie Williams with 13 years of experience in the field.', 'Science & Research', 'donald29@hotmail.com', '555-9093'),
(3, 'John Walker', 'John Walker with 5 years of experience in the field.', 'Health & Wellness', 'rosariothomas@shelton.org', '555-7524'),
(4, 'Tracy Mendoza', 'Tracy Mendoza with 6 years of experience in the field.', 'Entertainment & Media', 'fergusonmarcus@smith.com', '555-8902'),
(6, 'Jacob Rice', 'Jacob Rice with 14 years of experience in the field.', 'Arts & Culture', 'williamsbonnie@flowers.com', '555-2081');
GO

--------------------------------------------------------------------------------

-- Data insertion to Session_or_Workshop table
INSERT INTO Session_or_Workshop (Event_ID, Title, Start_Time, End_Time, Description) VALUES
(1, 'Innovative Tech Trends', '09:00', '10:30', 'Exploring the latest trends in technology and innovation.'),
(1, 'Blockchain Basics', '11:00', '12:30', 'An introduction to blockchain technology and its applications.'),
(2, 'Mindfulness in the Workplace', '09:00', '11:00', 'Strategies for incorporating mindfulness into your daily work routine.'),
(3, 'Sustainable Urban Living', '14:00', '16:30', 'Designing sustainable urban environments for the future.'),
(4, 'Educational Technology Tools', '16:00', '18:00', 'A look at the latest tools in educational technology.'),
(5, 'Enhancing Athletic Performance', '09:00', '10:00', 'Techniques and strategies for improving athletic performance.'),
(6, 'The Future of Food', '11:00', '14:00', 'Exploring the future trends in the food industry.'),
(7, 'Art in the Digital Age', '14:00', '15:30', 'How digital media is transforming traditional art forms.'),
(8, 'Innovations in Finance', '16:00', '18:00', 'Emerging innovations shaping the future of finance.'),
(9, 'Renewable Energy Solutions', '09:00', '12:00', 'Current trends and future possibilities in renewable energy.'),
(9, 'Virtual Reality in Education', '14:00', '15:00', 'Building and maintaining a personal brand in the digital age.'),
(3, 'Cryptocurrency 101', '09:00', '11:00', 'Learn the latest trends in web development and coding.'),
(6, 'The Art of Leadership', '10:00', '12:00', 'Explore how urban farming is changing the landscape of city living.'),
(10, 'Advanced Machine Learning', '09:00', '10:00', 'Understanding the basics of cryptocurrencies and how to invest.'),
(10, 'Effective Team Communication', '10:00', '12:00', 'Building and maintaining a personal brand in the digital age.'),
(10, 'Urban Farming Innovations', '12:00', '15:00', 'Building and maintaining a personal brand in the digital age.'),
(4, 'Yoga and Wellness', '11:00', '12:00', 'Incorporate yoga into your daily routine for better health.'),
(1, 'Yoga and Wellness', '12:00', '13:00', 'Explore how urban farming is changing the landscape of city living.'),
(3, 'Effective Team Communication', '13:00', '16:00', 'Incorporate yoga into your daily routine for better health.'),
(7, 'Advanced Machine Learning', '12:00', '15:00', 'Building and maintaining a personal brand in the digital age.'),
(3, 'Virtual Reality in Education', '14:00', '16:00', 'How virtual reality is being used to enhance learning experiences.'),
(9, 'Effective Team Communication', '10:00', '12:00', 'How virtual reality is being used to enhance learning experiences.'),
(8, 'The Art of Leadership', '10:00', '11:00', 'Dive deeper into machine learning techniques and their applications.'),
(6, 'Virtual Reality in Education', '10:00', '13:00', 'Understanding the basics of cryptocurrencies and how to invest.'),
(7, 'Modern Web Development Techniques', '12:00', '15:00', 'Dive deeper into machine learning techniques and their applications.'),
(7, 'Urban Farming Innovations', '09:00', '11:00', 'Understanding the basics of cryptocurrencies and how to invest.'),
(9, 'Introduction to IoT', '14:00', '15:00', 'Explore how urban farming is changing the landscape of city living.'),
(1, 'Modern Web Development Techniques', '09:00', '12:00', 'Understanding the basics of cryptocurrencies and how to invest.'),
(4, 'Modern Web Development Techniques', '14:00', '15:00', 'Learn the latest trends in web development and coding.'),
(9, 'Urban Farming Innovations', '11:00', '14:00', 'Dive deeper into machine learning techniques and their applications.');
GO

--------------------------------------------------------------------------------

-- Data insertion to Event_Sponsor_Details table
INSERT INTO Event_Sponsor_Details (Event_ID, Sponsor_ID, Contribution_Level) VALUES
(1, 1, 5000),
(2, 2, 15000),
(3, 3, 20000),
(4, 4, 30000),
(5, 5, 5000),
(6, 6, 7000),
(7, 7, 7000),
(8, 8, 6000),
(9, 9, 6786),
(10, 10, 6786),
(6, 4, 5000),
(7, 6, 30000),
(7, 4, 5000),
(6, 10, 7000),
(2, 6, 10000),
(10, 1, 15000),
(3, 7, 15000),
(6, 7, 10000),
(6, 9, 15000),
(7, 4, 20000),
(3, 4, 7000),
(3, 6, 20000),
(9, 2, 30000),
(1, 2, 10000),
(10, 2, 15000),
(10, 9, 20000),
(10, 7, 30000),
(8, 7, 30000),
(2, 4, 10000),
(5, 8, 7000);
GO

--------------------------------------------------------------------------------

-- Data insertion to Attendee table
INSERT INTO Attendee (First_name, Last_name, Contact_email, Contact_phone) VALUES
('Emma', 'Johnson', 'emma.johnson@email.com', '555-1001'),
('Liam', 'Smith', 'liam.smith@email.com', '555-1002'),
('Olivia', 'Williams', 'olivia.williams@email.com', '555-1003'),
('Noah', 'Brown', 'noah.brown@email.com', '555-1004'),
('Ava', 'Jones', 'ava.jones@email.com', '555-1005'),
('Oliver', 'Garcia', 'oliver.garcia@email.com', '555-1006'),
('Isabella', 'Miller', 'isabella.miller@email.com', '555-1007'),
('Elijah', 'Davis', 'elijah.davis@email.com', '555-1008'),
('Sophia', 'Rodriguez', 'sophia.rodriguez@email.com', '555-1009'),
('Logan', 'Martinez', 'logan.martinez@email.com', '555-1010');
GO

--------------------------------------------------------------------------------

-- Data insertion to Registration table
INSERT INTO Registration (Event_ID, Attendee_ID, Registration_Date, Payment_Status, Price, Discount, Ticket_type) VALUES
(1, 1, '2024-04-01', 1, 100.00, 0.10, 'Standard'),
(2, 2, '2024-04-02', 1, 150.00, 0.20, 'VIP'),
(3, 3, '2024-04-03', 1, 120.00, 0.40, 'Standard'),
(4, 4, '2024-04-04', 1, 100.00, 0.10, 'Standard'),
(5, 5, '2024-04-05', 1, 120.00, 0.20, 'Standard'),
(6, 6, '2024-04-06', 1, 100.00, 0.10, 'Standard'),
(7, 7, '2024-04-07', 1, 120.00, 0.40, 'Standard'),
(8, 8, '2024-04-08', 1, 100.00, 0.10, 'Standard'),
(9, 9, '2024-04-09', 1, 100.00, 0.10, 'Standard'),
(10, 10, '2024-04-10', 1, 150.00, 0.20, 'VIP'),
(5, 1, '2024-04-01', 1, 120.00, 0.10, 'Standard'),
(6, 7, '2024-04-27', 0, 100.00, 0.50, 'Standard'), 
(9, 6, '2024-04-05', 1, 100.00, 0.10, 'Standard'),
(1, 9, '2024-04-15', 0, 150.00, 0.20, 'VIP'),
(3, 3, '2024-04-05', 0, 120.00, 0.40, 'Standard'),
(8, 8, '2024-04-11', 0, 120.00, 0.10, 'Standard'),
(8, 10, '2024-04-24', 0, 100.00, 0.40, 'Standard'),
(5, 1, '2024-04-17', 1, 120.00, 0.20, 'Standard'),
(10, 3, '2024-04-03', 1, 150.00, 0.10, 'VIP'),
(8, 8, '2024-04-19', 1, 100.00, 0.10, 'Standard'),
(10, 6, '2024-04-18', 1, 150.00, 0.20, 'VIP'),
(2, 5, '2024-04-12', 0, 150.00, 0.20, 'VIP'),
(9, 5, '2024-04-10', 0, 250.00, 0.40, 'VIP'),
(2, 10, '2024-04-08', 1, 150.00, 0.20, 'VIP'),
(7, 9, '2024-04-01', 1, 120.00, 0.40, 'Standard'),
(1, 7, '2024-04-02', 1, 100.00, 0.10, 'Standard'),
(2, 1, '2024-04-20', 0, 150.00, 0.20, 'Standard'),
(3, 10, '2024-04-24', 1, 120.00, 0.40, 'Standard'),
(9, 6, '2024-04-16', 0, 120.00, 0.20, 'Standard'),
(8, 2, '2024-04-15', 1, 100.00, 0.10, 'Standard');
GO

SELECT * FROM Registration

--------------------------------------------------------------------------------

-- Data insertion to Ticket table
INSERT INTO Ticket (Registration_ID, Attendee_ID, Issue_Date, Valid_until, Seat_number, Price, Discounted_Price, Ticket_type) VALUES
(1, 1, '2024-05-01', '2024-06-10', 'A1', 100.00, 90.00, 'Standard'),
(2, 2, '2024-05-02', '2024-06-10', 'A2', 150.00, 120.00, 'VIP'),
(3, 3, '2024-05-03', '2024-06-20', 'B1', 100.00, 90.00, 'Standard'),
(4, 4, '2024-05-04', '2024-06-20', 'B2', 150.00, 120.00, 'VIP'),
(5, 5, '2024-05-05', '2024-07-05', 'C1', 100.00, 90.00, 'Standard'),
(6, 6, '2024-05-06', '2024-07-05', 'C2', 150.00, 120.00, 'VIP'),
(7, 7, '2024-05-07', '2024-08-15', 'D1', 100.00, 90.00, 'Standard'),
(8, 8, '2024-05-08', '2024-08-15', 'D2', 150.00, 120.00, 'VIP'),
(9, 9, '2024-05-09', '2024-09-10', 'E1', 100.00, 90.00, 'Standard'),
(10, 10, '2024-05-10', '2024-09-10', 'E2', 150.00, 120.00, 'VIP'),
(3, 5, '2024-06-01', '2024-07-10', 'F1', 120.00, 72.00, 'Standard'),
(5, 8, '2024-06-02', '2024-07-10', 'F2', 180.00, 108.00, 'VIP'),
(1, 1, '2024-06-03', '2024-08-01', 'G1', 120.00, 72.00, 'Standard'),
(2, 7, '2024-06-04', '2024-08-01', 'G2', 180.00, 108.00, 'VIP'),
(7, 2, '2024-06-05', '2024-09-01', 'H1', 120.00, 72.00, 'Standard'),
(8, 6, '2024-06-06', '2024-09-01', 'H2', 180.00, 108.00, 'VIP'),
(4, 9, '2024-06-07', '2024-10-05', 'I1', 120.00, 72.00, 'Standard'),
(6, 3, '2024-06-08', '2024-10-05', 'I2', 180.00, 108.00, 'VIP'),
(10, 4, '2024-06-09', '2024-11-10', 'J1', 120.00, 72.00, 'Standard'),
(9, 10, '2024-06-10', '2024-11-10', 'J2', 180.00, 108.00, 'VIP'),
(3, 1, '2024-06-11', '2024-12-01', 'K1', 120.00, 72.00, 'Standard'),
(7, 2, '2024-06-12', '2024-12-01', 'K2', 180.00, 108.00, 'VIP'),
(4, 6, '2024-06-13', '2025-01-05', 'L1', 120.00, 72.00, 'Standard'),
(8, 7, '2024-06-14', '2025-01-05', 'L2', 180.00, 108.00, 'VIP'),
(1, 3, '2024-06-15', '2025-02-10', 'M1', 120.00, 72.00, 'Standard'),
(5, 8, '2024-06-16', '2025-02-10', 'M2', 180.00, 108.00, 'VIP'),
(10, 9, '2024-06-17', '2025-03-01', 'N1', 120.00, 72.00, 'Standard'),
(2, 4, '2024-06-18', '2025-03-01', 'N2', 180.00, 108.00, 'VIP'),
(6, 5, '2024-06-19', '2025-04-05', 'O1', 120.00, 72.00, 'Standard'),
(9, 10, '2024-06-20', '2025-04-05', 'O2', 180.00, 108.00, 'VIP'),
(1, 1, '2024-05-01', '2024-07-10', 'A1', 100.00, 90.00, 'Standard'),
(2, 2, '2024-05-02', '2024-08-10', 'A2', 150.00, 120.00, 'VIP'),
(3, 3, '2024-05-03', '2024-09-20', 'B1', 100.00, 90.00, 'Standard'),
(4, 4, '2024-05-04', '2024-10-20', 'B2', 150.00, 120.00, 'VIP'),
(5, 5, '2024-05-05', '2024-06-05', 'C1', 100.00, 90.00, 'Standard'),
(1, 1, '2024-05-01', '2024-07-10', 'A1', 100.00, 90.00, 'Standard');
GO

--------------------------------------------------------------------------------

-- Data insertion to Feedback table
INSERT INTO Feedback (Event_ID, Attendee_ID, Comment, Rating, Submission_Date) VALUES
(1, 1, 'Incredible event, very insightful!', 4, '2024-06-12'),
(2, 2, 'Great speakers, but the venue was a bit crowded.', 3.5, '2024-06-12'),
(3, 3, 'Loved the wellness workshops!', 4, '2024-07-18'),
(4, 4, 'Wished for more networking opportunities.', 5, '2024-07-18'),
(5, 5, 'The sustainability topics were very current and useful.', 4.5, '2024-08-23'),
(6, 6, 'Good event, but some sessions were overlapping.', 5, '2024-08-23'),
(7, 7, 'Excellent educational content, learned a lot!', 3, '2024-09-18'),
(8, 8, 'Venue was fantastic, but some talks were too technical.', 2, '2024-09-18'),
(9, 9, 'The sports summit was engaging and informative.', 3.5, '2024-10-13'),
(10, 10, 'Great event, but registration process could be smoother.', 5, '2024-10-13'),
(4, 3, 'The educational content was exceptional, learned a lot!', 4.5, '2024-11-12'),
(7, 6, 'Good event overall, but could have more interactive sessions.', 3, '2024-11-12'),
(2, 5, 'The keynote speaker was fantastic, but the workshop timings were not convenient.', 3.5, '2024-12-18'),
(6, 8, 'Enjoyed the networking opportunities, but some sessions felt repetitive.', 5, '2024-12-18'),
(1, 9, 'The tech symposium exceeded my expectations, great job!', 4.5, '2025-01-23'),
(8, 2, 'The finance talks were insightful, but the venue lacked proper seating arrangements.', 3, '2025-01-23'),
(5, 4, 'The sports summit had a great lineup of speakers, but the event duration was too long.', 4, '2025-02-17'),
(10, 7, 'The media and entertainment expo was informative, but could include more hands-on workshops.', 3.5, '2025-02-17'),
(3, 10, 'The wellness workshops were rejuvenating, but the food options were limited.', 4, '2025-03-13'),
(9, 1, 'The science research conference provided valuable insights, looking forward to the next one!', 4.5, '2025-03-13'),
(5, 6, 'Excellent event organization, but some sessions were too crowded.', 4, '2024-11-20'),
(3, 3, 'The environmental talks were eye-opening, but the venue could be improved.', 3.5, '2024-12-02'),
(7, 8, 'The educational content was top-notch, but the event schedule was too packed.', 4, '2025-01-05'),
(2, 9, 'Enjoyed the health and wellness expo, but the registration process was slow.', 3, '2025-01-30'),
(4, 2, 'The learning & development conference was informative, but lacked practical workshops.', 4, '2025-02-28'),
(8, 10, 'The entrepreneurship forum was inspiring, but some sessions felt repetitive.', 3.5, '2025-03-15'),
(6, 7, 'The culinary arts show had amazing food, but the venue was too small.', 5, '2025-03-28'),
(1, 4, 'The tech symposium was well-organized, but the Wi-Fi connectivity was poor.', 3, '2025-04-10'),
(10, 5, 'The media expo showcased interesting technologies, but the panel discussions were lacking.', 4, '2025-04-25'),
(9, 9, 'The science research conference had engaging speakers, but the sessions were too long.', 3.5, '2025-05-15');
GO

--------------------------------------------------------------------------------

