<!DOCTYPE html>
<html>
<head>
    <title>About Us | PharmaFast</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7f9;
            color: #333;
        }

        /* HERO SECTION */
        .hero {
            height: 85vh;
            background: linear-gradient(135deg, #002f35, #0a5c6b);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 40px;
        }

        .hero-content {
            max-width: 900px;
        }

        .hero h1 {
            font-size: 56px;
            margin-bottom: 20px;
            letter-spacing: 2px;
        }

        .hero p {
            font-size: 20px;
            line-height: 1.8;
            opacity: 0.95;
        }

        /* MAIN CONTAINER */
        .main {
            max-width: 1200px;
            margin: -100px auto 80px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.25);
            padding: 70px;
        }

        .section {
            margin-bottom: 70px;
        }

        .section h2 {
            font-size: 32px;
            color: #003b44;
            margin-bottom: 20px;
        }

        .section p {
            font-size: 17px;
            line-height: 1.8;
            color: #555;
            max-width: 900px;
        }

        /* FEATURES */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .feature {
            background: #f7fbfc;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.18);
        }

        .feature h3 {
            color: #0a5c6b;
            margin-bottom: 12px;
            font-size: 22px;
        }

        .feature p {
            font-size: 15px;
            color: #555;
            line-height: 1.6;
        }

        /* TEAM */
        .team {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 40px;
            margin-top: 40px;
        }

        .member {
            background: linear-gradient(135deg, #ffffff, #f2f9fa);
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 18px 45px rgba(0,0,0,0.18);
            transition: transform 0.3s;
        }

        .member:hover {
            transform: translateY(-10px);
        }

        .member h3 {
            margin-bottom: 8px;
            color: #003b44;
            font-size: 24px;
        }

        .role {
            font-weight: bold;
            color: #198754;
            margin-bottom: 15px;
            font-size: 14px;
            letter-spacing: 1px;
        }

        .member p {
            font-size: 15px;
            color: #555;
            line-height: 1.6;
        }

        /* FOOTER */
        .footer {
            background: #002f35;
            color: #ccc;
            text-align: center;
            padding: 30px;
            font-size: 14px;
        }

        .footer span {
            color: #ffffff;
            font-weight: bold;
        }
        
        .member img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 15px;
    border: 4px solid #0a5c6b;
}
        
    </style>
</head>

<body>

<!-- HERO -->
<div class="hero">
    <div class="hero-content">
        <h1>PharmaFast</h1>
        <p>
            A next generation digital healthcare platform designed to
            connect patients, doctors, and pharmacies with speed,
            reliability, and trust.
        </p>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="main">

    <div class="section">
        <h2>About PharmaFast</h2>
        <p>
            PharmaFast is built with the vision of simplifying healthcare
            management through technology. From booking doctor appointments
            to ordering medicines online, we provide a seamless experience
            that saves time and improves accessibility.
        </p>
    </div>

    <div class="section">
        <h2>What Makes Us Different</h2>

        <div class="features">
            <div class="feature">
                <h3>Fast and Reliable</h3>
                <p>
                    Optimized workflows ensure quick appointment booking
                    and instant medicine ordering without delays.
                </p>
            </div>

            <div class="feature">
                <h3>Secure by Design</h3>
                <p>
                    Patient data is handled with strict security practices
                    to ensure privacy and trust.
                </p>
            </div>

            <div class="feature">
                <h3>User First Approach</h3>
                <p>
                    Clean interface and simple navigation make the platform
                    easy to use for everyone.
                </p>
            </div>

            <div class="feature">
                <h3>Future Ready</h3>
                <p>
                    Designed to scale with additional healthcare services
                    and integrations in the future.
                </p>
            </div>
        </div>
    </div>

    <div class="section">
        <h2>Meet the Team</h2>

        <div class="team">
            <div class="member">
                <h3>Abir Ghosh</h3>
                <img src="Abir05.jpeg">
                <div class="role">Co Founder and Backend Developer</div>
                <p>
                    Responsible for system architecture, database design,
                    and backend logic ensuring performance and stability.
                </p>
            </div>
            

            <div class="member">
            
                <h3>Rudranil Goswami</h3>
                <img src="Rudranil.jpeg">
                <div class="role">Co Founder and Application Developer</div>
                <p>
                    Focuses on application features, workflow design,
                    and creating a smooth user experience.
                </p>
            </div>
        </div>
    </div>
    <div class="section">
    <h2>Main Office</h2>
    <p>
        PharmaFast operates from its primary office located at:
    </p>

    <div class="feature" style="max-width:700px;">
        <h3>Head Office Address</h3>
        <p>
            PX82+66Q, Vivekananda Sarani,<br>
            Opposite IndianOil,<br>
            Kanyapur, Asansol,<br>
            West Bengal 713305
        </p>
    </div>
</div>
    

</div>

<!-- FOOTER -->
<div class="footer">
    <span>PharmaFast</span> - Building the future of digital healthcare
</div>

</body>
</html>