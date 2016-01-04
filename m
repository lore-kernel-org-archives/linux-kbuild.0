Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f54.google.com ([209.85.213.54]:33593 "EHLO
	mail-vk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbcADKyr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2016 05:54:47 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
Date: Mon, 4 Jan 2016 11:54:46 +0100
Message-ID: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
Subject: Thoughts about introducing OPTIMIZATION_CFLAG
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: multipart/mixed; boundary=001a11426686026f1a05287ff3a3
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>
Cc: linux-kbuild@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

--001a11426686026f1a05287ff3a3
Content-Type: text/plain; charset=UTF-8

[ Not sure if I have addressed all the correct people and mailing-lists ]

Hi,

while still digging into a llvmlinux issue with workqueue I saw that
the wrong optimization compiler-flag was used on x86 architecture and
acpi subsystem.

CLANG requires '-Oz' whereas GCC requires '-Os'.

As acpi-daemon was throwing out the regression I looked by accident
over the *_CFLAGS.
As said... I checked only for x86 and acpi only.

For example '-Os' is hardcoded in...

arch/x86/Makefile
arch/x86/purgatory/Makefile

drivers/acpi/Makefile
drivers/acpi/acpica/Makefile

For acpi part we have currently both used '-O2' and '-Os' ('-Oz' for
llvmlinux) in approx 200 make-lines.

$ grep '\-O2' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi | wc -l
226
$ grep '\-Oz' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi |
grep '\-O2' | wc -l
200

So, which optimization-cflags is now used if I have both in one
make-line (and how can I check this)?

[ EXAMPLE ]

$ mycompiler --version
clang version 3.7.0 (tags/RELEASE_370/final)
Target: x86_64-unknown-linux-gnu
Thread model: posix

$  mycompiler -Wp,-MD,drivers/acpi/.video_detect.o.d  -nostdinc
-isystem /opt/llvm-toolchain-3.7.0/bin/../lib/clang/3.7.0/include
-nostdinc -isystem
/opt/llvm-toolchain-3.7.0/bin/../lib/clang/3.7.0/include
-I./arch/x86/include -Iarch/x86/include/generated/uapi
-Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi
-Iarch/x86/include/generated/uapi -I./include/uapi
-Iinclude/generated/uapi -include ./include/linux/kconfig.h
-D__KERNEL__ -Qunused-arguments -Wno-unknown-warning-option -Wall
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing
-fno-common -Werror-implicit-function-declaration -Wno-format-security
-std=gnu89 -no-integrated-as -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
-mno-avx -m64 -mtune=generic -mno-red-zone -mcmodel=kernel
-funit-at-a-time -DCONFIG_X86_X32_ABI -DCONFIG_AS_CFI=1
-DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
-DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
-DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare
-fno-asynchronous-unwind-tables *** -O2 *** -Wframe-larger-than=1024
-fno-stack-protector -Wno-unused-variable
-Wno-format-invalid-specifier -Wno-gnu -Wno-asm-operand-widths
-Wno-initializer-overrides -fno-builtin -Wno-tautological-compare
-mno-global-merge -fno-omit-frame-pointer -fno-optimize-sibling-calls
-pg -Wdeclaration-after-statement -Wno-pointer-sign
-fno-strict-overflow -Werror=implicit-int -Werror=strict-prototypes
-Werror=date-time -Wno-initializer-overrides -Wno-unused-value
-Wno-format -Wno-unknown-warning-option -Wno-sign-compare
-Wno-format-zero-length -Wno-uninitialized *** -Oz *** -DMODULE
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(video_detect)"
-D"KBUILD_MODNAME=KBUILD_STR(video)" -c -o
drivers/acpi/.tmp_video_detect.o drivers/acpi/video_detect.c

How can I switch a optimization-cflags for certain code-parts in the
Linux-kernel (with or without the kbuild-system)?
( So the default optimization-cflags is '-O2' whereas parts wants '-Os'. )

What to do when using CONFIG_CC_OPTIMIZE_FOR_SIZE=y which sets '-Os' explicitly?

Below tools/ directory we have also an OPTIMIZATION variable used.

Something like a "global" solution is desired from my side.

I have attached a patchset on top of my llvmlinux-amd64-fixes-4.4,
hope this helps a bit to see what I mean.
It is not doing what I desire - still WIP.

Thoughts?

Thanks in advance.

Regards,
- Sedat -

--001a11426686026f1a05287ff3a3
Content-Type: text/x-diff; charset=US-ASCII;
	name="0001-kbuild-Introduce-OPTIMIZATION_CFLAGS.patch"
Content-Disposition: attachment;
	filename="0001-kbuild-Introduce-OPTIMIZATION_CFLAGS.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iizuoe440

RnJvbSBlZDY2ZTgwOWQ3NzlkMGNlNWRiNmI3MWFkNDg3OTIwMTBiZjZhYWQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBNb24sIDQgSmFuIDIwMTYgMTE6MTY6MDAgKzAxMDAKU3ViamVjdDogW1BBVENIIDEvM10g
a2J1aWxkOiBJbnRyb2R1Y2UgT1BUSU1JWkFUSU9OX0NGTEFHUwoKU2lnbmVkLW9mZi1ieTogU2Vk
YXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4KLS0tCiBNYWtlZmlsZSB8IDExICsrKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggZGNkYjI0YjI3ZGRlLi4zMGNk
NDA2YTQ0NzUgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0yOTUsMTAg
KzI5NSwxMiBAQCBDT05GSUdfU0hFTEwgOj0gJChzaGVsbCBpZiBbIC14ICIkJEJBU0giIF07IHRo
ZW4gZWNobyAkJEJBU0g7IFwKIAkgIGVsc2UgaWYgWyAteCAvYmluL2Jhc2ggXTsgdGhlbiBlY2hv
IC9iaW4vYmFzaDsgXAogCSAgZWxzZSBlY2hvIHNoOyBmaSA7IGZpKQogCitPUFRJTUlaQVRJT05f
Q0ZMQUdTIDo9IC1PMgorCiBIT1NUQ0MgICAgICAgPSBnY2MKIEhPU1RDWFggICAgICA9IGcrKwot
SE9TVENGTEFHUyAgID0gLVdhbGwgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdzdHJpY3QtcHJvdG90
eXBlcyAtTzIgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLXN0ZD1nbnU4OQotSE9TVENYWEZMQUdTID0g
LU8yCitIT1NUQ0ZMQUdTICAgPSAtV2FsbCAtV21pc3NpbmctcHJvdG90eXBlcyAtV3N0cmljdC1w
cm90b3R5cGVzICQoT1BUSU1JWkFUSU9OX0NGTEFHUykgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLXN0
ZD1nbnU4OQorSE9TVENYWEZMQUdTID0gJChPUFRJTUlaQVRJT05fQ0ZMQUdTKQogCiBIT1NUQ0ZM
QUdTICArPSAtV25vLXVudXNlZC12YWx1ZSAtV25vLXVudXNlZC1wYXJhbWV0ZXIgLVduby1taXNz
aW5nLWZpZWxkLWluaXRpYWxpemVycwogaWZuZXEgKCQoc2hlbGwgJChIT1NUQ0MpIC12IDI+JjEg
fCBncmVwIC1jICJjbGFuZyB2ZXJzaW9uIiksIDEpCkBAIC02MjMsMTEgKzYyNSwxMCBAQCBLQlVJ
TERfQ0ZMQUdTCSs9ICQoY2FsbCBjYy1vcHRpb24sLWZuby1kZWxldGUtbnVsbC1wb2ludGVyLWNo
ZWNrcywpCiBlbmRpZgogCiBpZmRlZiBDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJWkUKLUtCVUlM
RF9DRkxBR1MgCSs9ICQoY2FsbCBjYy1vcHRpb24sLU96LC1PcykKK09QVElNSVpBVElPTl9DRkxB
R1MgOj0gJChjYWxsIGNjLW9wdGlvbiwtT3osLU9zKQogS0JVSUxEX0NGTEFHUwkrPSAkKGNhbGwg
Y2MtZGlzYWJsZS13YXJuaW5nLG1heWJlLXVuaW5pdGlhbGl6ZWQsKQotZWxzZQotS0JVSUxEX0NG
TEFHUwkrPSAtTzIKIGVuZGlmCitLQlVJTERfQ0ZMQUdTCSs9ICQoT1BUSU1JWkFUSU9OX0NGTEFH
UykKIAogIyBUZWxsIGdjYyB0byBuZXZlciByZXBsYWNlIGNvbmRpdGlvbmFsIGxvYWQgd2l0aCBh
IG5vbi1jb25kaXRpb25hbCBvbmUKIEtCVUlMRF9DRkxBR1MJKz0gJChjYWxsIGNjLW9wdGlvbiwt
LXBhcmFtPWFsbG93LXN0b3JlLWRhdGEtcmFjZXM9MCkKLS0gCjIuNi40Cgo=
--001a11426686026f1a05287ff3a3
Content-Type: text/x-diff; charset=US-ASCII;
	name="0002-x86-llvmlinux-Use-OPTIMIZATION_CFLAGS.patch"
Content-Disposition: attachment;
	filename="0002-x86-llvmlinux-Use-OPTIMIZATION_CFLAGS.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iizuog0p1

RnJvbSBhMTIyNGNiZGEyMjI3YTEwY2M4NmJjN2IxYzA0NDJkZjcwMTVmMjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBNb24sIDQgSmFuIDIwMTYgMTE6NDE6NTEgKzAxMDAKU3ViamVjdDogW1BBVENIIDIvM10g
eDg2OiBsbHZtbGludXg6IFVzZSBPUFRJTUlaQVRJT05fQ0ZMQUdTCgpTaWduZWQtb2ZmLWJ5OiBT
ZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgotLS0KIGFyY2gveDg2L01ha2VmaWxl
ICAgICAgICAgICB8IDQgKysrLQogYXJjaC94ODYvcHVyZ2F0b3J5L01ha2VmaWxlIHwgNCArKyst
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9NYWtlZmlsZSBiL2FyY2gveDg2L01ha2VmaWxlCmluZGV4IDVmYTQx
ZmZlMTVlMi4uYTg4ZDBkNDkwMTkxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9NYWtlZmlsZQorKysg
Yi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMjAsNyArMjAsOSBAQCBlbmRpZgogQ09ERTE2R0NDX0NG
TEFHUyA6PSAtbTMyIC1XYSwkKHNyY3RyZWUpL2FyY2gveDg2L2Jvb3QvY29kZTE2Z2NjLmgKIE0x
Nl9DRkxBR1MJIDo9ICQoY2FsbCBjYy1vcHRpb24sIC1tMTYsICQoQ09ERTE2R0NDX0NGTEFHUykp
CiAKLVJFQUxNT0RFX0NGTEFHUwk6PSAkKE0xNl9DRkxBR1MpIC1nIC1PcyAtRF9fS0VSTkVMX18g
XAorT1BUSU1JWkFUSU9OX0NGTEFHUyA6PSAkKGNhbGwgY2Mtb3B0aW9uLC1PeiwtT3MpCisKK1JF
QUxNT0RFX0NGTEFHUwk6PSAkKE0xNl9DRkxBR1MpIC1nICQoT1BUSU1JWkFUSU9OX0NGTEFHUykg
LURfX0tFUk5FTF9fIFwKIAkJICAgLURESVNBQkxFX0JSQU5DSF9QUk9GSUxJTkcgXAogCQkgICAt
V2FsbCAtV3N0cmljdC1wcm90b3R5cGVzIC1tYXJjaD1pMzg2IC1tcmVncGFybT0zIFwKIAkJICAg
LWZuby1zdHJpY3QtYWxpYXNpbmcgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLWZuby1waWMgXApkaWZm
IC0tZ2l0IGEvYXJjaC94ODYvcHVyZ2F0b3J5L01ha2VmaWxlIGIvYXJjaC94ODYvcHVyZ2F0b3J5
L01ha2VmaWxlCmluZGV4IDJjODM1ZTM1NjM0OS4uYzlmZmMwN2Y5ZmEzIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9wdXJnYXRvcnkvTWFrZWZpbGUKKysrIGIvYXJjaC94ODYvcHVyZ2F0b3J5L01ha2Vm
aWxlCkBAIC0xMCw3ICsxMCw5IEBAIHRhcmdldHMgKz0gcHVyZ2F0b3J5LnJvCiAjIGluIHR1cm4g
bGVhdmVzIHNvbWUgdW5kZWZpbmVkIHN5bWJvbHMgbGlrZSBfX2ZlbnRyeV9fIGluIHB1cmdhdG9y
eSBhbmQgbm90CiAjIHN1cmUgaG93IHRvIHJlbG9jYXRlIHRob3NlLiBMaWtlIGtleGVjLXRvb2xz
LCB1c2UgY3VzdG9tIGZsYWdzLgogCi1LQlVJTERfQ0ZMQUdTIDo9IC1mbm8tc3RyaWN0LWFsaWFz
aW5nIC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLWZuby16ZXJvLWluaXRpYWxpemVkLWluLWJz
cyAtZm5vLWJ1aWx0aW4gLWZmcmVlc3RhbmRpbmcgLWMgLU1EIC1PcyAtbWNtb2RlbD1sYXJnZQor
T1BUSU1JWkFUSU9OX0NGTEFHUyA6PSAkKGNhbGwgY2Mtb3B0aW9uLC1PeiwtT3MpCisKK0tCVUlM
RF9DRkxBR1MgOj0gLWZuby1zdHJpY3QtYWxpYXNpbmcgLVdhbGwgLVdzdHJpY3QtcHJvdG90eXBl
cyAtZm5vLXplcm8taW5pdGlhbGl6ZWQtaW4tYnNzIC1mbm8tYnVpbHRpbiAtZmZyZWVzdGFuZGlu
ZyAtYyAtTUQgJChPUFRJTUlaQVRJT05fQ0ZMQUdTKSAtbWNtb2RlbD1sYXJnZQogS0JVSUxEX0NG
TEFHUyArPSAtbSQoQklUUykKIAogJChvYmopL3B1cmdhdG9yeS5ybzogJChQVVJHQVRPUllfT0JK
UykgRk9SQ0UKLS0gCjIuNi40Cgo=
--001a11426686026f1a05287ff3a3
Content-Type: text/x-diff; charset=US-ASCII;
	name="0003-acpi-llvmlinux-Use-OPTIMIZATION_CFLAGS.patch"
Content-Disposition: attachment;
	filename="0003-acpi-llvmlinux-Use-OPTIMIZATION_CFLAGS.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iizuohwc2

RnJvbSAzZWQwZmRlYWZkMjE5NTE4Y2VmZjYwMWNiYjRkZjU2MmMwOTM3NGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBNb24sIDQgSmFuIDIwMTYgMTE6NDI6NTggKzAxMDAKU3ViamVjdDogW1BBVENIIDMvM10g
YWNwaTogbGx2bWxpbnV4OiBVc2UgT1BUSU1JWkFUSU9OX0NGTEFHUwoKU2lnbmVkLW9mZi1ieTog
U2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2FjcGkvTWFr
ZWZpbGUgICAgICAgIHwgNCArKystCiBkcml2ZXJzL2FjcGkvYWNwaWNhL01ha2VmaWxlIHwgNCAr
KystCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvTWFrZWZpbGUgYi9kcml2ZXJzL2FjcGkvTWFrZWZpbGUK
aW5kZXggNjc1ZWFmMzM3MTc4Li44YTUyNTU4ZGEzMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNw
aS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2FjcGkvTWFrZWZpbGUKQEAgLTIsNyArMiw5IEBACiAj
IE1ha2VmaWxlIGZvciB0aGUgTGludXggQUNQSSBpbnRlcnByZXRlcgogIwogCi1jY2ZsYWdzLXkJ
CQk6PSAtT3MKK09QVElNSVpBVElPTl9DRkxBR1MgCQk6PSAkKGNhbGwgY2Mtb3B0aW9uLC1Peiwt
T3MpCisKK2NjZmxhZ3MteQkJCTo9ICQoT1BUSU1JWkFUSU9OX0NGTEFHUykKIGNjZmxhZ3MtJChD
T05GSUdfQUNQSV9ERUJVRykJKz0gLURBQ1BJX0RFQlVHX09VVFBVVAogCiAjCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2FjcGkvYWNwaWNhL01ha2VmaWxlIGIvZHJpdmVycy9hY3BpL2FjcGljYS9NYWtl
ZmlsZQppbmRleCA4ODU5MzZmNzk1NDIuLjQ0YjQ2NDhjY2I0NiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9hY3BpL2FjcGljYS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2FjcGkvYWNwaWNhL01ha2VmaWxl
CkBAIC0yLDcgKzIsOSBAQAogIyBNYWtlZmlsZSBmb3IgQUNQSUNBIENvcmUgaW50ZXJwcmV0ZXIK
ICMKIAotY2NmbGFncy15CQkJOj0gLU9zIC1EQlVJTERJTkdfQUNQSUNBCitPUFRJTUlaQVRJT05f
Q0ZMQUdTCQk6PSAkKGNhbGwgY2Mtb3B0aW9uLC1PeiwtT3MpCisKK2NjZmxhZ3MteQkJCTo9ICQo
T1BUSU1JWkFUSU9OX0NGTEFHUykgLURCVUlMRElOR19BQ1BJQ0EKIGNjZmxhZ3MtJChDT05GSUdf
QUNQSV9ERUJVRykJKz0gLURBQ1BJX0RFQlVHX09VVFBVVAogCiAjIHVzZSBhY3BpLm8gdG8gcHV0
IGFsbCBmaWxlcyBoZXJlIGludG8gYWNwaS5vIG1vZHBhcmFtIG5hbWVzcGFjZQotLSAKMi42LjQK
Cg==
--001a11426686026f1a05287ff3a3--
