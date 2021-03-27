
ALTER TABLE tblsku ADD COLUMN tsv tsvector;

CREATE TRIGGER tsvectorupdate
BEFORE INSERT OR UPDATE ON tblsku
FOR EACH ROW EXECUTE FUNCTION
  tsvector_update_trigger(tsv, 'pg_catalog.english',
    SKU,
    Manf,
    ItemNo,
    SKUDesc,
    UnitWeight,
    SKUMinUnitsType,
    DCLoc,
    VSKU01,
    VSKU02,
    VSKU03,
    VSKU04,
    VSKU05,
    VSKU06,
    VSKU07,
    VSKU08,
    VSKU09,
    VSKU10,
    SKUNotes
    );

UPDATE tblsku SET tsv =
    to_tsvector('pg_catalog.english', coalesce(SKU::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(Manf::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(ItemNo::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(SKUDesc::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(UnitWeight::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(SKUMinUnitsType::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(DCLoc::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU01::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU02::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU03::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU04::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU05::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU06::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU07::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU08::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU09::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(VSKU10::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(SKUNotes::text, ''))

;
DROP VIEW frm_sku_subform1;
\i queries/frm_sku_subform1.sql

