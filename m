Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dallas.jonmasters.org ([72.29.103.172]:51159 "EHLO
	dallas.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757284AbYAZE3e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Jan 2008 23:29:34 -0500
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
From: Jon Masters <jonathan@jonmasters.org>
In-Reply-To: <479AB57D.3080805@gmail.com>
References: <20080124215813.GA4204@uranus.ravnborg.org>
	 <200801251419.09999.rusty@rustcorp.com.au> <47995788.3000402@gmail.com>
	 <200801261501.56198.rusty@rustcorp.com.au>  <479AB57D.3080805@gmail.com>
Content-Type: text/plain
Date: Fri, 25 Jan 2008 23:28:55 -0500
Message-Id: <1201321736.32422.152.camel@perihelion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tejun Heo <htejun@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

On Sat, 2008-01-26 at 13:22 +0900, Tejun Heo wrote:

> Rusty Russell wrote:
> > On Friday 25 January 2008 14:29:12 Tejun Heo wrote:
> >> Rusty Russell wrote:
> >>> On Friday 25 January 2008 09:02:53 Sam Ravnborg wrote:

> >> So, are you saying that modprobe chooses modules in the reverse order of
> >> modules.alias file?
> > 
> > That is precisely what I'm saying, and more.
> 
> Oops, then modprobe needs to be updated too.  Jon, can you please put
> this onto your to-do list too?

But the thing Rusty is also getting at (so I think) is that this might
not be the way to fix the "problem". Perhaps using the rebinding bits in
the kernel might be the best way to solve this in the longer term. I can
fix both depmod and modprobe, but I would appreciate some more input :)

Alternatives are a config option to only load the first match for now,
and to load based on the Modules.order. Thoughts?

Jon.


