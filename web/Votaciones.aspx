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
    <button class="boton1">Votar</button>
    <h1 class="titulo">CATEGORIA</h1>
    <video class="fondo" autoplay muted loop>
        <source src="files/minecraft-dungeons.3840x2160.mp4" type="video/mp4">
    </video>
</asp:Content>