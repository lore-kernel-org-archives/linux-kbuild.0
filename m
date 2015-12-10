Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:49087 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783AbbLJUqz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 15:46:55 -0500
Date: Thu, 10 Dec 2015 21:46:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Behaviour of kernel makefiles when entering a subdir using a
 config symbol = m
Message-ID: <20151210204638.GA32218@ravnborg.org>
References: <56687204.4080404@ti.com>
 <20151209213255.GA11031@ravnborg.org>
 <56692D6D.6060607@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56692D6D.6060607@ti.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

On Thu, Dec 10, 2015 at 09:44:45AM +0200, Tomi Valkeinen wrote:
> Hi Sam,
> 
> On 09/12/15 23:32, Sam Ravnborg wrote:
> 
> > kbuild may enter a sub directory for two purposes:
> > 1) to build object files to be part of the final image
> >    Only subdirs specified using obj-y is visited.
> > 
> > 2) to build object files that will be included in a module
> >    Subdirs specified with obj-y and obj-m is visited
> > 
> > Since you have the following code in your Makefile:
> > 
> >     obj-m += foo/
> > 
> > then foo/ is only visited to build modules.
> > 
> > So bar.o is built but is NOT included in the final image.
> > This is also the behaviour you see.
> 
> Right.
> 
> We have three drivers (one fbdev, two drm), each of which can be built
> as a module. But each of them also may require small boot-time setup,
> which needs to be built-in.
> 
> I can get around the problem by entering the dir with obj-y, or by
> creating a new extra config define which is y/n, and using that in the
> makefile. The former makes make enter the dir even if the driver is not
> enabled, and latter creates a config symbol only to solve this problem.
The extra config symbol is the most elegant solution here IMO.
Make sure to document that this config symbol enables the boot-time
setup stuff.

	Sam
