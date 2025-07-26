<%@ Page Title="Rickcraft Awards | Votos Realizados" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="GraciasPorVotar.aspx.cs" Inherits="web.GraciasPorVotar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: #111;
            font-family: Arial, sans-serif;
        }

        .fondo-gracias {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
            object-fit: cover;
            pointer-events: none;
        }

        .gracias-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 80vh;
            padding: 40px 20px;
        }

        .gracias-trofeo {
            width: 120px;
            height: 120px;
            margin-bottom: 20px;
            image-rendering: pixelated;
            filter: drop-shadow(0 0 20px #FFD700aa);
        }

        .animate-trofeo {
            animation: trofeo-pop 0.7s ease-out;
        }

        @keyframes trofeo-pop {
            0% { transform: scale(0.7) rotate(-5deg); opacity: 0.5; }
            60% { transform: scale(1.2) rotate(5deg); opacity: 1; }
            100% { transform: scale(1) rotate(0deg); opacity: 1; }
        }

        .gracias-titulo {
            color: #FFD700;
            font-size: clamp(32px, 7vw, 80px);
            text-shadow: 0 0 15px #fff, 0 0 10px #FFD700;
            margin-bottom: 16px;
            letter-spacing: 1.5px;
            text-align: center;
        }

        .gracias-mensaje {
            background: rgba(34, 40, 49, 0.95);
            color: #f5f5f5;
            font-size: clamp(18px, 2.8vw, 30px);
            border-radius: 20px;
            padding: 24px 32px;
            border: 2px solid #FFD700;
            max-width: 700px;
            text-align: center;
            text-shadow: 1px 1px 3px #000;
            margin-bottom: 32px;
        }
        
        .gracias-mensaje span {
            color: #FFD700;
            font-weight: bold;
        }

        @font-face {
            font-family: 'Minecrafter';
            src: url(files/fonts/Minecrafter.Reg.ttf) format(truetype);
            font-weight: normal;
            font-style: normal;
        }

        .gracias-boton {
            background: linear-gradient(135deg, #4CAF50 0%, #66BB6A 25%, #4CAF50 50%, #388E3C 75%, #2E7D32 100%);
            color: white;
            padding: 12px 20px;
            letter-spacing: 1px;
            border: 3px solid;
            border-color: #81C784 #2E7D32 #2E7D32 #81C784;
            font-family: 'Minecrafter';
            font-size: clamp(18px, 4vw, 35px); 
            cursor: pointer;
            box-shadow: 
                inset 2px 2px 0px rgba(255,255,255,0.3),
                inset -2px -2px 0px rgba(0,0,0,0.3),
                0 4px 8px rgba(0,0,0,0.4);
            gap: 8px;
            text-shadow: 2px 2px 0px rgba(0,0,0,0.5);
            margin-top: 3vh;
            position: relative;
            text-shadow: 0 0 30px white;
        }

        .gracias-boton:hover {
            background: linear-gradient(135deg, #66BB6A 0%, #81C784 25%, #66BB6A 50%, #4CAF50 75%, #388E3C 100%);
            border-color: #A5D6A7 #1B5E20 #1B5E20 #A5D6A7;
            box-shadow: 
                inset 2px 2px 0px rgba(255,255,255,0.4),
                inset -2px -2px 0px rgba(0,0,0,0.4),
                0 6px 12px rgba(0,0,0,0.5);
            transform: translateY(-1px);
        }

        .gracias-boton:active {
            background: linear-gradient(135deg, #388E3C 0%, #4CAF50 25%, #388E3C 50%, #2E7D32 75%, #1B5E20 100%);
            border-color: #2E7D32 #81C784 #81C784 #2E7D32;
            box-shadow: 
                inset -2px -2px 0px rgba(255,255,255,0.2),
                inset 2px 2px 0px rgba(0,0,0,0.4),
                0 2px 4px rgba(0,0,0,0.3);
            transform: translateY(1px);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <video class="fondo-gracias" autoplay muted loop>
        <source src="files/GraciasPorVotar.mp4" type="video/mp4">
    </video>
    <div class="gracias-container">
        <img src="https://imgs.search.brave.com/gyl2Mx8k3hBdrkwewcFBuwFpMGmJHvybg0fkqDkv2ww/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wLm5v/dmFza2luLm1lLzUy/Nzg5ODM2MTAucG5n/P2NsYXNzPXRodW1i/bmFpbA" alt="Trofeo" class="gracias-trofeo animate-trofeo" />
        <div class="gracias-titulo">¡GRACIAS POR VOTAR!</div>
        <div class="gracias-mensaje">
            Hemos registrado tus votos con éxito.
            <br> Tus votos ya no podrán ser modificados.
            <br><br> Gracias por formar parte de los <b>Rickcraft Awards</b>.
            <br><span>¡Mucha suerte a tus favoritos!</span>
        </div>
        <asp:Button ID="BotonInicio" runat="server" CssClass="gracias-boton" Text="Volver al inicio" OnClick="BotonInicio_Click" ToolTip="Ir al inicio"/>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const trofeo = document.querySelector('.gracias-trofeo');
            trofeo.addEventListener('mouseenter', () => {
                trofeo.classList.remove('animate-trofeo');
                // Forzar reflow para reiniciar la animación
                void trofeo.offsetWidth;
                trofeo.classList.add('animate-trofeo');
            });
        });
    </script>
</asp:Content>