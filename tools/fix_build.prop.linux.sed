s/ *= */=/g

s/ro.product.model=.*/ro.product.model=L-04E/
s/ro.product.brand=.*/ro.product.brand=lge/
s/ro.product.name=.*/ro.product.name=geevl04e_dcm_jp/
s/ro.product.device=.*/ro.product.device=geevl04e/
s/ro.build.product=.*/ro.build.product=geevl04e/
s/ro.build.description=.*/ro.build.description=geevl04e_dcm_jp-user 4.1.2 JZO54K L04E10c.1363013820 release-keys/
s%ro.build.fingerprint=.*%ro.build.fingerprint=lge/geevl04e_dcm_jp/geevl04e:4.1.2/JZO54K/L04E10c.1363013820:user/release-keys%

$s/$/\n/
$s/$/#/g
$s/$/\n/

$s/$/# Add/g
$s/$/\n/

   s/ro.config.libemoji=.*//g
$s/$/ro.config.libemoji=libemoji_docomo.so/
$s/$/\n/
