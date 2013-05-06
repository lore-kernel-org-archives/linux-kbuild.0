Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57005 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751811Ab3EFOLn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 May 2013 10:11:43 -0400
Subject: Re: Wish: exact matches displayed first
From: Jean Delvare <jdelvare@suse.de>
In-Reply-To: <20130506125459.GB3958@free.fr>
References: <1367826629.4494.30.camel@chaos.site>
	 <20130506100007.GA3958@free.fr>  <20130506125459.GB3958@free.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 May 2013 16:10:33 +0200
Message-ID: <1367849433.4569.107.camel@chaos.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Roland Eggner <edvx1@systemanalysen.net>, Wang YanQing <udknight@gmail.com>

Salut Yann,

Le Monday 06 May 2013 à 14:54 +0200, Yann E. MORIN a écrit :
> Jean, All,
> 
> On Mon, May 06, 2013 at 12:00:07PM +0200, Yann E. MORIN wrote:
> > On Mon, May 06, 2013 at 09:50:29AM +0200, Jean Delvare wrote:
> > > I wish a search in "make menuconfig" would return an exact match, if it
> > > exists, first in the list. At the moment, looking for "PCI", for
> > > example, returns several dozen entries (anything matching "PCI") and
> > > CONFIG_PCI is far away from the top. Ideally I would expect this query
> > > to return CONFIG_PCI first.
> > 
> > Indeed, this has bugged me a few times, too.
> > I'll see what I can do.
> 
> BTW, did you know that you can search using extended regular expressions?
> Searching for ^PCI$ will yield only the CONFIG_PCI symbol.

No, I didn't know. Thanks for the tip, it's very useful. If I can
remember it, that is ;)

> Otherwise, I have a patch (that I'll submit shortly) to sort the symbols
> by releveance.

I will be happy to test it!

-- 
Jean Delvare
Suse L3

