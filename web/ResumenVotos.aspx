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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <video class="fondo" autoplay muted loop>
        <source src="files/minecraft-dungeons.3840x2160.mp4" type="video/mp4">
    </video>

    <h1 class="titulo">MIS VOTOS</h1>
    <h2 class="subtitulo">Esta es tu ultima oportunidad para cambiar tus votos</h2>

    

</asp:Content>