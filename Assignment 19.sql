DELIMITER //
CREATE PROCEDURE LIST_INV(ACC_ID char(5))
BEGIN 
	SELECT TICKER, SHARE_QTY, INV_DATE, AMOUNT, STOCK_DATE AS 'CURRENT_DATE', (PRICE * SHARE_QTY) AS 'CURRENT_PRICE', 
    ((PRICE * SHARE_QTY) - AMOUNT) AS 'PROFT'
    FROM INVESTMENT JOIN STOCK_PRICES USING(TICKER) JOIN TRANSACTIONS USING (ACC_ID)
    WHERE STOCK_DATE = '2023-05-31' AND TRAN_DATE = INV_DATE;
    SELECT BALANCE 
    FROM ACCOUNTS;
END //
DELIMITER ;
CALL LIST_INV(00001);

DELIMITER //
CREATE PROCEDURE MAY_TRANS()
BEGIN 
	SELECT TRAN_ID, TRAN_DATE, DESCRP, AMOUNT, ACC_ID, INVESTMENT.INV_ID, TRAN_TYPE
    FROM TRANSACTIONS JOIN INVESTMENT USING (ACC_ID) 
    WHERE TRAN_DATE BETWEEN '2023-05-01' AND '2023-05-31';
END //
DELIMITER ;
CALL MAY_TRANS();
