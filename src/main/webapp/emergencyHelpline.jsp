<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Emergency Helpline | PharmaFast</title>

   
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f4f8fb;
            padding: 30px;
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #003d4d;
            font-weight: 700;
        }

        .subtitle {
            text-align: center;
            margin-bottom: 25px;
            color: #555;
            font-size: 14px;
        }

        .city-select {
            text-align: center;
            margin-bottom: 30px;
        }

        select {
            padding: 10px 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
        }

        .card {
            background: #ffffff;
            border-radius: 14px;
            padding: 22px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 16px 40px rgba(0,0,0,0.15);
        }

        .icon {
            font-size: 36px;
            color: #0a5c6b;
            margin-bottom: 10px;
        }

        .card h4 {
            margin: 5px 0 6px;
            font-size: 18px;
            color: #003d4d;
        }

        .number {
            font-size: 20px;
            font-weight: 700;
            color: #198754;
            margin-bottom: 8px;
        }

        .desc {
            font-size: 14px;
            color: #555;
            margin-bottom: 12px;
        }

        .call-btn {
            display: inline-block;
            padding: 8px 14px;
            background: linear-gradient(135deg, #0a5c6b, #198754);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
        }

        .call-btn i {
            margin-right: 6px;
        }

        .note {
            margin-top: 35px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
    </style>

    
    <script>
        function changeCity() {
            const city = document.getElementById("city").value;
            document.getElementById("cityName").innerText = city;
        }
    </script>

    
    <script>
        function autoDetectCity() {
            if (!navigator.geolocation) return;

            navigator.geolocation.getCurrentPosition(success, () => {});

            function success(position) {
                const lat = position.coords.latitude;
                const lon = position.coords.longitude;

                fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lon}`)
                    .then(res => res.json())
                    .then(data => {
                        const city =
                            data.address.city ||
                            data.address.town ||
                            data.address.state_district ||
                            "India";

                        const select = document.getElementById("city");

                        for (let i = 0; i < select.options.length; i++) {
                            if (select.options[i].value.toLowerCase() === city.toLowerCase()) {
                                select.selectedIndex = i;
                                break;
                            }
                        }

                        changeCity();
                    })
                    .catch(() => {});
            }
        }
    </script>
</head>

<body onload="autoDetectCity()">

<h2>🚨 Emergency & Medical Helplines</h2>
<div class="subtitle">
    City-wise emergency support numbers | Click to call instantly
</div>

<div class="city-select">
    <label><b>Select City:</b></label>
    <select id="city" onchange="changeCity()">
        <option value="India">All India</option>
        <option value="Asansol">Asansol</option>
        <option value="Kolkata">Kolkata</option>
        <option value="Delhi">Delhi</option>
        <option value="Mumbai">Mumbai</option>
        <option value="Bengaluru">Bengaluru</option>
    </select>
</div>

<h4 style="text-align:center; color:#0a5c6b; margin-bottom:25px;">
    Showing Emergency Numbers for <span id="cityName">India</span>
</h4>

<div class="grid">

    <div class="card">
        <div class="icon"><i class="fa-solid fa-phone-volume"></i></div>
        <h4>National Emergency</h4>
        <div class="number">112</div>
        <div class="desc">Unified emergency number (All services)</div>
        <a href="tel:112" class="call-btn"><i class="fa-solid fa-phone"></i>Call Now</a>
    </div>

    <div class="card">
        <div class="icon"><i class="fa-solid fa-ambulance"></i></div>
        <h4>Ambulance</h4>
        <div class="number">108</div>
        <div class="desc">Free government ambulance service</div>
        <a href="tel:108" class="call-btn"><i class="fa-solid fa-phone"></i>Call Now</a>
    </div>

    <div class="card">
        <div class="icon"><i class="fa-solid fa-user-doctor"></i></div>
        <h4>Medical Helpline</h4>
        <div class="number">104</div>
        <div class="desc">Health advice & doctor consultation</div>
        <a href="tel:104" class="call-btn"><i class="fa-solid fa-phone"></i>Call Now</a>
    </div>

    <div class="card">
        <div class="icon"><i class="fa-solid fa-brain"></i></div>
        <h4>Mental Health</h4>
        <div class="number">14416</div>
        <div class="desc">Mental health counselling (Govt.)</div>
        <a href="tel:14416" class="call-btn"><i class="fa-solid fa-phone"></i>Call Now</a>
    </div>

    <div class="card">
        <div class="icon"><i class="fa-solid fa-skull-crossbones"></i></div>
        <h4>Poison Control</h4>
        <div class="number">1066</div>
        <div class="desc">Anti-poison emergency support</div>
        <a href="tel:1066" class="call-btn"><i class="fa-solid fa-phone"></i>Call Now</a>
    </div>

    <div class="card">
        <div class="icon"><i class="fa-solid fa-child-reaching"></i></div>
        <h4>Child Helpline</h4>
        <div class="number">1098</div>
        <div class="desc">Emergency help for children</div>
        <a href="tel:1098" class="call-btn"><i class="fa-solid fa-phone"></i>Call Now</a>
    </div>
    <!-- COVID-19 HELPLINES -->

<div class="card">
    <div class="icon"><i class="fa-solid fa-virus-covid"></i></div>
    <h4>COVID-19 National Helpline</h4>
    <div class="number">1075</div>
    <div class="desc">24×7 National COVID support (India)</div>
    <a href="tel:1075" class="call-btn">
        <i class="fa-solid fa-phone"></i>Call Now
    </a>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-map-location-dot"></i></div>
    <h4>COVID Helpline – West Bengal</h4>
    <div class="number">1800-313-444222</div>
    <div class="desc">State COVID control room</div>
    <a href="tel:1800313444222" class="call-btn">
        <i class="fa-solid fa-phone"></i>Call Now
    </a>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-hospital"></i></div>
    <h4>COVID Helpline – Delhi</h4>
    <div class="number">1031</div>
    <div class="desc">Delhi Government COVID assistance</div>
    <a href="tel:1031" class="call-btn">
        <i class="fa-solid fa-phone"></i>Call Now
    </a>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-shield-virus"></i></div>
    <h4>COVID Helpline – Maharashtra</h4>
    <div class="number">104</div>
    <div class="desc">Medical & COVID emergency support</div>
    <a href="tel:104" class="call-btn">
        <i class="fa-solid fa-phone"></i>Call Now
    </a>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-house-medical"></i></div>
    <h4>COVID Helpline – Karnataka</h4>
    <div class="number">104</div>
    <div class="desc">COVID care & medical guidance</div>
    <a href="tel:104" class="call-btn">
        <i class="fa-solid fa-phone"></i>Call Now
    </a>
</div>

<div class="card">
    <div class="icon"><i class="fa-solid fa-notes-medical"></i></div>
    <h4>COVID Helpline – Uttar Pradesh</h4>
    <div class="number">1800-180-5145</div>
    <div class="desc">UP State COVID support line</div>
    <a href="tel:18001805145" class="call-btn">
        <i class="fa-solid fa-phone"></i>Call Now
    </a>
</div>
    

</div>

<div class="note">
    ⚠ In any life-threatening emergency, dial <b>112</b> immediately.<br>
    📞 Click-to-call works best on mobile devices.
</div>

</body>
</html>
