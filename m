Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:43757 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbZD3NrK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2009 09:47:10 -0400
Date: Thu, 30 Apr 2009 09:47:08 -0400 (EDT)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/3] removing unwanted module configs
In-Reply-To: <alpine.DEB.2.00.0904300932380.20374@gandalf.stny.rr.com>
Message-ID: <alpine.DEB.2.00.0904300945440.20374@gandalf.stny.rr.com>
References: <20090430030821.523327994@goodmis.org> <20090430071830.GC16737@elte.hu> <alpine.DEB.2.00.0904300908110.20374@gandalf.stny.rr.com> <20090430132605.GA5289@elte.hu> <alpine.DEB.2.00.0904300932380.20374@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>



On Thu, 30 Apr 2009, Steven Rostedt wrote:
> 
> Since this option can also be used for helping embedded developers (I used 
> it for that) I would not want to bloat the kernel with running a script 
> that is suppose to minimize it. But if IKCONFIG && !IKCONFIG_PROC does not 
> add more data to the kernel, then I would be happy to turn it on by 
> default.

Actually, I can let the user decide. If it sees that IKCONFIG is not set, 
it can remove it from the .config output. When the silentoldconfig runs 
afterwards, it will ask the user if they want to enable it.

-- Steve

