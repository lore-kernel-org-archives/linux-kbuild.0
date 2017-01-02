Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0068.hostedemail.com ([216.40.44.68]:33039 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755969AbdABS7n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jan 2017 13:59:43 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id CCB11B1178
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Jan 2017 18:51:14 +0000 (UTC)
Date: Mon, 2 Jan 2017 13:51:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] jump label: pass kbuild_cflags when checking for asm
 goto support
Message-ID: <20170102135111.26d5f5bd@grimm.local.home>
In-Reply-To: <CAPzFB+Wwn+qMh8esnoJ+E4Zym1V7JQZoztz70bPH0HqZSNpGjg@mail.gmail.com>
References: <20161210004638.23417-1-dtwlin@google.com>
        <CAPzFB+Wwn+qMh8esnoJ+E4Zym1V7JQZoztz70bPH0HqZSNpGjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Lin <dtwlin@google.com>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, jbaron@akamai.com, will.deacon@arm.com

On Sun, 1 Jan 2017 15:05:45 -0800
David Lin <dtwlin@google.com> wrote:

> +Cc: Steven Rostedt <rostedt@goodmis.org>
> +Cc: Will Deacon <will.deacon@arm.com>
> 
> On Fri, Dec 9, 2016 at 4:46 PM, David Lin <dtwlin@google.com> wrote:
> > Some versions of ARM GCC compiler such as Android toolchain throws
> > in a '-fpic' flag by default. This causes the gcc-goto check script
> > to fail although some config would have '-fno-pic' flag in the
> > KBUILD_CFLAGS.
> >
> > This patch passes the KBUILD_CFLAGS to the check script so that the
> > script does not rely on the default config from different compilers.
> >
> > Signed-off-by: David Lin <dtwlin@google.com>

Acked-by: Steven Rostedt <rostedt@goodmis.org.

-- Steve

> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 694111b..f667daa 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -790,7 +790,7 @@ KBUILD_CFLAGS   += $(call
> > cc-option,-Werror=incompatible-pointer-types) KBUILD_ARFLAGS :=
> > $(call ar-option,D)
> >
> >  # check for 'asm goto'
> > -ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh
> > $(CC)), y) +ifeq ($(shell $(CONFIG_SHELL)
> > $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
> > KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO KBUILD_AFLAGS +=
> > -DCC_HAVE_ASM_GOTO endif
> > --
> > 2.10.2
> >  

