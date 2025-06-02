<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* insertar fuente Minecrafter */ 
        @font-face {
            font-family: 'Minecrafter';
            src: url('fonts/Minecrafter.Reg.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Minecrafter';
            color: white;
            display: flex;
            align-items: center;     /* centra verticalmente */
            justify-content: center; /* centra horizontalmente */
            text-align: center;
            overflow: hidden;
        }

        h1 {
            color: white;
            text-shadow: 2px 2px 0px #333333;
        }

        h1.mejores {
            letter-spacing: 2px;
        }

        h1.título {
            font-size: 75px;
            letter-spacing: 1px;
        }

        .minecraft-button {
            background: linear-gradient(135deg, #4CAF50 0%, #66BB6A 25%, #4CAF50 50%, #388E3C 75%, #2E7D32 100%);
            color: white;
            padding: 12px 24px;
            letter-spacing: 1px;
            border: 3px solid;
            border-color: #81C784 #2E7D32 #2E7D32 #81C784;
            font-family: 'Minecrafter';
            font-size: 24px;
            cursor: pointer;
            box-shadow: 
                inset 2px 2px 0px rgba(255,255,255,0.3),
                inset -2px -2px 0px rgba(0,0,0,0.3),
                0 4px 8px rgba(0,0,0,0.4);
            gap: 8px;
            text-shadow: 2px 2px 0px rgba(0,0,0,0.5);
            margin-top: 30px;
            position: relative;
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
        video.fondo {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .container {
            z-index: 1;
        }
    </style>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="google" content="notranslate"> 

    <video class="fondo" autoplay muted loop>
        <source src="mcc.mp4" type="video/mp4">
    </video>

    <div class="container">
        <h1 class="título"><span translate="no">rickcraft awards</span></h1>
        <h1 class="mejores">Elige Los Mejores</h1>
        <button class="minecraft-button">¡Vota Ya!</button>
    </div>
</asp:Content>
