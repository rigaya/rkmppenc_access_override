
# rkmppenc_access_override
by rigaya

```/dev/ion``` にアクセス件がある状態で [rkmppenc](https://github.com/rigaya/rkmppenc) を実行すると、mpp の初期化に失敗する場合があります。

このsoは、mppが```/dev/ion```のチェックに使用する```access```関数をhookし、```/dev/ion```に対するチェックを常に失敗させることで、このエラーを防ぎます。

## ビルド

gccをインストールした環境で ```make``` を実行します。```rkmppenc_access_override.so```が生成されます。

```
git clone https://github.com/rigaya/rkmppenc_access_override.git
cd rkmppenc_access_override
make
```

## 使用方法

```rkmppenc```実行時に、環境変数 ```LD_PRELOAD``` に ```rkmppenc_access_override.so```へのパスを指定して使用します。

```
LD_PRELOAD=<path/to/rkmppenc_access_override.so> rkmppenc -i input -o output
```


## rkmppenc_access_override 使用にあたっての注意事項
無保証です。自己責任で使用してください。 
