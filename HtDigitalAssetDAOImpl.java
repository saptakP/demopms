package com.uberotel.b2b.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.uberotel.b2b.business.domain.DigitalAsset;
import com.uberotel.b2b.business.domain.Hotel;
import com.uberotel.b2b.business.domain.Room;
import com.uberotel.common.util.DBConnectionMgr;

public class HtDigitalAssetDAOImpl {

	
	final static Logger logger = LoggerFactory.getLogger(DigitalAssetDAOImpl.class);	
	
	
	String INSERT_DIGITAL_ASSET = "INSERT INTO digital_asset (asset_type,hotel_id,room_type_id,room_id,use_room_type,no_of_assets,asset_detail,"
			+ "asset_res_ht_px,asset_res_wd_px,created,created_by) values (?,?,?,?,?,?,?,?,?,?,?)";

	String UPDATE_DIGITAL_ASSET_RM = "update digital_asset set use_room_type=? ,no_of_assets=?,asset_detail=?,updated=?,updated_by=? "
			+ "where digital_asset_id=? and asset_type=? and hotel_id=? and room_type_id=? and room_id=?";

	String UPDATE_DIGITAL_ASSET_RT = "update digital_asset set  no_of_assets=?,asset_detail=?,updated=?,updated_by=? "
			+ "where digital_asset_id=? and asset_type=? and hotel_id=? and room_type_id=? and room_id=0";

	String UPDATE_DIGITAL_ASSET_HT = "update digital_asset set  no_of_assets=?,asset_detail=?,updated=?,updated_by=? "
			+ "where digital_asset_id=? and asset_type=? and hotel_id=? and room_type_id=0 and room_id =0";

