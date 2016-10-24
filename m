Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0236.hostedemail.com ([216.40.44.236]:47031 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933054AbcJXRtB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2016 13:49:01 -0400
Message-ID: <1477331336.1984.6.camel@perches.com>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
From: Joe Perches <joe@perches.com>
Date: Mon, 24 Oct 2016 10:48:56 -0700
In-Reply-To: <874m41mz4h.fsf@turtle.gmx.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
         <20161021212127.GA32611@angband.pl> <87eg37niky.fsf@turtle.gmx.de>
         <1477250598.3561.4.camel@perches.com> <8760oinqly.fsf@turtle.gmx.de>
         <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
         <874m41mz4h.fsf@turtle.gmx.de>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On Mon, 2016-10-24 at 19:32 +0200, Sven Joachim wrote:

(in the attachment)
> +KBUILD_CFLAGS  += $(call cc-option,-fno-pie,)

trivia:

The trailing comma is not necessary though the Makefile
is a bit inconsistent about this.

$ git grep "KBUILD_CFLAGS.*call cc-option" Makefile
Makefile:KBUILD_CFLAGS  += $(call cc-option,-fno-delete-null-pointer-checks,)
Makefile:KBUILD_CFLAGS  += $(call cc-option,-ffunction-sections,)
Makefile:KBUILD_CFLAGS  += $(call cc-option,-fdata-sections,)
Makefile:KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
Makefile:KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
Makefile:KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
Makefile:KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
Makefile:KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
Makefile:KBUILD_CFLAGS   += $(call cc-option, -fno-var-tracking-assignments)
Makefile:KBUILD_CFLAGS   += $(call cc-option, -gsplit-dwarf, -g)
Makefile:KBUILD_CFLAGS  += $(call cc-option, -gdwarf-4,)
Makefile:KBUILD_CFLAGS  += $(call cc-option, -femit-struct-debug-baseonly) \
Makefile:KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
Makefile:KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
Makefile:KBUILD_CFLAGS  += $(call cc-option,-fno-strict-overflow)
Makefile:KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
Makefile:KBUILD_CFLAGS   += $(call cc-option,-Werror=implicit-int)
Makefile:KBUILD_CFLAGS   += $(call cc-option,-Werror=strict-prototypes)
Makefile:KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
Makefile:KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
