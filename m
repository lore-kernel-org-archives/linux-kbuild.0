Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55808 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388036AbfGPSN3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 14:13:29 -0400
Date: Tue, 16 Jul 2019 20:13:24 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716181324.GA41555@gmail.com>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716144034.GA36330@gmail.com>
 <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org


* Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, 16 Jul 2019, Ingo Molnar wrote:
> 
> > 
> > * Thomas Gleixner <tglx@linutronix.de> wrote:
> > 
> > > The gold linker has known issues of failing the build in random and
> > > predictible ways. H.J. stated:
> > 
> > s/predictable/unpredictable?
> 
> No. It fails randomly, but also predictable. Enable X32 support on 64bit
> and it fails the VDSO build. That's been the case for years.

Then please make this a bit more apparent, such as:

 "The gold linker has known issues of failing the build in random
  but also in more predictible ways."

or so?

Thanks,

	Ingo
