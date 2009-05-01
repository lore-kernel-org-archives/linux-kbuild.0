Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:56827 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756091AbZEALgZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 May 2009 07:36:25 -0400
Date: Fri, 1 May 2009 13:38:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/14] deb-pkg target improvements
Message-ID: <20090501113834.GA22023@uranus.ravnborg.org>
References: <200904230034.59627.elendil@planet.nl> <20090423091406.GA5702@stro.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090423091406.GA5702@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Frans Pop <elendil@planet.nl>, linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>

On Thu, Apr 23, 2009 at 11:14:06AM +0200, maximilian attems wrote:
> On Thu, 23 Apr 2009, Frans Pop wrote:
> 
> > Here's a new patch series with improvements for the deb-pkg target. It's a
> > compromise that includes both the patches from Maximilian Attems and myself,
> > with some changes because of comments, a few fixes, and further improvements.
> > 
> > The (new) second patch simplifies some of the later patches quite a bit.
> 
> great!
> been currently overworked in coorganising this physics workshop [1].
> so had no time to respin all of this.
> 
> reviewed and the hole patch serie has an
> Acked-by: maximilian attems <max@stro.at>

Applied the full serie with maximilliam's ack.
Thanks for fixing this!

It is applied to kbuild-next so it will show up in .32.

	Sam
