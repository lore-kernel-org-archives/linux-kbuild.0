Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:51221 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752091AbZGVSaG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Jul 2009 14:30:06 -0400
Date: Wed, 22 Jul 2009 20:30:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: "header-y" versus "unifdef-y"?
Message-ID: <20090722183004.GA8457@merkur.ravnborg.org>
References: <alpine.LFD.2.00.0907220823370.19368@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0907220823370.19368@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, Jul 22, 2009 at 08:25:03AM -0400, Robert P. J. Day wrote:
> 
>   is it my imagination, or did someone recently propose that there
> will soon be no distinction between those two Kbuild directives since
> it's just as easy to "unifdef" all of them, no matter what?  has that
> patch already been submitted for the next major release?

Documentation/kbuild/makefiles.txt:

        --- 7.4 unifdef-y (deprecated)

        unifdef-y is deprecated. A direct replacement is header-y.


That should answer your Q.

	Sam
