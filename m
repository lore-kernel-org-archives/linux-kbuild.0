Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:26538 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757577Ab3D2Uni (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 16:43:38 -0400
Message-ID: <1367268217.30667.25.camel@gandalf.local.home>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 16:43:37 -0400
In-Reply-To: <alpine.DEB.2.02.1304291514210.15369@oneiric>
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
	 <alpine.DEB.2.02.1304291514210.15369@oneiric>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 15:15 -0400, Robert P. J. Day wrote:
> On Mon, 29 Apr 2013, Steven Rostedt wrote:
> 
> > Can you add this patch and see if it fixes your issue. If so, can I
> > add your "tested-by" to this patch?
> 
>   just to be clear, that patch didn't solve the issue involving a
> config file from an earlier kernel but i don't think it was supposed
> to, was it?

No, and honestly, I don't see that as an issue ;-) Old configs with new
kernels will always have issues if a new dependency is created. In other
words, that's a WONTFIX bug.

make localmodconfig is to disable only the configs not needed for the
loaded modules. If a required config was not in the original .config,
then that's out of scope for localmodconfig. But the bug you reported
was, localmodconfig was disabling a required config that was in the
original .config.

-- Steve


