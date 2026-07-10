Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5371632DD;
	Fri, 10 Jul 2026 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708548; cv=none; b=I6tB9dKIx2pVmneqnerV4OS+Ko+SOPG9ARJGMkQCcGppZCmlTfm+vLbInPSfszcBFc7FBQvxsgVoBePNFTqw5R04GJKORVjzMBslPg4Rb4ilTp543WiMWjLx1SLR/tVSEanJgL/N8621MSbzJUMg2dzO73AkxqZn9YRwCrSnULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708548; c=relaxed/simple;
	bh=68eIDrvAlIQGBsFY+IdahN07WT8ESuLhz7qbLA6ceQQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=SYCWqxX/J8yM45mOKiwR1Kn97oi+PaeqP2hooPaRpwwBHNSVuVkXPDWOd+1kQE9iWS7HaGmNGIwvPTGpQjYFSL17otvJ7t6IiOOg8/Y0oWh+uf0hz+cnIk1yINqab30CQpIQaiy/unlXjjfIxDLCsXdJyDE4DmCUoZFqtQOP9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=MlyhIzYx; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="MlyhIzYx"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66AIYtl5133442
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 10 Jul 2026 11:34:56 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66AIYtl5133442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783708497;
	bh=EbJ86+oR//Se5tv47NuwhNNVQ3nw66dnnFCPfh6NAWc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=MlyhIzYxhkVjuiN4XTkSGsyMF0XTnACqaH3qW8cfVC/0JLGzcwPeE8fXioEdPB3cJ
	 2gYraSSuaitvRkkFoVCgcbBO25P8YsgmwNAUY+BFuBRgzh2DijkoBsiCXxKCQDIQH6
	 yNkg4AyWms/NCEza7c1E6TEOBFug5Szkrer/lHjQD7t4jYxgEsI8fwwxEKZu6n2i3z
	 ln7UUGyidYcAT/NLp9vk/2uqDxSSXHdYo6wyeJd/rtw2uRzxU3M/DccvCOsWV+VP0i
	 men/Qpl1Fr5IUl8afrwbp5cI8W3Mz4iuBVYs+wBm1t41E0/uEG44r8LAm6+9zJq8iw
	 Eg8JF5rqt0+MA==
Date: Fri, 10 Jul 2026 11:34:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nam Cao <namcao@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        =?ISO-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
User-Agent: K-9 Mail for Android
In-Reply-To: <20260710093522-38be8589-5a4d-4476-a2d4-0bb4a6243134@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de> <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com> <9131ADF7-6D08-418F-BE2F-2E99CC83FD2E@zytor.com> <20260710081440-d355b1fd-c34d-40bb-965c-8bbe2a8c375a@linutronix.de> <DC26CD8F-9767-4544-A157-8367439CE0BA@zytor.com> <20260710093522-38be8589-5a4d-4476-a2d4-0bb4a6243134@linutronix.de>
Message-ID: <A2327520-6521-433E-8EE2-8C0773FA998C@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 10, 2026 12:41:31 AM PDT, "Thomas Wei=C3=9Fschuh" <thomas=2Eweisssc=
huh@linutronix=2Ede> wrote:
>On Fri, Jul 10, 2026 at 12:32:55AM -0700, H=2E Peter Anvin wrote:
>> On July 9, 2026 11:36:25 PM PDT, "Thomas Wei=C3=9Fschuh" <thomas=2Eweis=
sschuh@linutronix=2Ede> wrote:
>> >On Thu, Jul 09, 2026 at 12:06:07PM -0700, H=2E Peter Anvin wrote:
>> >> On July 9, 2026 2:57:09 AM PDT, Vincenzo Frascino <vincenzo=2Efrasci=
no@arm=2Ecom> wrote:
>> >> >On 08/07/2026 14:56, Thomas Wei=C3=9Fschuh wrote:
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
>> >
>> >(=2E=2E=2E)
>> >
>> >> Why stuff them into a tarball?
>> >
>> >Because it was the easiest solution to implement and has been sufficie=
nt
>> >for IKHEADERS so far=2E I don't see a clearly winning solution among t=
he
>> >possibilities to expose a directory:
>> >
>> >* Use plain sysfs:
>> >  Requires a new code generator and potentially changes to sysfs
>> >
>> >* Use a read-only filesystem like cramfs/erofs:
>> >  Introduces new build-time and runtime dependencies
>> >
>> >* Add a new filesystem backed by a tarball or cpio archive:
>> >  Lot's of complexity and work to implement
>> >
>> >But I am open to discussions and other ideas=2E
>>=20
>> I discussed this with GregKH a while ago, in the context of eventually =
making
>> the vdso an actual mapping of a virtual file=2E According to him it sho=
uld be
>> quite simple in sysfs; I got a bit stumped on the necessary hooks (the =
kernel
>> needs to keep track of where the vdso lives in the address space=2E)
>
>Interesting idea, I will take a look at it=2E
>
>Today the vDSO mapped into userspace is a stripped version=2E For the
>debugging usecase however we want the unstripped one=2E
>Also it won't help with debugging a coredump=2E
>
>
>Thomas

Why wouldn't it??
