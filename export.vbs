Option Compare Database

Const DSN As String = ""

Public Function dataTables() As Collection

    Set dataTables = New Collection

    ' order here is for creating/exporting data
    ' dropping these objects needs to be done in reverse
    dataTables.Add "tblSupplier"
    dataTables.Add "tblSKU"
    dataTables.Add "tblPurchaseOrder"
    dataTables.Add "tblAnalysis"
    dataTables.Add "tblAnalysisItems"
    dataTables.Add "tblBank"
    dataTables.Add "tblCategory"
    dataTables.Add "tblCustomer"
    dataTables.Add "tblDCLocUpdate"
    dataTables.Add "tblOrder"
    dataTables.Add "tblOrderDeposit"
    dataTables.Add "tblOrderItems"
    dataTables.Add "tblOrderPmts"
    dataTables.Add "tblOrderPmtsItems"
    dataTables.Add "tblPercent"
    dataTables.Add "tblPreOrder"
    dataTables.Add "tblPreOrderCodes"
    dataTables.Add "tblPreOrderItems"
    dataTables.Add "tblPurchaseOrderItems"
    dataTables.Add "tblPurchaseType"
    dataTables.Add "tblSKUClass"
    dataTables.Add "tblSKUCustInfo"
    dataTables.Add "tblShipper"
    dataTables.Add "tblSupplierPmts"
    dataTables.Add "tblSupplierPmtsItems"
    dataTables.Add "tblTaxJurisdiction"
    dataTables.Add "tblUpdateNA"
    dataTables.Add "tblVendor"
End Function

Public Function printTablesReversed()
    For i = dataTables().Count To 1 Step -1
        Debug.Print dataTables.Item(i)
    Next
End Function

Public Function printTables()
    For Each Table In dataTables()
        Debug.Print Table
    Next

End Function

Public Function linkTable(tableName As String)

    Debug.Print "Linking table " & tableName

    DoCmd.TransferDatabase TransferType:=acLink, _
         DatabaseType:="ODBC Database", _
         DatabaseName:="ODBC;DSN=" & DSN, _
         ObjectType:=acTable, _
         Source:=tableName, _
         Destination:=tableName

End Function

Public Function linkTables()
    On Error GoTo LinkTables_Error

    For Each Table In dataTables()
        linkTable (Table)
    Next

    Exit Function

LinkTables_Error:
    Debug.Print Err.Number & " " & Err.Description
    Resume Next
End Function

Public Function dropTable(tableName As String)
    On Error GoTo dropTable_Error

    Debug.Print "Dropping " & tableName
    CurrentDb.TableDefs.Delete (tableName)

    Exit Function

dropTable_Error:
    Debug.Print Err.Number & " " & Err.Description

End Function

Public Function dropTables()
    For i = dataTables().Count To 1 Step -1
        dropTable dataTables.Item(i)
    Next
End Function


Public Function exportTable(tbl As String)

    SQL = "INSERT INTO public_" & tbl & " SELECT " & tbl & ".* FROM " + tbl
    Debug.Print SQL
    DoCmd.RunSQL SQL

End Function

Public Function exportTables()
    On Error GoTo errHandler

    DoCmd.SetWarnings False

    'NB collection order matters here
    For Each Table In dataTables
        exportTable Table
    Next

    DoCmd.SetWarnings True

    Exit Function

errHandler:
    Debug.Print Err.Number & " " & Err.Description
    Resume Next

End Function

Public Function dumpTable(tableName As String)

    Debug.Print "Dumping table " & tableName
    t = Now

    dstFile = "\\tsclient\au\dumps\" & tableName & ".csv"
    srcFile = "c:\temp\" & tableName & ".csv"

    DoCmd.TransferText acExportDelim, , tableName, srcFile, , , 65001
    FileCopy srcFile, dstFile

    reportTimeFrom (t)
End Function

Public Function dumpTables()
    On Error GoTo errHandler
    t = Now
    DoCmd.SetWarnings False

    For Each Table In dataTables
        dumpTable (Table)
    Next

    reportTimeFrom (t)

    DoCmd.SetWarnings True

    Exit Function

errHandler:
    Resume Next

End Function

Public Function reportTimeFrom(t As Date)
    delta_t = (Now - t) * 24 * 3600
    Debug.Print "Done in " & delta_t & " seconds"
End Function
