Sub mon_prog1()
For i = 1 To 10
Debug.Print " Je suis un mauvais élève, je dois bien travailler "
Next
End Sub


Sub mon_prog2()
i = 0
While i < 10
Debug.Print " Je suis un mauvais élève, je dois bien travailler "
i = i + 1
Wend
End Sub


--------------------------------------------------------------------------------------------


Sub afficher_demander()

Dim reponse As String

MsgBox "bonjour, une fenêtre apparait avec ce message. Validez avec [OK]"
reponse = InputBox("ici, je vous pose une question et j'attends une réponse. Merci de valider.")

MsgBox " Votre réponse est: " & reponse

End Sub



-------------------------------------------------------------------------------------------

Type Utilisateur
    Nom As String
    Prenom As String
    age As Integer
    tel As String
    adresse As String
    code_postal As String
End Type

Sub exemple()

    'Déclaration
    Dim user1 As Utilisateur
    Dim i As Integer
    i = Application.Workbooks(1).Worksheets(1).Cells(1, 8)

     For i = i + 1 To i + 100
    'Attributions des valeurs à user1
    user1.Nom = InputBox("Entrez votre nom")
    user1.Prenom = InputBox("Entrez votre prénom")
    user1.age = InputBox("Entrez votre age")
    user1.tel = InputBox("Entrez votre numero tel")
    user1.adresse = InputBox("Entrez votre adress")
    user1.code_postal = InputBox("Entrez votre code postal")

     choix = InputBox("voulez-vous continuer")

   Application.Workbooks(1).Worksheets(1).Cells(1, 8) = i

    Application.Workbooks(1).Worksheets(1).Cells(i, 1) = user1.Nom
    Application.Workbooks(1).Worksheets(1).Cells(i, 2) = user1.Prenom
    Application.Workbooks(1).Worksheets(1).Cells(i, 3) = user1.tel
    Application.Workbooks(1).Worksheets(1).Cells(i, 4) = user1.adresse
    Application.Workbooks(1).Worksheets(1).Cells(i, 5) = user1.code_postal
     If choix = "NON" Then
     Stop
        Else
    End If
  Next

   
    'Debug.Print user1.Nom & " " & user1.Prenom & " " & user1.age

End Sub
