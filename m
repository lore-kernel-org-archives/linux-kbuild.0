Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649463;
	b=uDqff3BPdJovVGcYydss60au1/BpGzQmRs0QUQL33EI2PuNU7NKZR5cKjNWeMTuPKvxn
	 Sa2XQVCiy9yW9LzQ3YXjZefpZMTVUjFDFfqFe8F+8oCdmFiAsOGeFiAu7Z1E0oGHCK6lq
	 Uu8HWajCgRiWRsSuL5CqXLPrXAB73M+i5LA4xHL0FM03mMLWgTWEh0SPTsY9+XAf/BG88
	 K79TSKWPtMVYMm9wck3BPxuhgd6kaJu7u0+G0cNgfNDhc3K/n+lbuUvUO2pQbZYHpsvDU
	 cYOfWb7WADguJZC+1qtPo4R9W8ZN7xTz0xOuMvAzNH+vImyksrk0hwMDrU8MPK93xGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=IsTV0C3NsWFzyc5EN5xi+u0IF5Ywfk5Kit7oRFfTTIU=;
	b=A66nd5YBz6vwTGoL1GU1JAtu6olcV1BBHxrAuWtj7uS10/pVat/P9Pt+l7t6Ef9hmNM0
	 EpUCodfSf+QCeyUdzQWAdZWjeUmYiehcrQvVdjnz/37iLKnPzUpitPGFuuot/APNhxo+q
	 2P2WZo5ibe/iP7B3ayrTWWyPcj2lBPf+aREXeHb7TB1qM0Ec3wpcQ4l+fPupzjhyarrfe
	 dW2Ef21CsSUBPYNALI8nkJsmQMbB8MnVyh+BqLKCjKSPkPjbr8z1vC6dfI7dmTPcomHGx
	 5+yXl9y+vyiaAIxnvzvvxlt7N5GSKTenumjFRR+bltF4ROggBJomXyCgxCwYPFUcfHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YSlQ/zJU";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A8D606A32A
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 23:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A8D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YSlQ/zJU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2916862f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 15:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649461; x=1796254261; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IsTV0C3NsWFzyc5EN5xi+u0IF5Ywfk5Kit7oRFfTTIU=;
        b=YSlQ/zJUXogzXesxC8ohXnyWNkRmdLcFb4CTSHVlRd5R6REWwX6LDFfrAwJLtJ/MJM
         CzkFpUiyogwRo5a8VummiwW5NBB9FYrOdO24mLn9yM4WHuSDAHnZ+VR+C63u/3ZK6PhY
         oVv8D7QiE0v9m1Cgg800+L6NCSeZrOd9Wk4e2+rExTz00H23ZxvHiADD+Ucq1UCyMI2D
         BMlg6QrpaZqRRWxhj77GHYElvOl40bjgkclJSOtYr/wnaSlTmKwiXNEuz+UDpxM2Jw72
         ObDq6mH/ROLySTdTUI9yyAuP/Qq7Ncz3Yu63dKjauy5V3AITl1WYzR1siV0SR/cmd6UM
         /C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649461; x=1796254261;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsTV0C3NsWFzyc5EN5xi+u0IF5Ywfk5Kit7oRFfTTIU=;
        b=XvNwVST6sAkF57WL3renjm34h0nZNJnCJx/XUYbT5H6R60Ryd/QQsznh27/wh/Rr/O
         XIJ1TaZcljIluqLbzIG4fdSJ9pPn76zzOVo0PSH1zyr/mrxXJhiZln98J471RLJWdjtb
         /1LWusLqghJhGRvzR39uEVVATTPmb2Wzg0mmZ6Xds41KkOTQ0zLtaTNLc0ubr0iHnFMY
         qtyq9/nZKRD4zddPRJzXREuOQtRB5xB/6KYLKam6+3PQE9bP9Of5+FqyJz1/OJr6ZdM/
         58Q/VZ1wA0h1rV8gXj+AgF88RMwL4fgGQFCnsgTm11FppMF5mJGbdUxR4U/Po9iH0oSV
         6unA==
