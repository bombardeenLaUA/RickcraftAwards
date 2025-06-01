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
            background-color: black;
            margin: 0;
            padding: 0;
            position: absolute;
        }
        
        h1 {
            color: white;

            text-shadow: 2px 2px 0px #333333;
            white-space: nowrap;        
            word-spacing: normal;      
            letter-spacing: 0px;        
                   
            display: inline-block;      
            width: auto;     
          
            text-align:center;
        }
        
.elige-los-mejores {
     font-family: 'Minecrafter', monospace;
     margin-left: auto;
     margin-right: auto;
     text-align: center;
     

}


        .sexo {
            text-align:center;
           position: absolute;
            right: -1003px;
            min-width: 200px;          
            overflow: visible;
             color: white;
           font-family: 'Minecrafter', monospace;
          text-shadow: 2px 2px 0px #333333;
          white-space: nowrap;        
         word-spacing: normal;      
         letter-spacing: 0px;        
        line-height: 1.2;          
        display: inline-block;      
         width: auto;     
         font-size: 75px;
         text-align:center;
        }

       
        .Se-me-esta-deformando-todo {
            display: flex;
            align-items: center;
            justify-content: center;
            white-space: nowrap;
            font-size: 120px;
        }
          .fondo {
      position: fixed;
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 100%;
      z-index: -1;
      object-fit: cover;
    }
        .contenido {
            position: relative;
            z-index: 1;
        }



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <meta name="google" content="notranslate">
        
    <!---h1s (si estoy usando etiquetas de estas y que----->
        <h1 class="sexo"><span translate="no">RickCraft Awards</span></h1>
      <h1 class="elige-los-mejores">Elige Los Mejores</h1>

  <!-- fondo ------>

       <video class="fondo" autoplay muted loop>
        <source src="mcc.mp4" type="video/mp4">
           </video>


       
    
</asp:Content>

