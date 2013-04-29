Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:11763 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751026Ab3D2PNJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 11:13:09 -0400
Message-ID: <1367248388.30667.13.camel@gandalf.local.home>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 11:13:08 -0400
In-Reply-To: <alpine.DEB.2.02.1304291056410.13584@oneiric>
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
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 11:01 -0400, Robert P. J. Day wrote:

>   however, the last bit on that wiki page still puzzles me and i just
> noticed it -- even after i manually add in the atheros stuff,
> localmodconfig still throws it away again, this time without warning.
> 

That looks to me like a localmodconfig bug. You're telling me that you
did the make menuconfig, got everything in there, and after doing the
localmodconfig, it throws it out?

That now interests me.

Can you send me the .config after the make menuconfig, and the lsmod
output you used. As well as which kernel version you are testing
against.

Thanks!

-- Steve


