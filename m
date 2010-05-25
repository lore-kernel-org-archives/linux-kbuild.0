Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:53261 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754291Ab0EYTjc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 May 2010 15:39:32 -0400
Subject: Re: [PATCH 00/13] jump label v8
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <20100525190650.GB3548@redhat.com>
References: <cover.1274283321.git.jbaron@redhat.com>
	 <20100523091856.GF25524@elte.hu> <20100524133455.GA2720@redhat.com>
	 <20100524192752.GA22554@elte.hu>  <20100525190650.GB3548@redhat.com>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 25 May 2010 15:39:29 -0400
Message-ID: <1274816369.22648.214.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Baron <jbaron@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, =?ISO-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

[ Added Michal to Cc ]

On Tue, 2010-05-25 at 15:06 -0400, Jason Baron wrote:
> On Mon, May 24, 2010 at 09:27:52PM +0200, Ingo Molnar wrote:
> > * Jason Baron <jbaron@redhat.com> wrote:
> > 
> > > On Sun, May 23, 2010 at 11:18:56AM +0200, Ingo Molnar wrote:
> > > > hi Jason,
> > > > 
> > > > * Jason Baron <jbaron@redhat.com> wrote:
> > > > 
> > > > > Hi,
> > > > > 
> > > > > updates for -v8:
> > > > 
> > > > I wanted to try your feature, but even after updating to 
> > > > latest rawhide i have:
> > > > 
> > > >  lyra:~> rpm -q gcc
> > > >  gcc-4.4.4-3.fc14.x86_64
> > > > 
> > > > and IIRC the asm goto feature is new in GCC 4.5, right?
> > > > 
> > > > Do you know when there's going to be a GCC 4.5 package for 
> > > > Fedora? I wanted to see how this feature works in 
> > > > practice, with a GCC packaged up for a distro.
> > > > 
> > > > Is there perhaps some repo somewhere with more 
> > > > experimental GCC builds for rawhide or so?
> > > > 
> > > > Thanks,
> > > > 
> > > > 	Ingo
> > > 
> > > Hi Ingo,
> > > 
> > > right. So the gcc feature is officially in gcc 4.5 which 
> > > i believe has been released. however, it has been 
> > > bacported to the latest fedora gcc even though its 4.4 
> > > based. Thus, if you apply something like like the 
> > > following you can test it out on fedora.
> > 
> > Hm, could you please add a build-time check to check for 
> > the GCC feature instead? That way we'll be able to support 
> > any backports straight out of box.
> > 
> > We do this for various GCC features: stackprotector, cfi, 
> > etc., so it's a standard technique.
> > 
> > 	Ingo
> 
> ok, here's what we've come up with based on Ingo's suggestion. Any
> chance this feature can be considered for 2.6.35? I've a got a few
> other small fixes too...
> 
> thanks,
> 
> -Jason
> 
> diff --git a/Makefile b/Makefile
> index 85edb67..b51ddfb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -582,6 +582,11 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-dwarf2-cfi-asm)
>  # conserve stack if available
>  KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
>  
> +# check for 'asm goto'
> +ifeq ($(shell sh -c "(echo 'int main(void) { entry: asm goto (\"\"::::entry); return 0; }') | $(CC) -x c - >/dev/null 2>&1 && echo y"), y)
> +	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
> +endif

Yeah, also this would help prevent bugs with other archs where the GCC
version may not have supported it either.

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

> +
>  # Add user supplied CPPFLAGS, AFLAGS and CFLAGS as the last assignments
>  # But warn user when we do so
>  warn-assign = \
> diff --git a/include/linux/jump_label.h b/include/linux/jump_label.h
> index 1eaf884..ebe19ae 100644
> --- a/include/linux/jump_label.h
> +++ b/include/linux/jump_label.h
> @@ -1,11 +1,9 @@
>  #ifndef _LINUX_JUMP_LABEL_H
>  #define _LINUX_JUMP_LABEL_H
>  
> -#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5))
> -# ifdef CONFIG_HAVE_ARCH_JUMP_LABEL
> -#  include <asm/jump_label.h>
> -#  define HAVE_JUMP_LABEL 1
> -# endif
> +#if defined(CC_HAVE_ASM_GOTO) && defined(CONFIG_HAVE_ARCH_JUMP_LABEL)
> +# include <asm/jump_label.h>
> +# define HAVE_JUMP_LABEL
>  #endif
>  
>  enum jump_label_type {


