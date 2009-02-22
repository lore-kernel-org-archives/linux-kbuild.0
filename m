Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39112 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752462AbZBVQXb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Feb 2009 11:23:31 -0500
Date: Sun, 22 Feb 2009 17:23:11 +0100
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH][RFC] check for select dependency errors on config load
Message-ID: <20090222162311.GA25417@elte.hu>
References: <499edf47.1818d00a.060b.2b8d@mx.google.com> <499EE162.4050008@oracle.com> <alpine.DEB.2.00.0902210008580.30069@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0902210008580.30069@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Frederic Weisbecker <fweisbec@gmail.com>, zippel@linux-m68k.org, Andrew Morton <akpm@linux-foundation.org>


* Steven Rostedt <rostedt@goodmis.org> wrote:

> There's been a few problems with SELECT and dependencies 
> lately. I've been burnt by it a few times myself. So I look at 
> the kconfig code and added this patch. It can use a bit more 
> work but it does what I want.
> 
> When the config is loaded, it checks all the symbols that are 
> selected by an active config and makes sure the visible 
> dependencies are also activated. This should probably be moved 
> to the writing of the config instead, but since I just wanted 
> to see if my current config was OK, I did it on load. This is 
> an RFC patch anyway, so fixes/comments are definitely welcome.
> 
> Here's what I get with the attached config running on 
> 2.6.29-rc5.

Yah! Very nice Steve.

/me nominates Steve as the Kconfig maintainer :-)

	Ingo
