Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35896 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754403Ab0ITCyS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Sep 2010 22:54:18 -0400
Received: by wyf22 with SMTP id 22so3900736wyf.19
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Sep 2010 19:54:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
Date: Sun, 19 Sep 2010 22:54:17 -0400
Message-ID: <AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
Subject: Re: Stale expression reference causing use-after-free
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: multipart/mixed; boundary=0016e6d7df984155da0490a80727
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

--0016e6d7df984155da0490a80727
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

It would seem that this issue is responsible for the crash I've seen
randomly happening with gconf (2.6.36-rc6, before my generalization's
branch). So far, I've traced it to the following line in
menu_finalize():

sym->dir_dep.expr =3D expr_transform(expr_copy(parent->dir_dep));

The crash happen in expr_copy(). expr_transform() is never being
called. The trace is the following:

Program received signal SIGSEGV, Segmentation fault.
0xbb1f085c in ?? () from /usr/lib/libc.so.12
(gdb) bt
#0  0xbb1f085c in ?? () from /usr/lib/libc.so.12
#1  0xbb1f0e4b in malloc () from /usr/lib/libc.so.12
#2  0x0805277f in expr_copy (org=3D0xba790fd0) at scripts/kconfig/expr.c:79
#3  0x080527e9 in expr_copy (org=3D0xba790fd0) at scripts/kconfig/expr.c:86
#4  0x00000001 in ?? ()
#5  0x00000000 in ?? ()

however, with the small patch attached, we get a bit more information:

(gdb) print expr_copy_nest
$1 =3D 43391

After reducing the stack size from 2048k (default) to 1024k:

(gdb) print expr_copy_nest
$1 =3D 21545

and bumping it to 4096k:

(gdb) print expr_copy_nest
$1 =3D 87081

so we're dying from stack exhaustion, because expr_copy() is given a
really nasty symbol:

(gdb) print org
$5 =3D (struct expr *) 0xba790fd0
(gdb) print *org
$6 =3D {type =3D E_NOT, left =3D {expr =3D 0xba790fd0, sym =3D 0xba790fd0},
right =3D {expr =3D 0x0, sym =3D 0x0}}

Reverting 246cf9c26bf11f2bffbecea6e5bd222eee7b1df8 fixes the crash.

 - Arnaud


On Sun, Sep 19, 2010 at 12:56 AM, Arnaud Lacombe <lacombar@gmail.com> wrote=
:
> Hi,
>
> I've been experiencing a use-after-free with the current kconfig (from
> for-next, but I believe mainline is affected too), related to the
> introduction of commit 246cf9c26bf11f2bffbecea6e5bd222eee7b1df8. The
> symptoms with the attached test case and patch to highlight the
> problem is the following:
>
> % scripts/kconfig/mconf Kconfig.testcase
> [...]
> Invalid expr 0xbb9124a0 at scripts/kconfig/menu.c:295 in
> menu_finalize(): 41414141
> zsh: abort (core dumped) =A0scripts/kconfig/mconf Kconfig.testcase
>
> The backtrace is not really surprising:
>
> #2 =A00xbbb9fbd6 in abort () from /usr/lib/libc.so.12
> #3 =A00x0804f23a in menu_finalize (parent=3D0xbb911e20) at
> scripts/kconfig/menu.c:295
> #4 =A00x0804eb6d in menu_finalize (parent=3D0xbb911df0) at
> scripts/kconfig/menu.c:292
> #5 =A00x0804f166 in menu_finalize (parent=3D0xbb911d60) at
> scripts/kconfig/menu.c:320
> #6 =A00x0804eb6d in menu_finalize (parent=3D0xbb911c10) at
> scripts/kconfig/menu.c:292
> #7 =A00x0804eb6d in menu_finalize (parent=3D0x8069ea0) at scripts/kconfig=
/menu.c:292
> #8 =A00x080535d7 in conf_parse (name=3D0x804aa61 "=C7\004$") at
> scripts/kconfig/zconf.tab.c:2242
> #9 =A00x0804aa61 in main (ac=3DCannot access memory at address 0x0
>
> (gdb) frame 3
> #3 =A00x0804f23a in menu_finalize (parent=3D0xbb911e20) at
> scripts/kconfig/menu.c:295
> 295 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXPR_CHECK(parent->dir_dep);
>
> So far, I tracked this issue down to the faulty expression being freed
> by expr_eliminate_dups1() in the previous iteration of
> menu_initialize(), on the following line
>
> basedep =3D expr_eliminate_dups(basedep);
>
> The testcase is a stripped down Kconfig from the tree.
>
> =A0- Arnaud
>

--0016e6d7df984155da0490a80727
Content-Type: text/x-patch; charset=US-ASCII; name="expr.c.diff"
Content-Disposition: attachment; filename="expr.c.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_geaqeaa13

ZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9leHByLmMgYi9zY3JpcHRzL2tjb25maWcvZXhw
ci5jCmluZGV4IGNjZDY1NjMuLmUyYjdmMDEgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9l
eHByLmMKKysrIGIvc2NyaXB0cy9rY29uZmlnL2V4cHIuYwpAQCAtNjMsMTIgKzU5LDE4IEBAIHN0
cnVjdCBleHByICpleHByX2FsbG9jX29yKHN0cnVjdCBleHByICplMSwgc3RydWN0IGV4cHIgKmUy
KQogCXJldHVybiBlMiA/IGV4cHJfYWxsb2NfdHdvKEVfT1IsIGUxLCBlMikgOiBlMTsKIH0KIAor
aW50IGV4cHJfY29weV9uZXN0ID0gMDsKKwogc3RydWN0IGV4cHIgKmV4cHJfY29weShzdHJ1Y3Qg
ZXhwciAqb3JnKQogewogCXN0cnVjdCBleHByICplOwogCi0JaWYgKCFvcmcpCi0JCXJldHVybiBO
VUxMOworCWV4cHJfY29weV9uZXN0Kys7CisKKwlpZiAoIW9yZykgeworCQllID0gTlVMTDsKKwkJ
Z290byBiYWlsX291dDsKKwl9CiAKIAllID0gbWFsbG9jKHNpemVvZigqb3JnKSk7CiAJbWVtY3B5
KGUsIG9yZywgc2l6ZW9mKCpvcmcpKTsKQEAgLTk3LDYgKzk5LDkgQEAgc3RydWN0IGV4cHIgKmV4
cHJfY29weShzdHJ1Y3QgZXhwciAqb3JnKQogCQlicmVhazsKIAl9CiAKK2JhaWxfb3V0OgorCWV4
cHJfY29weV9uZXN0LS07CisKIAlyZXR1cm4gZTsKIH0KIAo=
--0016e6d7df984155da0490a80727--
