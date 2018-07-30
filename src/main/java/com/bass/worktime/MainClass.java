package com.bass.worktime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Formatter;

/**
 * Created by a.makarov on 20.07.2018.
 */

@WebServlet("/work")
public class MainClass extends HttpServlet {

    private int status = 0; // 0 - закончил, 1 - работает, 2 - отошел
    private long finalTime = 0L, currentTime = 0L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status = req.getParameter("status");
        this.status = Integer.parseInt(status);
    }

    public double getTime(){
        //double time = (double)Math.round(finalTime/3600000f*10)/10;
        return finalTime/1000;
    }

    public String getTimeString(){
        String time = String.format("%02d:%02d:%02d", finalTime/3600000, finalTime%3600000/60000, finalTime%3600000%60000/1000);
        return time;
    }

    public void setStatus(int status){
        if(status == 1){
            if(this.status == 0)
                finalTime = 0;
            currentTime = System.currentTimeMillis();
        }
        else if(status == 2){
            finalTime += System.currentTimeMillis() - currentTime;
        }
        else{
            finalTime += System.currentTimeMillis() - currentTime;
            currentTime = 0;
        }
        this.status = status;
    }

    public int getStatus(){
        return status;
    }
}
