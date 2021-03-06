package com.solvd.secondTeamProject.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.solvd.secondTeamProject.dao.IWarehouseGoodsDAO;
import com.solvd.secondTeamProject.model.Product;
import com.solvd.secondTeamProject.model.Transport;
import com.solvd.secondTeamProject.model.Warehouse;

public class WarehouseGoodsDAO extends MySQLDAO implements IWarehouseGoodsDAO{

	private final String GET_GOODS_BY_WAREHOUSE_ID=   "select g.*, w.quantity "
													+ "from warehouses_have_goods w "
													+ "join goods g on (g.id=w.goods_id)"
													+ "where w.warehouses_id=?";
	private final String RELATE_WAREHOUSE_AND_GOODS= "insert into warehouses_have_goods(goods_id,warehouses_id,quantity) values(?,?,?)";

	private Logger log = LogManager.getLogger(WarehouseGoodsDAO.class);

	
	@Override
	public List<Product> getGoodsByWarehouseId(long id) {
		ArrayList<Product> result = new ArrayList<Product>();
		Connection con = null;
		try {
			con = cp.getConnection();
			PreparedStatement pre = con.prepareStatement(GET_GOODS_BY_WAREHOUSE_ID);
			pre.setLong(1,id);
			ResultSet rset = pre.executeQuery();
			while (rset.next()) {
				Product p =new Product();
				p.setName(rset.getString("good_name"));
				p.setId(rset.getLong("id"));
				p.setPrice(rset.getDouble("price"));
				p.setVolume(rset.getDouble("volume"));
				p.setQuantity(rset.getLong("quantity"));
				result.add(p);
			}
        } catch (SQLException e) {
			log.error("SQL Exception, can not get",e);
		} catch (InterruptedException e) {
			log.error("Cant get a connection",e);
		}finally{
			cp.releaseConnection(con);
		}
        return result;
	}


	@Override
	public void relate(Warehouse w, Product p) {
		Connection con = null;
        try {
			con = cp.getConnection();
			PreparedStatement pre = con.prepareStatement(RELATE_WAREHOUSE_AND_GOODS, Statement.RETURN_GENERATED_KEYS);
			pre.setLong(1,p.getId());
			pre.setLong(2,w.getId());
			pre.setLong(3,p.getQuantity());			
			int rset = pre.executeUpdate();
			if(rset==1)
				log.info("Warehouse and Product related");

		} catch (SQLException e) {
			log.error("SQL Exception, can not insert",e);
		} catch (InterruptedException e) {
			log.error("Cant get a connection",e);
		}finally{
			cp.releaseConnection(con);
		}
	}

}
