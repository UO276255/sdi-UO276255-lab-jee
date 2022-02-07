package com.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ProductsServlet", value = "/products")
public class ProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<String,Integer> storeProducts = (HashMap<String, Integer>) request.getSession().getAttribute("storeProducts");

        if (storeProducts == null) {
            storeProducts = new HashMap<String,Integer>();
            request.getSession().setAttribute("storeProducts", storeProducts);
        }

        String product = request.getParameter("product");
        if (product != null) {
            addToListCart(storeProducts, product);
        }
        request.setAttribute("selectedItems", storeProducts);
        getServletContext().getRequestDispatcher("/products-view.jsp").forward(request, response);

    }

    private void addToListCart(Map<String,Integer> storeProducts, String productKey){
        if(storeProducts.get(productKey) == null){
            storeProducts.put(productKey,Integer.valueOf(1));
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
