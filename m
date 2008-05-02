Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:46578 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752796AbYEBGHi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 02:07:38 -0400
Date: Fri, 2 May 2008 08:08:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas
Message-ID: <20080502060813.GB19090@uranus.ravnborg.org>
References: <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net> <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501191714.GM29330@cs181133002.pp.htv.fi> <20080501213952.GA8281@uranus.ravnborg.org> <20080501220747.GV29330@cs181133002.pp.htv.fi> <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net> <8499950a0805011848h713606e3mda5dd2aed31dfa91@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8499950a0805011848h713606e3mda5dd2aed31dfa91@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@gmail.com>
Cc: "Sam Ravnborg (kbuild list)" <linux-kbuild@vger.kernel.org>

On Fri, May 02, 2008 at 02:48:58AM +0100, Oleg Verych wrote:
> Sam, please, tell to those guys, that shell must be `bash`, as Roman wanted.

No - we want to be portable across as many setups as possible.
So forcing us to use bash is in the long run not a good solutions.

We should go for the least common denominator - busy-box could be the one.


	Sam
