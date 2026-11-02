Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651830;
	b=2/OoU/oiEPRbcW2HGKS6KLk2dgdpOt3yCJkA84zEXUmzdy6d2QCWhWJOxrjo6tYIJmDz
	 1oB5s5OI9Be3t+oTzH37yYdIQagzNozuk6HvDT5H0n7s7bSvK4tDCUTD51mVWZ7pudDqk
	 /xgCoOcHOB+QoLaibF6g1p2fUEGRYUnWIadoshD/L/1LpjKlcESD4SE4Y73BuEpwNec8i
	 BSy4IlfmL0COceYVsfJVt6sJaW3mW4CfDhoGS+scK0TGaImIGErLM4dzW6aigigOgEJfb
	 ZanZcy91zT3UW45V7OIkmI0gJkdVpQ+ViWKKiddS8VVSSq44s2vcNcdMnVaZS2UuXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651830;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/wRem9inoL+KURop9OsJrRgfb4AguB18kiI/yBFilMs=;
	b=Gn7uWswX/ObXPGLw2OakHCuS453QclD1v02OWXGe2V+E/vNBL18z8pPUU7FvijqSanog
	 BYc1iEhlNXwyA3ZKIz1RMI0P0RYikpVGcQkx5Lk5TjqVqAZZXK3yGTZgd20gVyRoIruOH
	 l98i5l1MQh8Cn9tvdHX8zGPIiulsiGwEUjN+1EVDMZM2Hw3rMAJ/GPVblK3wxyDmFetHZ
	 YWxlVooIt65XeAr8mavGj4GGHGMeQyHqj4LPQs/VanyYckcCosNj/eXgLTQv1lUybbwz2
	 sIyfRvWLuKukUCrX+EayK3KWClX9RsgH8KPsc3hoWy1u/30to1kVANNHIJsVGXy56Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b="dMGHa4c/";
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA9606A324;
	Mon,  2 Nov 2026 20:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADA9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=dMGHa4c/
Received: from ehlo.thunderbird.net (ENVISION-AE.edge1.SanJose1.Level3.net [4.79.220.182])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6A2KaBlw3911017
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 2 Nov 2026 12:36:12 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6A2KaBlw3911017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1793651772;
	bh=/wRem9inoL+KURop9OsJrRgfb4AguB18kiI/yBFilMs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dMGHa4c/ldljzkDZjgiKFxfNwa4+zmPFbemihQ+SmeTyuTR5FuQ4wVakILeMC8M8t
	 7uowHbn3gZNaHG1SB7HgBNHZ2tFdIBEssib56KwxGSYD/72G4SDHoC4R29vt/qP0Z5
	 gfh0H8S38++B8mYJr+4Y7pnrVWr7c18GU3hMICyEZjyn3APvkWdkMv98zj3eWtdHXg
	 EagfHTqdORtQMmBZ7TaJT6US8YDr1mr2z7oODkRG9fU6FRmw2LHkUeVFqxjBnvP7Ox
	 eG+g//Wik7QPFujujVpXz1520fMjg3h1gjIUXVr+x/vSGxQ/RNsMDJ6/16WlRJ9966
	 SPL5fqcvvS4yA==
Date: Mon, 02 Nov 2026 12:36:05 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nam Cao <namcao@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        =?ISO-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
User-Agent: K-9 Mail for Android
In-Reply-To: <20261029102949-d209a22d-5f56-4b52-a054-deafff531e7d@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de> <179313256476.2881498.3865128683953782646.b4-reply@b4> <A0A4758F-BCDF-4C76-A51B-3ADBB5CAC8DD@zytor.com> <20261028064715-bd8a4806-e974-40a3-b773-0afa26689d56@linutronix.de> <147D6C9E-264C-4492-9EA7-A4BB8526CB95@zytor.com> <20261029102949-d209a22d-5f56-4b52-a054-deafff531e7d@linutronix.de>
Message-ID: <AAE231D0-1792-4DF6-842A-2C9B4B3BC8EF@zytor.com>
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

