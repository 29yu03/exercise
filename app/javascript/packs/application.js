// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function() {
  $('#postCarousel').carousel({
    interval: false, // 自動スライドを無効にする
    wrap: false      // 最初と最後のスライドでのループを無効にする
  });
});


document.addEventListener("turbolinks:load", function() {
   // ページの読み込みが完了したら実行される関数

  const profileImageInput = document.getElementById('profile_image_input');
  const currentProfileImage = document.getElementById('current_profile_image');
  const imagePreview = document.getElementById('image_preview');
  // ファイル選択ボタンと画像プレビューの要素を取得

  if (profileImageInput) {
    profileImageInput.addEventListener('change', function(event) {
    // ファイル選択ボタンにchangeイベントを設定
      const file = event.target.files[0];
      const reader = new FileReader();
      // 選択されたファイルを取得

      // ファイルの読み込みが完了したら実行される処理
      reader.onload = function(event) {
        imagePreview.innerHTML = `<img src="${event.target.result}" width="170" height="170" style="border-radius: 10px;">`;
        // 読み込んだ画像を画像プレビューの要素に表示する
        currentProfileImage.style.display = 'none';
        // 現在のプロフィール画像を非表示にする

      };

      reader.readAsDataURL(file);
      // ファイルをDataURL形式に変換して読み込む
    });
  }
});
