module TaskHelpers

  CLOBBER.include %w[
    ddl/indexes.sql
    ddl/load_data.sql
    ddl/schema.sql
    audit.accdb
    dumps/*.csv
    create_system_dsn.bat
  ]

  CLEAN.include %w[
    dumps/*.clean.csv
  ]

  def db
    ENV['DATABASE_URL'] || "-d #{RANDOM_DB_NAME}"
  end

  def mdb
    ENV['MDB'] || 'audit.accdb'
  end

  def tables
    [
     "tblSupplier",
     "tblSKU",
     "tblPurchaseOrder",
     "tblAnalysis",
     "tblAnalysisItems",
     "tblBank",
     "tblCategory",
     "tblCustomer",
     "tblDCLocUpdate",
     "tblOrder",
     "tblOrderDeposit",
     "tblOrderItems",
     "tblOrderPmts",
     "tblOrderPmtsItems",
     "tblPercent",
     "tblPreOrder",
     "tblPreOrderCodes",
     "tblPreOrderItems",
     "tblPurchaseOrderItems",
     "tblPurchaseType",
     "tblSKUClass",
     "tblSKUCustInfo",
     "tblShipper",
     "tblSupplierPmts",
     "tblSupplierPmtsItems",
     "tblTaxJurisdiction",
     "tblUpdateNA",
     "tblVendor",
   ]
  end

  def parse_database_url
    uri = URI(ENV['DATABASE_URL'].lstrip.chomp)

    {
      user:     uri.user,
      pass:     uri.password,
      port:     uri.port || 5432,
      host:     uri.host,
      database: uri.path[1..],
      sslmode:  "prefer",
    }
  end

end