On October 29, 2026 2:40:26 AM PDT, "Thomas Wei=C3=9Fschuh" <thomas=2Eweiss=
schuh@linutronix=2Ede> wrote:
>On Tue, Oct 27, 2026 at 11:12:26PM -0700, H=2E Peter Anvin wrote:
>> On October 27, 2026 10:55:04 PM PDT, "Thomas Wei=C3=9Fschuh" <thomas=2E=
weissschuh@linutronix=2Ede> wrote:
>> >On Tue, Oct 27, 2026 at 05:02:52PM -0700, H=2E Peter Anvin wrote:
>> >> On October 27, 2026 1:22:44 PM PDT, Nicolas Schier <nsc@kernel=2Eorg=
> wrote:
>> >> >On 2026-07-08 15:56 +0200, Thomas Wei=C3=9Fschuh wrote:
>> >> >> Finding the debug version of the vDSO is not trivial as there is =
no common
>> >> >> scheme where it is placed=2E That's especially problematic for CI=
 testing=2E
>> >> >>=20
>> >> >> The vDSO futex unlock mechanism requires for testing to have acce=
ss to the
>> >> >> inner labels of the unlock assembly, which are only accessible vi=
a the
>> >> >> debug so=2E
>> >> >>=20
>> >> >> Also for general debugging purposes it's convenient to have acces=
s to the
>> >> >> debug vDSO at a well defined place=2E
>> >> >>=20
>> >> >> The files are placed in /sys/kernel/vdso_debug=2Etar=2Exz=2E They=
 use the
>> >> >> regular 'make vdso_install' layout, including build-id symlinks t=
o find
>> >> >> the correct file for each process=2E
>> >> >>=20
>> >> >> The design is kept close to the ones of the similar IKCONFIG and =
IKHEADERS=2E
>> >> >>=20
>> >> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating=
 an
>> >> >> explicit dependency to avoid errors due to concurrent builds=2E
>> >> >>=20
>> >> >> Suggested-by: Thomas Gleixner <tglx@kernel=2Eorg>
>> >> >> Link: https://lore=2Ekernel=2Eorg/lkml/20260602090536=2E045586688=
@kernel=2Eorg/
>> >> >> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas=2Eweissschuh@linutro=
nix=2Ede>
>> >> >> ---
>> >> >>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
>> >> >>  arch/x86/Makefile   |  3 +++
>> >> >>  init/Kconfig        | 10 ++++++++++
>> >> >>  kernel/Makefile     |  1 +
>> >> >>  kernel/vdso_debug=2Ec | 43 +++++++++++++++++++++++++++++++++++++=
++++++
>> >> >>  5 files changed, 89 insertions(+), 1 deletion(-)
>> >> >>=20
>> >> >
>> >> >This seems to have fallen through the cracks; shall it be considere=
d for
>> >> >kbuild-7=2E5?
>> >
>> >Please don't pick this up just yet=2E I have a prototype which exposes=
 the
>> >directory through sysfs directly without forcing users to unpack the a=
rchive=2E
>> >If you could take a look at the kbuild bits however, that would be gre=
at=2E
>> >
>> >> A thought: most tools support compressed separate debug information=
=2E Would it
>> >> make more sense to have the vdso images with separate, compressed de=
bug data
>> >> in a subdirectory?
>> >
>> >I want to stick to the 'make vdso_install' layout=2E Maybe that should=
 be
>> >changed to your proposal, too? But what are the specific advantages?
>> >The files are compressed on disk anyways through the module compressio=
n=2E
>
>> The nice thing would be that it would let debug tools use them as-is, a=
nd
>> after all we need to make the vdso itself available anyway=2E
>
>To make sure we are on the same page:
>You propose to make the vDSO mapping a file-based one pointing to sysfs?
>
>This would change the userspace ABI and I can imagine some tools breaking=
=2E
>Also it will require a bunch of additional per-architecture logic=2E
>
>Tools should be able to handle the debug-id symlinks as implemented by my
>current scheme=2E For regular (real) file backed mappings there is no gua=
rantee
>that the file on disk is still the same version that is mapped by the pro=
cess=2E
>
>> As a possible side benefit the user would be able to see the post-patch=
 vdso=2E
>
>Nice idea=2E
>
>
>We could go with a combined aproach=2E First we go with my proposal which=
 works
>with minimal per-architecture logic and already works for most of them as=
 is=2E
>That can later be extended with per-architecture logic to provide the
>alternative-patched "live" view, file-backed mappings and detached debug =
symbols=2E
>
>
>Thomas

I'm not necessarily saying the vma has to work that way, but the contents =
can be exported as a file regardless=2E

It might be nice to do that in the long run, but that's a separate project=
=2E
