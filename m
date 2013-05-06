Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([94.23.35.102]:46612 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752863Ab3EFNEw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 May 2013 09:04:52 -0400
Date: Mon, 6 May 2013 15:04:46 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: Wish: exact matches displayed first
Message-ID: <20130506150446.7e39f644@skate>
In-Reply-To: <20130506125459.GB3958@free.fr>
References: <1367826629.4494.30.camel@chaos.site>
	<20130506100007.GA3958@free.fr>
	<20130506125459.GB3958@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Jean Delvare <jdelvare@suse.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Roland Eggner <edvx1@systemanalysen.net>, Wang YanQing <udknight@gmail.com>

Dear Yann E. MORIN,

On Mon, 6 May 2013 14:54:59 +0200, Yann E. MORIN wrote:

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

Wow, I didn't know that. Is this documented/advertised somewhere?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
