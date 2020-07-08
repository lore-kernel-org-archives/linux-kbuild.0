Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:34984 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728973AbgGHCCX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 22:02:23 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
Date: Wed, 8 Jul 2020 02:01:50 +0000
Message-ID: <BFD3E8B0-4BAA-4E3A-AF16-FB17E88BECFE@fb.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com>
 <20200707221130.GB1591079@rani.riverdale.lan>
In-Reply-To: <20200707221130.GB1591079@rani.riverdale.lan>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A44DE559F25940449F9AB288F69D74BE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Nick Terrell <nickrterrell@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>, Norbert Lange <nolange79@gmail.com>, Andrew Morton <akpm@linux-foundation.org>



> On Jul 7, 2020, at 6:11 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>=20
> On Mon, Jul 06, 2020 at 08:46:00PM -0700, Nick Terrell wrote:
>> From: Nick Terrell <terrelln@fb.com>
>>=20
>> * Adds the zstd cmd to scripts/Makefile.lib
>> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
>>=20
>> Architecture specific support is still needed for decompression.
>>=20
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 916b2f7f7098..d960f8815f87 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -413,6 +413,21 @@ quiet_cmd_xzkern =3D XZKERN  $@
>> quiet_cmd_xzmisc =3D XZMISC  $@
>>       cmd_xzmisc =3D cat $(real-prereqs) | $(XZ) --check=3Dcrc32 --lzma2=
=3Ddict=3D1MiB > $@
>>=20
>> +# ZSTD
>> +# ---------------------------------------------------------------------=
------
>> +# Appends the uncompressed size of the data using size_append. The .zst
>> +# format has the size information available at the beginning of the fil=
e too,
>> +# but it's in a more complex format and it's good to avoid changing the=
 part
>> +# of the boot code that reads the uncompressed size.
>> +# Note that the bytes added by size_append will make the zstd tool thin=
k that
>> +# the file is corrupt. This is expected.
>> +
>> +quiet_cmd_zstd =3D ZSTD    $@
>> +cmd_zstd =3D (cat $(filter-out FORCE,$^) | \
> 		   ^^ should just be $(real-prereqs)
>> +	zstd -19 && \
>> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> 	   ^^ size_append does not take arguments. It's used as just
> 	   $(size_append) and will always output shell code to print the
> 	   total size of $(real-prereqs) -- see other compressor command
> 	   definitions.

Yeah, when I wrote this code, this was how the rest of the compressors were=
 implemented.
I noticed that they had all been updated when I was responding to Norbert L=
ange earlier.
I will submit a v7 shortly with the updated command.

Thanks for the review,
Nick
