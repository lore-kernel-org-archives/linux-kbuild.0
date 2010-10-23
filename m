Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:52947 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756951Ab0JWNlJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 23 Oct 2010 09:41:09 -0400
Date: Sat, 23 Oct 2010 15:41:02 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: 2.6.36, make oldconfig broken
Message-ID: <20101023134102.GA7893@elte.hu>
References: <201010221229.36996.gene.heskett@gmail.com>
 <20101022114019.60839ff2.randy.dunlap@oracle.com>
 <201010221608.36754.gene.heskett@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201010221608.36754.gene.heskett@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gene Heskett <gene.heskett@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org


hi Gene,

* Gene Heskett <gene.heskett@gmail.com> wrote:

> > Please send your 2.6.35.7 .config file so that we can generate & see the 
> > changes.
> 
> Attached Randy, & many thanks.
> 
> Just for S&G I overwrote the generated .config in the 2.6.36 tree with these 
> files, and ran a make xconfig, which bitched about line 3109, and which I don't 
> recall ever playing with, "RAR_REGISTER" IIRC, so I saved it without any other 
> changes and built/installed & booted from that now.

In case it's useful: i take old .config's and put them into new kernels all the 
time, and i very much depend on configured drivers and options not going away 
suddenly. I know lots of other developers depend on that as well.

In the hundreds or so cases i've done this manually in the past few years i only 
remember less than 5 cases where this didnt work in an 'as expected' way.

So this should really work for you. If it doesnt when going from 2.6.35 to 2.6.36 
then that's very likely a bug somewhere which we want to fix ...

Thanks,

	Ingo
