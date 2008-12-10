Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:43068 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820AbYLJUoe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Dec 2008 15:44:34 -0500
Date: Wed, 10 Dec 2008 15:44:32 -0500 (EST)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Better way to force a rebuild
In-Reply-To: <20081210203740.GA16674@uranus.ravnborg.org>
Message-ID: <alpine.DEB.1.10.0812101541220.11805@gandalf.stny.rr.com>
References: <alpine.DEB.1.10.0812101443550.11805@gandalf.stny.rr.com> <20081210200242.GA15692@uranus.ravnborg.org> <20081210121048.6186eaf9.akpm@linux-foundation.org> <20081210203740.GA16674@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, mingo@elte.hu


On Wed, 10 Dec 2008, Sam Ravnborg wrote:
> 
> I will fix the record_mcount stuff somehow.
> But not tonight. Busy with work-work.

Sam, Thanks!

No hurry, I was doing some clean ups when I came across that code, and 
said to myself "what an ugly hack!", and I wanted it fixed. The current 
hack works just fine, but it is an eye sore in the kernel.

I just wanted others to know that it needed to be cleaned up, and figured 
a post would help get it done.

Thanks,

-- Steve

