Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:38464 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754427AbZK0LDM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Nov 2009 06:03:12 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 05/10] kbuild: sort the list of symbols exported by the kernel (__ksymtab)
Date: Fri, 27 Nov 2009 21:33:15 +1030
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <4B0CF5A6.7080908@tuffmail.co.uk> <1259161737.2535.6.camel@mulgrave.site>
In-Reply-To: <1259161737.2535.6.camel@mulgrave.site>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200911272133.15617.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, Alex Chiang <achiang@hp.com>, Tony Luck <tony.luck@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Mike Frysinger <vapier.adi@gmail.com>, greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, paulus@samba.org

On Thu, 26 Nov 2009 01:38:57 am James Bottomley wrote:
> On Wed, 2009-11-25 at 09:15 +0000, Alan Jenkins wrote:
> > Yes, the series as a whole relies on that patch.  Rusty pulled the 
> > series from linux-next (thanks rusty!).
> 
> Not according to current linux-next:

Yeah, I pulled it for a day, then Alan produced the ia64 fix.

Pulling again until all acks are in...

Thanks,
Rusty.
