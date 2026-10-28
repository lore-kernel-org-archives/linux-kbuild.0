Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166907;
	b=JnxMysZSN/TxxyAIiQzyDTKatyw21z+Ixrle1+E5Nw2VBnqySiAOlRXc5l5r5h73cVua
	 drRG+Ts4yDhh21I6MXaM+oF9S9piahcYhoXBNR6hXZ7dWqyrYL2VPR2evHrG66t3chwFl
	 kIlUKN0tgu++qfNjExQ+RNXFbtDJk6KBywnh8cfVVar2KI1ggzhaOFbCLNV8HEY0d+P2Q
	 1CwkeQPWDzLjFX7LlRkWpTBiqgU2ds3gpRvZBJwxpCvJITFss7L7SApUEY1q9k8ua2dEA
	 7mwSZlmG7ghaCI8BVT0CUYPzkaKqOgjdLe2J7FfMcKTVKGLRMqHGc8+55M1+IaV6E0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166907;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=wEQ8eA5GTq65bs9pnrH5mBwk2AORiHzbuwcMq+G1oVA=;
	b=5N+gvHQHlTq3bIQa5wwiCcZ732B+JS8wIEpT1uxQybW4FwU5xZOh4xO8A+09EgOPdbVy
	 E1PzLFEcIDK7AR+ahqAOyVRl//fSmWwDu4dm7+SBkdl68hUKnqJUMN+pbsiJEgJ/zLZ0q
	 iaDrKgj5GCgmYDadsPbf1ztPn80lLBC8JdRb/XI4/U/7WkcR7y2uHqF8QkAHgIDRNCRmj
	 M/dEBhwxDgjj7S8pckOP4JphdtqislZaAO3QCb/hG73RQX5x73h1HLR0Na1mTySempo8Q
	 cLRnP/mWb3QhkHBucYVr4s2srHsWBt/RAcGXZ8mq6IvnFX9E4IU5D5BCGKxSfxQPwtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=d9SXguD8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oTuxCjNr;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CBA606A31A;
	Wed, 28 Oct 2026 05:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=d9SXguD8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oTuxCjNr
Date: Wed, 28 Oct 2026 06:55:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793166904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEQ8eA5GTq65bs9pnrH5mBwk2AORiHzbuwcMq+G1oVA=;
	b=d9SXguD8Ki2DZb/hc+cnFBNRsScN2PnTq0IvilbvNyt15PURndCRcuPiJczsN5oOIcCa3Q
	etj6ldV0hnFK6jwH9FZ2o5AeWEUFz92bzuPsqufZbSy1HW9w4TEbR9H/poq//6yl+orNLv
	jmXqYBJ+Ysm1txYnGg3Rv6IUiDlwhu+qLjRt9M66lXSu9Ql4d/Z6KJvfVnqQ9iVxPWqV6r
	k5AZUG8UkCPriqAAf7HG8iUd80Ogsjdl+JyxwZJiztDCxL3SeKTZaWdbwBVgOIttaPf1C4
	7U1gS4AnpVubji0TVAC4jmGEGq30w3VcztUdyggKUa8AvU2K8cE5AgPHtio7zQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793166904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEQ8eA5GTq65bs9pnrH5mBwk2AORiHzbuwcMq+G1oVA=;
	b=oTuxCjNrpqbHctfaGsOdkwnmQvHppLRGiqdfzCs9Jtxgrvvx+Dv4Gyhdz7zWJzQHrPM1cI
	tWsYohZanhjX14Dw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>, Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
Message-ID: <20261028064715-bd8a4806-e974-40a3-b773-0afa26689d56@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
 <179313256476.2881498.3865128683953782646.b4-reply@b4>
 <A0A4758F-BCDF-4C76-A51B-3ADBB5CAC8DD@zytor.com>
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
In-Reply-To: <A0A4758F-BCDF-4C76-A51B-3ADBB5CAC8DD@zytor.com>

On Tue, Oct 27, 2026 at 05:02:52PM -0700, H. Peter Anvin wrote:
> On October 27, 2026 1:22:44 PM PDT, Nicolas Schier <nsc@kernel.org> wrote:
> >On 2026-07-08 15:56 +0200, Thomas Weiﬂschuh wrote:
> >> Finding the debug version of the vDSO is not trivial as there is no common
> >> scheme where it is placed. That's especially problematic for CI testing.
> >> 
> >> The vDSO futex unlock mechanism requires for testing to have access to the
> >> inner labels of the unlock assembly, which are only accessible via the
> >> debug so.
> >> 
> >> Also for general debugging purposes it's convenient to have access to the
> >> debug vDSO at a well defined place.
> >> 
> >> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> >> regular 'make vdso_install' layout, including build-id symlinks to find
> >> the correct file for each process.
> >> 
> >> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> >> 
> >> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> >> explicit dependency to avoid errors due to concurrent builds.
> >> 
> >> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> >> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >> ---
> >>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
> >>  arch/x86/Makefile   |  3 +++
> >>  init/Kconfig        | 10 ++++++++++
> >>  kernel/Makefile     |  1 +
> >>  kernel/vdso_debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 89 insertions(+), 1 deletion(-)
> >> 
> >
> >This seems to have fallen through the cracks; shall it be considered for
> >kbuild-7.5?

Please don't pick this up just yet. I have a prototype which exposes the
directory through sysfs directly without forcing users to unpack the archive.
If you could take a look at the kbuild bits however, that would be great.

> A thought: most tools support compressed separate debug information. Would it
> make more sense to have the vdso images with separate, compressed debug data
> in a subdirectory?

I want to stick to the 'make vdso_install' layout. Maybe that should be
changed to your proposal, too? But what are the specific advantages?
The files are compressed on disk anyways through the module compression.


Thomas
