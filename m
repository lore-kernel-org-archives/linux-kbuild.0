Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:41138 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753870Ab0KIAtR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Nov 2010 19:49:17 -0500
Subject: Re: [PATCH 1/5] [PATCH 1/5] kconfig: Make localmodconfig handle
 environment variables
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <AANLkTi=JXFppmiyyo=Hc614=FpDhOO4h8SLTs=CUOvQv@mail.gmail.com>
References: <20101029054310.790179545@goodmis.org>
	 <20101029054423.498608001@goodmis.org>
	 <AANLkTi=a8dp-WUNHAkx2fZ5GgNHmDw+ee7MDeUSL44Z0@mail.gmail.com>
	 <1288402042.29632.50.camel@gandalf.stny.rr.com>
	 <AANLkTi=JXFppmiyyo=Hc614=FpDhOO4h8SLTs=CUOvQv@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Mon, 08 Nov 2010 19:49:07 -0500
Message-ID: <1289263747.12418.78.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

On Sun, 2010-10-31 at 18:05 -0400, Arnaud Lacombe wrote:
> Hi,

> > But you are right. After KS and Plumbers, I'll work on doing something
> > like that. That can probably solve some of the other issues I'm having
> > (still keeping too many modules enabled).
> >
> I have some work in progress in this area: cleanup, better split
> between the kconfig backend and frontend, and eventually a perl
> binding. That would all be an interesting goal for .38 :-)
> 
> Currently I got the parser working within perl, but I'm not really
> really sure of what I can currently do with it and how the whole thing
> interface to one another :)

Let me know what you got, I would really like localmodconfig to have
this back end. It should really help get a minimal config as well.

-- Steve


