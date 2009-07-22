Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:40658 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753068AbZGVSf2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Jul 2009 14:35:28 -0400
Date: Wed, 22 Jul 2009 14:32:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: "header-y" versus "unifdef-y"?
In-Reply-To: <20090722183004.GA8457@merkur.ravnborg.org>
Message-ID: <alpine.LFD.2.00.0907221432240.27475@localhost>
References: <alpine.LFD.2.00.0907220823370.19368@localhost> <20090722183004.GA8457@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, 22 Jul 2009, Sam Ravnborg wrote:

> On Wed, Jul 22, 2009 at 08:25:03AM -0400, Robert P. J. Day wrote:
> >
> >   is it my imagination, or did someone recently propose that there
> > will soon be no distinction between those two Kbuild directives since
> > it's just as easy to "unifdef" all of them, no matter what?  has that
> > patch already been submitted for the next major release?
>
> Documentation/kbuild/makefiles.txt:
>
>         --- 7.4 unifdef-y (deprecated)
>
>         unifdef-y is deprecated. A direct replacement is header-y.
>
>
> That should answer your Q.

  ah, quite right, thanks.  i remembered someone saying that would
happen eventually, i didn't realize it had *already* happened.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================