X-Forwarded-Encrypted: i=1; AL+hErFQ8mreQMQN37sbXmLwT+mjF8f3Kxfs9AJx255nhpkbYsIkviTjUr0IfTtOhFUv/GgUih2vsF722a7hjaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JfXRCaHrUdzriBZf+lGh2sXSM4Ya6inldsavALMZ7Q2wYAv+U
	CFVZSeMfEFc0XXSsAz4Py13dQk1V09QxFo2jGOYhA/8TnelzoaVB5v0A
X-Gm-Gg: AZFdTZdvMItGDzD7ma96VFm+hz78wLShIpK+WT69gSRsmgDLTv7Qocj8sy0MxkbB/iY
	3s7J0l/QZDspaf3TnoLSKn9lBF4myTAd8Iuj5oLLKr2Tqqq3FeXEstw5LRN3zD8MqpKVVIZb3eP
	yRlyWV91DnBNECopNYxief8qxJk6VDqPOsDEZ4lB8OSMdTe6XRXBwFPo7+CxMpM2CS3CPmhcy9K
	BWqMZxUlmSHr2fZe8/tUvAHxaipNfLwEmoSfEkwJp9nLBkt21YlzrT8hVtoBh19ANle0vqRgFTj
	tf0P5nHGF+oF4LIKanIIVnQmTdT8Prl6sDtqqPoxK24J05GYEJnwlUdNWWitfCLg5mXkDkFSisI
	ZEpUrHVXWflyH0UAvJW/SYscq7PTGBYg9AN4o8jTrMdx9NlzKMbvCKhnae1sNHFtF1Vuyr7ydbR
	mzSnkhrFlbSWuYcUGHDKSys0ki04un9W4J98JpLYUvRfJ9aXPw9pmweCmfZ3c9K3XJ8sAV6XWSK
	hLRQ3QOOQePTtdJDJV9KgH/6besPy8jIvjPO50KPAeTaYV3VVALV43XCc6j8n0VuYuwVIvnjZMd
	raKTTWOjAIzHqvp8dxwzejKvMMwKmaihVBECb5yM0QDFLd2uhJvG/AWIpkg2gMcbPJG2UR6u0B0
	o9yGa4sgDWd9fmUW/mw==
X-Received: by 2002:a5d:5f88:0:b0:4a9:b6e8:7c6 with SMTP id ffacd0b85a97d-4abab02c3bfmr36329365f8f.8.1795649460678;
        Wed, 25 Nov 2026 15:31:00 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm38031818f8f.58.2026.11.25.15.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 15:30:59 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
Date: Wed, 25 Nov 2026 23:30:58 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
Content-Language: en-US
In-Reply-To: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4VH2GW00lQVgMZO4NWKt7o0R"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4VH2GW00lQVgMZO4NWKt7o0R
Content-Type: multipart/mixed; boundary="------------Go6KQObmpkGqGitCoEutHhyP";
 protected-headers="v1"; hp="clear"
Message-ID: <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
Date: Wed, 25 Nov 2026 23:30:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
Content-Language: en-US
In-Reply-To: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>

--------------Go6KQObmpkGqGitCoEutHhyP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Priyanshu,

On 11/18/26 07:15, Priyanshu Singh wrote:
> randconfig parses KCONFIG_SEED with signed strtol(), causing several
> validation and cross-architecture bugs:
>=20
> - Artificial constraints and portability issues:
>   32-bit seeds in [0x80000000, 0xFFFFFFFF] and values > UINT_MAX
>   are capped to LONG_MAX (0x7FFFFFFF) on 32-bit hosts instead of
>   matching 64-bit host behavior.
> - Whitespace handling asymmetry: Trailing whitespace leaves
>   *endp !=3D '\0', discarding the seed in favor of gettimeofday()
>   while leading whitespace is accepted.
> - Garbage handling: Invalid strings (e.g., "xyz", "42_foo") fall back
>   to the clock seed and exit with status 0, ignoring KCONFIG_WERROR.
>=20
> Switch to strtoull(..., 0) and consume trailing whitespace so
> whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
> explicitly so C11 and C23 builds behave identically.

