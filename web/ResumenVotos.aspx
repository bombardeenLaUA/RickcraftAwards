<%@ Page Title="Rickcraft Awards | Resumen Votos" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ResumenVotos.aspx.cs" Inherits="web.ResumenVotos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @font-face {
            font-family: 'Minecrafter';
            src: url(files/fonts/Minecrafter.Reg.ttf) format(truetype);
            font-weight: normal;
            font-style: normal;
        }

        
        .fondo {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 100vw;
            z-index: -1;
            object-fit: cover;
        }

        body {
            padding: 0;
            margin: 0;
            min-height: 100vh;
            background: #222; 
            position: relative;
            font-family: 'Minecrafter';
            color: white;
        }

        h1.titulo {
            position: relative;
            text-align: center;
            color: white;
            font-family: 'Minecrafter';
            font-size: clamp(30px, 10vw, 100px);
            letter-spacing: 1px;
            text-shadow: 0 0 100px rgba(255, 255, 255, 0.8);
            margin-top: 70px;
            margin-bottom: 0;
        }

        h2.subtitulo {
            text-align: center;
            font-size: 30px;
            position: relative;
            margin-top: 40px;
            margin-bottom: 20px;
        }

        .noseque-container {
            justify-content: center;
            align-items: center;
            display: flex;
        }

        .terminar-boton {
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

        .terminar-boton:hover {
            background: linear-gradient(135deg, #66BB6A 0%, #81C784 25%, #66BB6A 50%, #4CAF50 75%, #388E3C 100%);
            border-color: #A5D6A7 #1B5E20 #1B5E20 #A5D6A7;
            box-shadow: 
                inset 2px 2px 0px rgba(255,255,255,0.4),
                inset -2px -2px 0px rgba(0,0,0,0.4),
                0 6px 12px rgba(0,0,0,0.5);
            transform: translateY(-1px);
        }

        .terminar-boton:active {
            background: linear-gradient(135deg, #388E3C 0%, #4CAF50 25%, #388E3C 50%, #2E7D32 75%, #1B5E20 100%);
            border-color: #2E7D32 #81C784 #81C784 #2E7D32;
            box-shadow: 
                inset -2px -2px 0px rgba(255,255,255,0.2),
                inset 2px 2px 0px rgba(0,0,0,0.4),
                0 2px 4px rgba(0,0,0,0.3);
            transform: translateY(1px);
        }

        .resumen-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: repeat(2, 1fr);
            gap: 32px;
            margin: 40px auto 0 auto;
            max-width: 1400px;
            padding: 0 24px;
        }
        .resumen-categoria {
            background: linear-gradient(135deg, #222 0%, #444 100%);
            border: 3px solid #81C784;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.3);
            color: white;
            font-family: 'Minecrafter';
            font-size: 1.2em;
            text-align: center;
            padding: 32px 12px 24px 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: box-shadow 0.2s, border-color 0.2s;
        }
        .resumen-categoria .nombre-categoria {
            font-size: 1.3em;
            margin-bottom: 12px;
            color: #FFD700;
            text-shadow: 0 0 12px #FFD70088;
        }
        .resumen-categoria .nombre-nominado {
            font-size: 1.1em;
            color: #fff;
            margin-bottom: 8px;
        }
        .resumen-categoria .img-nominado {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 10px;
            box-shadow: 0 2px 8px #2228;
        }



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <video class="fondo" autoplay muted loop>
        <source src="files/minecraft-dungeons.3840x2160.mp4" type="video/mp4">
    </video>

    <h1 class="titulo">MIS VOTOS</h1>
    <h2 class="subtitulo">Esta es tu ultima oportunidad para cambiar tus votos</h2>
    <div class="resumen-grid">
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 1</div>
            <img src="URL_NOMINADO_1" class="img-nominado" alt="Nominado 1"/>
            <div class="nombre-nominado">Nominado 1</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 2</div>
            <img src="URL_NOMINADO_2" class="img-nominado" alt="Nominado 2"/>
            <div class="nombre-nominado">Nominado 2</div>
        </div><div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 3</div>
            <img src="URL_NOMINADO_3" class="img-nominado" alt="Nominado 3"/>
            <div class="nombre-nominado">Nominado 3</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 4</div>
            <img src="URL_NOMINADO_4" class="img-nominado" alt="Nominado 4"/>
            <div class="nombre-nominado">Nominado 4</div>
        </div><div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 5</div>
            <img src="URL_NOMINADO_5" class="img-nominado" alt="Nominado 5"/>
            <div class="nombre-nominado">Nominado 5</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 6</div>
            <img src="URL_NOMINADO_6" class="img-nominado" alt="Nominado 6"/>
            <div class="nombre-nominado">Nominado 6</div>
        </div><div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 7</div>
            <img src="URL_NOMINADO_7" class="img-nominado" alt="Nominado 7"/>
            <div class="nombre-nominado">Nominado 7</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoría 8</div>
            <img src="URL_NOMINADO_8" class="img-nominado" alt="Nominado 8"/>
            <div class="nombre-nominado">Nominado 8</div>
        </div>
    </div>
    <div class="noseque-container">
        <asp:Button ID="BotonTerminarVotacion" runat="server" CssClass="terminar-boton" Text="Terminar votacion" OnClick="BtnContinuar_Click" ToolTip="Terminar votación"/>
    </div>
</asp:Content>