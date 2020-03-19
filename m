Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:34570 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgCSBg3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Mar 2020 21:36:29 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v2 8/7] .gitignore: add ZSTD-compressed files
Date: Thu, 19 Mar 2020 01:36:17 +0000
Message-ID: <0CFF6F19-AF18-4B5C-8EEE-71B8E64EAD4E@fb.com>
References: <20200318002303.977158-1-terrelln@fb.com>
 <20200319010015.26880-1-kilobyte@angband.pl>
In-Reply-To: <20200319010015.26880-1-kilobyte@angband.pl>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A85907ABA10B074C91C8AE46816F4640@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Nick Terrell <nickrterrell@gmail.com>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>



> On Mar 18, 2020, at 6:00 PM, Adam Borowski <kilobyte@angband.pl> wrote:
>=20
> For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably mor=
e
> will come, thus let's be consistent with all other compressors.

Thanks for the review, I will include that in v3 tomorrow!

> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
> Otherwise, "git status" will complain.
>=20
>=20
> .gitignore | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index 72ef86a5570d..edb0191c294f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -43,6 +43,7 @@
> *.tab.[ch]
> *.tar
> *.xz
> +*.zst
> Module.symvers
> modules.builtin
> modules.order
> --=20
> 2.26.0.rc2
>=20
