<%@ page import = "com.bass.worktime.MainClass" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="work" class="com.bass.worktime.MainClass" scope="session"/>
<jsp:setProperty name="work" property="*"/>

<html xmlns="http://www.w3.org/1999/xhtml">

    <body>
        <head>
            <title> WorkTime </title>

            <style>
            h1 {color: #fe6637}
            nav a {color: rgba(255,255,255,.5)}
            body {}
            .button-container a {
              text-decoration: none;
              outline: none;
              display: inline-block;
              padding: 10px 30px;
              margin: 10px 20px;
              position: relative;
              overflow: hidden;
              border: 2px solid #fe6637;
              border-radius: 8px;
              font-family: 'Montserrat', sans-serif;
              color: #fe6637;
              transition: .2s ease-in-out;
            }
            .button-container a:before {
              content: "";
              background: linear-gradient(90deg, rgba(255,255,255,.1), rgba(255,255,255,.5));
              height: 50px;
              width: 50px;
              position: absolute;
              top: -8px;
              left: -75px;
              transform: skewX(-45deg);
            }
            .button-container a:hover {
                background-color: #fe6637;
                color: #fff;
            }
            .button-container a:hover:before {
              left: 150px;
              transition: .5s ease-in-out;
            }
            </style>

        </head>
        <H1> WorkTime </H1>
        <div id="lazy"></div>

        <div class="button-container">
            <% if(work.getStatus() != 1) { %>
            <a href="./?status=1">
                Пришел
            </a>
            <% } %>
            <% if(work.getStatus() == 1) { %>
            <a href="./?status=2">
                Ушел
            </a>
            <% } %>
            <% if(work.getStatus() == 1) { %>
            <a href="./?status=0">
                Отработал
            </a>
            <% } %>
        </div>
        <p> Статус:
			<% if (work.getStatus() == 0) { %>
				<font color="red"> отсутствует </font>
			<% } else if(work.getStatus() == 2){ %>
				<font color="orange"> отошел </font>
			<% } else { %>
                <font color="green"> на работе </font>
            <% } %>
		</p>
		<% if(work.getTime() != 0 && work.getStatus() == 0) { %>
		    <p> Отработанное время:
		    <%= work.getTimeString() %>  </p>
		<% } %>
</html>
