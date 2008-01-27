Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dallas.jonmasters.org ([72.29.103.172]:37578 "EHLO
	dallas.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753531AbYA0Eeo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Jan 2008 23:34:44 -0500
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
From: Jon Masters <jonathan@jonmasters.org>
In-Reply-To: <200801262025.59593.rusty@rustcorp.com.au>
References: <20080124215813.GA4204@uranus.ravnborg.org>
	 <200801261501.56198.rusty@rustcorp.com.au> <479AB57D.3080805@gmail.com>
	 <200801262025.59593.rusty@rustcorp.com.au>
Content-Type: text/plain
Date: Sat, 26 Jan 2008 23:33:56 -0500
Message-Id: <1201408437.32422.189.camel@perihelion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Tejun Heo <htejun@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

On Sat, 2008-01-26 at 20:25 +1100, Rusty Russell wrote:

> There is, of course, no reason to change modprobe; just define the current 
> behaviour that the *last* alias is preferred, and generate modules.alias 
> accordingly.

For now, let's base it on Modules.order but ensure the alias file is
written in the appropriate order (I need to check, that's probably in
reverse of Modules.order...I'll think about this tomorrow, this has been
on my mind recently, and like I said, I had to kludge a fix for an
Enterprise distribution for deterministic behavior recently too).

> Jon's idea of having the later one pull the device away would also work, but 
> seems like it's a complex solution to a corner case.

Well, ultimately, we (myself, Kay, and others) would seem to prefer that
rebinding be done properly - so through a combination of udev rules and
kernel behavior, the user/third parties define the priorities. We should
load all the drivers - that's totally correct - but we shouldn't depend
upon whichever probe function will run first, that's too lame.

I'll start with the simple fix, then we should debate this...

Jon.


