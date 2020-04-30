Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD3DOH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 23:14:07 -0400
Date: Wed, 29 Apr 2020 20:14:03 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200430031403.GC3546299@ubuntu-s3-xlarge-x86>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
 <20200423171807.29713-3-natechancellor@gmail.com>
 <20200426162737.GA9322@alpha.franken.de>
 <20200427020830.GA260@Ryzen-7-3700X.localdomain>
 <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
 <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
 <alpine.LFD.2.21.2004291835400.851719@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2004291835400.851719@eddie.linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Wed, Apr 29, 2020 at 06:46:33PM +0100, Maciej W. Rozycki wrote:
> On Mon, 27 Apr 2020, Nathan Chancellor wrote:
> 
> > >  Can you actually record in the change description what the difference in 
> > > the relevant link command is, as shown where `V=1' has been used with 
> > > `make' invocation?
> > 
> > That will be rather unweildy to put in the commit message since
> > currently, $(CC) + $(KBUILD_CFLAGS) is being used but I can if it is
> > really desired. Otherwise, I can just put it where I put the changelog.
> 
>  Umm, is the difference so huge?  I think a note along the lines of:
> 
> "[...] This change adds/removes[*]:
> 
> <part of the command affected>
> 
> from the invocation of [...], which is required for [...]"
> 
> -- only quoting what's actually changed will be sufficient.  Reword as 
> required.  Otherwise it's hard to guess now what the change actually does, 
> and it will be even harder for someone who comes across it and tries to 
> understand it the future, when the context might be hard to reproduce.
> 
> [*] Delete as appropriate.
> 
>   Maciej

I ended up figuring out a way to get the difference proper into the
commit message in v4. Please take a look.

Cheers,
Nathan
