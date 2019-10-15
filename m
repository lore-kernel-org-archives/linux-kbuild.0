Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:57588 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfJOHrU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 03:47:20 -0400
Date: Tue, 15 Oct 2019 00:47:17 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] microblaze: Include generic support for MSI irqdomains
Message-ID: <20191015074717.GB8715@infradead.org>
References: <aa6dd855474451ff4f2e82691d1f590f3a85ba68.1570530881.git.michal.simek@xilinx.com>
 <20191008154604.GA7903@infradead.org>
 <c558db03-1199-275d-3e42-612c71cbf736@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c558db03-1199-275d-3e42-612c71cbf736@xilinx.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com, Kate Stewart <kstewart@linuxfoundation.org>, Kuldeep Dave <kuldeep.dave@xilinx.com>, Albert Ou <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Palmer Dabbelt <palmer@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Firoz Khan <firoz.khan@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org

On Thu, Oct 10, 2019 at 12:47:31PM +0200, Michal Simek wrote:
> On 08. 10. 19 17:46, Christoph Hellwig wrote:
> > On Tue, Oct 08, 2019 at 12:34:47PM +0200, Michal Simek wrote:
> >> index e5c9170a07fc..83417105c00a 100644
> >> --- a/arch/microblaze/include/asm/Kbuild
> >> +++ b/arch/microblaze/include/asm/Kbuild
> >> @@ -25,6 +25,7 @@ generic-y += local64.h
> >>  generic-y += mcs_spinlock.h
> >>  generic-y += mm-arch-hooks.h
> >>  generic-y += mmiowb.h
> >> +generic-y += msi.h
> > 
> > Please just mark it as mandatory-y in the asm-generic makefile
> > instead of requiring a sniplet for every architecture.
> > 
> 
> But is it really mandatory for all architectures?

What the mandatory-y keyword means is that every architecture that
doesn't provide its own header gets the default one, which seems
applicable here.  Maybe the keyword is a bit misnamed and should be
default-y or something like that..

But in this case I think we have a clear case of x86 vs the rest, which
is unlikely to change in a major way.
