Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:62798 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754013AbbK0Oar (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Nov 2015 09:30:47 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] logfs: clarify MTD dependency
Date: Fri, 27 Nov 2015 15:30:12 +0100
Message-ID: <3269089.8XYbbcUOLH@wuerfel>
In-Reply-To: <20151127141406.GA29886@sepie.suse.cz>
References: <9365895.IkncCfXjo6@wuerfel> <20151127141406.GA29886@sepie.suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, Prasad Joshi <prasadjoshi.linux@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Friday 27 November 2015 15:14:06 Michal Marek wrote:
> 
> Hi Arnd,
> 
> I hit this as well and was about to submit a slightly different fix. Can
> you try the logfs portion of the below patch? Proper changelog is to be
> done, but the gist of the patch is that IS_REACHABLE(CONFIG_FOO) 
> evaluates to 1 if CONFIG_FOO=y or we are building a module and
> CONFIG_FOO=m.
> 

I thought about doing it that way, and I'm sure that also worked.
The possible behaviors are basically:

a) before your original patch, building logfs with CONFIG_MTD=m would
   silently leave out MTD support, which was rather confusing.

b) with my patch, it becomes impossible to have logfs as the built-in
   root file system on a block device while also using CONFIG_MTD=m,
   and that may be slightly annoying

c) your patch restores a), but makes it work in the case where both
   logfs and mtd are loadable modules, which is an improvement but
   may still confuse users.

My preference is still version b) as I sent, but I don't really mind
your version either.

	Arnd
