<%@ Page Title="Rickcraft Awards | Votaciones" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Votaciones.aspx.cs" Inherits="web.Votaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
        @font-face {
            font-family: 'Minecrafter';
            src: url(files/fonts/Minecrafter.Reg.ttf) format(truetype);
            font-weight: normal;
            font-style: normal;
        }

        body {
            padding: 0; 
            overflow: hidden;
        }

        .fondo {
            position: absolute;
            top: 0;
            left: 0;
            height: 100vh;
            width: 100vw;
            z-index: -1;
            object-fit: cover;
        }
        @media (min-aspect-ratio: 21/9) {
            .fondo {
                object-fit: contain;
                background: black;
            }
        }        

        h1.titulo {
            position: relative;
            text-align: center;
            color: white;
            font-family: 'Minecrafter';
            font-size: clamp(30px, 10vw, 100px);
            letter-spacing: 1px;
            text-shadow: 0 0 100px rgba(255, 255, 255, 0.8);
            margin-top: 140px;
        }
        .boton-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin-top: 24px;
        }
        .boton1 {
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

        .boton1:hover {
            background: linear-gradient(135deg, #66BB6A 0%, #81C784 25%, #66BB6A 50%, #4CAF50 75%, #388E3C 100%);
            border-color: #A5D6A7 #1B5E20 #1B5E20 #A5D6A7;
            box-shadow: 
                inset 2px 2px 0px rgba(255,255,255,0.4),
                inset -2px -2px 0px rgba(0,0,0,0.4),
                0 6px 12px rgba(0,0,0,0.5);
            transform: translateY(-1px);
        }

        .boton1:active {
            background: linear-gradient(135deg, #388E3C 0%, #4CAF50 25%, #388E3C 50%, #2E7D32 75%, #1B5E20 100%);
            border-color: #2E7D32 #81C784 #81C784 #2E7D32;
            box-shadow: 
                inset -2px -2px 0px rgba(255,255,255,0.2),
                inset 2px 2px 0px rgba(0,0,0,0.4),
                0 2px 4px rgba(0,0,0,0.3);
            transform: translateY(1px);
        }
                    
        /* móviles*/            
        @media (max-width: 480px) {
            .candidatos-container {
                flex-direction: column;
                gap: 16px;
                align-items: center;
                margin: 24px 0 60px 0;
            }
            .candidato {
                min-width: 96vw;
                max-width: 99vw;
                padding: 0 0 12px 0;
                min-height: unset;
                border-radius: 12px;
            }
            .candidato-img {
                min-height: 100px;
                max-height: 140px;
                border-radius: 12px 12px 0 0;
            }
        }
        /* tablets */
        @media (min-width: 481px) and (max-width: 900px) {
            .candidatos-container {
                flex-direction: column;
                gap: 28px;
                align-items: center;
                margin: 32px 0 80px 0;
            }
            .candidato {
                min-width: 80vw;
                max-width: 92vw;
                border-radius: 14px;
            }
            .candidato-img {
                min-height: 160px;
                max-height: 220px;
                border-radius: 14px 14px 0 0;
            }
        }
        /* portátiles/pantallas medianas */
        @media (min-width: 901px) and (max-width: 1199px) {
            .candidatos-container {
                flex-direction: row;
                gap: 36px;
                margin: 36px 0 90px 0;
            }
            .candidato {
                min-width: 320px;
                max-width: 380px;
                border-radius: 16px;
            }
            .candidato-img {
                min-height: 180px;
                max-height: 260px;
                border-radius: 16px 16px 0 0;
            }
        }
        /* pantallas grandes */
        @media (min-width: 1200px) and (max-width: 1919px) {
            .candidatos-container {
                flex-direction: row;
                gap: 56px;
                margin: 40px 0 100px 0;
            }
            .candidato {
                min-width: 400px;
                max-width: 440px;
                border-radius: 18px;
            }
            .candidato-img {
                min-height: 220px;
                max-height: 320px;
                border-radius: 18px 18px 0 0;
            }
        }
        /* pantallas extra grandes */
        @media (min-width: 1920px) {
            .candidatos-container {
                flex-direction: row;
                gap: 80px;
                margin: 60px 0 140px 0;
            }
            .candidato {
                min-width: 500px;
                max-width: 600px;
                border-radius: 22px;
            }
            .candidato-img {
                min-height: 320px;
                max-height: 420px;
                border-radius: 22px 22px 0 0;
            }
        }
        .candidatos-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 56px; /*espacio entre candidatos*/
            margin: 40px 0 100px 0;
        }

        .candidato {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: linear-gradient(135deg, #222 0%, #444 100%);
            color: white;
            font-family: 'Minecrafter', Arial, sans-serif;
            font-size: clamp(18px, 3vw, 32px);
            border: 3px solid #81C784;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.3);
            padding: 0 0 32px 0; /* espacio abajo de la imagen */
            min-width: 400px;    /* tamaño ancho */
            max-width: 440px;
            text-align: center;
            cursor: pointer;
            transition: border-color 0.2s, box-shadow 0.2s, background 0.2s, transform 0.2s;
            user-select: none;
            position: relative;
            overflow: hidden;
        }

        .candidato-img {
            width: 100%;
            aspect-ratio: 1/1;
            height: auto;
            min-height: 220px;  
            max-height: 320px;
            display: block;
            border-radius: 18px 18px 0 0;
            border: none;
            margin: 0;
            box-shadow: none;
        }

        @media (max-width: 900px) {
            .candidatos-container {
                flex-direction: column;
                gap: 32px;
                align-items: center;
            }
            .candidato {
                min-width: 90vw;
                max-width: 98vw;
            }
        }
        /* tablets */
        @media (max-width: 768px) {
            }
        }
        /* portátiles/pantallas medianas */
        @media (min-width: 769px) and (max-width: 1199px) {
            
        }
           
        /* pantallas grandes */
        @media (min-width: 1920px) {
        }
        .candidatos-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 56px; /*espacio entre candidatos*/
            margin: 120px 0 140px 0;
        }

        .candidato {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: linear-gradient(135deg, #222 0%, #444 100%);
            color: white;
            font-family: 'Minecrafter', Arial, sans-serif;
            font-size: clamp(18px, 3vw, 32px);
            border: 3px solid #81C784;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.3);
            padding: 0 0 32px 0; /* espacio abajo de la imagen */
            min-width: 400px;    /* tamaño ancho */
            text-align: center;
            cursor: pointer;
            transition: border-color 0.2s, box-shadow 0.2s, background 0.2s, transform 0.2s;
            user-select: none;
            position: relative;
            overflow: hidden;
        }

        .candidato-img {
            width: 100%;
            aspect-ratio: 1/1;
            height: auto;
            min-height: 220px;  
            max-height: 320px;
            display: block;
            border-radius: 18px 18px 0 0;
            border: none;
            margin: 0;
            box-shadow: none;
        }

        .candidato-nombre {
            margin: 18px 0 0 0;
            font-size: 1.1em;
            font-family: 'Minecrafter', Arial, sans-serif;
            letter-spacing: 1px;
        }

        .candidato-boton {
            padding: 10px 28px;
            border-radius: 12px;
            background: linear-gradient(135deg, #333 0%, #666 100%);
            color: #fff;
            font-family: 'Minecrafter', Arial, sans-serif;
            font-size: 1em;
            margin-top: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            border: 2px solid #81C784;
            transition: background 0.2s, border-color 0.2s, color 0.2s, padding 0.2s, box-shadow 0.2s;;
        }

        .candidato-boton:hover {
            padding: 15px 35px;
            box-shadow: 0px 0px 12px #FFD70088, 0 2px 8px #2228;
            transition: padding 0.2s, box-shadow 0.2s;
        }

        .candidato:hover {
            transform: scale(1.10) translateY(-8px);
            border-color: #FFD700;
            box-shadow: 0 0 32px #FFD70088, 0 8px 24px rgba(0,0,0,0.5);
            background: linear-gradient(135deg, #333 0%, #666 100%);
            z-index: 1;
        }

        .candidato.seleccionado {
            position: relative;
            border-color: #FFD700;
            background: linear-gradient(135deg, #4CAF50 0%, #81C784 100%);
            box-shadow: 0 0 32px #FFD70088;
            color: #222;
            overflow: hidden;
        }

        .candidato.seleccionado::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -75%;
            width: 50%;
            height: 200%;
            background: linear-gradient(
                120deg,
                rgba(255, 255, 255, 0) 0%,
                rgba(255, 255, 255, 0.6) 50%,
                rgba(255, 255, 255, 0) 100%
            );
            transform: rotate(25deg);
            animation: shineMove 1.3s ease-out forwards;
            pointer-events: none;
        }

        @keyframes shineMove {
            0% {
                left: -75%;
            }
            100% {
                left: 135%;
            }
        }
        .candidato.seleccionado .candidato-boton {
            background: linear-gradient(135deg, #FFD700 0%, #FFF176 100%);
            color: #222;
            border-color: #FFD700;
            box-shadow: 0 0 16px #FFD70088;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="titulo">CATEGORIA</h1>
    <div class="candidatos-container">
        <div class="candidato" onclick="seleccionarCandidato(this)">
            <img src="https://imgs.search.brave.com/jbvSywNuWVlodEbyhNNR2HBY0Tgrk2QEqa9aRxpG5xA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/ZmFtb3VzYmlydGhk/YXlzLmNvbS9oZWFk/c2hvdHMvdGhlZ3Jl/ZmctMS5qcGc" class="candidato-img" alt="Candidato 1" />
            <div class="candidato-nombre">Candidato 1</div>
            <div class="candidato-boton">Elegir</div>
        </div>
        <div class="candidato" onclick="seleccionarCandidato(this)">
            <img src="https://imgs.search.brave.com/teO-qRS8GPHmMVLKPB4-z7_G4Lp8qonBtUx49-0_iwc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLmRh/aWx5bWFpbC5jby51/ay8xcy8yMDIyLzA2/LzI4LzAyLzU3Mzcy/MTY5LTEwNzc5OTY3/LVBvcHVsYXJfV2l0/aF9oaXNfdW5pcXVl/X2FwcGVhcmFuY2Vf/YW5kX2NvbmZpZGVu/dF9hdHRpdHVkZV9I/YXNidWwtYS0zXzE2/NTYzNzk5MTY5MDIu/anBn" class="candidato-img" alt="Candidato 2" />
            <div class="candidato-nombre">Candidato 2</div>
            <div class="candidato-boton">Elegir</div>
        </div>
        <div class="candidato" onclick="seleccionarCandidato(this)">
            <img src="https://imgs.search.brave.com/Fh_aSSPa-WedAew1u_yheViP4VcwYvz6nP24Qktu6Bw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9wZXBlLWZyb2ct/d2VhcnMtY3Jvd24t/bGlrZS1raW5nXzEy/NTA0ODYtMjE1Mi5q/cGc_c2VtdD1haXNf/aHlicmlkJnc9NzQw" class="candidato-img" alt="Candidato 3" />
            <div class="candidato-nombre">Candidato 3</div>
            <div class="candidato-boton">Elegir</div>
        </div>
    </div>
    <div class="boton-container">
        <button class="boton1">Continuar</button>
    </div>
    <video class="fondo" autoplay muted loop>
        <source src="files/minecraft-dungeons.3840x2160.mp4" type="video/mp4">
    </video>
    <script>
        function seleccionarCandidato(element) {
            if (element.classList.contains('seleccionado')) {
                element.classList.remove('seleccionado');
            } else {
                document.querySelectorAll('.candidato').forEach(function (el) {
                    el.classList.remove('seleccionado');
                });
                element.classList.add('seleccionado');
            }
        }
    </script>
</asp:Content>