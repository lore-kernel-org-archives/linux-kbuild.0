Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:55357 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754051AbZEDMPr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 May 2009 08:15:47 -0400
Subject: Re: [PATCH 7/7] kconfig: search for a config to base the local(mod|yes)config on
From: Andi Kleen <andi@firstfloor.org>
References: <20090430185022.122124349@goodmis.org>
	<20090430185223.792841532@goodmis.org>
Date: Mon, 04 May 2009 14:15:41 +0200
In-Reply-To: <20090430185223.792841532@goodmis.org> (Steven Rostedt's message of "Thu, 30 Apr 2009 14:50:29 -0400")
Message-ID: <87fxflgj2q.fsf@basil.nowhere.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Steven Rostedt <rostedt@goodmis.org> writes:

> Here's the list and order of search:
>
>   /proc/config.gz
>   /boot/vmlinuz-`uname -r`
>   vmlinux  # local to the directory
>   /lib/modules/`uname -r`/kernel/kernel/configs.ko
>   kernel/configs.ko
>   kernel/configs.o
>   .config


That seems like the wrong order. ./.config should always be first for
compatibility. 

That order would completely wreck all my build scripts, and I suspect
others too.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
