Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35619 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751224AbdFVOXX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 10:23:23 -0400
Received: by mail-pg0-f66.google.com with SMTP id f127so2642612pgc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2017 07:23:23 -0700 (PDT)
Date: Fri, 23 Jun 2017 00:23:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kbuild:thin-ar 5/8] ia64-linux-ld: warning: .note.gnu.build-id
 section discarded, --build-id ignored.
Message-ID: <20170623002301.7276d0f4@roar.ozlabs.ibm.com>
In-Reply-To: <20170622140400.GE8406@bubble.grove.modra.org>
References: <201706221136.76FjJsv8%fengguang.wu@intel.com>
        <20170622143327.32177b0a@roar.ozlabs.ibm.com>
        <20170622140400.GE8406@bubble.grove.modra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Modra <amodra@gmail.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, kbuild-all@01.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

On Thu, 22 Jun 2017 23:34:01 +0930
Alan Modra <amodra@gmail.com> wrote:

> On Thu, Jun 22, 2017 at 02:33:27PM +1000, Nicholas Piggin wrote:
> > On Thu, 22 Jun 2017 11:48:38 +0800
> > kbuild test robot <fengguang.wu@intel.com> wrote:  
> > > >> ia64-linux-ld: warning: .note.gnu.build-id section discarded, --build-id ignored.    
> > 
> > 
> > Sigh.
> > 
> > What's happening here is that when performing the final link with the
> > -R option, the linker forgets to emit the --build-id section it was
> > asked to.
> > 
> > This is the final link command line that causes the error:
> > 
> > $ ia64-linux-ld -static -R arch/ia64/kernel/gate-syms.o --build-id -o vmlinux -T ./arch/ia64/kernel/vmlinux.lds --whole-archive built-in.o --no-whole-archive --start-group lib/lib.a arch/ia64/lib/lib.a --end-group  
> 
> Try putting the --just-symbols (-R) file after --no-whole-archive.
> The idea being to make it not the first object file.  --just-symbols
> files have their contents discarded, and the linker is stupidly
> attaching the section it creates to hold the build-id, to that file.
> 

That makes sense. It's a bit tricky to do this with the way options are
provided by the arch code to the final link, but I worked around it by
linking a small dummy .o file with the symbols and pulling that into the
final link.

Thanks,
Nick
