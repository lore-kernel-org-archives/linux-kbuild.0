Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:63506 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728676AbgGHCDz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 22:03:55 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v6 2/8] lib: prepare xxhash for preboot environment
Date: Wed, 8 Jul 2020 02:03:24 +0000
Message-ID: <ACBA859B-4BB3-40F3-A6D9-F22A48E5C1E2@fb.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-3-nickrterrell@gmail.com>
 <20200707215925.GA1591079@rani.riverdale.lan>
In-Reply-To: <20200707215925.GA1591079@rani.riverdale.lan>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E13629502AE10640976B1E9A4203D7C5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Nick Terrell <nickrterrell@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>, Norbert Lange <nolange79@gmail.com>, Andrew Morton <akpm@linux-foundation.org>



> On Jul 7, 2020, at 5:59 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>=20
> On Mon, Jul 06, 2020 at 08:45:58PM -0700, Nick Terrell wrote:
>> From: Nick Terrell <terrelln@fb.com>
>>=20
>> Don't export symbols if XXH_PREBOOT is defined.
>>=20
>> This change is necessary to get xxhash to work in a preboot environment,
>> which is needed to support zstd-compressed kernels.
>=20
> The usual way to do it is by adding -D__DISABLE_EXPORTS to the CFLAGS, wh=
ich will
> cause EXPORT_SYMBOL to be stubbed out. Doesn't that work here?

I can do that. I did it this way because this was how other compressors did=
 it.

Thanks,
Nick=
