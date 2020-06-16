Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbgFPSpc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 14:45:32 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD996C061573
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2020 11:45:32 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k2so1823774pjs.2
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2020 11:45:32 -0700 (PDT)
Date: Tue, 16 Jun 2020 11:45:30 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] recordmcount: support >64k sections
Message-ID: <202006161145.25387D9@keescook>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200424193046.160744-1-samitolvanen@google.com>
 <20200424222214.GC9040@rlwimi.vmware.com>
 <202006161101.34B26E6@keescook>
 <20200616143844.5599804d@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616143844.5599804d@oasis.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Matt Helsley <mhelsley@vmware.com>, Sami Tolvanen <samitolvanen@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Kristen Carlson Accardi <kristen@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 16, 2020 at 02:38:44PM -0400, Steven Rostedt wrote:
> On Tue, 16 Jun 2020 11:03:18 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > > Reviewed-by: Matt Helsley <mhelsley@vmware.com>  
> > 
> > Hi!
> > 
> > Can this patch please be applied and sent before -rc2? FGKASLR, LTO, and
> > link time improvements[1] all depend on this fix, and I'd really like
> > them all to be able to sanely rebase for the development window.
> > 
> > Thanks!
> > 
> > -Kees
> > 
> > [1] https://lore.kernel.org/lkml/CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com/
> 
> The patch seems to have fallen behind in my patch stack (unfortunately,
> it's most recent first!)
> 
> Anyway, I'm putting together now a set of patches for -rc2. I'll
> include this one in it as well.

Awesome! Thanks very much. :)

-- 
Kees Cook
