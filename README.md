# Firesotre エクスポートデータビューワー

使い方

1. エクスポートデータをローカルにコピーします:

    ```
    gsutil -m cp -r gs://BUCKET/PATH ./exports
    ```

2. エミュレーターを起動します:

    ```
    docker compose up
    ```

3. http://localhost:4000/firestore にアクセスします。

    * default にアクセスしてしまうので注意してください。
    * データベース名がある場合、 URL 直打ちでデータベース名を指定する必要があります。

