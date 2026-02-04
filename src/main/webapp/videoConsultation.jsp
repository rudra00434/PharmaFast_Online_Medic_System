<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String room = request.getParameter("room");
    if (room == null || room.trim().isEmpty()) {
        room = "PharmaFast_Default";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Video Consultation</title>

    <!-- Jitsi External API -->
    <script src="https://meet.jit.si/external_api.js"></script>

    <style>
        body { margin:0; background:#000; }
        #meet { width:100vw; height:100vh; }
    </style>
</head>

<body>

<div id="meet"></div>

<script>
    const domain = "meet.jit.si";
    const options = {
        roomName: "<%= room %>",
        width: "100%",
        height: "100%",
        parentNode: document.querySelector('#meet'),
        configOverwrite: {
            prejoinPageEnabled: false
        },
        interfaceConfigOverwrite: {
            SHOW_JITSI_WATERMARK: false
        }
    };

    const api = new JitsiMeetExternalAPI(domain, options);
</script>

</body>
</html>
