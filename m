Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45781 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbeJSBF3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 21:05:29 -0400
Date: Thu, 18 Oct 2018 17:03:33 +0000
From: Du Changbin <changbin.du@gmail.com>
Subject: Re: [PATCH 2/4] kernel hacking: new config NO_AUTO_INLINE to disable
 compiler auto-inline optimizations
Message-ID: <20181018170333.ctwhuyecd5m6wxoh@mail.google.com>
References: <20181018162548.6399-1-changbin.du@gmail.com>
 <20181018162548.6399-3-changbin.du@gmail.com>
 <20181018125948.789c72de@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181018125948.789c72de@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Du Changbin <changbin.du@gmail.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, tglx@linutronix.de, mingo@redhat.com, linux@armlinux.org.uk, akpm@linux-foundation.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org, Changbin Du <changbin.du@intel.com>

On Thu, Oct 18, 2018 at 12:59:48PM -0400, Steven Rostedt wrote:
> On Thu, 18 Oct 2018 16:25:46 +0000
> Du Changbin <changbin.du@gmail.com> wrote:
> 
> > From: Changbin Du <changbin.du@intel.com>
> > 
> > This patch add a new kernel hacking option NO_AUTO_INLINE. Selecting
> > this option will prevent the compiler from optimizing the kernel by
> > auto-inlining functions not marked with the inline keyword.
> > 
> > With this option, only functions explicitly marked with "inline" will
> > be inlined. This will allow the function tracer to trace more functions
> > because it only traces functions that the compiler has not inlined.
> > 
> > Signed-off-by: Changbin Du <changbin.du@intel.com>
> > Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 
> I have acked patch this before, but this particular patch has extra
> changes that I have not acked.
>
Steven, no extra changes made. I just wronly rebased it on top of mainline.
:)

> 
> 
> > +config ENABLE_WARN_DEPRECATED
> > +	bool "Enable __deprecated logic"
> > +	default y
> > +	help
> > +	  Enable the __deprecated logic in the kernel build.
> > +	  Disable this to suppress the "warning: 'foo' is deprecated
> > +	  (declared at kernel/power/somefile.c:1234)" messages.
> > +
> 
> What is that?
> 
> -- Steve

-- 
Thanks,
Du Changbin
