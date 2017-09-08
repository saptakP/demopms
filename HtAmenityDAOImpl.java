package com.uberotel.b2b.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.uberotel.b2b.business.domain.Amenity;
import com.uberotel.common.util.DBConnectionMgr;

public class HtAmenityDAOImpl implements HtAmenityDAO {
	private static final Logger LOGGER = LoggerFactory.getLogger(HtAmenityDAOImpl.class);
	
	private final String SELECT_ACTIVE_AMENITIES = "SELECT amenity_id, short_desc FROM amenity WHERE status='A'";
	
	@Override
	public List<Amenity> getAllAmenities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Amenity> getAllActiveAmenities() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Amenity> amenities = new ArrayList<>();

		try {
			con = DBConnectionMgr.getConnection();
			pstmt = con.prepareStatement(SELECT_ACTIVE_AMENITIES);
			rs = pstmt.executeQuery();

			if ( rs != null ) {
				while ( rs.next() ) {
					Amenity amenity = new Amenity();
					amenity.setAmenityId(rs.getInt(1));
					amenity.setShortDesc(rs.getString(2));
					amenities.add(amenity);
				}
			}
		} catch (SQLException se) {
			LOGGER.error("SQLException >> ", se);
		} finally {
			DBConnectionMgr.clearConn(rs, pstmt, con);
		}
		return amenities;
	}

	@Override
	public Amenity getAmenityById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createAmenity(Amenity amenity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateAmenity(Amenity amenity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAmenityById(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cancelAmenity(Amenity amenity) {
		// TODO Auto-generated method stub
		return 0;
	}

}
