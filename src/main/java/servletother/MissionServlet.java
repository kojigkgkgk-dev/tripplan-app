package servletother;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAOother.MissionDAO;
import DAOother.SavingDAO;
import modelother.Mission;
import modelother.Trip;

@WebServlet("/MissionServlet")
public class MissionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. パラメータからtripIdを取得（デフォルトは一旦24 ※DBにあるIDに合わせてください）
        int tripId = 24; 
        String idStr = request.getParameter("tripId");
        try {
            if (idStr != null && !idStr.isEmpty()) {
                tripId = Integer.parseInt(idStr);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("TripListServlet");
            return;
        }

        MissionDAO missionDao = new MissionDAO();
        SavingDAO savingsDao = new SavingDAO();

        // 2. データの取得
        List<Mission> missionList = missionDao.findByTripId(tripId);
        Trip trip = savingsDao.getTripInfo(tripId);
        int currentSavings = savingsDao.getCurrentSavings(tripId);
        
        long dailyGoal = 0;
        long daysRemaining = 0;

        // 3. 計算ロジック
        if (trip != null) {
            LocalDate today = LocalDate.now();
            LocalDate departure = trip.getDepartureDate();
            
            // 出発日までの日数を計算
            daysRemaining = ChronoUnit.DAYS.between(today, departure);
            
            if (daysRemaining > 0) {
                int neededAmount = trip.getTotalBudget() - currentSavings;
                if (neededAmount > 0) {
                    dailyGoal = neededAmount / daysRemaining;
                }
            } else {
                // 出発日を過ぎている場合は0にする
                daysRemaining = 0;
            }
        } else {
            // IDが見つからない場合はコンソールにログを出してリダイレクト
            System.out.println("Error: Trip ID " + tripId + " not found in database.");
            response.sendRedirect("TripListServlet");
            return;
        }

        // 4. JSPにデータをセット
        request.setAttribute("missionList", missionList);
        request.setAttribute("trip", trip);
        request.setAttribute("currentSavings", currentSavings);
        request.setAttribute("daysRemaining", daysRemaining);
        request.setAttribute("dailyGoal", dailyGoal);

        // 5. 表示
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mission.jsp");
        dispatcher.forward(request, response);
    }
}