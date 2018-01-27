Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:50222 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751404AbeA0A4E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jan 2018 19:56:04 -0500
Date: Fri, 26 Jan 2018 16:55:54 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 20/21] Kbuild, lto: Add Link Time Optimization support
Message-ID: <20180127005554.GM26209@tassilo.jf.intel.com>
References: <20171127213423.27218-1-andi@firstfloor.org>
 <20171127213423.27218-21-andi@firstfloor.org>
 <CAK8P3a3RQhiEkh6uUjdX-juXggNdZxvxRPJbE6M3e6Dy-ycGxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3RQhiEkh6uUjdX-juXggNdZxvxRPJbE6M3e6Dy-ycGxw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andi Kleen <andi@firstfloor.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, samitolvanen@google.com, alxmtvv@gmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Morton <akpm@linux-foundation.org>

On Sat, Jan 27, 2018 at 01:15:49AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 27, 2017 at 10:34 PM, Andi Kleen <andi@firstfloor.org> wrote:
> > From: Andi Kleen <ak@linux.intel.com>
> > - Add a new LDFINAL variable that controls the final link
> > for vmlinux or module. In this case we call gcc-ld instead
> > of ld, to run the LTO step.
> 
> When I tried this out on allmodconfig (following the lwn article), I ran into
> a number of warnings:

Thanks for testing. Yes it's a known issue: during one module build
when modpost looks at the file it is still in LTO format, and
modpost doesn't understand the LTO symbol table. I had a patch
to teach it to it at some point, but it got lost somewhere.
The LLVM LTO patchkit has a different solution that actually
fixes the sequence to run modpost only after a LTO final link,
but I haven't gotten around to port that one.

It seems to work already for the single file modules.

-Andi
