Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from two.firstfloor.org ([193.170.194.197]:37692 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754641Ab3CDTIH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Mar 2013 14:08:07 -0500
Date: Mon, 4 Mar 2013 20:08:05 +0100
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: make ctags with separate build dirs
Message-ID: <20130304190805.GK3401@two.firstfloor.org>
References: <20130304180216.GI3401@two.firstfloor.org>
 <20130304183529.GA10627@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130304183529.GA10627@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kbuild@vger.kernel.org

On Mon, Mar 04, 2013 at 07:35:29PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 04, 2013 at 07:02:16PM +0100, Andi Kleen wrote:
> > 
> > I usually use separate build dirs. For make ctags in the main source
> > directory the dependecies always want to create all kinds of
> > infrastructure and set up up the config, polluting the source dir.
> > For make cscope it doesn't do that.
> > 
> > Could make ctags be fixed to not do that?
> 
> Confused:
> $ make ctags
> make: *** No rule to make target `ctags'.  Stop.
> 
> I have no support for make ctags in the kernel.

Ah, it's "make tags" and works as expected.  Never mind.

Thanks Sam.

-Andi
