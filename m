Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from galactus.symlabs.net ([91.121.6.203]:38675 "EHLO symlabs.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1761012AbYEAQlP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 12:41:15 -0400
Message-ID: <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net>
In-Reply-To: <20080501163453.GF29330@cs181133002.pp.htv.fi>
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net>
    <20080501120616.GY29330@cs181133002.pp.htv.fi>
    <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net>
    <20080501163453.GF29330@cs181133002.pp.htv.fi>
Date: Thu, 1 May 2008 18:38:23 +0200 (CEST)
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not
     digestible by gas
From: sampo@symlabs.com
Reply-To: sampo@symlabs.com
MIME-Version: 1.0
Content-Type: multipart/mixed;boundary="----=_20080501183823_32661"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: sampo@symlabs.com, linux-kbuild@vger.kernel.org

------=_20080501183823_32661
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Adrian Bunk wrote:
> On Thu, May 01, 2008 at 05:05:47PM +0200, sampo@symlabs.com wrote:
>> Adrian Bunk wrote:
>> > On Thu, May 01, 2008 at 07:07:55AM +0200, sampo@symlabs.com wrote:
>> >> Platform: x86
>> >> Compiler: gcc-3.4.6
>> >> Binutils: 2.17.50.0.8
>> >> Kernel under build: 2.6.25 (from kernel.org)
>> >>
>> >> Problem: Build fails due to incompatibility of asm-offsets.h with
>> >> assembler. See below:
>> >>
>> >> gcc -Wp,-MD,arch/x86/kernel/.entry_32.o.d  -nostdinc -isystem
>> >> /apps/gcc/3.4.6/lib/gcc/i686-pc-linux-gnu/3.4.6/include -D__KERNEL__
>> >> -Iinclude  -include include/linux/autoconf.h -D__ASSEMBLY__ -m32
>> >> -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
>> >> -Iinclude/asm-x86/mach-default     -c -o arch/x86/kernel/entry_32.o
>> >> arch/x86/kernel/entry_32.S
>> >> include/asm/asm-offsets.h: Assembler messages:
>> >> include/asm/asm-offsets.h:10: Error: invalid character '_' in
>> mnemonic
>> >> include/asm/asm-offsets.h:11: Error: invalid character '_' in
>> mnemonic
>> >> include/asm/asm-offsets.h:12: Error: invalid character '_' in
>> mnemonic
>> >> include/asm/asm-offsets.h:13: Error: invalid character '_' in
>> mnemonic
>> >> include/asm/asm-offsets.h:14: Error: invalid character '_' in
>> mnemonic
>> >> include/asm/asm-offsets.h:15: Error: invalid character '_' in
>> mnemonic
>> >> (snip - much more of the same)
>> >>...
>> >
>> > Thanks for your report.
>> >
>> > Please send:
>> > - your .config
>> > - your include/asm/asm-offsets.h
>>
>> Please see attached. FYI
>>
>> ls-alFg include/asm
>> lrwxrwxrwx 1 sampo sampo 7 May  1 02:30 include/asm -> asm-x86/
>
> Thanks, the next things I need are:
> - arch/x86/kernel/asm-offsets.s

See attached.

> - the output of "sed --version"

sed --version
GNU sed version 4.1.5-boot
Copyright (C) 2003 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE,
to the extent permitted by law.

To facilitate more rapid communication, my skype chat is sampo.kellomaki
and my phone is +351-918.731.007. I stay up late so please do not
hesitate to call at any hour. I am based in Lisbon.

Cheers,
--Sampo

------=_20080501183823_32661
Content-Type: application/octet-stream; name="asm-offsets.s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="asm-offsets.s"

CS5maWxlCSJhc20tb2Zmc2V0cy5jIgojIEdOVSBDIHZlcnNpb24gMy40LjYgKGk2ODYtcGMtbGlu
dXgtZ251KQojCWNvbXBpbGVkIGJ5IEdOVSBDIHZlcnNpb24gMy40LjYuCiMgR0dDIGhldXJpc3Rp
Y3M6IC0tcGFyYW0gZ2djLW1pbi1leHBhbmQ9OTAgLS1wYXJhbSBnZ2MtbWluLWhlYXBzaXplPTEx
MzAwNAojIG9wdGlvbnMgcGFzc2VkOiAgLW5vc3RkaW5jIC1JaW5jbHVkZSAtSWluY2x1ZGUvYXNt
LXg4Ni9tYWNoLWRlZmF1bHQKIyAtRF9fS0VSTkVMX18gLURDT05GSUdfQVNfQ0ZJPTEgLURDT05G
SUdfQVNfQ0ZJX1NJR05BTF9GUkFNRT0xCiMgLURLQlVJTERfU1RSKHMpPSNzIC1ES0JVSUxEX0JB
U0VOQU1FPUtCVUlMRF9TVFIoYXNtX29mZnNldHMpCiMgLURLQlVJTERfTU9ETkFNRT1LQlVJTERf
U1RSKGFzbV9vZmZzZXRzKSAtaXN5c3RlbSAtaW5jbHVkZSAtTUQgLW0zMgojIC1tc29mdC1mbG9h
dCAtbXJlZ3Bhcm09MyAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0yIC1tYXJjaD1pNjg2CiMg
LW1uby1zc2UgLW1uby1tbXggLW1uby1zc2UyIC1tbm8tM2Rub3cgLWF1eGJhc2Utc3RyaXAgLU8y
IC1XYWxsIC1XdW5kZWYKIyAtV3N0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJpZ3JhcGhzIC1XZXJy
b3ItaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb24KIyAtV25vLXNpZ24tY29tcGFyZSAtV2Rl
Y2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtZm5vLXN0cmljdC1hbGlhc2luZwojIC1mbm8tY29t
bW9uIC1mcmVnLXN0cnVjdC1yZXR1cm4gLWZuby11bml0LWF0LWEtdGltZSAtZmZyZWVzdGFuZGlu
ZwojIC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLWZvbWl0LWZyYW1lLXBvaW50ZXIg
LWZ2ZXJib3NlLWFzbQojIG9wdGlvbnMgZW5hYmxlZDogIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1
Zy10eXBlcyAtZmRlZmVyLXBvcAojIC1mb21pdC1mcmFtZS1wb2ludGVyIC1mb3B0aW1pemUtc2li
bGluZy1jYWxscyAtZmNzZS1mb2xsb3ctanVtcHMKIyAtZmNzZS1za2lwLWJsb2NrcyAtZmV4cGVu
c2l2ZS1vcHRpbWl6YXRpb25zIC1mdGhyZWFkLWp1bXBzCiMgLWZzdHJlbmd0aC1yZWR1Y2UgLWZw
ZWVwaG9sZSAtZmZvcmNlLW1lbSAtZmZ1bmN0aW9uLWNzZQojIC1ma2VlcC1zdGF0aWMtY29uc3Rz
IC1mY2FsbGVyLXNhdmVzIC1mcmVnLXN0cnVjdC1yZXR1cm4gLWZnY3NlIC1mZ2NzZS1sbQojIC1m
Z2NzZS1zbSAtZmdjc2UtbGFzIC1mbG9vcC1vcHRpbWl6ZSAtZmNyb3NzanVtcGluZyAtZmlmLWNv
bnZlcnNpb24KIyAtZmlmLWNvbnZlcnNpb24yIC1mcmVydW4tY3NlLWFmdGVyLWxvb3AgLWZyZXJ1
bi1sb29wLW9wdAojIC1mZGVsZXRlLW51bGwtcG9pbnRlci1jaGVja3MgLWZzY2hlZHVsZS1pbnNu
czIgLWZzY2hlZC1pbnRlcmJsb2NrCiMgLWZzY2hlZC1zcGVjIC1mc2NoZWQtc3RhbGxlZC1pbnNu
cyAtZnNjaGVkLXN0YWxsZWQtaW5zbnMtZGVwCiMgLWZicmFuY2gtY291bnQtcmVnIC1mcmVvcmRl
ci1ibG9ja3MgLWZyZW9yZGVyLWZ1bmN0aW9ucyAtZmNwcm9wLXJlZ2lzdGVycwojIC1mdmVyYm9z
ZS1hc20gLWZyZWdtb3ZlIC1mb3B0aW1pemUtcmVnaXN0ZXItbW92ZSAtZmFyZ3VtZW50LWFsaWFz
CiMgLWZtZXJnZS1jb25zdGFudHMgLWZ6ZXJvLWluaXRpYWxpemVkLWluLWJzcyAtZmlkZW50IC1m
cGVlcGhvbGUyCiMgLWZndWVzcy1icmFuY2gtcHJvYmFiaWxpdHkgLWZtYXRoLWVycm5vIC1mdHJh
cHBpbmctbWF0aCAtbWllZWUtZnAKIyAtbWZwLXJldC1pbi0zODcgLW1hY2N1bXVsYXRlLW91dGdv
aW5nLWFyZ3MgLW1uby1yZWQtem9uZQojIC1tdGxzLWRpcmVjdC1zZWctcmVmcyAtbXR1bmU9aTY4
NiAtbWFyY2g9aTY4NiAtbXJlZ3Bhcm09MwojIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTIK
CgkudGV4dAoJLnAyYWxpZ24gNCwsMTUKLmdsb2JsIGZvbwoJLnR5cGUJZm9vLCBAZnVuY3Rpb24K
Zm9vOgojQVBQCgkKLT5JQTMyX1NJR0NPTlRFWFRfYXggJDQ0IG9mZnNldG9mKHN0cnVjdCBzaWdj
b250ZXh0LCBheCkJIwoJCi0+SUEzMl9TSUdDT05URVhUX2J4ICQzMiBvZmZzZXRvZihzdHJ1Y3Qg
c2lnY29udGV4dCwgYngpCSMKCQotPklBMzJfU0lHQ09OVEVYVF9jeCAkNDAgb2Zmc2V0b2Yoc3Ry
dWN0IHNpZ2NvbnRleHQsIGN4KQkjCgkKLT5JQTMyX1NJR0NPTlRFWFRfZHggJDM2IG9mZnNldG9m
KHN0cnVjdCBzaWdjb250ZXh0LCBkeCkJIwoJCi0+SUEzMl9TSUdDT05URVhUX3NpICQyMCBvZmZz
ZXRvZihzdHJ1Y3Qgc2lnY29udGV4dCwgc2kpCSMKCQotPklBMzJfU0lHQ09OVEVYVF9kaSAkMTYg
b2Zmc2V0b2Yoc3RydWN0IHNpZ2NvbnRleHQsIGRpKQkjCgkKLT5JQTMyX1NJR0NPTlRFWFRfYnAg
JDI0IG9mZnNldG9mKHN0cnVjdCBzaWdjb250ZXh0LCBicCkJIwoJCi0+SUEzMl9TSUdDT05URVhU
X3NwICQyOCBvZmZzZXRvZihzdHJ1Y3Qgc2lnY29udGV4dCwgc3ApCSMKCQotPklBMzJfU0lHQ09O
VEVYVF9pcCAkNTYgb2Zmc2V0b2Yoc3RydWN0IHNpZ2NvbnRleHQsIGlwKQkjCgkKLT4KCQotPkNQ
VUlORk9feDg2ICQwIG9mZnNldG9mKHN0cnVjdCBjcHVpbmZvX3g4NiwgeDg2KQkjCgkKLT5DUFVJ
TkZPX3g4Nl92ZW5kb3IgJDEgb2Zmc2V0b2Yoc3RydWN0IGNwdWluZm9feDg2LCB4ODZfdmVuZG9y
KQkjCgkKLT5DUFVJTkZPX3g4Nl9tb2RlbCAkMiBvZmZzZXRvZihzdHJ1Y3QgY3B1aW5mb194ODYs
IHg4Nl9tb2RlbCkJIwoJCi0+Q1BVSU5GT194ODZfbWFzayAkMyBvZmZzZXRvZihzdHJ1Y3QgY3B1
aW5mb194ODYsIHg4Nl9tYXNrKQkjCgkKLT5DUFVJTkZPX2hhcmRfbWF0aCAkNiBvZmZzZXRvZihz
dHJ1Y3QgY3B1aW5mb194ODYsIGhhcmRfbWF0aCkJIwoJCi0+Q1BVSU5GT19jcHVpZF9sZXZlbCAk
MTIgb2Zmc2V0b2Yoc3RydWN0IGNwdWluZm9feDg2LCBjcHVpZF9sZXZlbCkJIwoJCi0+Q1BVSU5G
T194ODZfY2FwYWJpbGl0eSAkMTYgb2Zmc2V0b2Yoc3RydWN0IGNwdWluZm9feDg2LCB4ODZfY2Fw
YWJpbGl0eSkJIwoJCi0+Q1BVSU5GT194ODZfdmVuZG9yX2lkICQ0OCBvZmZzZXRvZihzdHJ1Y3Qg
Y3B1aW5mb194ODYsIHg4Nl92ZW5kb3JfaWQpCSMKCQotPgoJCi0+VElfdGFzayAkMCBvZmZzZXRv
ZihzdHJ1Y3QgdGhyZWFkX2luZm8sIHRhc2spCSMKCQotPlRJX2V4ZWNfZG9tYWluICQ0IG9mZnNl
dG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgZXhlY19kb21haW4pCSMKCQotPlRJX2ZsYWdzICQ4IG9m
ZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgZmxhZ3MpCSMKCQotPlRJX3N0YXR1cyAkMTIgb2Zm
c2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBzdGF0dXMpCSMKCQotPlRJX3ByZWVtcHRfY291bnQg
JDIwIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgcHJlZW1wdF9jb3VudCkJIwoJCi0+VElf
YWRkcl9saW1pdCAkMjQgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBhZGRyX2xpbWl0KQkj
CgkKLT5USV9yZXN0YXJ0X2Jsb2NrICQzMiBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIHJl
c3RhcnRfYmxvY2spCSMKCQotPlRJX3N5c2VudGVyX3JldHVybiAkMjggb2Zmc2V0b2Yoc3RydWN0
IHRocmVhZF9pbmZvLCBzeXNlbnRlcl9yZXR1cm4pCSMKCQotPlRJX2NwdSAkMTYgb2Zmc2V0b2Yo
c3RydWN0IHRocmVhZF9pbmZvLCBjcHUpCSMKCQotPgoJCi0+R0RTX3NpemUgJDAgb2Zmc2V0b2Yo
c3RydWN0IGRlc2NfcHRyLCBzaXplKQkjCgkKLT5HRFNfYWRkcmVzcyAkMiBvZmZzZXRvZihzdHJ1
Y3QgZGVzY19wdHIsIGFkZHJlc3MpCSMKCQotPgoJCi0+UFRfRUJYICQwIG9mZnNldG9mKHN0cnVj
dCBwdF9yZWdzLCBieCkJIwoJCi0+UFRfRUNYICQ0IG9mZnNldG9mKHN0cnVjdCBwdF9yZWdzLCBj
eCkJIwoJCi0+UFRfRURYICQ4IG9mZnNldG9mKHN0cnVjdCBwdF9yZWdzLCBkeCkJIwoJCi0+UFRf
RVNJICQxMiBvZmZzZXRvZihzdHJ1Y3QgcHRfcmVncywgc2kpCSMKCQotPlBUX0VESSAkMTYgb2Zm
c2V0b2Yoc3RydWN0IHB0X3JlZ3MsIGRpKQkjCgkKLT5QVF9FQlAgJDIwIG9mZnNldG9mKHN0cnVj
dCBwdF9yZWdzLCBicCkJIwoJCi0+UFRfRUFYICQyNCBvZmZzZXRvZihzdHJ1Y3QgcHRfcmVncywg
YXgpCSMKCQotPlBUX0RTICQyOCBvZmZzZXRvZihzdHJ1Y3QgcHRfcmVncywgZHMpCSMKCQotPlBU
X0VTICQzMiBvZmZzZXRvZihzdHJ1Y3QgcHRfcmVncywgZXMpCSMKCQotPlBUX0ZTICQzNiBvZmZz
ZXRvZihzdHJ1Y3QgcHRfcmVncywgZnMpCSMKCQotPlBUX09SSUdfRUFYICQ0MCBvZmZzZXRvZihz
dHJ1Y3QgcHRfcmVncywgb3JpZ19heCkJIwoJCi0+UFRfRUlQICQ0NCBvZmZzZXRvZihzdHJ1Y3Qg
cHRfcmVncywgaXApCSMKCQotPlBUX0NTICQ0OCBvZmZzZXRvZihzdHJ1Y3QgcHRfcmVncywgY3Mp
CSMKCQotPlBUX0VGTEFHUyAkNTIgb2Zmc2V0b2Yoc3RydWN0IHB0X3JlZ3MsIGZsYWdzKQkjCgkK
LT5QVF9PTERFU1AgJDU2IG9mZnNldG9mKHN0cnVjdCBwdF9yZWdzLCBzcCkJIwoJCi0+UFRfT0xE
U1MgJDYwIG9mZnNldG9mKHN0cnVjdCBwdF9yZWdzLCBzcykJIwoJCi0+CgkKLT5FWEVDX0RPTUFJ
Tl9oYW5kbGVyICQ0IG9mZnNldG9mKHN0cnVjdCBleGVjX2RvbWFpbiwgaGFuZGxlcikJIwoJCi0+
SUEzMl9SVF9TSUdGUkFNRV9zaWdjb250ZXh0ICQxNjQgb2Zmc2V0b2Yoc3RydWN0IHJ0X3NpZ2Zy
YW1lLCB1Yy51Y19tY29udGV4dCkJIwoJCi0+CgkKLT5wYmVfYWRkcmVzcyAkMCBvZmZzZXRvZihz
dHJ1Y3QgcGJlLCBhZGRyZXNzKQkjCgkKLT5wYmVfb3JpZ19hZGRyZXNzICQ0IG9mZnNldG9mKHN0
cnVjdCBwYmUsIG9yaWdfYWRkcmVzcykJIwoJCi0+cGJlX25leHQgJDggb2Zmc2V0b2Yoc3RydWN0
IHBiZSwgbmV4dCkJIwoJCi0+VFNTX3N5c2VudGVyX3NwMCAkLTg3MDAgb2Zmc2V0b2Yoc3RydWN0
IHRzc19zdHJ1Y3QsIHg4Nl90c3Muc3AwKSAtIHNpemVvZihzdHJ1Y3QgdHNzX3N0cnVjdCkJIwoJ
Ci0+UEFHRV9TSVpFX2FzbSAkNDA5NiBQQUdFX1NJWkUJIwoJCi0+UEFHRV9TSElGVF9hc20gJDEy
IFBBR0VfU0hJRlQJIwoJCi0+UFRSU19QRVJfUFRFICQxMDI0IFBUUlNfUEVSX1BURQkjCgkKLT5Q
VFJTX1BFUl9QTUQgJDEgUFRSU19QRVJfUE1ECSMKCQotPlBUUlNfUEVSX1BHRCAkMTAyNCBQVFJT
X1BFUl9QR0QJIwoJCi0+Y3J5cHRvX3RmbV9jdHhfb2Zmc2V0ICQ0OCBvZmZzZXRvZihzdHJ1Y3Qg
Y3J5cHRvX3RmbSwgX19jcnRfY3R4KQkjCgkKLT4KCQotPkJQX3NjcmF0Y2ggJDQ4NCBvZmZzZXRv
ZihzdHJ1Y3QgYm9vdF9wYXJhbXMsIHNjcmF0Y2gpCSMKCQotPkJQX2xvYWRmbGFncyAkNTI5IG9m
ZnNldG9mKHN0cnVjdCBib290X3BhcmFtcywgaGRyLmxvYWRmbGFncykJIwoJCi0+QlBfaGFyZHdh
cmVfc3ViYXJjaCAkNTcyIG9mZnNldG9mKHN0cnVjdCBib290X3BhcmFtcywgaGRyLmhhcmR3YXJl
X3N1YmFyY2gpCSMKCQotPkJQX3ZlcnNpb24gJDUxOCBvZmZzZXRvZihzdHJ1Y3QgYm9vdF9wYXJh
bXMsIGhkci52ZXJzaW9uKQkjCiNOT19BUFAKCXJldAoJLnNpemUJZm9vLCAuLWZvbwoJLmxvY2Fs
CV9fZm9yY2Vfb3JkZXIKCS5jb21tCV9fZm9yY2Vfb3JkZXIsNCw0Cgkuc2VjdGlvbgkubm90ZS5H
TlUtc3RhY2ssIiIsQHByb2diaXRzCgkuaWRlbnQJIkdDQzogKEdOVSkgMy40LjYiCg==
------=_20080501183823_32661--


