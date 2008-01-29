Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:53463 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753650AbYA2Ft6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2008 00:49:58 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
Date: Tue, 29 Jan 2008 14:29:05 +1100
References: <20080124215813.GA4204@uranus.ravnborg.org> <479D33B3.6010707@gmail.com> <1201490410.32422.206.camel@perihelion>
In-Reply-To: <1201490410.32422.206.camel@perihelion>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200801291429.06426.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jon Masters <jonathan@jonmasters.org>
Cc: Tejun Heo <htejun@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

On Monday 28 January 2008 14:20:10 Jon Masters wrote:
> On Mon, 2008-01-28 at 10:45 +0900, Tejun Heo wrote:
> > Yeah, the alias file can be generated in reverse but I think it's better
> > to do things straight.  It may cause some surprises (after upgrading
> > modprobe, the other driver is being loaded!) but IMHO we'll be better
> > off with forward-ordered aliases in the long run.  After all, module
> > loading order was undefined anyway.
>
> I actually agree, in that the first entry is probably what people expect
> to get loaded, and that works well with things like Modules.order. I
> guess I'll just throw that together, since this wasn't defined anyway,
> and perhaps add a config option so you can reverse order if you want.

Please bear in mind that modules.alias is a (cimpletely undocumented) internal 
module utilities detail: in theory modprobe is reading all the aliases out of 
modules themselves (that's too slow, since nowdays probe-by-alias is the 
common case).

So since this is a temporary hack anyway, I think backwards is fine.

Cheers,
Rusty.