	String SELECT_DIGITAL_ASSET_HT = 
			"select A.* from "+
					"(select  "+
					"    digital_asset_id,asset_type,hotel_name,digital_asset.hotel_id, "+
					"        rt_desc,digital_asset.room_type_id,no_of_assets,asset_detail "+
					"from "+
					"    digital_asset, hotel, room_type "+
					"where "+
					"    digital_asset.hotel_id = ? "+ 
					"    and digital_asset.hotel_id = hotel.hotel_id "+ 
					"    and digital_asset.room_type_id = room_type.room_type_id "+ 
					"    and (asset_type like 'RT%') "+ 
					"union all "+ 
					" select  "+
					"    digital_asset_id,asset_type,hotel_name,digital_asset.hotel_id, "+
					"        '','0',no_of_assets,asset_detail "+
					"from "+
					"    digital_asset, hotel "+
					"where "+
					"    digital_asset.hotel_id = ? "+ 
					"    and digital_asset.hotel_id = hotel.hotel_id "+ 
					"    and digital_asset.room_type_id = 0 "+ 
					"    and (asset_type like 'HT%')) as A "+ 
					" order by room_type_id,asset_type ";
	
	
	
	

public Hotel insertDigitalAssetHotel(Hotel hotel) 
{
	// Generate two records and then For two records insert one by one;
	DigitalAsset digitalAssetHotelThumb = new DigitalAsset();
	digitalAssetHotelThumb.setHotelId(hotel.getHotelId());
	digitalAssetHotelThumb.setRoomTypeId(0);
	digitalAssetHotelThumb.setRoomId(0l);
	digitalAssetHotelThumb.setAssetType("HT_THUMB");
	
	DigitalAsset digitalAssetHotelDetail = new DigitalAsset();
	digitalAssetHotelDetail.setHotelId(hotel.getHotelId());
	digitalAssetHotelDetail.setRoomTypeId(0);
	digitalAssetHotelDetail.setRoomId(0l);
	digitalAssetHotelDetail.setAssetType("HT_DETAIL");
	
	List<DigitalAsset> digitalAssets= new ArrayList<>();
	digitalAssets.add(digitalAssetHotelThumb);
	digitalAssets.add(digitalAssetHotelDetail);
	
	Connection conn = null;
	PreparedStatement statement = null;
	ResultSet rs = null;
	
	String sql = INSERT_DIGITAL_ASSET;
	
	try {		
		
		conn=DBConnectionMgr.getConnection();
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		for(DigitalAsset digitalAsset:digitalAssets)
		{
			
			if(digitalAsset.getNoOfAssets()==null) digitalAsset.setNoOfAssets(0);
			if(digitalAsset.getAssetResHtPx()==null) digitalAsset.setAssetResHtPx(0);
			if(digitalAsset.getAssetResWdPx()==null) digitalAsset.setAssetResWdPx(0);
			
			
			statement.setString(1, digitalAsset.getAssetType());
			statement.setLong(2, digitalAsset.getHotelId()); // This can never be 0 or null
			statement.setInt(3, digitalAsset.getRoomTypeId()); // This is probably 0 for hotel level insert
			statement.setLong(4,digitalAsset.getRoomId()); // This is probably 0 for hotel level insert
			statement.setString(5, digitalAsset.getUseRoomType()); 
			statement.setInt(6, digitalAsset.getNoOfAssets());  // This is always 0 for insert
			statement.setString(7, digitalAsset.getAssetDetail());
			statement.setInt(8, digitalAsset.getAssetResHtPx());  // This is always 0 for insert
			statement.setInt(9, digitalAsset.getAssetResWdPx());  // This is always 0 for insert
			java.sql.Date insertionTime = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
			statement.setDate(10, insertionTime);
			statement.setString(11, "UserIdOfAdminUser");
			statement.addBatch();
		}
		

		int[] rowsInserted = statement.executeBatch();

		logger.debug(" inside INSERT_DIGITAL_ASSET rowsInserted "+rowsInserted );
		
		// Here we need to get the insertedHotelId. So get the newly
		// inserted data ..
	} catch (Exception e) {
		logger.error("Could not INSERT_DIGITAL_ASSET", e);
	} finally {
		DBConnectionMgr.clearConn(rs,statement,conn);
		return hotel;
	}
	
}



public Room insertDigitalAssetRoom(Room roomIn) 
{
	Connection conn = null;
	PreparedStatement statement = null;
	ResultSet rs = null;

	int roomTypeAssetCount=0;
	
	
	// First generate two records for Room and then insert one by one
	

	// Generate two records and then For two records insert one by one;
//	DigitalAsset digitalAssetRoomThumb = new DigitalAsset();
//	digitalAssetRoomThumb.setHotelId(roomIn.getHotelId());
//	digitalAssetRoomThumb.setRoomTypeId(roomIn.getRoomTypeId());
//	digitalAssetRoomThumb.setRoomId(roomIn.getRoomId());
//	digitalAssetRoomThumb.setAssetType("RM_THUMB");
//	
//	DigitalAsset digitalAssetRoomDetail = new DigitalAsset();
//	digitalAssetRoomDetail.setHotelId(roomIn.getHotelId());
//	digitalAssetRoomDetail.setRoomTypeId(roomIn.getRoomTypeId());
//	digitalAssetRoomDetail.setRoomId(roomIn.getRoomId());
//	digitalAssetRoomDetail.setAssetType("RM_DETAIL");
	
	List<DigitalAsset> digitalAssets= new ArrayList<>();
//	digitalAssets.add(digitalAssetRoomThumb);
//	digitalAssets.add(digitalAssetRoomDetail);
	
	
	
	
	try {		
		
		conn=DBConnectionMgr.getConnection();
		
		// Now check if we already have two data for the given Room Type and Hotel_id
		
		String sql = "select count(1) from digital_asset where hotel_id= ? and room_type_id=? and room_id=0 ";	
		statement = conn.prepareStatement(sql);
		statement.setLong(1,roomIn.getHotelId());
		statement.setInt(2,roomIn.getRoomTypeId());
		rs=statement.executeQuery();
		if(rs.next())roomTypeAssetCount=rs.getInt(1);
		rs.close();
		statement.close();
		
		// If we do not have any data for the Room Type and Hotel_id then generate two records for Room Type and then insert them one by one.
		if(roomTypeAssetCount!=2)
		{
			// Generate two records and then For two records insert one by one;
			DigitalAsset digitalAssetRTThumb = new DigitalAsset();
			digitalAssetRTThumb.setHotelId(roomIn.getHotelId());
			digitalAssetRTThumb.setRoomTypeId(roomIn.getRoomTypeId());
			digitalAssetRTThumb.setRoomId(0L);
			digitalAssetRTThumb.setAssetType("RT_THUMB");
//			
//			DigitalAsset digitalAssetRTDetail = new DigitalAsset();
//			digitalAssetRTDetail.setHotelId(roomIn.getHotelId());
//			digitalAssetRTDetail.setRoomTypeId(roomIn.getRoomTypeId());
//			digitalAssetRTDetail.setRoomId(0L);
//			digitalAssetRTDetail.setAssetType("RT_DETAIL");
			
			digitalAssets.add(digitalAssetRTThumb);
			// digitalAssets.add(digitalAssetRTDetail);
			
		}
		
		sql= INSERT_DIGITAL_ASSET;
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		
		
		
		
		

		for(DigitalAsset digitalAsset:digitalAssets)
		{
			if(digitalAsset.getNoOfAssets()==null) digitalAsset.setNoOfAssets(0);
			if(digitalAsset.getAssetResHtPx()==null) digitalAsset.setAssetResHtPx(0);
			if(digitalAsset.getAssetResWdPx()==null) digitalAsset.setAssetResWdPx(0);
			
			
			statement.setString(1, digitalAsset.getAssetType());
			statement.setLong(2, digitalAsset.getHotelId()); // This can never be 0 or null
			statement.setInt(3, digitalAsset.getRoomTypeId()); // This is probably 0 for hotel level insert
			statement.setLong(4,digitalAsset.getRoomId()); // This is probably 0 for hotel level or RT Level insert
			statement.setString(5, digitalAsset.getUseRoomType()); 
			statement.setInt(6, digitalAsset.getNoOfAssets());  // This is always 0 for insert
			statement.setString(7, digitalAsset.getAssetDetail());
			statement.setInt(8, digitalAsset.getAssetResHtPx());  // This is always 0 for insert
			statement.setInt(9, digitalAsset.getAssetResWdPx());  // This is always 0 for insert
			java.sql.Date insertionTime = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
			statement.setDate(10, insertionTime);
			statement.setString(11, "UserIdOfAdminUser");
			statement.addBatch();
		}

		int[] rowsInserted = statement.executeBatch();

		logger.debug(" inside INSERT_DIGITAL_ASSET rowsInserted "+rowsInserted );
		
		// Here we need to get the insertedHotelId. So get the newly
		// inserted data ..
	} catch (Exception e) {
		logger.error("Could not INSERT_DIGITAL_ASSET", e);
	} finally {
		DBConnectionMgr.clearConn(rs,statement,conn);
		return roomIn;
	}
	
	
}



public DigitalAsset updateDigitalAsset(DigitalAsset digitalAsset)
{
	String updateSql="";
	java.sql.Date updatedTime;
	Connection conn = null;
	PreparedStatement statement = null;
	ResultSet rs = null;
	
	try{
		
		int rowsAffected=0;
		conn=DBConnectionMgr.getConnection();
		
		switch (digitalAsset.getAssetType()) {
	     case "HT_THUMB":
	     case "HT_DETAIL":	 
	    	 updateSql=UPDATE_DIGITAL_ASSET_HT;
	    	 statement= conn.prepareStatement(updateSql);

				statement.setInt(1, digitalAsset.getNoOfAssets());  // This is always 0 for insert
				statement.setString(2, digitalAsset.getAssetDetail());

				updatedTime = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
				statement.setDate(3, updatedTime);
				statement.setString(4, "UserIdOfAdminUser");

				statement.setLong(5, digitalAsset.getDigitalAssetId()); // This can never be 0 or null
				statement.setString(6, digitalAsset.getAssetType());			
				statement.setLong(7, digitalAsset.getHotelId()); // This can never be 0 or null

				rowsAffected = statement.executeUpdate();
				logger.debug(" inside UPDATE_DIGITAL_ASSET_HT rowsAffected "+rowsAffected );
	    	 
	         break;
	     case "RT_THUMB":
	     case "RT_DETAIL":	 
	    	 updateSql=UPDATE_DIGITAL_ASSET_RT;
	    	 
	    	 statement= conn.prepareStatement(updateSql);

				statement.setInt(1, digitalAsset.getNoOfAssets());  // This is always 0 for insert
				statement.setString(2, digitalAsset.getAssetDetail());

				updatedTime = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
				statement.setDate(3, updatedTime);
				statement.setString(4, "UserIdOfAdminUser");

				statement.setLong(5, digitalAsset.getDigitalAssetId()); // This can never be 0 or null
				statement.setString(6, digitalAsset.getAssetType());			
				statement.setLong(7, digitalAsset.getHotelId()); // This can never be 0 or null
				statement.setInt(8, digitalAsset.getRoomTypeId()); // This is probably 0 for hotel level insert

				rowsAffected = statement.executeUpdate();
				logger.debug(" inside UPDATE_DIGITAL_ASSET_RT rowsAffected "+rowsAffected );
	    	 
	         break;
	     case "RM_THUMB":
	     case "RM_DETAIL":	 
	    	 updateSql=UPDATE_DIGITAL_ASSET_RM;
	    	 statement= conn.prepareStatement(updateSql);

	    	 	statement.setString(1, digitalAsset.getUseRoomType());
				statement.setInt(2, digitalAsset.getNoOfAssets());  // This is always 0 for insert
				statement.setString(3, digitalAsset.getAssetDetail());

				updatedTime = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
				statement.setDate(4, updatedTime);
				statement.setString(5, "UserIdOfAdminUser");

				statement.setLong(6, digitalAsset.getDigitalAssetId()); // This can never be 0 or null
				statement.setString(7, digitalAsset.getAssetType());			
				statement.setLong(8, digitalAsset.getHotelId()); // This can never be 0 or null
				statement.setInt(9, digitalAsset.getRoomTypeId()); // This is probably 0 for hotel level insert
				statement.setLong(10,digitalAsset.getRoomId()); // This is probably 0 for hotel level or RT Level insert

				rowsAffected = statement.executeUpdate();
				logger.debug(" inside UPDATE_DIGITAL_ASSET_RT rowsAffected "+rowsAffected );
    	 
				break;
	     default:
	         logger.error("Invalid AssetType "+digitalAsset.getAssetType());
		 }
	         
	}
	 catch (Exception e) {
			logger.error("Could not INSERT_DIGITAL_ASSET", e);
		} finally {
			DBConnectionMgr.clearConn(rs,statement,conn);
		}
	 
     return  digitalAsset;   

}


public List<DigitalAsset> getDigitalAssets(Hotel hotel)
{
	List<DigitalAsset> digitalAssets =new ArrayList<>();
	DigitalAsset digitalAsset;
	Connection conn = null;
	PreparedStatement statement = null;
	ResultSet rs = null;
	
try {		
		
		conn=DBConnectionMgr.getConnection();
		
		// Now check if we already have two data for the given Room Type and Hotel_id
		
		String sql = SELECT_DIGITAL_ASSET_HT ;

		statement = conn.prepareStatement(sql);
		statement.setLong(1,hotel.getHotelId());
		statement.setLong(2,hotel.getHotelId());
		rs=statement.executeQuery();
		
		
		
		while(rs.next())
			{
				digitalAsset=new DigitalAsset();
				digitalAsset.setDigitalAssetId(rs.getLong("digital_asset_id"));
				digitalAsset.setAssetType(rs.getString("asset_type"));
				digitalAsset.setHotelName(rs.getString("hotel_name"));
				digitalAsset.setHotelId(rs.getLong("hotel_id"));
				digitalAsset.setRoomTypeId(rs.getInt("room_type_id"));
				digitalAsset.setRoomTypeDesc(rs.getString("rt_desc"));
				digitalAsset.setNoOfAssets(rs.getInt("no_of_assets"));
				digitalAsset.setAssetDetail(rs.getString("asset_detail"));
				
				digitalAssets.add(digitalAsset);
			}
	} catch (Exception e) {
		logger.error("Could not INSERT_DIGITAL_ASSET", e);
	} finally {
		DBConnectionMgr.clearConn(rs,statement,conn);
	}
	return digitalAssets;
}


/*	
	INSERT INTO `uberotel`.`digital_asset`
	(`digital_asset_id`,
	`asset_type`,
	`hotel_id`,
	`room_type_id`,
	`room_id`,
	`use_room_type`,
	`no_of_assets`,
	`asset_detail`,
	`asset_res_ht_px`,
	`asset_res_wd_px`,
	`created`,
	`created_by`,
	`updated`,
	`updated_by`)
	VALUES
	(
	{digital_asset_id: BIGINT},
	{asset_type: VARCHAR},
	{hotel_id: BIGINT},
	{room_type_id: INT},
	{room_id: BIGINT},
	{use_room_type: VARCHAR},
	{no_of_assets: INT},
	{asset_detail: VARCHAR},
	{asset_res_ht_px: INT},
	{asset_res_wd_px: INT},
	{created: TIMESTAMP},
	{created_by: VARCHAR},
	{updated: TIMESTAMP},
	{updated_by: VARCHAR}
	);
	*/











}
