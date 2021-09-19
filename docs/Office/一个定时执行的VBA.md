## 方法

```
Private Declare Function timeGetTime Lib "winmm.dll" () As Long


Sub delay(T As Long)
    Dim time1 As Long
    time1 = timeGetTime
    Do
        DoEvents
    Loop While timeGetTime - time1 < T
End Sub

Sub AutoUpdate()
    Dim i As Integer
    For i = 1 To 333
     Worksheets("Sheet1").Cells(i, 1) = i
     Call delay(5000)
    Next


End Sub

Private Sub CommandButton1_Click()
    Call AutoUpdate
End Sub
```

## DoEvents
unblock 

## Refer
https://blog.csdn.net/xuemanqianshan/article/details/104873772/?utm_medium=distribute.pc_relevant.none-task-blog-title-6&spm=1001.2101.3001.4242
https://blog.csdn.net/STR_Liang/article/details/104627060