C23 builds aren't supported yet.

>=20
> Emit a warning whenever KCONFIG_SEED deviates from a canonical unsigned=

> 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, retain=


Yes, it would be good to improve the input validation for KCONFIG_SEED,
especially to reject negative values.

In a v2, could you make this part more explicit (add it to your bullet
list of changes above?)

> modulo 2^32 truncation for parseable 64-bit integers and fall back to
> the clock seed on unparseable inputs or ERANGE overflow.
>=20
> Add regression tests in scripts/kconfig/tests/randconfig_seed/.
>=20
> Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconfig=
")

Improvements in input validation are good, but 'Fixes' is for bugs.

> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
> ---
> Notes for reviewers:
> - 0b/0B guard: Under glibc 2.38+ with -std=3Dgnu2x/-std=3Dc23, strtoull=
()
>   maps to __isoc23_strtoull() which accepts 0b/0B binary prefixes in
>   base 0, whereas C11 stops at 'b'. Rejecting 0b/0B prior to strtoull()=

>   keeps behavior identical across toolchains.
> - Backward compatibility (KCONFIG_WERROR unset): Non-canonical but
>   parseable 64-bit integers (whitespace, signs, -1, or > UINT_MAX
>   timestamps like `date +%s%N`) emit a warning and truncate modulo 2^32=

>   across both 32-bit and 64-bit hosts, while unparseable strings or
>   > 64-bit ERANGE overflows fall back to gettimeofday().
>=20
> Input                   Pre-Patch (64-bit)    Pre-Patch (32-bit)    Pos=
t-Patch (32 & 64-bit)
> ----------------------  --------------------  --------------------  ---=
---------------------------------
> "42" / "0x2a"           0x2A (quiet)          0x2A (quiet)          0x2=
A (quiet)
> "0x80000000"            0x80000000 (quiet)    0x7FFFFFFF (clamp)    0x8=
0000000 (quiet)
> " 42"                   0x2A (quiet)          0x2A (quiet)          0x2=
A + warn (WERROR -> exit 1)
> "42 "                   Clock fallback        Clock fallback        0x2=
A + warn (WERROR -> exit 1)
> "-1"                    0xFFFFFFFF (quiet)    0xFFFFFFFF (quiet)    0xF=
FFFFFFF + warn (WERROR -> exit 1)
> "4294967296" (2^32)     0x0 (quiet)           0x7FFFFFFF (clamp)    0x0=
 + warn (WERROR -> exit 1)
> "18446744073709551616"  0xFFFFFFFF (clamp)    0x7FFFFFFF (clamp)    Clo=
ck fallback + warn (WERROR -> 1)
> "0b1010"                Clock (C11)/10 (C23)  Clock (C11)/10 (C23)  Clo=
ck fallback + warn (WERROR -> 1)
> "xyz" / "42_foo"        Clock (ignores WERR)  Clock (ignores WERR)  Clo=
ck fallback + warn (WERROR -> 1)
>=20
> Tested via `make testconfig` (40 passed).
>=20
>  scripts/kconfig/conf.c                        |  40 +++-
>  scripts/kconfig/tests/randconfig_seed/Kconfig |  44 ++++
>  .../kconfig/tests/randconfig_seed/__init__.py | 222 ++++++++++++++++++=

