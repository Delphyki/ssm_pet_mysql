package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/submitCaptcha")
public class CaptchaVerificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取用户输入的验证码
        String userCaptcha = request.getParameter("captchaInput");

        // 从会话中获取存储的验证码
        HttpSession session = request.getSession();
        String sessionCaptcha = (String) session.getAttribute("captcha");

        // 验证验证码
        if (userCaptcha != null && userCaptcha.equals(sessionCaptcha)) {
            // 验证码正确，处理表单数据（这里简单输出成功信息）
            response.getWriter().println("Captcha verification successful!");
            // 可以选择在这里清除会话中的验证码，避免重复使用
            session.removeAttribute("captcha");
        } else {
            // 验证码错误，返回错误信息
            response.getWriter().println("Captcha verification failed. Please try again.");

            response.sendRedirect("your-form-page.html");
        }
    }
}
