# 🌿 Al-Hadika Pest Control & Garden Services

**Arabic:** الحديقة - خدمات مكافحة الآفات والحدائق

A professional pest control and garden services website built with Ruby on Rails.

---

## 📋 Table of Contents

- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Contact Form Setup](#contact-form-setup)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

---

## 🏢 About

Al-Hadika is a comprehensive pest control and garden services company based in Batroun, Lebanon. This website provides:

- Information about our professional services
- Online contact form with email notifications
- Live business hours status (Open/Closed indicator)
- Service details with interactive modals
- Google Maps integration
- WhatsApp integration for instant communication

**Tagline:** *We eliminate what bugs you.*

---

## ✨ Features

### 🎯 Core Features
- **Responsive Design** - Mobile-first design that works on all devices
- **Bilingual Branding** - English (Al-Hadika) and Arabic (الحديقة)
- **Live Business Status** - Automatically shows if business is Open/Closed based on Lebanon timezone
- **Interactive Service Modals** - Click any service to see detailed information
- **Contact Form** - Sends emails directly to business email (support@al-hadika.com)
- **WhatsApp Integration** - Direct links to start WhatsApp conversations
- **Google Maps** - Integrated map showing business location in Batroun

### 📱 Pages
1. **Home** - Hero slideshow with 5 service highlights, statistics, reviews
2. **Services** - Complete list of residential, commercial, and specialized services
3. **About** - Company information and values (coming soon)
4. **Reviews** - Customer testimonials and ratings (coming soon)
5. **Contact** - Contact form, business hours, FAQ, and location map

### 🕐 Business Hours
- **Monday - Friday:** 8:00 AM - 11:00 PM
- **Saturday:** 9:00 AM - 10:00 PM
- **Sunday:** Closed
- **Emergency Services:** Available 24/7

### 🛠️ Services Offered
**Residential:**
- General Pest Control
- Termite Control
- Bed Bug Treatment
- Rodent Control
- Outdoor Pest Control

**Commercial:**
- Restaurant & Food Service
- Hotels & Hospitality
- Commercial Buildings

**Specialized:**
- Fumigation Services
- Pre-Construction Treatment
- Preventive Maintenance

---

## 💻 Tech Stack

- **Framework:** Ruby on Rails 7.x
- **Frontend:** 
  - Tailwind CSS (utility-first CSS)
  - ERB templates
  - Vanilla JavaScript
- **Email:** ActionMailer with SMTP (Outlook)
- **Database:** PostgreSQL (or SQLite for development)
- **Deployment:** Ready for Heroku, VPS, or any Rails-compatible host

---

## 🚀 Installation

### Prerequisites
- Ruby 3.x
- Rails 7.x
- Bundler
- PostgreSQL (or SQLite for development)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/al-hadika.git
   cd al-hadika
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Set up environment variables**
   ```bash
   # Create .env file
   touch .env
   
   # Add your Outlook password
   echo 'OUTLOOK_PASSWORD=your_outlook_password_here' >> .env
   ```

5. **Start the server**
   ```bash
   rails server
   ```

6. **Visit the application**
   ```
   http://localhost:3000
   ```

---

## ⚙️ Configuration

### Email Configuration

The contact form uses Outlook SMTP. Configuration is in `config/environments/production.rb`:

```ruby
config.action_mailer.smtp_settings = {
  address: 'smtp-mail.outlook.com',
  port: 587,
  domain: 'outlook.com',
  user_name: 'Al-Hadika@outlook.com',
  password: ENV['OUTLOOK_PASSWORD'],
  authentication: 'plain',
  enable_starttls_auto: true
}
```

### Environment Variables

Required environment variables:

```env
OUTLOOK_PASSWORD=your_outlook_password_here
```

**Development:**
- Create `.env` file in project root
- Add to `.gitignore` (already included)

**Production:**
- Set environment variables on your server:
  ```bash
  export OUTLOOK_PASSWORD=your_password
  ```
- Or use your hosting platform's environment variable settings

---

## 📧 Contact Form Setup

The contact form is fully functional and sends emails to `support@al-hadika.com`.

### Files Structure
```
app/
├── controllers/
│   └── pages_controller.rb          # Handles form submission
├── mailers/
│   └── contact_mailer.rb             # Sends emails
└── views/
    ├── pages/
    │   └── contact.html.erb          # Contact form page
    └── contact_mailer/
        └── contact_email.html.erb    # Email template
```

### Routes
```ruby
get 'contact', to: 'pages#contact'
post 'contact', to: 'pages#create_contact'
```

### Testing Emails in Development

Install `letter_opener` gem for development:

```ruby
# Gemfile
gem 'letter_opener', group: :development
```

```ruby
# config/environments/development.rb
config.action_mailer.delivery_method = :letter_opener
```

Emails will open in your browser instead of being sent.

---

## 🎨 Styling & Design

### Color Palette
- **Primary Green:** `#0F4D23` (Dark green)
- **Secondary Green:** `#1E7A3A` (Medium green)
- **Accent Green:** `#9BBF78` (Light green)
- **Light Green:** `#CFE8B3` (Pale green)
- **Cream:** `#F5EED3` (Background)
- **WhatsApp Green:** `#25D366`

### Responsive Breakpoints
- Mobile: `< 640px`
- Tablet: `640px - 1024px`
- Desktop: `> 1024px`

---

## 🌍 Deployment

### Heroku Deployment

1. **Create Heroku app**
   ```bash
   heroku create al-hadika
   ```

2. **Set environment variables**
   ```bash
   heroku config:set OUTLOOK_PASSWORD=your_password
   ```

3. **Deploy**
   ```bash
   git push heroku main
   ```

4. **Run migrations**
   ```bash
   heroku run rails db:migrate
   ```

### VPS/Server Deployment

1. Set up Ruby and Rails environment
2. Clone repository
3. Set environment variables in `~/.bashrc` or `/etc/environment`
4. Configure Nginx/Apache
5. Use Passenger or Puma for application server
6. Set up SSL certificate

---

## 📱 Contact Information

- **Phone:** +961 79 365 375
- **Email:** support@al-hadika.com
- **WhatsApp:** +961 79 365 375
- **Location:** Sea Side Road, Batroun, Lebanon
- **Coordinates:** 34.248132, 35.662430

---

## 🔐 Security Notes

- Never commit `.env` file to version control
- Use environment variables for all sensitive data
- Keep `OUTLOOK_PASSWORD` secure
- Enable two-factor authentication on Outlook account
- Consider using app-specific passwords instead of main password
- Regularly update dependencies: `bundle update`

---

## 🐛 Troubleshooting

### Email Not Sending

**Problem:** Contact form submits but no email received

**Solutions:**
1. Check `OUTLOOK_PASSWORD` environment variable is set
2. Verify Outlook account allows SMTP access
3. Check spam folder
4. Review logs: `tail -f log/production.log`
5. Test SMTP connection:
   ```ruby
   rails console
   ContactMailer.contact_email({
     first_name: "Test",
     last_name: "User",
     email: "test@example.com",
     phone: "+961 79 123 456",
     service: "General Pest Control",
     message: "Test message"
   }).deliver_now
   ```

### Open/Closed Status Not Working

**Problem:** Business status badge not showing

**Solutions:**
1. Check browser console for JavaScript errors
2. Verify timezone detection is working
3. Clear browser cache
4. Check that JavaScript is enabled

### Slideshow Not Working

**Problem:** Images not changing or arrows not working

**Solutions:**
1. Check browser console for errors
2. Verify JavaScript is loaded
3. Check image URLs are accessible
4. Clear browser cache

---

## 📝 TODO / Future Enhancements

- [ ] Add About page content
- [ ] Complete Reviews page with database integration
- [ ] Add admin panel for managing services
- [ ] Implement blog/articles section
- [ ] Add multiple language support (full Arabic translation)
- [ ] Integrate online booking system
- [ ] Add customer portal for tracking service history
- [ ] Implement SMS notifications
- [ ] Add Google Analytics
- [ ] Create mobile app

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is proprietary and confidential. All rights reserved by Al-Hadika Pest Control & Garden Services.

---

## 👥 Team

- **Development:** Built with care for Al-Hadika
- **Design:** Custom Tailwind CSS design
- **Contact:** For inquiries, email support@al-hadika.com

---

## 🙏 Acknowledgments

- Tailwind CSS for the amazing utility-first framework
- Unsplash for placeholder images
- Font Awesome for icons
- Ruby on Rails community

---

**Made with 💚 in Lebanon**

*Last Updated: January 2025*