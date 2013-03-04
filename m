Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:32925 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758134Ab3CDSfb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Mar 2013 13:35:31 -0500
Date: Mon, 4 Mar 2013 19:35:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: make ctags with separate build dirs
Message-ID: <20130304183529.GA10627@merkur.ravnborg.org>
References: <20130304180216.GI3401@two.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130304180216.GI3401@two.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org

On Mon, Mar 04, 2013 at 07:02:16PM +0100, Andi Kleen wrote:
> 
> I usually use separate build dirs. For make ctags in the main source
> directory the dependecies always want to create all kinds of
> infrastructure and set up up the config, polluting the source dir.
> For make cscope it doesn't do that.
> 
> Could make ctags be fixed to not do that?

Confused:
$ make ctags
make: *** No rule to make target `ctags'.  Stop.

I have no support for make ctags in the kernel.

	Sam
