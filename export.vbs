Option Compare Database

Const DSN As String = ""
Const TABLE_EXPORT_DESTINATION As String = ""

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
         Source:=Strings.LCase(tableName), _
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

    dstFile = TABLE_EXPORT_DESTINATION & tableName & ".csv"
    srcFile = "c:\temp\" & tableName & ".csv"

    ' Export the data
    DoCmd.TransferText acExportDelim, , tableName, srcFile, , , 65001

    ' Copy it if a destination is specified
    If Len(TABLE_EXPORT_DESTINATION) > 0 Then
        FileCopy srcFile, dstFile
    End If

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

Sub ListForms()
    Dim frm As Object
    Dim LiveForm As Form

    For Each frm In CurrentProject.AllForms
        Debug.Print frm.Name
        ''To use the form, uncomment
        DoCmd.OpenForm frm.Name, acViewDesign
        Set LiveForm = Forms(frm.Name)
        Debug.Print LiveForm.recordSource
        Debug.Print
        ''Do not forget to close when you are done
        DoCmd.Close acForm, frm.Name
    Next
End Sub

Public Sub UpdateFormSource(frmName, recordSource)
    DoCmd.OpenForm frmName, acViewDesign
    Set LiveForm = Forms(frmName)
    LiveForm.recordSource = recordSource
    DoCmd.Close acForm, frmName, acSaveYes
End Sub

Public Sub UpdateForms()

    UpdateFormSource "frmSKUSubform1", "public_frm_sku_subform1"
    UpdateFormSource "frmSKUSubform3", "public_frm_sku_subform3"
    UpdateFormSource "frmSKUSubform4", "public_qrySKUPOHistAU"
    UpdateFormSource "frmSKUSubform5", "public_qrySKUPOHistAU2"
    UpdateFormSource "frmSKUCustInfoSubform1", "public_frm_sku_cust_info_subform1"
    UpdateFormSource "frmSKUCustInfoSubform2", "public_frm_sku_cust_info_subform2"

End Sub

Public Sub UpdateReportSrouce(rptName, recordSource)
    DoCmd.OpenReport rptName, acViewDesign
    Set LiveReport = Reports(rptName)
    LiveReport.recordSource = recordSource
    DoCmd.Close acReport, rptName, acSaveYes
End Sub

Public Sub UpdateReports()

    UpdateReportSrouce "rptOrderItemsOutstanding", "public_qry_order_items_outstanding"

End Sub
