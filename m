Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:8323 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758206Ab3D2XkL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 19:40:11 -0400
Message-ID: <1367278809.30667.33.camel@gandalf.local.home>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 19:40:09 -0400
In-Reply-To: <alpine.DEB.2.02.1304291636380.16617@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
	     <20130427153833.GC3355@free.fr>
	     <alpine.DEB.2.02.1304271325240.12586@oneiric>
	     <20130427174226.GA25088@free.fr>
	     <alpine.DEB.2.02.1304271412250.27554@oneiric>
	     <20130428202854.GC4571@free.fr>
	 <alpine.DEB.2.02.1304290645150.16211@oneiric>
	    <1367244700.28120.6.camel@fedora>
	    <alpine.DEB.2.02.1304291022320.9234@oneiric>
	   <1367246499.30667.9.camel@gandalf.local.home>
	   <alpine.DEB.2.02.1304291056410.13584@oneiric>
	  <1367248388.30667.13.camel@gandalf.local.home>
	 <alpine.DEB.2.02.1304291121180.26536@oneiric>
	 <1367258419.30667.20.camel@gandalf.local.home>
	 <alpine.DEB.2.02.1304291636380.16617@oneiric>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 16:39 -0400, Robert P. J. Day wrote:

>   i'm interested -- should that Kconfig file have been written using a
> different structure to avoid this issue? surely there are other
> Kconfig files that would have had the same problem, no? i can't
> believe this could be restricted to a single example involving
> atheros stuff.

I did a quick search and there's lots of places that source is within if
statements. But the config used isn't usually a tristate. That is, it is
either enabled or not, but can't be a module.

Here the if condition was a module and is something that localmodconfig
can disabled.

Hmm, I did find another case like this (and there may be more).

drivers/ipack/Kconfig does it too. But nobody noticed.

Anyway, it's fixed now, which is good.

-- Steve


