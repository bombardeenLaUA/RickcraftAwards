<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <style>
            /* Importar la fuente Minecrafter */
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
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <meta name="google" content="notranslate">
       
         <!-- fondo -->
         <video class="fondo" autoplay muted loop>
         <source src="mcc.mp4" type="video/mp4">
         </video>

    
        <h1>Elige Los Mejores</h1>
        <h1 class="título"><span translate="no">RickCraft Awards</span></h1>
        <hr>

       


    
</asp:Content>