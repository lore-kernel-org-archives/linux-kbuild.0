Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:56042 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755071AbZHCPd1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 3 Aug 2009 11:33:27 -0400
Message-ID: <4A7702D9.5080101@zytor.com>
Date: Mon, 03 Aug 2009 08:31:37 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: ld:arch/x86/kernel/vmlinux.lds:678: parse error
References: <20090803140459.02cea700@hyperion.delvare>
In-Reply-To: <20090803140459.02cea700@hyperion.delvare>
Content-Type: multipart/mixed;
 boundary="------------050306080201060908060903"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>

This is a multi-part message in MIME format.
--------------050306080201060908060903
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/03/2009 05:04 AM, Jean Delvare wrote:
> Hi Sam,
> 
> I am not able to build Linus' latest kernel on my oldest test system. I
> get the following linking error at the end:
> 
>   LD      .tmp_vmlinux1
> ld:arch/x86/kernel/vmlinux.lds:678: parse error
> 
> Which is:
> 
> ASSERT((_end - 0xC0000000 <= (512 * 1024 * 1024)),
>         "kernel image bigger than KERNEL_IMAGE_SIZE")
> 
> Apparently this assertion is relatively new, as I was able to build
> kernel 2.6.29 on the same system. The system has binutils 2.14.90.0.6,
> which is more recent than what is listed in Documentation/Changes
> (2.12).
> 
> Any idea?
> 

Old binutils doesn't accept the naked ASSERT(); there has to be a sink
for the data; so one has to do crap like:

__junk_symbol = ASSERT(...);

or

. = ASSERT(...);

near the end.

Does this patch fix it for you?

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.


--------------050306080201060908060903
Content-Type: text/plain;
 name="diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="diff"

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC92bWxpbnV4Lmxkcy5TIGIvYXJjaC94ODYv
a2VybmVsL3ZtbGludXgubGRzLlMKaW5kZXggNTlmMzFkMi4uMmViNjg3NCAxMDA2NDQKLS0t
IGEvYXJjaC94ODYva2VybmVsL3ZtbGludXgubGRzLlMKKysrIGIvYXJjaC94ODYva2VybmVs
L3ZtbGludXgubGRzLlMKQEAgLTQwNywxMiArNDA3LDEyIEBAIElOSVRfUEVSX0NQVShpcnFf
c3RhY2tfdW5pb24pOwogLyoKICAqIEJ1aWxkLXRpbWUgY2hlY2sgb24gdGhlIGltYWdlIHNp
emU6CiAgKi8KLUFTU0VSVCgoX2VuZCAtIF90ZXh0IDw9IEtFUk5FTF9JTUFHRV9TSVpFKSwK
LQkia2VybmVsIGltYWdlIGJpZ2dlciB0aGFuIEtFUk5FTF9JTUFHRV9TSVpFIikKKy4gPSBB
U1NFUlQoKF9lbmQgLSBfdGV4dCA8PSBLRVJORUxfSU1BR0VfU0laRSksCisJICAgImtlcm5l
bCBpbWFnZSBiaWdnZXIgdGhhbiBLRVJORUxfSU1BR0VfU0laRSIpOwogCiAjaWZkZWYgQ09O
RklHX1NNUAotQVNTRVJUKChwZXJfY3B1X19pcnFfc3RhY2tfdW5pb24gPT0gMCksCi0gICAg
ICAgICJpcnFfc3RhY2tfdW5pb24gaXMgbm90IGF0IHN0YXJ0IG9mIHBlci1jcHUgYXJlYSIp
OworLiA9IEFTU0VSVCgocGVyX2NwdV9faXJxX3N0YWNrX3VuaW9uID09IDApLAorICAgICAg
ICAgICAiaXJxX3N0YWNrX3VuaW9uIGlzIG5vdCBhdCBzdGFydCBvZiBwZXItY3B1IGFyZWEi
KTsKICNlbmRpZgogCiAjZW5kaWYgLyogQ09ORklHX1g4Nl8zMiAqLwpAQCAtNDIwLDcgKzQy
MCw2IEBAIEFTU0VSVCgocGVyX2NwdV9faXJxX3N0YWNrX3VuaW9uID09IDApLAogI2lmZGVm
IENPTkZJR19LRVhFQwogI2luY2x1ZGUgPGFzbS9rZXhlYy5oPgogCi1BU1NFUlQoa2V4ZWNf
Y29udHJvbF9jb2RlX3NpemUgPD0gS0VYRUNfQ09OVFJPTF9DT0RFX01BWF9TSVpFLAotICAg
ICAgICJrZXhlYyBjb250cm9sIGNvZGUgc2l6ZSBpcyB0b28gYmlnIikKKy4gPSBBU1NFUlQo
a2V4ZWNfY29udHJvbF9jb2RlX3NpemUgPD0gS0VYRUNfQ09OVFJPTF9DT0RFX01BWF9TSVpF
LAorICAgICAgICAgICAia2V4ZWMgY29udHJvbCBjb2RlIHNpemUgaXMgdG9vIGJpZyIpOwog
I2VuZGlmCi0K
--------------050306080201060908060903--
