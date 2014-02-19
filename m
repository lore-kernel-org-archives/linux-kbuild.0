Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:46702 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751592AbaBSBBH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 20:01:07 -0500
Date: Wed, 19 Feb 2014 11:31:00 +1030
From: Alan Modra <amodra@gmail.com>
Subject: Re: [RFC] kbuild: drop use of "ld -r" for intermediate links of
 vmlinux
Message-ID: <20140219010100.GA3386@bubble.grove.modra.org>
References: <20140216203724.GA19216@ravnborg.org>
 <20140218145856.GZ3386@bubble.grove.modra.org>
 <20140218214801.GA25163@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140218214801.GA25163@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, mmarek@suse.cz, Cary Coutant <ccoutant@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Feb 18, 2014 at 10:48:01PM +0100, Sam Ravnborg wrote:
> > Another possibility is to use thin archives to package up the objects.
> > Thin archives are like normal archives except they just contain paths
> > to the objects, not the object contents.  Paths are flattened when
> > adding one thin archive to another.  I think Stephen may have tried
> > that idea too.
> I just coded this in a similar simple fashion.
> It broke building vdso - needs to look into that and will get back when I may
> understand why my link suddenly broke.

Missing --whole-archive?

-- 
Alan Modra
Australia Development Lab, IBM
