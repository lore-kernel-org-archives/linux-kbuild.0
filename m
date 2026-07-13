Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2EE421EED;
	Mon, 13 Jul 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948653; cv=none; b=qw6bGfVGzFGWOsLHo+hzZVlFBCAtLGFB1bCy4te2HEtMZOVA2WmlVrv9Z2WjQywU73AQhllXr7c9R3ZfaIuhaoiNOlTI4gXDHvRp2Y9szsv3+pnm67I2Vqp1vMfoGxUPC9u39OQG4qAmYvLHziDUoLOHnvEjP+ZB4jTmI4/JQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948653; c=relaxed/simple;
	bh=LjAf51U8mqyC9ZnK7neeo1LhTQhTWN6vtBYar+XcRQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qgo62qPffou5GStM0UZ8XC2ZNreTjDzEXHeez/nrmAejyGyfRzT1BOZwEHssyPihtNMV6BczCpQ4TDFh5FtBQ+Cf2iWDQIDE2s+Mq9MgJcO65T3heCJBlvRZfsdl5DIYWsUDFCDH5ls3tCwRWpugk5/xsoWU5WVt5gQzM7A0Jbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R/yMwYvG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xTope03g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R/yMwYvG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xTope03g"
Date: Mon, 13 Jul 2026 15:17:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783948644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YW+Okndp8DxJTQJayVXkgT9t6AuGdsczQbIOz6scB1s=;
	b=R/yMwYvGVPoxw3Rhx4+k92W5KoyHulaVrDdV3N2LvZxwOjoHCg3ikRiUgLiZQ/C0kqIxC5
	9MIS/HIcHTIdHmxwU42VUM8pIScHO21pqHQtDcCIoVeBMykLK61WWXcx7sWmyio45X4NH0
	at2e5O0WoN6k14VOlWHqL77R2GyJiwutlQ/ZH1yOFogCjP4FkibfeD8Fu8PoKS6FzJ9qos
	gAlhTjycsyRsOwuE6rALPF9KN6JgZU9LcXSxs78BRwD8AWyE/Qn8hJb3Y6KsAjBMejHzhF
	e49DT5EJb3kj4rA6F4M03dLBvwXRUBY8yNzdjFn7IujcDS9OEfbwL0Xdml7SsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783948644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YW+Okndp8DxJTQJayVXkgT9t6AuGdsczQbIOz6scB1s=;
	b=xTope03gpotsxNm1comWzBGtgzchO+cTgh1LwlPQZ2wShQKuDcmNAMEDWX6bo+D9+CRvUx
	H0ErxyGjbenOUOCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
Message-ID: <20260713150522-86127a79-b4e7-4a0a-b5af-c4262534bffb@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
 <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com>
 <9131ADF7-6D08-418F-BE2F-2E99CC83FD2E@zytor.com>
 <20260710081440-d355b1fd-c34d-40bb-965c-8bbe2a8c375a@linutronix.de>
 <DC26CD8F-9767-4544-A157-8367439CE0BA@zytor.com>
 <20260710093522-38be8589-5a4d-4476-a2d4-0bb4a6243134@linutronix.de>
 <A2327520-6521-433E-8EE2-8C0773FA998C@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A2327520-6521-433E-8EE2-8C0773FA998C@zytor.com>

On Fri, Jul 10, 2026 at 11:34:48AM -0700, H. Peter Anvin wrote:
> On July 10, 2026 12:41:31 AM PDT, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >On Fri, Jul 10, 2026 at 12:32:55AM -0700, H. Peter Anvin wrote:
> >> On July 9, 2026 11:36:25 PM PDT, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >> >On Thu, Jul 09, 2026 at 12:06:07PM -0700, H. Peter Anvin wrote:
> >> >> On July 9, 2026 2:57:09 AM PDT, Vincenzo Frascino <vincenzo.frascino@arm.com> wrote:
> >> >> >On 08/07/2026 14:56, Thomas Weiﬂschuh wrote:
> >> >> >> Finding the debug version of the vDSO is not trivial as there is no common
> >> >> >> scheme where it is placed. That's especially problematic for CI testing.
> >> >> >> 
> >> >> >> The vDSO futex unlock mechanism requires for testing to have access to the
> >> >> >> inner labels of the unlock assembly, which are only accessible via the
> >> >> >> debug so.
> >> >> >> 
> >> >> >> Also for general debugging purposes it's convenient to have access to the
> >> >> >> debug vDSO at a well defined place.
> >> >> >> 
> >> >> >> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> >> >> >> regular 'make vdso_install' layout, including build-id symlinks to find
> >> >> >> the correct file for each process.
> >> >> >> 
> >> >> >> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> >> >> >> 
> >> >> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> >> >> >> explicit dependency to avoid errors due to concurrent builds.
> >> >> >> 
> >> >> >> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> >> >> >> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> >> >> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >> >
> >> >(...)
> >> >
> >> >> Why stuff them into a tarball?
> >> >
> >> >Because it was the easiest solution to implement and has been sufficient
> >> >for IKHEADERS so far. I don't see a clearly winning solution among the
> >> >possibilities to expose a directory:
> >> >
> >> >* Use plain sysfs:
> >> >  Requires a new code generator and potentially changes to sysfs
> >> >
> >> >* Use a read-only filesystem like cramfs/erofs:
> >> >  Introduces new build-time and runtime dependencies
> >> >
> >> >* Add a new filesystem backed by a tarball or cpio archive:
> >> >  Lot's of complexity and work to implement
> >> >
> >> >But I am open to discussions and other ideas.
> >> 
> >> I discussed this with GregKH a while ago, in the context of eventually making
> >> the vdso an actual mapping of a virtual file. According to him it should be
> >> quite simple in sysfs; I got a bit stumped on the necessary hooks (the kernel
> >> needs to keep track of where the vdso lives in the address space.)
> >
> >Interesting idea, I will take a look at it.

What would be the advantages?

How would this handle the fact that the data page mapping needs to be fixed
next to the code one? Should the data page mapping also be a virtual file?

> >Today the vDSO mapped into userspace is a stripped version. For the
> >debugging usecase however we want the unstripped one.

> >Also it won't help with debugging a coredump.
> Why wouldn't it??

I can't reconstruct what I was thinking here. Sorry for the noise.


Thomas
