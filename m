Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:39113 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728438AbfGPSwk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 14:52:40 -0400
Date: Tue, 16 Jul 2019 14:52:18 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716185218.GB15080@mit.edu>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716144034.GA36330@gmail.com>
 <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
 <20190716181324.GA41555@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716181324.GA41555@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 08:13:24PM +0200, Ingo Molnar wrote:
> 
> * Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > On Tue, 16 Jul 2019, Ingo Molnar wrote:
> > 
> > > 
> > > * Thomas Gleixner <tglx@linutronix.de> wrote:
> > > 
> > > > The gold linker has known issues of failing the build in random and
> > > > predictible ways. H.J. stated:
> > > 
> > > s/predictable/unpredictable?
> > 
> > No. It fails randomly, but also predictable. Enable X32 support on 64bit
> > and it fails the VDSO build. That's been the case for years.
> 
> Then please make this a bit more apparent, such as:
> 
>  "The gold linker has known issues of failing the build in random
>   but also in more predictible ways."

<bikeshedding>
How about:

The gold linker has known issues of failing for certain configurations.

</bikeshedding>

					- Ted
					
