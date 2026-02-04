<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Contact Us | PharmaFast</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f4f8fb;
        }

        .contact-header {
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            color: white;
            padding: 80px 20px;
            text-align: center;
        }

        .contact-header h1 {
            margin: 0;
            font-size: 42px;
            font-weight: 700;
        }

        .contact-header p {
            margin-top: 10px;
            font-size: 16px;
            opacity: 0.9;
        }

        .contact-container {
            max-width: 1100px;
            margin: -60px auto 60px;
            background: white;
            padding: 50px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.12);
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 40px;
        }

        .contact-info h3,
        .contact-form h3 {
            margin-bottom: 20px;
            color: #003d4d;
            font-size: 22px;
        }

        .info-box {
            margin-bottom: 25px;
        }

        .info-box span {
            display: block;
            font-weight: 600;
            color: #333;
            margin-bottom: 6px;
        }

        .info-box p {
            margin: 0;
            color: #555;
            font-size: 15px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #333;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            font-family: 'Poppins', sans-serif;
        }

        textarea {
            resize: none;
        }

        .submit-btn {
            margin-top: 10px;
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #0a5c6b, #198754);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
        }

        .map-section {
            max-width: 1100px;
            margin: 0 auto 60px;
            text-align: center;
        }

        .map-section h2 {
            margin-bottom: 20px;
            color: #003d4d;
            font-weight: 700;
        }

        .map-box {
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .contact-footer {
            text-align: center;
            margin: 20px 0 40px;
            font-size: 14px;
            color: #777;
        }

        @media (max-width: 900px) {
            .contact-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<div class="contact-header">
    <h1>Contact PharmaFast</h1>
    <p>We’re here to help you with medicines, appointments, and healthcare support</p>
</div>

<div class="contact-container">

    <div class="contact-info">
        <h3>Get in Touch</h3>

        <div class="info-box">
            <span>Project Name</span>
            <p>PharmaFast – Online Medical System</p>
        </div>

        <div class="info-box">
            <span>Developer</span>
            <p>Rudranil</p>
            <p>Email: tatairudra39@gmail.com</p>
        </div>

        <div class="info-box">
            <span>Co-Developer</span>
            <p>Abir Ghosh</p>
            <p>Email: Abir651@gmail.com</p>
        </div>

        <div class="info-box">
            <span>Support Availability</span>
            <p>24×7 Online Assistance</p>
        </div>
    </div>

    <div class="contact-form">
        <h3>Send Us a Message</h3>

        <form>
            <div class="form-group">
                <label>Your Name</label>
                <input type="text" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" required>
            </div>

            <div class="form-group">
                <label>Your Message</label>
                <textarea rows="5" required></textarea>
            </div>

            <button type="submit" class="submit-btn">Send Message</button>
        </form>
    </div>

</div>

<div class="map-section">
    <h2>Find Us on Google Maps</h2>

    <div class="map-box">
        <iframe
            src="https://www.google.com/maps?q=Asansol,West+Bengal,India&output=embed"
            width="100%"
            height="380"
            style="border:0;"
            allowfullscreen
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>
</div>

<div class="contact-footer">
    © 2025 PharmaFast. All rights reserved.
</div>

</body>
</html>
