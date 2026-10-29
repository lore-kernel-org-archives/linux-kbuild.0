Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266829;
	b=kQBa2lbtr0ZGT6MIHteq5o5BBZgBhPxoJs30fTmUDdifqBdFIY9RyOx0XdhfpSXAHBsm
	 1NJ4V2hGzmED4WrUiDjMw5sygJ8G4Uapy5EjourJtWpSzWMRQNeFbosfzfyF5ds+ulUxd
	 yui9s81UtaBcaaUeO5DXhLGJgNXdpviTHKS4xJCfMo6FR2FHkjhoO4I76h0l6tnzFIt9Y
	 8eZHqMXUnAiV+4EQU99SI5Vlz0sF9//fN+qRbEuY41N7GOppOuZ/8YZ7CS6OT3kP/zxt7
	 5HGYy+a1B+0sOG7Apr6UG2v/HwbVpIaNO6t3s4uj4BMYfT2uL7+rW2QZaWxY8jfNQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266829;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=BC2exVJo1Va8gjBCyKiM3s3gD9IKi/7NVdvRLD2XBdk=;
	b=sPwyu2UsvUtOvTDr3597EPyOCYb9y1pELbWgBMBY9vD1E4zye/2i+QpOxT/fVQ2kWI8l
	 ojcwBbb4FL/Fi/zLPDBOCmwnnmkyUHpYj3mdsW2ZZiqov/PG5l1nVntpaQrMgkFuSvoU1
	 E6J7aRUem+MVse2JAZGG8S6UFes9LndEAlgig2zPYYJh7Wth9bxUI1J+RK1YIOdkuQHXf
	 lhGvS8mVJICgAiayfGKiIq+NQhDVYN2rjDMpy5tZ7bOmtDmFsZ/D1qhsYuOOzosWXmAOJ
	 m9o50+RucEgdUtTzfacODQA9lYuLvJfx4mfrQAjUOi/kCsgAiXm9+uieZw+KZQQhHmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ePIjUmZe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Zpq3KZaE;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4BB606A31E;
	Thu, 29 Oct 2026 09:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ePIjUmZe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Zpq3KZaE
Date: Thu, 29 Oct 2026 10:40:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793266827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC2exVJo1Va8gjBCyKiM3s3gD9IKi/7NVdvRLD2XBdk=;
	b=ePIjUmZeOTwW2kBqF7UhtZewtuuz1Zp6pVfwbv5pGGz4wtBqGPjkSrTivB6q+FyIawlknx
	4AQbez2HLO0we89y9m5Q79M1xeeEk7lAF91VOnS2dWBrSIYsLDslqMBG0yZyWYnJJpaDp9
	NTNofnwqa1OcYaH2Gas97W7p3/sX/qSyN2Cqd5CF33FLn2n3dG6MPj6nk4K0+9Q6i05pq9
	13r4H8edEJ/x/WzHDAf1ZmdISrxyKh9+v4gLRdhnGH7N8MucUY+8+Rm/aTr77yaCStUFq1
	8UPSxxfdmvQtaUngA1BWupuQ144r1m1R3htQaOOUehoEXzezE1jp44HETXuIWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793266827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC2exVJo1Va8gjBCyKiM3s3gD9IKi/7NVdvRLD2XBdk=;
	b=Zpq3KZaElcQqqJvvMQ4xqOs9BzXayf2pcKUj1yMSLi0gf1GFzvPdc0hn5aR9KWmdP0wB7x
	/sDp2VYwiTZsV7Bw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
Message-ID: <20261029102949-d209a22d-5f56-4b52-a054-deafff531e7d@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
 <179313256476.2881498.3865128683953782646.b4-reply@b4>
 <A0A4758F-BCDF-4C76-A51B-3ADBB5CAC8DD@zytor.com>
 <20261028064715-bd8a4806-e974-40a3-b773-0afa26689d56@linutronix.de>
 <147D6C9E-264C-4492-9EA7-A4BB8526CB95@zytor.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <147D6C9E-264C-4492-9EA7-A4BB8526CB95@zytor.com>

On Tue, Oct 27, 2026 at 11:12:26PM -0700, H. Peter Anvin wrote:
> On October 27, 2026 10:55:04 PM PDT, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >On Tue, Oct 27, 2026 at 05:02:52PM -0700, H. Peter Anvin wrote:
> >> On October 27, 2026 1:22:44 PM PDT, Nicolas Schier <nsc@kernel.org> wrote:
> >> >On 2026-07-08 15:56 +0200, Thomas Weiﬂschuh wrote:
> >> >> Finding the debug version of the vDSO is not trivial as there is no common
> >> >> scheme where it is placed. That's especially problematic for CI testing.
> >> >> 
> >> >> The vDSO futex unlock mechanism requires for testing to have access to the
> >> >> inner labels of the unlock assembly, which are only accessible via the
> >> >> debug so.
> >> >> 
> >> >> Also for general debugging purposes it's convenient to have access to the
> >> >> debug vDSO at a well defined place.
> >> >> 
> >> >> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> >> >> regular 'make vdso_install' layout, including build-id symlinks to find
> >> >> the correct file for each process.
> >> >> 
> >> >> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> >> >> 
> >> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> >> >> explicit dependency to avoid errors due to concurrent builds.
> >> >> 
> >> >> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> >> >> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> >> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >> >> ---
> >> >>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
> >> >>  arch/x86/Makefile   |  3 +++
> >> >>  init/Kconfig        | 10 ++++++++++
> >> >>  kernel/Makefile     |  1 +
> >> >>  kernel/vdso_debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++
> >> >>  5 files changed, 89 insertions(+), 1 deletion(-)
> >> >> 
> >> >
> >> >This seems to have fallen through the cracks; shall it be considered for
> >> >kbuild-7.5?
> >
> >Please don't pick this up just yet. I have a prototype which exposes the
> >directory through sysfs directly without forcing users to unpack the archive.
> >If you could take a look at the kbuild bits however, that would be great.
> >
> >> A thought: most tools support compressed separate debug information. Would it
> >> make more sense to have the vdso images with separate, compressed debug data
> >> in a subdirectory?
> >
> >I want to stick to the 'make vdso_install' layout. Maybe that should be
> >changed to your proposal, too? But what are the specific advantages?
> >The files are compressed on disk anyways through the module compression.

> The nice thing would be that it would let debug tools use them as-is, and
> after all we need to make the vdso itself available anyway.

To make sure we are on the same page:
You propose to make the vDSO mapping a file-based one pointing to sysfs?

This would change the userspace ABI and I can imagine some tools breaking.
Also it will require a bunch of additional per-architecture logic.

Tools should be able to handle the debug-id symlinks as implemented by my
current scheme. For regular (real) file backed mappings there is no guarantee
that the file on disk is still the same version that is mapped by the process.

> As a possible side benefit the user would be able to see the post-patch vdso.

Nice idea.


We could go with a combined aproach. First we go with my proposal which works
with minimal per-architecture logic and already works for most of them as is.
That can later be extended with per-architecture logic to provide the
alternative-patched "live" view, file-backed mappings and detached debug symbols.


Thomas
