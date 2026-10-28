Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793167975;
	b=04AccbbEECewOOon4R1QEU1iq9oq+bVxGAJ/BAE/iAFZLBlX6P/hfb1Z8GIq3FNL04z0
	 KOQgJr4ckewGA2e2DHgpymmEdRVFPre+QbkHlqBotN2jU9om/IuyNqTvldAeygv1Wt5+g
	 1XKa5TdWB/UzaVlrvz3NuNYW+sW61uy6giEcqByQHB0x3usFibl73IYqMoLNcXIrp6+w9
	 nwf90ZEN+p5NRjiJ8pD7Jtw2rUHwYCIOUgoeigNfD5Vm3mSfPQKbBrR3DElhvvnsfAeiA
	 /N0V7M2Qp2eKcsluwL8upSGmLlM5jIRMvlURJYA2CjgvxJXSYSJNRlo/KzNnqE+LZAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793167975;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+KoKmcXA/B0ADIWST/pA3pwxT+GnX97Sf5SCmyvzAzU=;
	b=vs3GIwmY0BOsekU7YDlZXSrlcPPUmdGZyOElY2doCDJOja68pk8r63d2aEwUHZua2cQ5
	 VnBy8e0/Vgbsv+XO2x1hs5hEcNWEVD5D6T+0T1ycOwEO2RADZqATBuEr5UtuC3RNdpW4s
	 q4j4fI0Zd4UhUzHmk9nZaZA+2jPQ34qMx06+kk0kC9W/LI6FdJPGTz4kad4RY8lOTJAyp
	 Ucl6AVzfQWqRctnhLZVfkRuCWkR7Uf76bCLe6NjZPdiWc2H+UkjGADK4MChks/RF3Xpjb
	 rXfkDSyQZOy4dunyiYNiqbRm95PAttdv12aYePdNDbo0b6orGveMRK0AJD1CrMMt0dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=PHHw8wzk;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA02606A31D;
	Wed, 28 Oct 2026 06:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=PHHw8wzk
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69S6CV5K1896025
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 27 Oct 2026 23:12:31 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69S6CV5K1896025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1793167953;
	bh=+KoKmcXA/B0ADIWST/pA3pwxT+GnX97Sf5SCmyvzAzU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PHHw8wzk5OP8s1uftMZzCH3m4VGwz5nVFGJsfiGwULZCLWFAdXZJyRNVpPFW4omq1
	 BhX8DGeEdo0ZZQqexX9r0oycSjeXAOZlfBxaJlAa3C2WrTLlOMnHFrUxt7rzDGfBex
	 kVHyP0NspN5G3VR7E2hIFF6vhJHay9azD7GVK0AHnuNV4k9LrgNjg3y84N39Z8Mz4X
	 kNQyJnUdDPZA2a7jtC1jHSI2S7+27YZi0YvcDTfQUUVGSMWn0NNFclY+ywEs57TGeX
	 GQizq+3aNJZTXhE90F8jw+ZBEcs0zR7EN1U96imScHMsQIdyMMRsOC9biByHKYfnIq
	 HiNqDg3/xn5Kg==
Date: Tue, 27 Oct 2026 23:12:26 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        Nicolas Schier <nsc@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nam Cao <namcao@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        =?ISO-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
User-Agent: K-9 Mail for Android
In-Reply-To: <20261028064715-bd8a4806-e974-40a3-b773-0afa26689d56@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de> <179313256476.2881498.3865128683953782646.b4-reply@b4> <A0A4758F-BCDF-4C76-A51B-3ADBB5CAC8DD@zytor.com> <20261028064715-bd8a4806-e974-40a3-b773-0afa26689d56@linutronix.de>
Message-ID: <147D6C9E-264C-4492-9EA7-A4BB8526CB95@zytor.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 27, 2026 10:55:04 PM PDT, "Thomas Wei=C3=9Fschuh" <thomas=2Eweis=
sschuh@linutronix=2Ede> wrote:
>On Tue, Oct 27, 2026 at 05:02:52PM -0700, H=2E Peter Anvin wrote:
>> On October 27, 2026 1:22:44 PM PDT, Nicolas Schier <nsc@kernel=2Eorg> w=
rote:
>> >On 2026-07-08 15:56 +0200, Thomas Wei=C3=9Fschuh wrote:
>> >> Finding the debug version of the vDSO is not trivial as there is no =
common
>> >> scheme where it is placed=2E That's especially problematic for CI te=
sting=2E
>> >>=20
>> >> The vDSO futex unlock mechanism requires for testing to have access =
to the
>> >> inner labels of the unlock assembly, which are only accessible via t=
he
>> >> debug so=2E
>> >>=20
>> >> Also for general debugging purposes it's convenient to have access t=
o the
>> >> debug vDSO at a well defined place=2E
>> >>=20
>> >> The files are placed in /sys/kernel/vdso_debug=2Etar=2Exz=2E They us=
e the
>> >> regular 'make vdso_install' layout, including build-id symlinks to f=
ind
>> >> the correct file for each process=2E
>> >>=20
>> >> The design is kept close to the ones of the similar IKCONFIG and IKH=
EADERS=2E
>> >>=20
>> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
>> >> explicit dependency to avoid errors due to concurrent builds=2E
>> >>=20
>> >> Suggested-by: Thomas Gleixner <tglx@kernel=2Eorg>
>> >> Link: https://lore=2Ekernel=2Eorg/lkml/20260602090536=2E045586688@ke=
rnel=2Eorg/
>> >> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas=2Eweissschuh@linutronix=
=2Ede>
>> >> ---
>> >>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
>> >>  arch/x86/Makefile   |  3 +++
>> >>  init/Kconfig        | 10 ++++++++++
>> >>  kernel/Makefile     |  1 +
>> >>  kernel/vdso_debug=2Ec | 43 ++++++++++++++++++++++++++++++++++++++++=
+++
>> >>  5 files changed, 89 insertions(+), 1 deletion(-)
>> >>=20
>> >
>> >This seems to have fallen through the cracks; shall it be considered f=
or
>> >kbuild-7=2E5?
>
>Please don't pick this up just yet=2E I have a prototype which exposes th=
e
>directory through sysfs directly without forcing users to unpack the arch=
ive=2E
>If you could take a look at the kbuild bits however, that would be great=
=2E
>
>> A thought: most tools support compressed separate debug information=2E =
Would it
>> make more sense to have the vdso images with separate, compressed debug=
 data
>> in a subdirectory?
>
>I want to stick to the 'make vdso_install' layout=2E Maybe that should be
>changed to your proposal, too? But what are the specific advantages?
>The files are compressed on disk anyways through the module compression=
=2E
>
>
>Thomas

The nice thing would be that it would let debug tools use them as-is, and =
after all we need to make the vdso itself available anyway=2E As a possible=
 side benefit the user would be able to see the post-patch vdso=2E
