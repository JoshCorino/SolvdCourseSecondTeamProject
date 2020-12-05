package com.solvd.secondTeamProject;


import java.sql.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.solvd.secondTeamProject.dao.ICompanyDAO;
import com.solvd.secondTeamProject.dao.ICompanyTransportDAO;
import com.solvd.secondTeamProject.dao.IOrderGoodsDAO;
import com.solvd.secondTeamProject.dao.ITransportDAO;
import com.solvd.secondTeamProject.dao.IWarehouseDAO;
import com.solvd.secondTeamProject.dao.mybatis.*;
import com.solvd.secondTeamProject.model.*;

public class App 
{
    public static void main( String[] args )
    {
    	Logger log = LogManager.getLogger(App.class);

//    	Company company = new Company();
//    	company.setName("DHL");
//
//    	Order order = new Order();
//    	order.setDate(new Date(0));
//
//    	Product product = new Product();
//    	product.setName("Tv");
//    	product.setPrice(100);
//    	product.setVolume(10);
//    	
//    	Transport transport = new Transport();
//    	transport.setName("train");
//    	
//    	Warehouse warehouse = new Warehouse();
//    	warehouse.setName("Warehouse");
//        	
//        CompanyDAO cDAO = new CompanyDAO();
//        OrderDAO oDAO = new OrderDAO();
//        ProductDAO pDAO = new ProductDAO();
//        TransportDAO tDAO = new TransportDAO();
//        WarehouseDAO wDAO = new WarehouseDAO();
//        
//        cDAO.save(company);
//        oDAO.save(order, 1);
//        pDAO.save(product);
//        tDAO.save(transport);
//        wDAO.save(warehouse);
//        
//        Company companyGetted = cDAO.getById(1);
//    	log.info(companyGetted.toString());
//
//    	Order orderGetted = oDAO.getById(1);
//    	log.info(orderGetted.toString());
//
//    	Product productGetted = pDAO.getById(1);
//    	log.info(productGetted.toString());
//
//    	
//    	Transport transportGetted = tDAO.getById(1);
//    	log.info(transportGetted.toString());
//    	
//    	Warehouse warehouseGetted = wDAO.getById(1);
//    	log.info(warehouseGetted.toString());
//    	
//        
//        oDAO.remove(1);
//        cDAO.remove(1);
//        pDAO.remove(1);
//        tDAO.remove(1);
//        wDAO.remove(1);
        
        ICompanyDAO cd = new CompanyDAO();
        //System.out.println(cd.getAll());
        
        ITransportDAO td = new TransportDAO();
        //System.out.println(td.getById(1));
        
        ICompanyTransportDAO ctd = new CompanyTransportDAO();
        System.out.println(ctd.getTransportsByCompanyId(1l));
        
        IOrderGoodsDAO ogd = new OrderGoodsDAO();
        System.out.println(ogd.getProductsByOrderId(2));
        
        IWarehouseDAO whd = new WarehouseDAO();
        System.out.println(whd.getWarehouseById(2l));
    }
   
}
