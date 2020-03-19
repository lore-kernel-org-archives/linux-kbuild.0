Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:58704 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgCSAzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Mar 2020 20:55:19 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v2 2/7] lib: prepare xxhash for preboot environment
Date: Thu, 19 Mar 2020 00:54:45 +0000
Message-ID: <CE7DA1F7-651B-4ADF-859E-2AB1E7E4F5FB@fb.com>
References: <20200318002303.977158-1-terrelln@fb.com>
 <20200318002303.977158-3-terrelln@fb.com> <202003181545.B6CBE5FD@keescook>
In-Reply-To: <202003181545.B6CBE5FD@keescook>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B073666D29D665498C7F109DE5C51AC6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>, Nick Terrell <nickrterrell@gmail.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>

> On Mar 18, 2020, at 3:45 PM, Kees Cook <keescook@chromium.org> wrote:
>=20
> On Tue, Mar 17, 2020 at 05:22:58PM -0700, Nick Terrell wrote:
>> Don't export symbols if PREBOOT is defined.
>>=20
>> This change is necessary to get xxhash to work in a preboot environment,
>> which is needed to support zstd-compressed kernels.
>=20
> Hmm, I thought using this:
>=20
> #define __DISABLE_EXPORTS
>=20
> before the #include of the .c files solved this?

I was able to get __DISABLE_EXPORTS to work. However, that still leaves the
MODULE_LICENSE() and MODULE_DESCRIPTION() in. I would prefer to use
the same method other decompressors use, because it is a well tested route =
and
debugging is hard in the preboot environment. If you feel strongly about it=
 I will
change it.

I will plan on submitting a v3 tomorrow morning that fixes the style nits, =
and
splits PREBOOT into XXH_PREBOOT and ZSTD_PREBOOT.

Thanks for reviewing the patches!

-Nick

> -Kees
>=20
>>=20
>> Signed-off-by: Nick Terrell <terrelln@fb.com>
>> ---
>> lib/xxhash.c | 21 ++++++++++++---------
>> 1 file changed, 12 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/lib/xxhash.c b/lib/xxhash.c
>> index aa61e2a3802f..7f1d3cb01729 100644
>> --- a/lib/xxhash.c
>> +++ b/lib/xxhash.c
>> @@ -80,13 +80,11 @@ void xxh32_copy_state(struct xxh32_state *dst, const=
 struct xxh32_state *src)
>> {
>> 	memcpy(dst, src, sizeof(*dst));
>> }
>> -EXPORT_SYMBOL(xxh32_copy_state);
>>=20
>> void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state =
*src)
>> {
>> 	memcpy(dst, src, sizeof(*dst));
>> }
>> -EXPORT_SYMBOL(xxh64_copy_state);
>>=20
>> /*-***************************
>>  * Simple Hash Functions
>> @@ -151,7 +149,6 @@ uint32_t xxh32(const void *input, const size_t len, =
const uint32_t seed)
>>=20
>> 	return h32;
>> }
>> -EXPORT_SYMBOL(xxh32);
>>=20
>> static uint64_t xxh64_round(uint64_t acc, const uint64_t input)
>> {
>> @@ -234,7 +231,6 @@ uint64_t xxh64(const void *input, const size_t len, =
const uint64_t seed)
>>=20
>> 	return h64;
>> }
>> -EXPORT_SYMBOL(xxh64);
>>=20
>> /*-**************************************************
>>  * Advanced Hash Functions
>> @@ -251,7 +247,6 @@ void xxh32_reset(struct xxh32_state *statePtr, const=
 uint32_t seed)
>> 	state.v4 =3D seed - PRIME32_1;
>> 	memcpy(statePtr, &state, sizeof(state));
>> }
>> -EXPORT_SYMBOL(xxh32_reset);
>>=20
>> void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
>> {
>> @@ -265,7 +260,6 @@ void xxh64_reset(struct xxh64_state *statePtr, const=
 uint64_t seed)
>> 	state.v4 =3D seed - PRIME64_1;
>> 	memcpy(statePtr, &state, sizeof(state));
>> }
>> -EXPORT_SYMBOL(xxh64_reset);
>>=20
>> int xxh32_update(struct xxh32_state *state, const void *input, const siz=
e_t len)
>> {
>> @@ -334,7 +328,6 @@ int xxh32_update(struct xxh32_state *state, const vo=
id *input, const size_t len)
>>=20
>> 	return 0;
>> }
>> -EXPORT_SYMBOL(xxh32_update);
>>=20
>> uint32_t xxh32_digest(const struct xxh32_state *state)
>> {
>> @@ -372,7 +365,6 @@ uint32_t xxh32_digest(const struct xxh32_state *stat=
e)
>>=20
>> 	return h32;
>> }
>> -EXPORT_SYMBOL(xxh32_digest);
>>=20
>> int xxh64_update(struct xxh64_state *state, const void *input, const siz=
e_t len)
>> {
>> @@ -439,7 +431,6 @@ int xxh64_update(struct xxh64_state *state, const vo=
id *input, const size_t len)
>>=20
>> 	return 0;
>> }
>> -EXPORT_SYMBOL(xxh64_update);
>>=20
>> uint64_t xxh64_digest(const struct xxh64_state *state)
>> {
>> @@ -494,7 +485,19 @@ uint64_t xxh64_digest(const struct xxh64_state *sta=
te)
>>=20
>> 	return h64;
>> }
>> +
>> +#ifndef PREBOOT
>> +EXPORT_SYMBOL(xxh32_copy_state);
>> +EXPORT_SYMBOL(xxh64_copy_state);
>> +EXPORT_SYMBOL(xxh32);
>> +EXPORT_SYMBOL(xxh64);
>> +EXPORT_SYMBOL(xxh32_reset);
>> +EXPORT_SYMBOL(xxh64_reset);
>> +EXPORT_SYMBOL(xxh32_update);
>> +EXPORT_SYMBOL(xxh32_digest);
>> +EXPORT_SYMBOL(xxh64_update);
>> EXPORT_SYMBOL(xxh64_digest);
>>=20
>> MODULE_LICENSE("Dual BSD/GPL");
>> MODULE_DESCRIPTION("xxHash");
>> +#endif
>> --=20
>> 2.25.1
>>=20
>=20
> --=20
> Kees Cook
