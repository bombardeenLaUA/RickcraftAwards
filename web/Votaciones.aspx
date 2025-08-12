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
            margin: 0;
            min-height: 100vh;
            background: #222; /* color de fondo base por si el vídeo no carga */
            position: relative;
            font-family: 'Minecrafter';
            color: white;
        }

        .fondo {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 100vw;
            z-index: -1;
            object-fit: cover;
            pointer-events: none;
        }

        .titulo {
            position: relative;
            text-align: center;
            color: white;
            font-family: 'Minecrafter';
            font-size: clamp(30px, 10vw, 100px);
            letter-spacing: 1px;
            text-shadow: 0 0 100px rgba(255, 255, 255, 0.8);
            margin-top: 70px;
            margin-bottom: 0;
            display: block;
        }

        .descripcion {
            text-align: center;
            font-size: 30px;
            position: relative;
            margin-top: 40px;
            margin-bottom: 20px;
            display: block;
        }

        .boton-container {
            position: relative;
            width: 100%;
            height: auto;
            margin-top: 24px;
            margin-bottom: 48px;
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
            text-shadow: 0 0 30px white;
            transition: transform 0.2s, box-shadow 0.2s, background 0.2s;
            position: absolute;
            top: 0;
        }

        .boton-anterior {
            left: 11%;
        }

        .boton-continuar {
            left: 50%;
            transform: translateX(-50%);
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

        .boton-continuar:hover {
            transform: translateX(-50%) translateY(-1px);
        }

        .boton-continuar:active {
            transform: translateX(-50%) translateY(1px);
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
            padding-bottom: 32px;
            min-width: 400px;    /* tamaño ancho */
            max-width: 440px;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
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
        @media (max-width: 768px) {}

        /* portátiles/pantallas medianas */
        @media (min-width: 769px) and (max-width: 1199px) {}
           
        /* pantallas grandes */
        @media (min-width: 1920px) {}

        .candidatos-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 56px; /*espacio entre candidatos*/
            margin: 100px 0 70px 0;
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
            min-width: 400px;    
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
            transform: scale(1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .candidato-boton:hover {
            transform: scale(1.1);
            box-shadow: 0px 0px 12px #FFD70088, 0 2px 8px #2228;
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
                rgba(255, 255, 255, 0) 100%);
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

        .seguimiento-label {
            font-family: 'Minecrafter', Arial, sans-serif;
            font-size: 1.2em;
            color: #FFD700;
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
            padding: 12px;
            border-radius: 8px;
            background: rgba(34, 34, 34, 0.8);
            box-shadow: 0 2px 8px rgba(0,0,0,0.5);
            display: flex;
            margin: 0 auto 0 auto;
            max-width: fit-content;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updtVotaciones" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="lblCategoria" runat="server" CssClass="titulo"></asp:Label>
            <asp:Label ID="lblDescripcion" runat="server" CssClass="descripcion"></asp:Label>
            <asp:Panel ID="pnlNominados" runat="server" CssClass="candidatos-container">
                <asp:Repeater ID="rptNominados" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkBtnNominado" runat="server" CssClass="candidato" OnClientClick="seleccionarCandidato(this); return false;" data-nominado-id='<%# Eval("NominadoId") %>'>
                            <asp:Image ID="imgNominado" runat="server" CssClass="candidato-img" AlternateText="Nominado" ImageUrl='<%# Eval("wwwroot/" + "ImagenURL") %>'/>
                            <asp:Label ID="lblNominado" runat="server" CssClass="candidato-nombre" Text='<%# Eval("Nombre") %>'></asp:Label>
                            <div class="candidato-boton">Elegir</div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:HiddenField ID="hdnNominadoSeleccionado" runat="server" />
            </asp:Panel>
            <asp:Label ID="lblSeguimiento" runat="server" CssClass="seguimiento-label"></asp:Label>
            <div class="boton-container">
                <asp:Button ID="btnAnterior" runat="server" CssClass="boton1 boton-anterior" Text="Anterior" OnClick="BotonAnterior_Click" ToolTip="Categoría anterior"/>
                <asp:Button ID="btnContinuar" runat="server" CssClass="boton1 boton-continuar" Text="Continuar" OnClick="BotonContinuar_Click" ToolTip="Continuar"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <video class="fondo" autoplay muted loop>
        <source src="files/minecraft-dungeons.3840x2160.mp4" type="video/mp4">
    </video>
    <script>
        function seleccionarCandidato(element) {
            var nominadoId = element.getAttribute('data-nominado-id');
            var hiddenField = document.getElementById('<%= hdnNominadoSeleccionado.ClientID %>');
            if (element.classList.contains('seleccionado')) {
                element.classList.remove('seleccionado');
                hiddenField.value = '';
            } else {
                document.querySelectorAll('.candidato').forEach(function (el) {
                    el.classList.remove('seleccionado');
                });
                element.classList.add('seleccionado');
                hiddenField.value = nominadoId;
            }
        }
    </script>
</asp:Content>