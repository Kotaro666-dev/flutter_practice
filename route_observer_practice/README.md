# route_observer_practice

FirstPage, SecondPage, ThirdPage に遷移した場合には wakeLock を有効化し、これらのページから HomePage に戻ってきた場合には wakeLock
を無効化にする想定の練習

以下はログ出力テスト結果。

```
I/flutter (15631): イベント名：didPush
I/flutter (15631): 今ページ: home_page
I/flutter (15631): 前ページ: null
I/flutter (15631): ############ HEAD #############
I/flutter (15631): home_page
I/flutter (15631): ############ TAIL #############
I/flutter (15631): 
I/flutter (15631): イベント名：didPush
I/flutter (15631): 今ページ: first_page
I/flutter (15631): 前ページ: home_page
I/flutter (15631): コールバック処理：WakeLock is enabled
I/flutter (15631): ############ HEAD #############
I/flutter (15631): first_page
I/flutter (15631): home_page
I/flutter (15631): ############ TAIL #############
I/flutter (15631): 
I/flutter (15631): イベント名：didPush
I/flutter (15631): 今ページ: second_page
I/flutter (15631): 前ページ: first_page
I/flutter (15631): コールバック処理：WakeLock is enabled
I/flutter (15631): ############ HEAD #############
I/flutter (15631): second_page
I/flutter (15631): first_page
I/flutter (15631): home_page
I/flutter (15631): ############ TAIL #############
I/flutter (15631): 
I/flutter (15631): イベント名：didPush
I/flutter (15631): 今ページ: third_page
I/flutter (15631): 前ページ: second_page
I/flutter (15631): コールバック処理：WakeLock is enabled
I/flutter (15631): ############ HEAD #############
I/flutter (15631): third_page
I/flutter (15631): second_page
I/flutter (15631): first_page
I/flutter (15631): home_page
I/flutter (15631): ############ TAIL #############
I/flutter (15631): 
I/flutter (15631): イベント名：didPop
I/flutter (15631): 前ページ: third_page
I/flutter (15631): 今ページ: second_page
I/flutter (15631): ############ HEAD #############
I/flutter (15631): second_page
I/flutter (15631): first_page
I/flutter (15631): home_page
I/flutter (15631): ############ TAIL #############
I/flutter (15631): 
I/flutter (15631): イベント名：didPop
I/flutter (15631): 前ページ: second_page
I/flutter (15631): 今ページ: first_page
I/flutter (15631): ############ HEAD #############
I/flutter (15631): first_page
I/flutter (15631): home_page
I/flutter (15631): ############ TAIL #############
I/flutter (15631): 
I/flutter (15631): イベント名：didPop
I/flutter (15631): 前ページ: first_page
I/flutter (15631): 今ページ: home_page
I/flutter (15631): コールバック処理：WakeLock is disabled
I/flutter (15631): ############ HEAD #############
I/flutter (15631): home_page
I/flutter (15631): ############ TAIL #############
I/flutter (15631): 

```