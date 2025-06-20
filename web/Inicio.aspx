<%@ Page Title="Rickcraft Awards | Inicio" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="web.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            
            @font-face {
                font-family: 'Minecrafter';
                src: url('files/fonts/Minecrafter.Reg.ttf') format('truetype');
                font-weight: normal;
                font-style: normal;
            }
            @font-face {
                font-family: 'Minecraft';
                src: url('files/fonts/Minecraft.ttf') format('truetype');
                font-weight: normal;
                font-style: normal;
            }

            * {
                box-sizing: border-box;
            }

            html, body {
                margin: 0;
                padding: 0;
                height: 100vh;
                overflow: hidden; 
                font-family: 'Minecrafter';
                color: white;
                text-align: center;
                
                -webkit-user-select: text;
                -moz-user-select: text;
                -ms-user-select: text;
                user-select: text;
            }

            h1 {
                color: white;
                text-shadow: 2px 2px 0px #333333;
                margin: 0;
                
                -webkit-user-select: text;
                -moz-user-select: text;
                -ms-user-select: text;
                user-select: text;
            }

            .minecraft-button{
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
               
                -webkit-user-select: text;
                -moz-user-select: text;
                -ms-user-select: text;
                user-select: text;
            }

            .minecraft-button:hover{
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

            .centrado {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                padding: 2vh;
                position: relative;
                z-index: 1;
            }

            h1.mejores{
                letter-spacing: 2px;
                font-size: clamp(20px, 5vw, 40px); 
                text-shadow: 0 0 30px rgba(255, 255, 255, 0.8);
                margin: 2vh 0;
            }

            h1.título {
                font-size: clamp(30px, 10vw, 100px); 
                letter-spacing: 1px;
                text-shadow: 0 0 45px rgba(255, 255, 255, 0.8);
                margin-bottom: 2vh;
            }

            .fondo {
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                z-index: -1;
                object-fit: cover;
            }

            .creditos {
                position: absolute;
                top: 2vh;
                right: 2vw;
                font-size: clamp(12px, 2.5vw, 20px); 
                font-family: 'Minecraft';
                letter-spacing: 1px;
                z-index: 2;
                user-select: text;
                white-space: nowrap; 
                text-align: right;
            }
            
            /* móviles*/            
            @media (max-width: 480px) {
                .creditos {
                    font-size: 10px;
                    top: 1vh;
                    right: 1vw;
                    white-space: nowrap; 
                }
                
                .centrado {
                    padding: 1vh;
                }
                
                .minecraft-button {
                    padding: 10px 16px; 
                    font-size: 16px;
                }
            }
            /* tablets */
            @media (max-width: 768px) {
                .centrado { 
                    padding: 1.5vh;
                }
                .minecraft-button { 
                    font-size: 18px; padding: 12px 18px; 
                }
                .creditos { 
                    font-size: 12px; 
                }
            }
            /* portátiles/pantallas medianas */
            @media (min-width: 769px) and (max-width: 1199px) {

                .centrado { 
                    padding: 2vh;
                }
                .minecraft-button { 
                    font-size: 24px; padding: 14px 22px;
                }
                .creditos { 
                    font-size: 16px;
                }
            }
           
            /* pantallas grandes */
            @media (min-width: 1920px) {
                h1.título {
                    font-size: 120px;
                }
                
                h1.mejores {
                    font-size: 50px;
                }
                
                .minecraft-button {
                    font-size: 40px;
                    padding: 16px 28px; 
                }
                
                .creditos {
                    font-size: 24px;
                }
            }
        </style>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="google" content="notranslate"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <video class="fondo" autoplay muted loop aria-hidden="true">
        <source src="files/spawn rickcraft.mp4" type="video/mp4">
    </video>

    <div class="centrado">
        <h1 class="título"><span translate="no">rickcraft awards</span></h1>
        <h1 class="mejores">Elige Los Mejores:</h1>
        <asp:Button ID="BotonVotar" runat="server" OnClick="BotonVotar_Click" CssClass="minecraft-button" Text="Vota Ya"/>
    </div>
    <h1 class="creditos">Awards Web hecha por: zaxx, pako, rubenzuusss y mohacker</h1>
</asp:Content>