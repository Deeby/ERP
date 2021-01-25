package ERP.service.wareHouse;

import java.util.List;

import enums.ServiceResult;
import vo.PagingVO;
import vo.order.BuyerReturnVO;

public interface IEnterBuyReService {
//	7. 반품의뢰서 불러오기  -- 제경
	/**
	 * 조건에 맞는 반품의뢰서 수 
	 * @param pagingVO
	 * @return
	 */
	public int readBuyerReturnCnt(PagingVO<BuyerReturnVO> pagingVO);
	/**
	 * 조건에 맞는 반품의뢰서 목록 불러오기 
	 * @param pagingVO
	 * @return
	 */
	public List<BuyerReturnVO> readBuyerReturnList(PagingVO<BuyerReturnVO> pagingVO);
//	10. 반품의뢰서 상세보기 -- 제경
	/**
	 * 반품의뢰서 상세보기 
	 * @param board_no
	 * @return
	 */
	public BuyerReturnVO readBuyerReturn(int board_no);
//	12. 상품입고하기 
	/**
	 * 반품의뢰서를 토대로 상품 입고 (반품의뢰서를 파라미터로 받는다.)
	 * @param buyReVo
	 * @return
	 */
	public ServiceResult ReEnterProd(BuyerReturnVO buyReVo);
}