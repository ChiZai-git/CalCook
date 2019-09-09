package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import processing.PurchaseOrderOutput;

/**
 * Servlet implementation class PurchaceOrder
 */
public class PurchaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaceOrder() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String errMsg = "";
		int resultFlag;

		PurchaseOrderOutput purchaseOrder = new PurchaseOrderOutput();
		resultFlag = purchaseOrder.PurchaseOrder();

		request.setAttribute("resultFlag", resultFlag);
		request.setAttribute("errMsg", errMsg);
		request.getRequestDispatcher("PurchaseOrderEdit.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
