-- Change Significance
CREATE OR REPLACE TRIGGER ChangeSignificance
  BEFORE INSERT ON IMAGES FOR EACH ROW

  BEGIN
    IF :NEW.SIGNIFICANCE > 70 THEN
      :NEW.STORAGE_ID := 1;
    ELSIF :NEW.SIGNIFICANCE >= 45 OR :NEW.SIGNIFICANCE <= 69 THEN
      :NEW.STORAGE_ID := 2;
    ELSE
      :NEW.STORAGE_ID := 3;
    END IF;
  END;
/
