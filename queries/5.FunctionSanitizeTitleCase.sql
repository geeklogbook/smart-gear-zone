use raw;
use staging;
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS `UC_Words`;
CREATE DEFINER=`root`@`localhost` FUNCTION `UC_Words`( str VARCHAR(255) ) RETURNS varchar(255) CHARSET utf8
BEGIN  
  DECLARE c CHAR(1);  
  DECLARE s VARCHAR(255);  
  DECLARE i INT DEFAULT 1;  
  DECLARE bool INT DEFAULT 1;  
  DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';  
  SET s = LCASE( str );  
  WHILE i < LENGTH( str ) DO  
     BEGIN  
       SET c = SUBSTRING( s, i, 1 );  
       IF LOCATE( c, punct ) > 0 THEN  
        SET bool = 1;  
      ELSEIF bool=1 THEN  
        BEGIN  
          IF c >= 'a' AND c <= 'z' THEN  
             BEGIN  
               SET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));  
               SET bool = 0;  
             END;  
           ELSEIF c >= '0' AND c <= '9' THEN  
            SET bool = 0;  
          END IF;  
        END;  
      END IF;  
      SET i = i+1;  
    END;  
  END WHILE;  
  RETURN s;  
END