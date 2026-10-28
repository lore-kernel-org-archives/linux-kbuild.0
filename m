Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145837;
	b=yiD01fB8/yUhk8wkX5yX/RfDfLpog/oT/E8CXEl3iZGtchHOw9f1DKlv6Zf4hVe8jnh6
	 U7lPYz2F/kZ0fUYjWlPz0TZWOPqNQn0o6yE41S13ieQVYXjhJtKT6UAvzzrQd+krMKyen
	 7ia++8SZAREqGx1gaZJgnJ1+yRzz6WlJfnloBy6BtZ6ZGihwXV2gMq9DUzB9KPp7qyEeM
	 RtQVCXmcq6dLZWJ172udaFDPM07stVzJ6o222DFjtVBqVWUN+pi+Jnee9ZON/NbycKAik
	 q34/eoyPxFGDyd0XRq+a6HEMihUHJ7Qt1Gj1vvo2b8CF3HKRwPacMtugkwqqs5qtwyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145837;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WvXEqGRjy1Mu33I1k+nm3uATPGEt8p/jdpqF1L/3xoE=;
	b=eDiQtHlmg413Ta4T7YFNHRaBufa2pHawn7prpvM9E5qawkB9nJDFBYsb2vBBgnkzpziN
	 nKI/006CPzEOwb96xaps8s9fgoeSkoZtuGcQFOrGn40flQkWmBwwPRG+dN7I0ICujXGwh
	 +GQKKPuW9BkZoY5Rvftsmed6TbvUNYuIxjx5mnBK0HwmiTRRx/pG96BbR5BmaFnrWgpzg
	 VPk+uYwMs8xNeRcX5RJMC8VZylHqK9sNzgfDljfjFCZWQPnWBludN01PPb4AXozJtSlHH
	 IzhbmCIg95FOkQZCjmyJ2a6PmKYMOLgM5ZI4wb2gm3rC/nccNErhmigFolYmup8G1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=b7LPm4Gu;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AD606A324;
	Wed, 28 Oct 2026 00:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945AD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=b7LPm4Gu
Received: from ehlo.thunderbird.net (ENVISION-AE.edge1.SanJose1.Level3.net [4.79.220.182])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69S02uXc1276671
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 27 Oct 2026 17:02:57 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69S02uXc1276671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1793145779;
	bh=WvXEqGRjy1Mu33I1k+nm3uATPGEt8p/jdpqF1L/3xoE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=b7LPm4Gur56cBs7NJiNICXo+rpEuSFoWjieLVGMg9VXmA/dYHqYKgNgLWtqWI+SJU
	 L2MUuwJuSpPldjvlx7pRM52/EjKfclnno03JFD1nO1E6Oj/iWXLk3aWR6RLQnPxa4T
	 C87ERt8txMPBKeOyqay8a54xTESCAsoQYupS/vlvR8X/C4jrejkG5JaGZDrLMs1t6a
	 6ZPlrvyxxH3iDfAARuYkY9exrA6acZ/0noVRYSTGEg/rj/e8z+fZCbI1bcx2aUStNk
	 g0uzq/NOqvdFo1HUmJHCwJs28DFJmtv0J2xkfQiqNkfKEoRWH1mJSj4qzYwacZAgwl
	 pF/YTrguO6NNA==
Date: Tue, 27 Oct 2026 17:02:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Nicolas Schier <nsc@kernel.org>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
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
In-Reply-To: <179313256476.2881498.3865128683953782646.b4-reply@b4>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de> <179313256476.2881498.3865128683953782646.b4-reply@b4>
Message-ID: <A0A4758F-BCDF-4C76-A51B-3ADBB5CAC8DD@zytor.com>
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

On October 27, 2026 1:22:44 PM PDT, Nicolas Schier <nsc@kernel=2Eorg> wrote=
:
>On 2026-07-08 15:56 +0200, Thomas Wei=C3=9Fschuh wrote:
>> Finding the debug version of the vDSO is not trivial as there is no com=
mon
>> scheme where it is placed=2E That's especially problematic for CI testi=
ng=2E
>>=20
>> The vDSO futex unlock mechanism requires for testing to have access to =
the
>> inner labels of the unlock assembly, which are only accessible via the
>> debug so=2E
>>=20
>> Also for general debugging purposes it's convenient to have access to t=
he
>> debug vDSO at a well defined place=2E
>>=20
>> The files are placed in /sys/kernel/vdso_debug=2Etar=2Exz=2E They use t=
he
>> regular 'make vdso_install' layout, including build-id symlinks to find
>> the correct file for each process=2E
>>=20
>> The design is kept close to the ones of the similar IKCONFIG and IKHEAD=
ERS=2E
>>=20
>> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
>> explicit dependency to avoid errors due to concurrent builds=2E
>>=20
>> Suggested-by: Thomas Gleixner <tglx@kernel=2Eorg>
>> Link: https://lore=2Ekernel=2Eorg/lkml/20260602090536=2E045586688@kerne=
l=2Eorg/
>> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas=2Eweissschuh@linutronix=2E=
de>
>> ---
>>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
>>  arch/x86/Makefile   |  3 +++
>>  init/Kconfig        | 10 ++++++++++
>>  kernel/Makefile     |  1 +
>>  kernel/vdso_debug=2Ec | 43 +++++++++++++++++++++++++++++++++++++++++++
>>  5 files changed, 89 insertions(+), 1 deletion(-)
>>=20
>
>This seems to have fallen through the cracks; shall it be considered for
>kbuild-7=2E5?
>

A thought: most tools support compressed separate debug information=2E Wou=
ld it make more sense to have the vdso images with separate, compressed deb=
ug data in a subdirectory?
