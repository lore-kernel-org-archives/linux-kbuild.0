Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:48948 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756696AbZD3OoM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2009 10:44:12 -0400
Date: Thu, 30 Apr 2009 16:42:20 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/3] removing unwanted module configs
Message-ID: <20090430144220.GB14897@elte.hu>
References: <20090430030821.523327994@goodmis.org> <20090430071830.GC16737@elte.hu> <alpine.DEB.2.00.0904300908110.20374@gandalf.stny.rr.com> <20090430132605.GA5289@elte.hu> <alpine.DEB.2.00.0904300932380.20374@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0904300932380.20374@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>


* Steven Rostedt <rostedt@goodmis.org> wrote:

> On Thu, 30 Apr 2009, Ingo Molnar wrote:
> > 
> > CONFIG_IKCONFIG=y would be a one-off thing, only to make the 
> > whole concept self-hosting. If i boot a localyesconfig kernel, 
> > how does the script figure out what is built in? It cannot, 
> > unless i provide it the precise .config - but often that wont be 
> > provided. The script should clone the environment it is running 
> > in really.
> 
> Does IKCONFIG get loaded in the running kernel if IKCONFIG_PROC is 
> not set, or does it just sit in the vmlinux file.
> 
> Since this option can also be used for helping embedded developers 
> (I used it for that) I would not want to bloat the kernel with 
> running a script that is suppose to minimize it. But if IKCONFIG 
> && !IKCONFIG_PROC does not add more data to the kernel, then I 
> would be happy to turn it on by default.

this is a basic usability issue. The main goal is to help regular 
Linux users.

> I see I can use scripts/extract-ikconfig to get the config from 
> the current image. Now which image should it try?

no, enable IKCONFIG_PROC and it will be under /proc/config.gz.

> /boot/vmlinuz-`uname -r`
> ./vmlinux
> 
> I could have it first try /proc/config.gz and if it does not find 
> it then try the /boot kernel, if it does not find it or does not 
> find a config file in it, it would then try ./vmlinux file. If it 
> does not find the file or the config then it would just use the 
> local .config.

yeah, that sounds like a good plan.

	Ingo
