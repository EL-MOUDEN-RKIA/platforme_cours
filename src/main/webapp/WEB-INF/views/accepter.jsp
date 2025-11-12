<%@ page import="metier.entities.Etudiant" %>
<html>
<head>
    <title>Meet Popup</title>
    <style>
        /* --- Background overlay --- */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.45);
            display: flex;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(4px);
        }

        /* --- Popup container --- */
        .popup-box {
            margin-top: 100px;
            width: 450px;
            background: #fff;
            border-radius: 20px;
            padding: 35px 40px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            animation: pop 0.25s ease-out;
            position: relative;
            z-index: 3000;
        }

        @keyframes pop {
            from {transform: scale(0.85); opacity: 0;}
            to   {transform: scale(1); opacity: 1;}
        }

        /* Title */
        .popup-box h2 {
            margin: 0;
            margin-bottom: 20px;
            font-size: 22px;
            text-align: center;
            font-weight: 600;
            color: #222;
        }

        /* Inputs */
        .input-box {
            margin-bottom: 18px;
        }

        .input-box input,
        .input-box textarea {
            width: 100%;
            padding: 13px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            outline: none;
            font-size: 15px;
        }

        textarea {
            height: 120px;
            resize: none;
        }

        /* Button */
        .submit-btn {
            width: 100%;
            padding: 14px;
            background: #000;
            color: white;
            font-size: 16px;
            border-radius: 12px;
            cursor: pointer;
            border: none;
            transition: 0.2s;
        }

        .submit-btn:hover {
            background: #333;
        }

        /* Close X button */
        .close-btn {
            position: absolute;
            top: 18px;
            right: 18px;
            font-size: 20px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<%@ include file="message.jsp" %>

<%
    int id_prof = (int) request.getAttribute("id_prof");
    Etudiant etd = (Etudiant) request.getAttribute("etd");
    int id_demande = (int) request.getAttribute("id_demande");
%>

<!-- ✅ POPUP OVER THE PAGE -->
<div class="popup-overlay">

    <div class="popup-box">

        <span class="close-btn" onclick="window.history.back();">&times;</span>

        <h2>Program your first meet with <%=etd.getPrenom()%></h2>

        <form action="meetInfo.jee?id_prof=<%=id_prof%>&id_Etd=<%=etd.getId()%>&idDemande=<%=id_demande%>" method="post">

            <div class="input-box">
                <input type="text" name="titre" placeholder="Title" required>
            </div>

            <div class="input-box">
                <textarea name="description" placeholder="Describe your meet..." required></textarea>
            </div>

            <button type="submit" class="submit-btn">Envoyer<%=id_demande%></button>

        </form>

    </div>
</div>

</body>
</html>
