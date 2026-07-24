Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE143B3F1;
	Fri, 24 Jul 2026 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902499; cv=none; b=p86QhdOFwO2IPkogM27ExJYjgm+BiPBrLg9kyPC89FapwgfPfkPu/hutYpai386MF5KDIeE1XCRwaeNI4E+6uy5V/vBTaUKeiyHFpSlX7QdAig8UqIDjK81YBp2vu6xbzTPuN2K86TBmkcqUstCB7ph0O1UBi6Y/c9sYuHAlkLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902499; c=relaxed/simple;
	bh=M6OEyxVVRrVU6Zco1hEwTBsTB1/HIXYE4VJQU+duOZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/RYJBey653BV36njo6Cye4WOedmqCPOwTzxTeDgTjdi4Eyf9pcVrbT59eMiDG1ftLOrvDvjQjts8FV2oORtajxkVkouP6L5ZwaEU+n11zPs09bE8n+h+lVERCisUYCJoeEY8a7RU+t0KIy/komAMOdqtkXqUk0OsQ+g09lhNpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Uw5yJ5r8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g5PZiHJn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Uw5yJ5r8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g5PZiHJn"
Date: Fri, 24 Jul 2026 16:14:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784902494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbQ5iHIjBJtP9U50kdXQBv54b/c9piG0HN95PoJGwsY=;
	b=Uw5yJ5r8CnjCPNo8sufxIazYOnP8VaigMO0wkLJfm07c7MXqAAES26vXkenXlBISMczCCY
	ic3KNf0VEndyJ23tB6X2EzU118NNi4IIblmChwH0W1VxgPu/+cH3rB/9O+jtHet6rDlySo
	b4/+oy7v7kl9RXh2mJXXtBQdmwJG0WpfL+k/6vQwE4oGYIOcL5P+xcAclWEi6/Wr3tHnWf
	c/G4VmVIMDahUqmMlrLfdEfYsW1y5QiiIED9HmK9HWQ+rF3+oI7emZr8UR3z4Uyxg/ximH
	qRS+nXJAEjh7GUJioGoBcS0/VtrZIwNfE542/sAFuPmYBmojXeQvVCCo1rvMRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784902494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbQ5iHIjBJtP9U50kdXQBv54b/c9piG0HN95PoJGwsY=;
	b=g5PZiHJnz3y3hS1Zq9H98ryZ5Fv3wsxp+IbY7372hGdc2M6wKyP3V7GtVA2MiqDKj6kQMQ
	9/iOYAdQBoYOepCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Nam Cao <namcao@linutronix.de>, Andy Lutomirski <luto@kernel.org>, x86@kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Borislav Petkov <bp@alien8.de>, Nicolas Schier <nsc@kernel.org>, kernel-dev@igalia.com
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
Message-ID: <20260724160750-9e98ad5d-72b9-416c-8485-6942e0a3c8ec@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
 <17d3c3f6-f040-45b9-adf7-6ef1d7cf4e3e@igalia.com>
 <e49be8bf-a3f8-4b2f-8e2b-379f4885b194@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e49be8bf-a3f8-4b2f-8e2b-379f4885b194@igalia.com>

On Wed, Jul 15, 2026 at 09:29:35AM -0300, André Almeida wrote:
> Em 08/07/2026 12:28, André Almeida escreveu:
> > Em 08/07/2026 10:56, Thomas Weißschuh escreveu:
> > > Finding the debug version of the vDSO is not trivial as there is no
> > > common
> > > scheme where it is placed. That's especially problematic for CI testing.
> > > 
> > > The vDSO futex unlock mechanism requires for testing to have access
> > > to the
> > > inner labels of the unlock assembly, which are only accessible via the
> > > debug so.
> > > 
> > > Also for general debugging purposes it's convenient to have access to the
> > > debug vDSO at a well defined place.
> > > 
> > > The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> > > regular 'make vdso_install' layout, including build-id symlinks to find
> > > the correct file for each process.
> > > 
> > > The design is kept close to the ones of the similar IKCONFIG and
> > > IKHEADERS.
> > > 
> > > On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> > > explicit dependency to avoid errors due to concurrent builds.
> > > 
> > > Suggested-by: Thomas Gleixner <tglx@kernel.org>
> > > Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> > > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > > ---
> > 
> > Thanks for your patch! Tested in arm64 (qemu) and it worked fine. I was
> > just expecting that the file would be called "vdso.so.dbg", not
> > "vdso.so".

That is due to scripts/Makefile.vdsoinst:

dest := $(install-dir)/$$(patsubst %.dbg,%,$$(notdir $(1)))

> > Tested-by: André Almeida <andrealmeid@igalia.com>

Thanks!

> Also, how do you suggest to integrate this with kselftests? Maybe adding an
> untar command to futex/functional/run.sh?

In the current implementation, yes. But it would also be possible to have a
proper virtual directory tree, albeit with higher implementation consts.


Thomas
