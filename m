Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dallas.jonmasters.org ([72.29.103.172]:35007 "EHLO
	dallas.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757952AbYA1DUy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Jan 2008 22:20:54 -0500
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
From: Jon Masters <jonathan@jonmasters.org>
In-Reply-To: <479D33B3.6010707@gmail.com>
References: <20080124215813.GA4204@uranus.ravnborg.org>
	 <200801261501.56198.rusty@rustcorp.com.au> <479AB57D.3080805@gmail.com>
	 <200801262025.59593.rusty@rustcorp.com.au>  <479D33B3.6010707@gmail.com>
Content-Type: text/plain
Date: Sun, 27 Jan 2008 22:20:10 -0500
Message-Id: <1201490410.32422.206.camel@perihelion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tejun Heo <htejun@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

On Mon, 2008-01-28 at 10:45 +0900, Tejun Heo wrote:

> Yeah, the alias file can be generated in reverse but I think it's better
> to do things straight.  It may cause some surprises (after upgrading
> modprobe, the other driver is being loaded!) but IMHO we'll be better
> off with forward-ordered aliases in the long run.  After all, module
> loading order was undefined anyway.

I actually agree, in that the first entry is probably what people expect
to get loaded, and that works well with things like Modules.order. I
guess I'll just throw that together, since this wasn't defined anyway,
and perhaps add a config option so you can reverse order if you want.

Really we should all fix this through rebinding of loaded drivers. We're
beyond the days of one driver per device, into the realm of SATA
chipsets that also do "legacy", and much more funky stuff. A few of us
are already looking at dynamic driver updates for "Enterprise" distros,
and we have debated the rebinding issue. David Z. and I discussed using
a GUI tool like the hal device manager to facilitate udev rule writing.
It'll probably all happen at some point, hopefully before OLs :)

Jon.


