Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:59489 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1759604Ab0D3VSS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Apr 2010 17:18:18 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Fri, 30 Apr 2010 14:07:59 -0700
Date: Fri, 30 Apr 2010 14:07:59 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 1/4] Add targets to use the Coccinelle checker
Message-Id: <20100430140759.fc93fff6.rdunlap@xenotime.net>
In-Reply-To: <adaaasmyyyl.fsf@roland-alpha.cisco.com>
References: <1272316279-12042-1-git-send-email-npalix@diku.dk>
	<1272316279-12042-2-git-send-email-npalix@diku.dk>
	<1272317821.15953.107.camel@Joe-Laptop.home>
	<201004270020.09447.npalix@diku.dk>
	<4BD61266.5020905@xenotime.net>
	<adaaasmyyyl.fsf@roland-alpha.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: Nicolas Palix <npalix@diku.dk>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk

On Thu, 29 Apr 2010 10:01:54 -0700 Roland Dreier wrote:

>  > > +		"Take particularly attention when using the \"patch\" mode\n"\
>  > 
>  > 		      particular
> 
> Actually, "take particular attention" is not particularly grammatical.
> I might phrase this as
> 
>   Be especially careful when using the "patch" mode to review the patch
>   you are about to submit.

Yes, or:

    When using "patch" mode, carefully review the patch before submitting it.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
