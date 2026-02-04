<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PharmaFast - Get Medicines Fast</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        /* Navbar */
        .navbar {
            background-color: white;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
        }
        .navbar-brand {
            color: #007b74;
            font-weight: 700;
            font-size: 22px;
        }
        .nav-link {
            color: #333 !important;
            font-weight: 500;
            position: relative;
            transition: color 0.3s ease;
        }
        .nav-link::after {
            content: "";
            position: absolute;
            width: 0;
            height: 2px;
            background-color: #007b74;
            bottom: -4px;
            left: 0;
            transition: width 0.3s ease;
        }
        .nav-link:hover::after {
            width: 100%;
        }

        
        .hero {
            background: linear-gradient(135deg, #003d4d, #004f5f);
            color: white;
            padding: 60px 0;
            text-align: center;
        }

        
        .hero-text-logo {
            font-size: 44px;
            font-weight: 800;
            letter-spacing: 1px;
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            animation: logoSlideIn 1.2s ease-out forwards;
        }

        .hero-text-logo span {
            color: #2de2c1;
        }

        .hero-text-logo .plus {
            font-size: 34px;
            color: #2de2c1;
            animation: pulse 1.6s infinite ease-in-out;
        }

        @keyframes logoSlideIn {
            from {
                transform: translateY(-25px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.8; }
            50% { transform: scale(1.2); opacity: 1; }
            100% { transform: scale(1); opacity: 0.8; }
        }

        .hero h2 {
            font-weight: 600;
        }

        
        .features {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
        }
        .feature-box {
            background-color: rgba(255, 255, 255, 0.12);
            padding: 20px;
            border-radius: 12px;
            width: 250px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .feature-box:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        }

        /* Login Section */
        .login-section {
            background-color: white;
            border-radius: 15px;
            padding: 30px;
            margin-top: -40px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .login-section:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.18);
        }

        /* Offers */
        .offer-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            margin-top: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .offer-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }
        .offer-card h5 {
            color: #007b74;
            font-weight: 600;
        }

        /* Buttons */
        .btn-success,
        .btn-outline-success {
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }
        .btn-success:hover,
        .btn-outline-success:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 18px rgba(0,123,116,0.4);
        }

        /* Footer */
        footer {
            background-color: #003d4d;
            color: #ffffff;
            padding: 40px 0 20px;
            margin-top: 60px;
        }
        footer h6 {
            font-weight: 600;
            margin-bottom: 15px;
        }
        footer a {
            color: #cfdfe3;
            text-decoration: none;
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
        }
        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.2);
            margin-top: 20px;
            padding-top: 15px;
            text-align: center;
            font-size: 14px;
            color: #cfdfe3;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg px-4 py-2">
    <a class="navbar-brand" href="#">PharmaFast</a>
    <div class="ms-auto d-flex align-items-center">
        <a href="aboutUs.jsp" class="nav-link me-3">About Us</a>
        <a href="#" class="nav-link me-3">Offers</a>
        <a href="contact.jsp" class="nav-link me-3">Contact Us</a>
        <a href="adminLogin.jsp" class="nav-link">Admin-Login</a>
    </div>
</nav>

<!-- Hero -->
<section class="hero">

   
    <div class="hero-text-logo">
        Pharma<span>Fast</span>
        <div class="plus">+</div>
    </div>

    <h2>Get Medicines Fast with Superfast Delivery in your City</h2>

    <div class="features mt-4">
        <div class="feature-box">
            <h6>💵 Cash on Delivery</h6>
            <p>Available on all orders</p>
        </div>
        <div class="feature-box">
            <h6>🚴 Express Delivery</h6>
            <p>Free and fast in your city</p>
        </div>
        <div class="feature-box">
            <h6>🔁 Easy Returns</h6>
            <p>No questions asked</p>
        </div>
    </div>
</section>

<!-- Login Section -->
<div class="login-section">
    <h4 class="mb-4">Login As</h4>

    <div class="d-flex justify-content-center gap-5 mb-3">
        <div>
            <lottie-player src="https://assets9.lottiefiles.com/packages/lf20_jcikwtux.json"
                background="transparent" speed="1"
                style="width:150px; height:150px;" loop autoplay></lottie-player>
            <p class="fw-semibold">Patient</p>
        </div>
        <div>
            <lottie-player src="https://assets10.lottiefiles.com/packages/lf20_0yfsb3a1.json"
                background="transparent" speed="1"
                style="width:150px; height:150px;" loop autoplay></lottie-player>
            <p class="fw-semibold">Doctor</p>
        </div>
    </div>

    <a href="patientLogin.jsp" class="btn btn-success px-4 me-3">Patient</a>
    <a href="doctorLogin.jsp" class="btn btn-outline-success px-4">Doctor</a>
</div>

<!-- Offers -->
<div class="container mt-5">
    <div class="row text-center">
        <div class="col-md-6">
            <div class="offer-card">
                <h5>📱 App Only Offer</h5>
                <p>Get 30% OFF on Medicine Orders</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="offer-card">
                <h5>💊 Website Offer</h5>
                <p>Get Extra 25% off on CIPLAs products</p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h6>PharmaFast</h6>
                <p style="font-size:14px;">
                    Your trusted online medical system for fast medicine delivery and doctor consultation.
                    building future of digital healthcare system by filling the gap between Patient and 
                    Doctor as well as Pharma industry . Now your health is our responsibility
                </p>
            </div>
            <div class="col-md-4">
                <h6>Quick Links</h6>
                <a href="#">Home</a>
                <a href="patientLogin.jsp">Patient Login</a>
                <a href="doctorLogin.jsp">Doctor Login</a>
                <a href="#">Offers</a>
            </div>
            <div class="col-md-4">
                <h6>Contact</h6>
                <a href="#">support@pharmafast.com</a>
                <a href="#">+91 98765 43210</a>
                <a href="#">India</a>
                <a href="#">tatairudra39@gmail.com</a>
                <a href="#">Abir651@gmail.com</a>  
            </div>
        </div>
        <div class="footer-bottom">
            © 2025 PharmaFast | Online Medical System
        </div>
    </div>
</footer>

</body>
</html>