>  3 files changed, 303 insertions(+), 3 deletions(-)
>  create mode 100644 scripts/kconfig/tests/randconfig_seed/Kconfig
>  create mode 100644 scripts/kconfig/tests/randconfig_seed/__init__.py
>=20
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 31c6fd25e6ec..bccf1d591990 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -92,11 +92,45 @@ static void set_randconfig_seed(void)
> =20
>  	env =3D getenv("KCONFIG_SEED");
>  	if (env && *env) {
> +		const char *p =3D env;
> +		const char *digits;
>  		char *endp;
> +		unsigned long long val =3D 0;
> +		bool has_bin_prefix;
> +		bool warned =3D false;
> +
> +		while (isspace((unsigned char)*p))
> +			p++;
> +
> +		digits =3D (*p =3D=3D '+' || *p =3D=3D '-') ? p + 1 : p;
> +		has_bin_prefix =3D digits[0] =3D=3D '0' &&
> +				 (digits[1] =3D=3D 'b' || digits[1] =3D=3D 'B');
> +
> +		errno =3D 0;
> +		if (!has_bin_prefix)
> +			val =3D strtoull(p, &endp, 0);
> +		else
> +			endp =3D (char *)p;

So it seems this would explicitly enforce C11's strtoull() handling of
binary representation (which is to say, it's not supported).

But C23 does add binary support to strtoull(), which is what we actually
want, because the whole reason strtoull() was added here was for its
support for hex representation (0x/0X prefix):

e85ac12443da (=E2=80=9Ckconfig/conf: accept a base-16 seed for randconfig=
=E2=80=9D)

In a v2, you can remove the changes for binary 0b/0B handling.

> +
> +		if (p !=3D env || !isdigit((unsigned char)*p) || *endp !=3D '\0' ||
> +		    errno =3D=3D ERANGE || val > UINT_MAX) {
> +			fprintf(stderr,
> +				"warning: KCONFIG_SEED has malformed format\n");

We have a similar warning for KCONFIG_PROBABILITY. In the future, we
should consider factoring out input warnings (like 'conf_warning').

Priyanshu, this is fine for now; you don't need to change this in a v2.

> +			warned =3D true;
> +		}
> =20
> -		seed =3D strtol(env, &endp, 0);
> -		if (*endp =3D=3D '\0')
> -			seed_set =3D true;
> +		if (endp !=3D p && errno !=3D ERANGE) {
> +			while (isspace((unsigned char)*endp))
> +				endp++;
> +
> +			if (*endp =3D=3D '\0') {
> +				seed =3D (unsigned int)val;

This cast is unnecessary, you can just do 'seed =3D val;'

> +				seed_set =3D true;
> +			}
> +		}
> +
> +		if (warned && getenv("KCONFIG_WERROR"))
> +			exit(1);
>  	}
> =20
>  	if (!seed_set) {
> diff --git a/scripts/kconfig/tests/randconfig_seed/Kconfig b/scripts/kc=
onfig/tests/randconfig_seed/Kconfig
> new file mode 100644
> index 000000000000..28d5cb225b04
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_seed/Kconfig
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config MODULES
> +	bool
> +	default y
> +	modules
> +
> +config BOOL1
> +	bool "Bool 1"
> +
> +config BOOL2
> +	bool "Bool 2"
> +
> +config BOOL3
> +	bool "Bool 3"
> +
> +config BOOL4
> +	bool "Bool 4"
> +
> +config TRI1
> +	tristate "Tristate 1"
> +
> +config TRI2
> +	tristate "Tristate 2"
> +
> +config TRI3
> +	tristate "Tristate 3"
> +
> +config TRI4
> +	tristate "Tristate 4"
> +
> +choice
> +	prompt "Choice"
> +
> +config CHOICE_A
> +	bool "Choice A"
> +
> +config CHOICE_B
> +	bool "Choice B"
> +
> +config CHOICE_C
> +	bool "Choice C"
> +
> +endchoice
> diff --git a/scripts/kconfig/tests/randconfig_seed/__init__.py b/script=
s/kconfig/tests/randconfig_seed/__init__.py
> new file mode 100644
> index 000000000000..7f9e1e5e7ef4
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_seed/__init__.py
> @@ -0,0 +1,222 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Validate KCONFIG_SEED handling in randconfig."""
> +
> +import time
> +
> +
> +def test_malformed_warns(conf):
> +    seeds =3D [
> +        'invalid', ' ', '\t', '\n', '+', '-',
> +        '0x', '0X', '0xg', '0x-1', '0x+1', '0x1g', '0b', '0b1010', '0B=
1010',

Don't forget to remove this with the base-2 check.

> +        '+0b1010', ' 0b1010 ', '08',
> +        '123foo', '10 20', '-1_junk', '-1 junk', '-1xyz',
> +        '4294967296_junk', '4294967296 junk', '4294967296xyz',
> +        '0x100000000xyz', '-0x100000000xyz',
> +        '--0', '+-0', '-+0', '++0', '++42', '+ 42', '- 0', '- 42',
> +        '42 ', '0x2a ', ' 42 ', '0 ', ' 0', ' 0 ', '+0x0', ' 0x2a', ' =
0x2a ',
> +        '-0', '-0x0', '+0', '+42', '+0x2a', ' 42', ' \t0x2a',
> +        '-1', '-42', '-0x1', ' -1', ' -42 ', '-42 ', '-0x80000000',
> +        '-2147483648', '-4294967295', '-4294967296', '-184467440737095=
51615',
> +        '4294967296', '+4294967296', '4294967296 ', ' 4294967296 ',
> +        '0x100000000', '040000000000', '1763362020123456789',
> +        '18446744073709551615', '18446744073709551616', '-184467440737=
09551616',
> +        '0x10000000000000000', '-0x10000000000000000',
> +        '999999999999999999999999', '-999999999999999999999999',
> +        '999999999999999999999999xyz', '-999999999999999999999999xyz',=

> +    ]
> +    for seed in seeds:
> +        context =3D 'seed=3D{!r}'.format(seed)
> +        assert conf._run_conf('--randconfig', extra_env=3D{
> +            'KCONFIG_SEED': seed,
> +        }) =3D=3D 0, context
> +        assert ('warning: KCONFIG_SEED has malformed format' in
> +                conf.stderr), context
> +        assert conf.stderr.count('warning:') =3D=3D 1, context
> +        assert 'KCONFIG_SEED=3D0x' in conf.stdout, context
> +        assert conf.config is not None, context
> +
> +
> +def test_malformed_preserves_config(conf):
> +    pairs =3D [
> +        # In-range whitespace & signs
> +        (' 0', '0'),
> +        (' +0', '0'),
> +        (' -0', '0'),
> +        ('-0', '0'),
> +        ('-0x0', '0'),
> +        ('+0', '0'),
> +        ('+0x0', '0'),
> +        ('+42', '42'),
> +        ('+0x2a', '0x2a'),
> +        (' 42', '42'),
> +        ('42 ', '42'),
> +        (' 42 ', '42'),
> +        ('0 ', '0'),
> +        (' 0 ', '0'),
> +        (' 0x2a', '0x2a'),
> +        ('0x2a ', '0x2a'),
> +        (' 0x2a ', '0x2a'),
> +        (' \t0xdeadbeef', '0xdeadbeef'),
> +        ('0xdeadbeef ', '0xdeadbeef'),
> +        (' 0xdeadbeef ', '0xdeadbeef'),
> +
> +        # Negative integers (modulo 2^32 backward compatibility)
> +        ('-1', '0xffffffff'),
> +        (' -1 ', '0xffffffff'),
> +        ('-0x1', '0xffffffff'),
> +        ('-42', '0xffffffd6'),
> +        (' -42 ', '0xffffffd6'),
> +        ('-42 ', '0xffffffd6'),
> +        ('-2147483648', '0x80000000'),
> +        ('-0x80000000', '0x80000000'),
> +        ('-4294967295', '0x1'),
> +        ('-4294967296', '0x0'),
> +        ('-0x100000000', '0x0'),
> +        ('-18446744073709551615', '0x1'),
> +
> +        # 64-bit > UINT_MAX integers (modulo 2^32 backward compatibili=
ty)
> +        ('4294967296', '0x0'),
> +        ('+4294967296', '0x0'),
> +        ('4294967296 ', '0x0'),
> +        (' 4294967296 ', '0x0'),
> +        ('0x100000000', '0x0'),
> +        ('040000000000', '0x0'),
> +        ('4294967338', '0x2a'),
> +        ('0x10000002a', '0x2a'),
> +        ('1763362020123456789', '0x23dfb515'),
> +        ('18446744073709551615', '0xffffffff'),
> +    ]
> +    for malformed_seed, canonical_seed in pairs:
> +        context =3D 'malformed=3D{!r}, canonical=3D{!r}'.format(
> +            malformed_seed, canonical_seed)
> +        assert conf._run_conf('--randconfig', extra_env=3D{
> +            'KCONFIG_SEED': malformed_seed,
> +        }) =3D=3D 0, context
> +        assert ('warning: KCONFIG_SEED has malformed format' in
> +                conf.stderr), context
> +        assert conf.stderr.count('warning:') =3D=3D 1, context
> +        malformed_stdout =3D conf.stdout
> +        malformed_config =3D conf.config
> +
> +        assert conf._run_conf('--randconfig', extra_env=3D{
> +            'KCONFIG_SEED': canonical_seed,
> +        }) =3D=3D 0, context
> +        assert 'warning:' not in conf.stderr, context
> +        assert conf.stdout =3D=3D malformed_stdout, context
> +        assert conf.config =3D=3D malformed_config, context
> +
> +
> +def test_unparseable_falls_back_to_clock(conf):
> +    forbidden_targets =3D [
> +        ('999999999999999999999999', '0xFFFFFFFF'),
> +        ('-999999999999999999999999', '0xFFFFFFFF'),
> +        ('18446744073709551616', '0xFFFFFFFF'),
> +        ('0b1010', '0xA'),
> +        ('42foo', '0x2A'),
> +    ]
> +    for seed, forbidden_hex in forbidden_targets:
> +        target_forbidden =3D 'KCONFIG_SEED=3D{}\n'.format(forbidden_he=
x)
> +        matched_forbidden =3D True
> +        for _ in range(3):
> +            assert conf._run_conf('--randconfig', extra_env=3D{
> +                'KCONFIG_SEED': seed,
> +            }) =3D=3D 0, 'seed=3D{!r}'.format(seed)
> +            assert ('warning: KCONFIG_SEED has malformed format' in
> +                    conf.stderr), 'seed=3D{!r}'.format(seed)
> +            if target_forbidden not in conf.stdout:
> +                matched_forbidden =3D False
> +                break
> +            time.sleep(0.002)
> +        assert not matched_forbidden, (
> +            'seed=3D{!r} unexpectedly matched forbidden static seed {!=
r}'.format(
> +                seed, forbidden_hex))
> +
> +
> +def test_werror(conf):
> +    seeds =3D [
> +        ('', 0), ('0', 0), ('42', 0), ('052', 0), ('0x2a', 0),
> +        ('0x80000000', 0), ('0xffffffff', 0),
> +        ('invalid', 1), ('123foo', 1), ('0x', 1), ('0b1010', 1),
> +        ('42 ', 1), (' 42', 1), (' 42 ', 1), ('0 ', 1), (' 0', 1),
> +        ('-0', 1), ('+42', 1), ('+0x0', 1), (' 0x2a', 1),
> +        ('--0', 1), ('+-0', 1), ('++42', 1), ('+ 42', 1), ('- 0', 1),
> +        ('-1', 1), ('-42', 1), (' -42 ', 1),
> +        ('4294967296', 1), ('4294967296 ', 1), ('1763362020123456789',=
 1),
> +        ('18446744073709551616', 1), ('999999999999999999999999', 1),
> +        ('-999999999999999999999999', 1),
> +    ]
> +    for seed, status in seeds:
> +        # Test with KCONFIG_WERROR unset: all seeds succeed (malformed=
 warn)
> +        context =3D 'seed=3D{!r}, werror=3Dunset'.format(seed)
> +        assert conf._run_conf('--randconfig', extra_env=3D{
> +            'KCONFIG_SEED': seed,
> +        }) =3D=3D 0, context
> +        if status:
> +            assert ('warning: KCONFIG_SEED has malformed format' in
> +                    conf.stderr), context
> +            assert conf.stderr.count('warning:') =3D=3D 1, context
> +        else:
> +            assert 'warning:' not in conf.stderr, context
> +        assert conf.config is not None, context
> +
> +        # Test with KCONFIG_WERROR set
> +        for werror in ['', '0', '1']:
> +            context =3D 'seed=3D{!r}, werror=3D{!r}'.format(seed, werr=
or)
> +            assert conf._run_conf('--randconfig', extra_env=3D{
> +                'KCONFIG_SEED': seed,
> +                'KCONFIG_WERROR': werror,
> +            }) =3D=3D status, context
> +            if status:
> +                assert ('warning: KCONFIG_SEED has malformed format' i=
n
> +                        conf.stderr), context
> +                assert conf.stderr.count('warning:') =3D=3D 1, context=

> +                assert conf.config is None, context
> +            else:
> +                assert 'warning:' not in conf.stderr, context
> +                assert conf.config is not None, context
> +
> +    # Verify unset KCONFIG_SEED succeeds under KCONFIG_WERROR
> +    for werror in ['', '0', '1']:
> +        context =3D 'unset seed, werror=3D{!r}'.format(werror)
> +        assert conf._run_conf('--randconfig', extra_env=3D{
> +            'KCONFIG_WERROR': werror,
> +        }) =3D=3D 0, context
> +        assert 'warning:' not in conf.stderr, context
> +        assert 'KCONFIG_SEED=3D0x' in conf.stdout, context
> +        assert conf.config is not None, context
> +
> +
> +def test_valid(conf):
> +    groups =3D [
> +        ('0x0', ['0', '00', '0x0', '0X0', '0x00000000']),
> +        ('0x2A', ['42', '052', '0x2a', '0X2A']),
> +        ('0x80000000', ['2147483648', '020000000000', '0x80000000', '0=
X80000000']),
> +        ('0xFFFFFFFF', ['4294967295', '037777777777', '0xffffffff', '0=
XFFFFFFFF']),
> +    ]
> +    for expected_hex, representations in groups:
> +        expected_config =3D None
> +        for seed in representations:
> +            context =3D 'seed=3D{!r}, expected_hex=3D{!r}'.format(seed=
, expected_hex)
> +            assert conf._run_conf('--randconfig', extra_env=3D{
> +                'KCONFIG_SEED': seed,
> +            }) =3D=3D 0, context
> +            assert conf.stderr =3D=3D '', context
> +            assert 'KCONFIG_SEED=3D{}\n'.format(expected_hex) in conf.=
stdout, context
> +            assert conf.config is not None, context
> +            if expected_config is None:
> +                expected_config =3D conf.config
> +            else:
> +                assert conf.config =3D=3D expected_config, context
> +
> +
> +def test_unset_and_empty(conf):
> +    for base_env in [{}, {'KCONFIG_SEED': ''}]:
> +        for werror in [None, '', '0', '1']:
> +            extra_env =3D dict(base_env)
> +            if werror is not None:
> +                extra_env['KCONFIG_WERROR'] =3D werror
> +            context =3D 'extra_env=3D{!r}'.format(extra_env)
> +            assert conf._run_conf('--randconfig', extra_env=3Dextra_en=
v) =3D=3D 0, context
> +            assert 'warning:' not in conf.stderr, context
> +            assert 'KCONFIG_SEED=3D0x' in conf.stdout, context
> +            assert conf.config is not None, context
> -- 2.53.0
>=20

This is *a lot* of test code for input validation of just 1 var. Could
this be simplified at all?

Is every test here absolutely necessary?

- Julian Braha

--------------Go6KQObmpkGqGitCoEutHhyP--

--------------4VH2GW00lQVgMZO4NWKt7o0R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCawdvsgUDAAAAAAAKCRDElYPCBXNxIFZ2
AP91c6LiCJ4B/0Dm6WkfSQKX7CmMEjv/kxm8MFBwXPi9kAEAqwDduLQ9MVMnnU1gsVr/nP8DHb1i
Q9ZF+2pIhwQrTwM=
=gvFU
-----END PGP SIGNATURE-----

--------------4VH2GW00lQVgMZO4NWKt7o0R--
