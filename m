Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dallas.jonmasters.org ([72.29.103.172]:33544 "EHLO
	dallas.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751158AbYAYFhK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Jan 2008 00:37:10 -0500
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
From: Jon Masters <jonathan@jonmasters.org>
In-Reply-To: <47995788.3000402@gmail.com>
References: <20080124215813.GA4204@uranus.ravnborg.org>
	 <1201212238-4369-12-git-send-email-sam@ravnborg.org>
	 <200801251419.09999.rusty@rustcorp.com.au>  <47995788.3000402@gmail.com>
Content-Type: text/plain
Date: Fri, 25 Jan 2008 00:00:00 -0500
Message-Id: <1201237200.25284.251.camel@perihelion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tejun Heo <htejun@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

On Fri, 2008-01-25 at 12:29 +0900, Tejun Heo wrote:

> This patch makes kbuild generate modules.order and another patch makes
> depmod generate modules.alias or whatever else according to the order
> specified in modules.order, so that modprobe prefer modules which is
> earlier in the linking order.

I flaked on the Modules.order stuff and it's been on my TODO for over a
week - company deadlines got in the way. I will push a new tree asap,
hopefully before next week, which excites me in particular because...

...in RHEL, I had to fix this too just now, so I've been looking forward
to a better upstream fix. What I had to do for RHEL5 in the end was just
alphabetically sort the modules list prior to writing to disk. It's not
elegant, but it does guarantee consistent behavior on multiple matches.

Jon.


