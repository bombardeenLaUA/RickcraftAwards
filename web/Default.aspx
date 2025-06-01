<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>

        <style>
            
            @font-face {
                font-family: 'Minecrafter';
                src: url('fonts/Minecrafter.Reg.ttf') format('truetype');
                font-weight: normal;
                font-style: normal;
            }

            body {
                 text-align: center;
                font-family: 'Minecrafter', monospace;
                color: white;
                height: 2000px;
            }

            h1 {
                color: white;
                text-shadow: 2px 2px 0px #333333;
            }
            
              .minecraft-button {
            background: linear-gradient(135deg, #4CAF50 0%, #66BB6A 25%, #4CAF50 50%, #388E3C 75%, #2E7D32 100%);
            color: white;
            padding: 12px 24px;
            border: 3px solid;
            border-color: #81C784 #2E7D32 #2E7D32 #81C784;
            font-family: 'Minecrafter', monospace;
            font-size: 14px;
            font-weight: normal;
            text-transform: uppercase;
            cursor: pointer;
            box-shadow: 
                inset 2px 2px 0px rgba(255,255,255,0.3),
                inset -2px -2px 0px rgba(0,0,0,0.3),
                0 4px 8px rgba(0,0,0,0.4);
            transition: all 0.1s ease;
            position: relative;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-shadow: 2px 2px 0px rgba(0,0,0,0.5);
            image-rendering: pixelated;
            image-rendering: -moz-crisp-edges;
            image-rendering: crisp-edges;
            margin-top: 30px;
        }

        .minecraft-button:hover {
            background: linear-gradient(135deg, #66BB6A 0%, #81C784 25%, #66BB6A 50%, #4CAF50 75%, #388E3C 100%);
            border-color: #A5D6A7 #1B5E20 #1B5E20 #A5D6A7;
            box-shadow: 
                inset 2px 2px 0px rgba(255,255,255,0.4),
                inset -2px -2px 0px rgba(0,0,0,0.4),
                0 6px 12px rgba(0,0,0,0.5);
            transform: translateY(-1px);
        }

        .minecraft-button:active {
            background: linear-gradient(135deg, #388E3C 0%, #4CAF50 25%, #388E3C 50%, #2E7D32 75%, #1B5E20 100%);
            border-color: #2E7D32 #81C784 #81C784 #2E7D32;
            box-shadow: 
                inset -2px -2px 0px rgba(255,255,255,0.2),
                inset 2px 2px 0px rgba(0,0,0,0.4),
                0 2px 4px rgba(0,0,0,0.3);
            transform: translateY(1px);
        }

        .arrow {
            font-size: 12px;
            transition: transform 0.2s ease;
            filter: drop-shadow(1px 1px 0px rgba(0,0,0,0.5));
        }

        .minecraft-button:hover .arrow {
            transform: translateX(2px);
        }

        
        .minecraft-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            
            background-image: 
                linear-gradient(45deg, transparent 25%, rgba(255,255,255,0.1) 25%, rgba(255,255,255,0.1) 50%, transparent 50%, transparent 75%, rgba(255,255,255,0.1) 75%);
            background-size: 4px 4px;
            pointer-events: none;
            opacity: 0.3;
        }

            h1.título {
                font-size: 75px;
            }
            .fondo {
                  position: fixed;
                  top: 0;
                  left: 0;
                  width: 100%;
                  height: 100%;
                  z-index: -1;
                  object-fit: cover;
            }

        </style>
    </head>
        
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <meta name="google" content="notranslate"> 

    <body>

         <!-- fondo -->
         <video class="fondo" autoplay muted loop>
         <source src="mcc.mp4" type="video/mp4">
         </video>

        <h1>Elige Los Mejores</h1>
        <h1 class="título"><span translate="no">RickCraft Awards</span></h1>
       
        
        <!-- Botón Vota Ya -->
        <button class="minecraft-button" onclick="handleVote()">
            ¡Vota Ya! >
            
        </button>

        <script>
            function handleVote() {
                // Agregar la funcionalidad de voto aquí
                alert('¡Votación iniciada!');
                // Ejemplo: window.location.href = 'votacion.aspx';
            }

        </script>

     </body>

</asp:Content>