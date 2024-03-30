function pullDown() {
  const pullDownButton = document.getElementById("menu");
  const pullDownParents = document.getElementById("pull-down");
  const closeButton = document.getElementById("close-menu");

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#FFBEDA;");
  });

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style");
  });

  pullDownButton.addEventListener('click', function() {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.classList.contains("hidden")) {
      // リストが非表示の場合は表示する
      pullDownParents.classList.remove("hidden");
      pullDownParents.classList.remove("hide-lists"); // アニメーションが逆に適用されるため、クラスを削除
    } else {
      // リストが表示されている場合は非表示にし、アニメーションを適用する
      pullDownParents.classList.add("hide-lists"); // アニメーションクラスを追加
      pullDownParents.addEventListener('animationend', function onAnimationEnd() {
        pullDownParents.classList.add("hidden"); // アニメーションが終了したら非表示にする
        pullDownParents.classList.remove("hide-lists"); // アニメーションクラスを削除
        pullDownParents.removeEventListener('animationend', onAnimationEnd); // ハンドラを削除
      });
    }
  });

  // 閉じるボタンのクリックイベントを処理する
  closeButton.addEventListener('click', function() {
    pullDownParents.classList.add("hide-lists"); // スライドアウトアニメーションを適用
    pullDownParents.addEventListener('animationend', function onAnimationEnd() {
      pullDownParents.classList.add("hidden");
      pullDownParents.classList.remove("hide-lists"); // アニメーションクラスを削除
      pullDownParents.removeEventListener('animationend', onAnimationEnd);
    });
  });
}

// ページが完全に読み込まれた後にpullDown関数を呼び出す

window.addEventListener('turbo:load', pullDown);
window.addEventListener("render", pullDown);