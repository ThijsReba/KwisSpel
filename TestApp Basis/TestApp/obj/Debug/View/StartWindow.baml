   M S B A M L   `   `   `  ����B  >TestApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:TestAppTestApp  5   	       TestApp.StartWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:TestApp     5   	     � Title$  StartWindow��5	   	   $	��450��6   $	��800��6*    � DataContext 5   	   �� *
QuizList+   Locator �� Source# [  .��5
      �� .+�5   
   �  � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $��50 �6#   �� 5      $��50 �6#   �� 5      $��50 �6#   .+�5      �� $�� Quizen maar!��6   $��28(�6-   $��0��6;   �� 5      $��50��6   $��50��6    $��28(�6,   $��C��6:   
�������$
��Bold"�5   ,   
����  �$��1��5      ��6*   �� *ShowCategoryManagementCommand+5      �� 5      $��50��6   $��50��6    $��28(�6,   $��?��6:   
�������$
��Bold"�5   ,   
���/kU�$��2��5      ��6*   �� *ShowQuestionManagementCommand+5      �� 5      $��50��6   $��50��6    $��28(�6,   $��+��6:   
�������$
��Bold"�5   ,   
�������$��3��5      ��6*   �� *ShowQuizManagementCommand+5      5!      &   System.Windows.Controls.DataGrid  5"   
      AutoGenerateColumns .     
IsReadOnly . $��0,6,0,0q�6�   ���	#FF979494   GridLinesVisibility$ 
Horizontal=�6�      HorizontalGridLinesBrush �	#FFF0E0E0   HeadersVisibility$ Column=�6�   	 �� SelectedItem	 6A   �� *SelectedQuiz+��6g   �� *Quizes+
   Columns
 5#      0  *System.Windows.Controls.DataGridTextColumn  5%      ,  &System.Windows.Controls.DataGridColumn   Header$
 Quiz��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6S      FontSize$ 14Q�6]   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *Description+6]   4  .System.Windows.Controls.DataGridTemplateColumn  5'      $ 50 6)      CellTemplate 5(      �� 5)      .R�5+      �� $��0,0,0,1q�5,   )   ���	#FF999A9B
�������$��2q�6n   $��Center=�6y   $��Center=�6�   $��60��6�   $��30��6�   ���	#FF44AE3F��5+   %   �� *DataContext.DeleteQuizCommand+ �� RelativeSource ��  �� AncestorType$ DataGridL�.��5,   �   Speel!6�   5-      5/      51      52      53      