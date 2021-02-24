Option Compare Database

Const DSN As String = "AuditPG"

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

    sql = "INSERT INTO public_" & tbl & " SELECT " & tbl & ".* FROM " + tbl
    Debug.Print sql
    DoCmd.RunSQL sql

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


