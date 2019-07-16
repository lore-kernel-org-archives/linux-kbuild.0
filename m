Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([193.142.43.55]:50689 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfGPP7Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 11:59:16 -0400
Date: Tue, 16 Jul 2019 17:59:11 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: kbuild: Fail if gold linker is detected
In-Reply-To: <20190716144034.GA36330@gmail.com>
Message-ID: <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de> <20190716144034.GA36330@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Tue, 16 Jul 2019, Ingo Molnar wrote:

> 
> * Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > The gold linker has known issues of failing the build in random and
> > predictible ways. H.J. stated:
> 
> s/predictable/unpredictable?

No. It fails randomly, but also predictable. Enable X32 support on 64bit
and it fails the VDSO build. That's been the case for years.

Thanks,

	tglx
