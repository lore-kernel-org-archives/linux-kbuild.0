Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55481366DA4
	for <linux-kbuild@vger.kernel.org>; Sun, 21 Jun 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782050228; cv=none; b=XfHIzzgL/9bHD418Uo40NyDgWL6YXIm8/6XDjStxxIelBBOnr2BtO2KETamx+LLwC14BLMXcwndp4NTj6Z6vKTjCf155dma5oAwZotYS/IXOnuQT5bM850FuI/xVbOhoJcXXfD0p/DzmZ8+uFHvqsCFGs9FJQpki0C+9tCDbSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782050228; c=relaxed/simple;
	bh=fvPxhb+XWNbU46fPY8gMPSLeWrRsc2z5sSGUBkotAr0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwkDkRQ06RZAterPvPgX5IGt75HgeX7hTkzS5PyiCp4i5RcG3U7DJ7BhY81IPTy6eAUNJrtifkcjDf4P2lzgCh57x+D0D7ZSTok71ShXmmX78PREQq7JF+8Wf5Nr6dJP/HUgpRniIx1JEhT6dPVyN6MTMMCI8l2NelL3BZXkkeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDsgn9Lb; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDsgn9Lb"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7ea6923cc94so34712197b3.3
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jun 2026 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782050226; x=1782655026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv1dki/80aNeWwp+36abGEnVJza7FGEeP7NOY9gPTvc=;
        b=IDsgn9Lb23KedjXNwjRfloquBvpRj0dwvFPGPAQDtjR5tCjOlIZyxGX8LZYKD7D22S
         +fP0YJVtDS6L66zOfEcfzPolWDTcyfNlcNO1LSEJnD92yZGoL/OCS9MzcPtB9YHA5uaX
         MGlL7tW7+31ijgJzSFwabHABzodNxMxv+oEctyDgfvXJiw6HowI/qHOxN7oS0+xh7Ke6
         7VlPJ3ja67RAZVkdDMP+SpeVM0/uL6ruLNMY+JzszK4GcENw/vay9RFT/XolJrMFGBFO
         UB7ig/YBSzOPqaDSD35HVVMbr01R4ktSpk0esy3xlU7S83jBukJBPPHRDXIXxUwgoA23
         n22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782050226; x=1782655026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv1dki/80aNeWwp+36abGEnVJza7FGEeP7NOY9gPTvc=;
        b=Qs5a2pTocMSxdj31HShSS+pwq5A2n3dzfWc2MOJpJ7G9AlupGlDCbiREEd6lgeSc1U
         g01evurGz01JIc8jm7SOriQOwy5mKGQ0Qnu/VCQORGoQZUlszRdOcfEU+aLGsTTiTdWU
         DomhwgO6jwhil7s3BT49NGBxBRw1u+qF8vHO3Gxul04lB1mmizeTEd851xX8c+DAoBR3
         2xBde4HLXTgcV4oaiADvnncdtnqjo6P2zBFbRnnV/L2mxdWR9W27qAy4jhwzTFCXjYpR
         i+7srFe+ny+CVPfyrOla4iRY7BXU+42DrhtSIzKupuv9SGp2EX404Rvqf6lxmJBYm8qQ
         BzeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpjj5mAIIQGDIaIMHcmVDlwUVrX0g6GrnIxKAi/MUUfnWPkJxNHbR3rCYY8VwK+IJYoom6fbdFa4Lkaz1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGImgr8zr+jqOJqbtY0vae2osFEvinzig9VIl0wrvzZ/7ywc5
	LMNGcU/fABblExV/fMEEDCETUcc5zP0QLkrR0qMAMaCVCsIZkvFfYNAz
X-Gm-Gg: AfdE7clkiRMo+8q0H5OQEpJmayXdhHCHXEjE2tBpthDSCzi2nblSWdP1c0h0NsDbyUR
	WvSt3sedF3AXFNue2RKokQDZtOE2l701UTGvuZCoOsWVG3Ij2p/rfn2/5u5KhIHEmOb0x11L9/d
	p8EhglvbPU0ABgKa8k0JAXfKldJAgeJncbMV7oO215K6YDBEW7m/rj5m60VYk+FEFxqVbNxU8Py
	/NFIwqHxVC5/eDphIWtt/d3+sOHzT1PTqz/J0BlE0SniOc+tYMR3saFOn1DURSSCI1rGCWgITir
	EloKWP+woY+oaiHdMRos901/q0f/MG0f+xMVVhV94Nw2dr01axQKqftRsrEqt092Q9x9PkByL/W
	jqyBgW2/O2SQX6yhr73jjO0ImDcQXeLWo4X2z3xPcjHHGB+hOgwV+robP/zhuKrGmSKpiZ8tjSI
	vDZAKM+seDC2bdTgHv8+rKBgC9FKRazIopkjs=
X-Received: by 2002:a05:690c:4b8b:b0:7c5:f6c:d311 with SMTP id 00721157ae682-80131d97bdamr100779827b3.13.1782050226417;
        Sun, 21 Jun 2026 06:57:06 -0700 (PDT)
Received: from localhost (user-24-214-85-55.knology.net. [24.214.85.55])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025c96fdb3sm21073127b3.1.2026.06.21.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:57:06 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sun, 21 Jun 2026 09:57:05 -0400
To: Yury Norov <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <ajftsRwe19fPTP1r@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org>
 <20260621054721.7cde38f0@fedora>
 <ajfphe4Z8BrfYoUX@yury>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajfphe4Z8BrfYoUX@yury>

On Sun, Jun 21, 2026 at 09:39:17AM -0400, Yury Norov wrote:
> On Sun, Jun 21, 2026 at 05:47:21AM -0400, Steven Rostedt wrote:
> > On Sun, 21 Jun 2026 05:34:32 -0400
> > Steven Rostedt <rostedt@kernel.org> wrote:
> > 
> > > Instead of having trace_printk.h included in kernel.h, create a config
> > > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > > Makefile to allow developers to add trace_printk() without the need to add
> > > the include for it. Having it included in the Makefile keeps it from being
> > > in the dependency chain and it will not waste extra CPU cycles for those
> > > building the kernel without using trace_printk.
> > 
> > Bah, I only tested with the config option enabled, and missed some
> > dependencies with it disabled.
> 
> Yes you did.
>  
> > For instance, rcu.h also uses ftrace_dump() so that too needs to go
> > into kernel.h.
> 
> No, it shouldn't.
> 
> > I also need to add a few more includes to trace_printk.h.
> 
> > OK, I need to run this through all my tests to find where else I missed
> > adding the includes. But the idea should hopefully satisfy everyone.
> 
> If you include it under config in kernel.h, to make the kernel buildable,

I mean: in kernel.h or in Makefile.

> you need to include trace_printk.h explicitly where it's actually used.
> IOW, apply my patch v4-7.
> 
> Then, developers who use trace_printk() on their development machine,
> will be really frustrated when their debugging code will break client
> build just because CONFIG_TRACE_PRINTK_DEBUGGING is disabled there.
> They will spend a day, at best, communicating with remote managers,
> and end up with adding #include <linux/trace_printk.h> in the files
> they touch. Is that your plan?
> 
> If I was one of those developers, the solution would be simple for me:
> don't use trace_printk() at all.
> 
> Thanks,
> Yury
