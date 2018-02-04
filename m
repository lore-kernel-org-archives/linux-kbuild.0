Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:44703 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751767AbeBDSpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 13:45:34 -0500
Received: by mail-ua0-f193.google.com with SMTP id x4so17312106uaj.11
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Feb 2018 10:45:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180204155053.GA32437@x230>
References: <20180204113712.8983-1-rosca.eugeniu@gmail.com> <20180204155053.GA32437@x230>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 4 Feb 2018 19:45:32 +0100
Message-ID: <CAFkk2KSw+-UeVnw4+7CK7adsQosxk=qXPGLwVOu9AaP2PA12ng@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Minimize 'Selected by' and 'Implied by'
Content-Type: multipart/mixed; boundary="001a113cf9cabe73500564675965"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>

--001a113cf9cabe73500564675965
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2018 at 4:50 PM, Petr Vorel <petr.vorel@gmail.com> wrote:
> Hi Eugeniu,
>
>> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>
>> Commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
>> readable") made an incredible improvement in how reverse dependencies
>> are perceived by the user, by breaking down the single (often
>> interminable) expression string into small readable chunks.
>
>> Even so, what happens in practice when reading the reverse
>> dependencies is that 80-90% of the OR sub-expressions simply don't
>> matter, since they evaluate to [=3Dn].
>
>> Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=3Darm64
>> and vanilla arm64 defconfig, here is the top 30 of CONFIG options with
>> the highest amount of OR sub-expressions that make up the final
>> "{Selected,Implied} by" reverse dependency expression.
>
>> | Config                        | Revdep all | Revdep ![=3Dn] |
>> |-------------------------------|------------|--------------|
>> | REGMAP_I2C                    | 212        | 9            |
>> | CRC32                         | 167        | 25           |
>> | FW_LOADER                     | 128        | 5            |
>> | MFD_CORE                      | 124        | 9            |
>> | FB_CFB_IMAGEBLIT              | 114        | 2            |
>> | FB_CFB_COPYAREA               | 111        | 2            |
>> | FB_CFB_FILLRECT               | 110        | 2            |
>> | SND_PCM                       | 103        | 2            |
>> | CRYPTO_HASH                   | 87         | 19           |
>> | WATCHDOG_CORE                 | 86         | 6            |
>> | IRQ_DOMAIN                    | 75         | 19           |
>> | SERIAL_CORE                   | 75         | 9            |
>> | PHYLIB                        | 74         | 16           |
>> | REGMAP_MMIO                   | 72         | 15           |
>> | GENERIC_PHY                   | 67         | 20           |
>> | DMA_ENGINE                    | 66         | 11           |
>> | SERIAL_CORE_CONSOLE           | 64         | 9            |
>> | CRYPTO_BLKCIPHER              | 64         | 13           |
>> | PINMUX                        | 60         | 17           |
>> | CRYPTO                        | 59         | 10           |
>> | MII                           | 58         | 8            |
>> | GPIOLIB_IRQCHIP               | 58         | 9            |
>> | MFD_SYSCON                    | 58         | 15           |
>> | VIDEOBUF2_DMA_CONTIG          | 46         | 4            |
>> | REGMAP_IRQ                    | 45         | 6            |
>> | REGMAP_SPI                    | 44         | 2            |
>> | CLKSRC_MMIO                   | 42         | 5            |
>> | SND_SOC_GENERIC_DMAENGINE_PCM | 41         | 3            |
>> | CRYPTO_SHA1                   | 37         | 2            |
>> | REGMAP                        | 36         | 4            |
>
>> The story behind the above is that we still need to visually
>> review/evaluate 212 expressions which *potentially* select REGMAP_I2C
>> in order to identify the expressions which *actually* select
>> REGMAP_I2C, for a particular ARCH and for a particular defconfig used.
>
>> This patch attempts to bring at user's fingertips those reverse
>> dependencies that actually participate in selection of given symbol
>> filtering out the rest of them.
>
>> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>> ---
>>  scripts/kconfig/expr.c | 24 +++++++++++++++++-------
>>  1 file changed, 17 insertions(+), 7 deletions(-)
>
>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> index 2ba332b3fed7..147b2d8a8f3e 100644
>> --- a/scripts/kconfig/expr.c
>> +++ b/scripts/kconfig/expr.c
>> @@ -1234,14 +1234,24 @@ static void __expr_print(struct expr *e, void (*=
fn)(void *, struct symbol *, con
>>               fn(data, e->right.sym, e->right.sym->name);
>>               break;
>>       case E_OR:
>> -             if (revdep && e->left.expr->type !=3D E_OR)
>> -                     fn(data, NULL, "\n  - ");
>> -             __expr_print(e->left.expr, fn, data, E_OR, revdep);
>> -             if (revdep)
>> -                     fn(data, NULL, "\n  - ");
>> -             else
>> +             if (revdep) {
>> +                     struct expr *left =3D e->left.expr;
>> +                     struct expr *right =3D e->right.expr;
>> +
>> +                     if (expr_calc_value(left) !=3D no) {
>> +                             if (left->type !=3D E_OR)
>> +                                     fn(data, NULL, "\n  - ");
>> +                             __expr_print(left, fn, data, E_OR, revdep)=
;
>> +                     }
>> +                     if (expr_calc_value(right) !=3D no) {
>> +                             fn(data, NULL, "\n  - ");
>> +                             __expr_print(right, fn, data, E_OR, revdep=
);
>> +                     }
>> +             } else {
>> +                     __expr_print(e->left.expr, fn, data, E_OR, revdep)=
;
>>                       fn(data, NULL, " || ");
>> -             __expr_print(e->right.expr, fn, data, E_OR, revdep);
>> +                     __expr_print(e->right.expr, fn, data, E_OR, revdep=
);
>> +             }
>>               break;
>>       case E_AND:
>>               expr_print(e->left.expr, fn, data, E_AND);
>
> Thanks for trying to improve my change.
>
> Applying your patch, running
> $ ARCH=3Darm64 make defconfig && ARCH=3Darm64 make menuconfig
> and searching for USB prints "Selected by:" with nothing actually selecte=
d.
>
> Kind regards,
> Petr

Hello,

I implemented the behavior I had in mind. With this patch, REGMAP_I2C
shows up as follows:

Symbol: REGMAP_I2C [=3Dy]=E2=94=82
Type  : tristate=E2=94=82
  Defined at drivers/base/regmap/Kconfig:19
  Depends on: I2C [=3Dy]
  Currently selected by:
  - RTC_I2C_AND_SPI [=3Dy] && RTC_CLASS [=3Dy] && I2C [=3Dy]
  - USB_HSIC_USB3503 [=3Dy] && USB_SUPPORT [=3Dy] && USB [=3Dy] && I2C [=3D=
y]
  - SND_SOC [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] && I2C [=3Dy]
  - DRM_I2C_ADV7511 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_BRIDGE
[=3Dy] && OF [=3Dy]
  - REGULATOR_FAN53555 [=3Dy] && REGULATOR [=3Dy] && I2C [=3Dy]
  - MFD_SEC_CORE [=3Dy] && HAS_IOMEM [=3Dy] && I2C [=3Dy]=3Dy
  - MFD_RK808 [=3Dy] && HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dy]
  - MFD_MAX77620 [=3Dy] && HAS_IOMEM [=3Dy] && I2C [=3Dy]=3Dy && (OF [=3Dy]=
 ||
COMPILE_TEST [=3Dn])
  - SENSORS_INA2XX [=3Dm] && HWMON [=3Dy] && I2C [=3Dy]
  All selecting symbols:
  - PWM_PCA9685 [=3Dn] && PWM [=3Dy] && I2C [=3Dy]
  - SX9500 [=3Dn] && IIO [=3Dy] && I2C [=3Dy]
  - ZPA2326_I2C [=3Dn] && IIO [=3Dy]
  - HP03 [=3Dn] && IIO [=3Dy] && I2C [=3Dy]
  - BMP280_I2C [=3Dn] && IIO [=3Dy] && BMP280 [=3Dn] && I2C [=3Dy]
  ...

USB shows up as:

Symbol: USB [=3Dy]
Type  : tristate
Prompt: Support for Host-side USB
  Location:
    -> Device Drivers
(1)   -> USB support (USB_SUPPORT [=3Dy])
  Defined at drivers/usb/Kconfig:38
  Depends on: USB_SUPPORT [=3Dy] && USB_ARCH_HAS_HCD [=3Dy]
  Selects: USB_COMMON [=3Dy] && NLS [=3Dy]
  Currently selected by:
    No symbols
  All selecting symbols:
  - DRM_UDL [=3Dn] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && USB_SUPPORT [=3Dy] =
&&
USB_ARCH_HAS_HCD [=3Dy]
  - IR_TTUSBIR [=3Dn] && RC_DEVICES [=3Dy] && USB_ARCH_HAS_HCD [=3Dy] && RC=
_CORE [=3Dm]
  - IR_IGUANA [=3Dn] && RC_DEVICES [=3Dy] && USB_ARCH_HAS_HCD [=3Dy] && RC_=
CORE [=3Dm]
  - IR_IGORPLUGUSB [=3Dn] && RC_DEVICES [=3Dy] && USB_ARCH_HAS_HCD [=3Dy] &=
&
RC_CORE [=3Dm]
  - IR_STREAMZAP [=3Dn] && RC_DEVICES [=3Dy] && USB_ARCH_HAS_HCD [=3Dy] &&
RC_CORE [=3Dm]
  ...

What do you think about this behavior? Tell me if you spot any bugs.

While working on the patch, I thought I had a regression where a
reverse dependency of just a single symbol showed up without a leading
"  - ", hence the slight overengineering. On a second look, I think
the original patch also did that though. It's arguable whether that's
actually a bug, but now it always prints the "  - ".

I don't have access to Mutt at the moment, and GMail's web interface
mangles patches, so I'll attach the patch.

If you go with something similar, you could add a Suggested-by:.

Cheers,
Ulf

--001a113cf9cabe73500564675965
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-Readable-rev.-dep-WIP.patch"
Content-Disposition: attachment; filename="0001-Readable-rev.-dep-WIP.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jd94z47r0

RnJvbSA4ZDNlMzRkYmY0ZWIxMWY0OTI1MTk0NjQwMzFjZDYxMGFkODY2YjUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVbGYgTWFnbnVzc29uIDx1bGZhbGl6ZXJAZ21haWwuY29tPgpE
YXRlOiBTdW4sIDQgRmViIDIwMTggMTg6NTI6NDAgKzAxMDAKU3ViamVjdDogW1BBVENIXSBSZWFk
YWJsZSByZXYuIGRlcCBXSVAKCi0tLQogc2NyaXB0cy9rY29uZmlnL2V4cHIuYyB8IDk3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiBzY3JpcHRzL2tj
b25maWcvZXhwci5oIHwgIDEgKwogc2NyaXB0cy9rY29uZmlnL21lbnUuYyB8IDExICsrKysrLQog
MyBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9zY3JpcHRzL2tjb25maWcvZXhwci5jIGIvc2NyaXB0cy9rY29uZmlnL2V4cHIuYwpp
bmRleCAyYmEzMzJiM2ZlZDcuLmZkNDgxNGNiMWEzMSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9rY29u
ZmlnL2V4cHIuYworKysgYi9zY3JpcHRzL2tjb25maWcvZXhwci5jCkBAIC0xMTc5LDcgKzExNzks
MzMgQEAgc3RydWN0IGV4cHIgKmV4cHJfc2ltcGxpZnlfdW5tZXRfZGVwKHN0cnVjdCBleHByICpl
MSwgc3RydWN0IGV4cHIgKmUyKQogCXJldHVybiBleHByX2dldF9sZWZ0bW9zdF9zeW1ib2wocmV0
KTsKIH0KIAotc3RhdGljIHZvaWQgX19leHByX3ByaW50KHN0cnVjdCBleHByICplLCB2b2lkICgq
Zm4pKHZvaWQgKiwgc3RydWN0IHN5bWJvbCAqLCBjb25zdCBjaGFyICopLCB2b2lkICpkYXRhLCBp
bnQgcHJldnRva2VuLCBib29sIHJldmRlcCkKK2VudW0gZXhwcl9wcmludF9tb2RlIHsKKwlQUklO
VF9OT1JNQUwsCisKKwkvKiBQcmludCByZXZlcnNlIGRlcGVuZGVuY2llcyB3aXRoIHNlbGVjdHMg
b24gc2VwYXJhdGUgbGluZXMgKi8KKwlQUklOVF9BTExfU0VMRUNUUywKKworCS8qIExpa2UgUFJJ
TlRfQUxMX1NFTEVDVFMsIGJ1dCBza2lwICduJy12YWx1ZWQgc2VsZWN0cyAqLworCVBSSU5UX0FD
VElWRV9TRUxFQ1RTCit9OworCisvKiBIZWxwZXIgZm9yIHByZXR0eS1wcmludGluZyByZXZlcnNl
IGRlcGVuZGVuY2llcyB3aXRoIG9uZSBzZWxlY3QgcGVyIGxpbmUgKi8KK3N0YXRpYyB2b2lkIHBy
aW50X3NlbGVjdChzdHJ1Y3QgZXhwciAqZSwKKwkJCSB2b2lkICgqZm4pKHZvaWQgKiwgc3RydWN0
IHN5bWJvbCAqLCBjb25zdCBjaGFyICopLAorCQkJIHZvaWQgKmRhdGEsCisJCQkgZW51bSBleHBy
X3ByaW50X21vZGUgbW9kZSkKK3sKKwlpZiAobW9kZSA9PSBQUklOVF9BTExfU0VMRUNUUyB8fCBl
eHByX2NhbGNfdmFsdWUoZSkgIT0gbm8pIHsKKwkJZm4oZGF0YSwgTlVMTCwgIlxuICAtICIpOwor
CQlleHByX3ByaW50KGUsIGZuLCBkYXRhLCBFX09SKTsKKwl9Cit9CisKK3N0YXRpYyB2b2lkIF9f
ZXhwcl9wcmludChzdHJ1Y3QgZXhwciAqZSwKKwkJCSB2b2lkICgqZm4pKHZvaWQgKiwgc3RydWN0
IHN5bWJvbCAqLCBjb25zdCBjaGFyICopLAorCQkJIHZvaWQgKmRhdGEsCisJCQkgaW50IHByZXZ0
b2tlbiwKKwkJCSBlbnVtIGV4cHJfcHJpbnRfbW9kZSBtb2RlKQogewogCWlmICghZSkgewogCQlm
bihkYXRhLCBOVUxMLCAieSIpOwpAQCAtMTE5MCwxMCArMTIxNiwxOCBAQCBzdGF0aWMgdm9pZCBf
X2V4cHJfcHJpbnQoc3RydWN0IGV4cHIgKmUsIHZvaWQgKCpmbikodm9pZCAqLCBzdHJ1Y3Qgc3lt
Ym9sICosIGNvbgogCQlmbihkYXRhLCBOVUxMLCAiKCIpOwogCXN3aXRjaCAoZS0+dHlwZSkgewog
CWNhc2UgRV9TWU1CT0w6Ci0JCWlmIChlLT5sZWZ0LnN5bS0+bmFtZSkKLQkJCWZuKGRhdGEsIGUt
PmxlZnQuc3ltLCBlLT5sZWZ0LnN5bS0+bmFtZSk7Ci0JCWVsc2UKKwkJaWYgKGUtPmxlZnQuc3lt
LT5uYW1lKSB7CisJCQlpZiAobW9kZSA9PSBQUklOVF9OT1JNQUwpCisJCQkJZm4oZGF0YSwgZS0+
bGVmdC5zeW0sIGUtPmxlZnQuc3ltLT5uYW1lKTsKKwkJCWVsc2UKKwkJCQkvKgorCQkJCSAqIFBS
SU5UXypfU0VMRUNUUywgd2l0aCBhIGZpbmFsIHNlbGVjdCB0aGF0CisJCQkJICogaGFzIG5vIGNv
bmRpdGlvbgorCQkJCSAqLworCQkJCXByaW50X3NlbGVjdChlLCBmbiwgZGF0YSwgbW9kZSk7CisJ
CX0gZWxzZSB7CiAJCQlmbihkYXRhLCBOVUxMLCAiPGNob2ljZT4iKTsKKwkJfQogCQlicmVhazsK
IAljYXNlIEVfTk9UOgogCQlmbihkYXRhLCBOVUxMLCAiISIpOwpAQCAtMTIzNCwxOSArMTI2OCw0
MiBAQCBzdGF0aWMgdm9pZCBfX2V4cHJfcHJpbnQoc3RydWN0IGV4cHIgKmUsIHZvaWQgKCpmbiko
dm9pZCAqLCBzdHJ1Y3Qgc3ltYm9sICosIGNvbgogCQlmbihkYXRhLCBlLT5yaWdodC5zeW0sIGUt
PnJpZ2h0LnN5bS0+bmFtZSk7CiAJCWJyZWFrOwogCWNhc2UgRV9PUjoKLQkJaWYgKHJldmRlcCAm
JiBlLT5sZWZ0LmV4cHItPnR5cGUgIT0gRV9PUikKLQkJCWZuKGRhdGEsIE5VTEwsICJcbiAgLSAi
KTsKLQkJX19leHByX3ByaW50KGUtPmxlZnQuZXhwciwgZm4sIGRhdGEsIEVfT1IsIHJldmRlcCk7
Ci0JCWlmIChyZXZkZXApCi0JCQlmbihkYXRhLCBOVUxMLCAiXG4gIC0gIik7Ci0JCWVsc2UKKwkJ
aWYgKG1vZGUgPT0gUFJJTlRfTk9STUFMKSB7CisJCQlleHByX3ByaW50KGUtPmxlZnQuZXhwciwg
Zm4sIGRhdGEsIEVfT1IpOwogCQkJZm4oZGF0YSwgTlVMTCwgIiB8fCAiKTsKLQkJX19leHByX3By
aW50KGUtPnJpZ2h0LmV4cHIsIGZuLCBkYXRhLCBFX09SLCByZXZkZXApOworCQkJZXhwcl9wcmlu
dChlLT5yaWdodC5leHByLCBmbiwgZGF0YSwgRV9PUik7CisJCX0gZWxzZSB7CisJCQkvKgorCQkJ
ICogUFJJTlRfKl9TRUxFQ1RTCisJCQkgKgorCQkJICogU3VwcG9ydCBib3RoIChPUiwgPHNlbGVj
dCAxPiwgKE9SLCA8c2VsZWN0IDI+KSkgYW5kCisJCQkgKiAoT1IsIChPUiwgPHNlbGVjdCAxPiks
IDxzZWxlY3QgMj4pIGZvcm1hdCBmb3IKKwkJCSAqIHNlbGVjdHMuIEkgdGhpbmsgeW91IGFsd2F5
cyBnZXQgdGhlIHNlY29uZCBvbmUgaW4KKwkJCSAqIHByYWN0aWNlIGFzIG9mIHdyaXRpbmcuCisJ
CQkgKi8KKwkJCWlmIChlLT5yaWdodC5leHByLT50eXBlICE9IEVfT1IpIHsKKwkJCQlwcmludF9z
ZWxlY3QoZS0+cmlnaHQuZXhwciwgZm4sIGRhdGEsIG1vZGUpOworCQkJCS8qIE1vdmUgb24gdG8g
bmV4dCBzZWxlY3QgKi8KKwkJCQlfX2V4cHJfcHJpbnQoZS0+bGVmdC5leHByLCBmbiwgZGF0YSwg
RV9PUiwgbW9kZSk7CisJCQl9IGVsc2UgeworCQkJCXByaW50X3NlbGVjdChlLT5sZWZ0LmV4cHIs
IGZuLCBkYXRhLCBtb2RlKTsKKwkJCQkvKiBNb3ZlIG9uIHRvIG5leHQgc2VsZWN0ICovCisJCQkJ
X19leHByX3ByaW50KGUtPnJpZ2h0LmV4cHIsIGZuLCBkYXRhLCBFX09SLCBtb2RlKTsKKwkJCX0K
KwkJfQogCQlicmVhazsKIAljYXNlIEVfQU5EOgotCQlleHByX3ByaW50KGUtPmxlZnQuZXhwciwg
Zm4sIGRhdGEsIEVfQU5EKTsKLQkJZm4oZGF0YSwgTlVMTCwgIiAmJiAiKTsKLQkJZXhwcl9wcmlu
dChlLT5yaWdodC5leHByLCBmbiwgZGF0YSwgRV9BTkQpOworCQlpZiAobW9kZSA9PSBQUklOVF9O
T1JNQUwpIHsKKwkJCWV4cHJfcHJpbnQoZS0+bGVmdC5leHByLCBmbiwgZGF0YSwgRV9BTkQpOwor
CQkJZm4oZGF0YSwgTlVMTCwgIiAmJiAiKTsKKwkJCWV4cHJfcHJpbnQoZS0+cmlnaHQuZXhwciwg
Zm4sIGRhdGEsIEVfQU5EKTsKKwkJfSBlbHNlIHsKKwkJCS8qCisJCQkgKiBQUklOVF8qX1NFTEVD
VFMsIHdpdGggYSBmaW5hbCBzZWxlY3QgdGhhdCBoYXMgYQorCQkJICogY29uZGl0aW9uCisJCQkg
Ki8KKwkJCXByaW50X3NlbGVjdChlLCBmbiwgZGF0YSwgbW9kZSk7CisJCX0KIAkJYnJlYWs7CiAJ
Y2FzZSBFX0xJU1Q6CiAJCWZuKGRhdGEsIGUtPnJpZ2h0LnN5bSwgZS0+cmlnaHQuc3ltLT5uYW1l
KTsKQEAgLTEyNzYsNyArMTMzMyw3IEBAIHN0YXRpYyB2b2lkIF9fZXhwcl9wcmludChzdHJ1Y3Qg
ZXhwciAqZSwgdm9pZCAoKmZuKSh2b2lkICosIHN0cnVjdCBzeW1ib2wgKiwgY29uCiAKIHZvaWQg
ZXhwcl9wcmludChzdHJ1Y3QgZXhwciAqZSwgdm9pZCAoKmZuKSh2b2lkICosIHN0cnVjdCBzeW1i
b2wgKiwgY29uc3QgY2hhciAqKSwgdm9pZCAqZGF0YSwgaW50IHByZXZ0b2tlbikKIHsKLQlfX2V4
cHJfcHJpbnQoZSwgZm4sIGRhdGEsIHByZXZ0b2tlbiwgZmFsc2UpOworCV9fZXhwcl9wcmludChl
LCBmbiwgZGF0YSwgcHJldnRva2VuLCBQUklOVF9OT1JNQUwpOwogfQogCiBzdGF0aWMgdm9pZCBl
eHByX3ByaW50X2ZpbGVfaGVscGVyKHZvaWQgKmRhdGEsIHN0cnVjdCBzeW1ib2wgKnN5bSwgY29u
c3QgY2hhciAqc3RyKQpAQCAtMTMzMSw1ICsxMzg4LDEzIEBAIHZvaWQgZXhwcl9nc3RyX3ByaW50
KHN0cnVjdCBleHByICplLCBzdHJ1Y3QgZ3N0ciAqZ3MpCiAgKi8KIHZvaWQgZXhwcl9nc3RyX3By
aW50X3JldmRlcChzdHJ1Y3QgZXhwciAqZSwgc3RydWN0IGdzdHIgKmdzKQogewotCV9fZXhwcl9w
cmludChlLCBleHByX3ByaW50X2dzdHJfaGVscGVyLCBncywgRV9OT05FLCB0cnVlKTsKKwlfX2V4
cHJfcHJpbnQoZSwgZXhwcl9wcmludF9nc3RyX2hlbHBlciwgZ3MsIEVfTk9ORSwgUFJJTlRfQUxM
X1NFTEVDVFMpOworfQorCisvKgorICogTGlrZSBleHByX2dzdHJfcHJpbnRfcmV2ZGVwKCksIGJ1
dCBkbyBub3QgcHJpbnQgJ24nLXZhbHVlZCBzZWxlY3RzCisgKi8KK3ZvaWQgZXhwcl9nc3RyX3By
aW50X2FjdGl2ZV9yZXZkZXAoc3RydWN0IGV4cHIgKmUsIHN0cnVjdCBnc3RyICpncykKK3sKKwlf
X2V4cHJfcHJpbnQoZSwgZXhwcl9wcmludF9nc3RyX2hlbHBlciwgZ3MsIEVfTk9ORSwgUFJJTlRf
QUNUSVZFX1NFTEVDVFMpOwogfQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9rY29uZmlnL2V4cHIuaCBi
L3NjcmlwdHMva2NvbmZpZy9leHByLmgKaW5kZXggYzE2ZTgyZTMwMmEyLi5jMDI3NGRjMjNhNDcg
MTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9leHByLmgKKysrIGIvc2NyaXB0cy9rY29uZmln
L2V4cHIuaApAQCAtMzExLDYgKzMxMSw3IEBAIHZvaWQgZXhwcl9mcHJpbnQoc3RydWN0IGV4cHIg
KmUsIEZJTEUgKm91dCk7CiBzdHJ1Y3QgZ3N0cjsgLyogZm9yd2FyZCAqLwogdm9pZCBleHByX2dz
dHJfcHJpbnQoc3RydWN0IGV4cHIgKmUsIHN0cnVjdCBnc3RyICpncyk7CiB2b2lkIGV4cHJfZ3N0
cl9wcmludF9yZXZkZXAoc3RydWN0IGV4cHIgKmUsIHN0cnVjdCBnc3RyICpncyk7Cit2b2lkIGV4
cHJfZ3N0cl9wcmludF9hY3RpdmVfcmV2ZGVwKHN0cnVjdCBleHByICplLCBzdHJ1Y3QgZ3N0ciAq
Z3MpOwogCiBzdGF0aWMgaW5saW5lIGludCBleHByX2lzX3llcyhzdHJ1Y3QgZXhwciAqZSkKIHsK
ZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9tZW51LmMgYi9zY3JpcHRzL2tjb25maWcvbWVu
dS5jCmluZGV4IDk5MjIyODU1NTQ0Yy4uMTcwYThiNDIxZTk3IDEwMDY0NAotLS0gYS9zY3JpcHRz
L2tjb25maWcvbWVudS5jCisrKyBiL3NjcmlwdHMva2NvbmZpZy9tZW51LmMKQEAgLTgyNyw3ICs4
MjcsMTYgQEAgc3RhdGljIHZvaWQgZ2V0X3N5bWJvbF9zdHIoc3RydWN0IGdzdHIgKnIsIHN0cnVj
dCBzeW1ib2wgKnN5bSwKIAogCWdldF9zeW1ib2xfcHJvcHNfc3RyKHIsIHN5bSwgUF9TRUxFQ1Qs
IF8oIiAgU2VsZWN0czogIikpOwogCWlmIChzeW0tPnJldl9kZXAuZXhwcikgewotCQlzdHJfYXBw
ZW5kKHIsIF8oIiAgU2VsZWN0ZWQgYnk6ICIpKTsKKwkJc3RyX2FwcGVuZChyLCBfKCIgIEN1cnJl
bnRseSBzZWxlY3RlZCBieToiKSk7CisJCWlmIChleHByX2NhbGNfdmFsdWUoc3ltLT5yZXZfZGVw
LmV4cHIpID09IG5vKSB7CisJCSAgICAgICAgc3RyX2FwcGVuZChyLCAiXG4iKTsKKwkJCXN0cl9h
cHBlbmQociwgXygiICAgIE5vIHN5bWJvbHMiKSk7CisJCX0gZWxzZSB7CisJCQlleHByX2dzdHJf
cHJpbnRfYWN0aXZlX3JldmRlcChzeW0tPnJldl9kZXAuZXhwciwgcik7CisJCX0KKwkJc3RyX2Fw
cGVuZChyLCAiXG4iKTsKKworCQlzdHJfYXBwZW5kKHIsIF8oIiAgQWxsIHNlbGVjdGluZyBzeW1i
b2xzOiIpKTsKIAkJZXhwcl9nc3RyX3ByaW50X3JldmRlcChzeW0tPnJldl9kZXAuZXhwciwgcik7
CiAJCXN0cl9hcHBlbmQociwgIlxuIik7CiAJfQotLSAKMi4xNC4xCgo=
--001a113cf9cabe73500564675965--
