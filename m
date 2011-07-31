Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:33699 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752254Ab1GaRI6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 Jul 2011 13:08:58 -0400
Date: Sun, 31 Jul 2011 10:08:56 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 2/2] Enable 'make CONFIG_FOO=y oldconfig'
Message-Id: <20110731100856.780d71de.rdunlap@xenotime.net>
In-Reply-To: <1312131467.22074.95.camel@i7.infradead.org>
References: <1312067499.22074.59.camel@i7.infradead.org>
	<1312067670.22074.61.camel@i7.infradead.org>
	<CACqU3MV460WGjmQdOOmhk3ZJT1FNjEjfuHqx8mYcgun9+7SfjA@mail.gmail.com>
	<4E34998D.8060806@zytor.com>
	<CACqU3MWn-OQVfLH96E+AeTCEjUw5+girXbuNgmUvXrEQuBe4vg@mail.gmail.com>
	<4E34A1E4.8040103@zytor.com>
	<CACqU3MVkLXoBq7KP2Jff=p7EiKR7DkPa4z7y0Rdah-dGzRvj4g@mail.gmail.com>
	<1312097621.22074.71.camel@i7.infradead.org>
	<20110731093740.39f7fbc3.rdunlap@xenotime.net>
	<1312131467.22074.95.camel@i7.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Sun, 31 Jul 2011 17:57:46 +0100 David Woodhouse wrote:

> On Sun, 2011-07-31 at 09:37 -0700, Randy Dunlap wrote:
> > Simple question:  what does "ARCH=x86" mean?
> > 
> > It doesn't mean anything to me without SUBARCH or nnBIT specified.
> 
> SUBARCH is meaningless for a native build; it's only for ARCH=um. So I
> don't know why that would make anything more meaningful to you.
> 
> And why would CONFIG_64BIT make a difference either? Or conversely: why
> do CONFIG_PAE, CONFIG_LITTLE_ENDIAN, etc. *not* make a difference to
> your understanding?
> 
> ARCH=x86 means exactly what it says: "build a kernel for the x86
> architecture".
> 
> Just like ARCH=mips means "build a kernel for MIPS" and ARCH=sparc means
> "build a kernel for SPARC", and ARCH=parisc means "build a kernel for
> PARISC", and ARCH=powerpc means "build a kernel for PowerPC". and
> ARCH=s390 means "build a kernel for S390".
> 
> In *all* of those cases, CONFIG_64BIT is just one more configuration
> option; one of *many* that define what actual hardware the kernel
> supports.

OK, it seems that we agree that ARCH=x86 is an incomplete specification.
Thanks.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
