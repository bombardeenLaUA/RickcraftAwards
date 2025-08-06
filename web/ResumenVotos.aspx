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
            margin-top: 40px;
            margin-bottom: 0;
        }

        h2.subtitulo {
            text-align: center;
            font-size: 30px;
            position: relative;
            margin-top: 40px;
            margin-bottom: 20px;
        }

        .boton-container {
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
            margin-top: 1vh;
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
            column-gap: 2px;
            row-gap: 0;
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
            aspect-ratio: 1/1;
            min-height: 220px;
            max-height: 320px;
            min-height: 70%;
            max-height: 70%;
            transform: scale(1);
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
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
            width: 70%;
            height: 70%;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 18px;
            box-shadow: 0 2px 8px #2228;
        }

        .resumen-categoria:hover {
            border-color: #FFD700;
            box-shadow: 0 0 32px #FFD70088, 0 8px 24px #2228;
            transform: scale(1.05);
        }

        .resumen-categoria a {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
            text-align: center;
            text-decoration: none;
            color: inherit;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <video class="fondo" autoplay muted loop>
        <source src="files/fondo resumen.mp4" type="video/mp4">
    </video>
    <h1 class="titulo">MIS VOTOS</h1>
    <h2 class="subtitulo">Esta es tu ultima oportunidad para cambiar tus votos</h2>
    <div class="resumen-grid">
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 1</div>
            <img src="https://static.eldiario.es/clip/a9054e0d-3a3e-4c0b-aae3-7e792ed744ec_16-9-aspect-ratio_default_0.jpg" class="img-nominado" alt="Nominado 1"/>
            <div class="nombre-nominado">Nominado 1</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 2</div>
            <img src="https://staticr1.blastingcdn.com/media/photogallery/2017/3/1/660x290/b_502x220x82/el-youtuber-auronplay-conocido-en-espana-como-el-critico-de-youtube-por-sus-contenidos-humoristicos-sobre-critica_1178941.jpg" class="img-nominado" alt="Nominado 2"/>
            <div class="nombre-nominado">Nominado 2</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 3</div>
            <img src="https://imagenes.elpais.com/resizer/v2/MSH7YHJ7WJCZLIBKRMGBSWDXKY.jpg?auth=4a4a3d784931e6f4e9e0b16999de5611cc0518aa58ff77fabf2263c90fcd8382&width=414&height=311&smart=true" class="img-nominado" alt="Nominado 3"/>
            <div class="nombre-nominado">Nominado 3</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 4</div>
            <img src="https://imagenes.elpais.com/resizer/v2/C6FKCBBD4NXQZY7MS52NMOTKIE.jpg?auth=191ce7e999b37d6084ca529e79f7870e7a206645cb6b5891eee06e9835f20b92&width=414&height=311&smart=true" class="img-nominado" alt="Nominado 4"/>
            <div class="nombre-nominado">Nominado 4</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 5</div>
            <img src="https://noticiasdeaqui.co/wp-content/uploads/2025/06/img_3249-1.jpg?w=1024" class="img-nominado" alt="Nominado 5"/>
            <div class="nombre-nominado">Nominado 5</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 6</div>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrFgt9SIvM9b7-4pjc8oq0vY67c88WJYCOQ&s" class="img-nominado" alt="Nominado 6"/>
            <div class="nombre-nominado">Nominado 6</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 7</div>
            <img src="https://i.ytimg.com/vi/RME7jMZrAv8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLAh5ZpPqmsT6-3aiyg7x8_yfqxQ-w" class="img-nominado" alt="Nominado 7"/>
            <div class="nombre-nominado">Nominado 7</div>
        </div>
        <div class="resumen-categoria">
            <div class="nombre-categoria">Categoria 8</div>
            <img src="https://static-cdn.jtvnw.net/twitch-clips-thumbnails-prod/AstuteApatheticTigerBibleThump-m271m2wgbhBJQ0FR/dce2d917-3c93-4dfd-b61a-0db44a08246f/preview.jpg" class="img-nominado" alt="Nominado 8"/>
            <div class="nombre-nominado">Nominado 8</div>
        </div>
    </div>
    <div class="boton-container">
        <asp:Button ID="BotonTerminarVotacion" runat="server" CssClass="terminar-boton" Text="Terminar votacion" OnClick="BtnContinuar_Click" ToolTip="Terminar votación"/>
    </div>
</asp:Content>