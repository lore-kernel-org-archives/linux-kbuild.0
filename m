Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgFPSir (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 14:38:47 -0400
Date: Tue, 16 Jun 2020 14:38:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] recordmcount: support >64k sections
Message-ID: <20200616143844.5599804d@oasis.local.home>
In-Reply-To: <202006161101.34B26E6@keescook>
References: <20200422232417.72162-1-samitolvanen@google.com>
        <20200424193046.160744-1-samitolvanen@google.com>
        <20200424222214.GC9040@rlwimi.vmware.com>
        <202006161101.34B26E6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Matt Helsley <mhelsley@vmware.com>, Sami Tolvanen <samitolvanen@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Kristen Carlson Accardi <kristen@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 16 Jun 2020 11:03:18 -0700
Kees Cook <keescook@chromium.org> wrote:

> > Reviewed-by: Matt Helsley <mhelsley@vmware.com>  
> 
> Hi!
> 
> Can this patch please be applied and sent before -rc2? FGKASLR, LTO, and
> link time improvements[1] all depend on this fix, and I'd really like
> them all to be able to sanely rebase for the development window.
> 
> Thanks!
> 
> -Kees
> 
> [1] https://lore.kernel.org/lkml/CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com/

The patch seems to have fallen behind in my patch stack (unfortunately,
it's most recent first!)

Anyway, I'm putting together now a set of patches for -rc2. I'll
include this one in it as well.

-- Steve
