<%@ Page Title="Rickcraft Awards | Votación Realizada" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="GraciasPorVotar.aspx.cs" Inherits="web.GraciasPorVotar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: #111;
            font-family: 'Minecrafter', Arial, sans-serif;
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

        .gracias-boton {
            background: linear-gradient(135deg, #FFD700, #81C784);
            color: #111;
            font-size: clamp(18px, 3.5vw, 28px);
            padding: 14px 40px;
            border-radius: 14px;
            border: 2px solid #388E3C;
            cursor: pointer;
            box-shadow: 0 4px 18px #FFD70055;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            text-decoration: none;
        }

        .gracias-boton:hover {
            transform: scale(1.05);
            box-shadow: 0 0 24px #FFD700aa;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <video class="fondo-gracias" autoplay muted loop>
        <source src="files/minecraft-dungeons.3840x2160.mp4" type="video/mp4">
    </video>
    <div class="gracias-container">
        <img src="https://imgs.search.brave.com/gyl2Mx8k3hBdrkwewcFBuwFpMGmJHvybg0fkqDkv2ww/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wLm5v/dmFza2luLm1lLzUy/Nzg5ODM2MTAucG5n/P2NsYXNzPXRodW1i/bmFpbA" alt="Trofeo" class="gracias-trofeo animate-trofeo" />
        <div class="gracias-titulo">¡GRACIAS POR VOTAR!</div>
        <div class="gracias-mensaje">
            Hemos registrado tu voto con exito  
            <br> Si lo deseas, puedes modificarlo o finalizar tu participacion mas adelante
            <br><br> Gracias por formar parte de los <b>Rickcraft Awards</b>  
            <br><span>¡Mucha suerte a tus favoritos!</span>
        </div>
        <a href="Inicio.aspx" class="gracias-boton">Volver al inicio</a>
    </div>
    <!-- animacion trofeo hover (pako nose como coño sabes js es complicadisimo -->
   
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

