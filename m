Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:55273 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753467AbYE1UfP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 May 2008 16:35:15 -0400
Date: Wed, 28 May 2008 22:35:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080528203556.GA7552@uranus.ravnborg.org>
References: <20080521144211.902CD37652C@pmx1.sophos.com> <20080521190453.GA12638@uranus.ravnborg.org> <20080521194806.GJ22488@duo.random> <20080528190907.GA6466@uranus.ravnborg.org> <20080528191315.GA6979@uranus.ravnborg.org> <20080528201803.GF8086@duo.random>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080528201803.GF8086@duo.random>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrea Arcangeli <andrea@qumranet.com>
Cc: tvrtko.ursulin@sophos.com, linux-kbuild@vger.kernel.org

On Wed, May 28, 2008 at 10:18:03PM +0200, Andrea Arcangeli wrote:
> On Wed, May 28, 2008 at 09:13:15PM +0200, Sam Ravnborg wrote:
> > Inspect the gcc commandlien to see if the last -I
> > contains the expected value (which is `pwd`)
> 
> I can reproduce a failure, not sure if it's the same one but it ends
> up with -I. Actually on the good build it seems the -I wasn't there at
> all.

Now I see. So we suddenly started to include ccflags-y in the
modpost build - which we did no do before.
I will look at it tomorrow.

Thanks,
	Sam
