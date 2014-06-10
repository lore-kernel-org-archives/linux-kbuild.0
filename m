Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:49287 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753784AbaFJT4I (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 15:56:08 -0400
Date: Tue, 10 Jun 2014 21:56:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
Message-ID: <20140610195602.GA7109@ravnborg.org>
References: <20140610095016.GA5528@ravnborg.org>
 <5396E55D.8000202@suse.cz>
 <20140610201706.9614.AA925319@jp.panasonic.com>
 <5396EDD0.8030406@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5396EDD0.8030406@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

On Tue, Jun 10, 2014 at 01:36:48PM +0200, Michal Marek wrote:
> On 2014-06-10 13:17, Masahiro Yamada wrote:
> > IMHO:
> > If all shell scripts invoked by $KBUILD_SHELL should be sh-compatible,
> >  "KBUILD_SHELL" should always be set to "/bin/sh" and
> > users should not change it.
> > 
> > I still don't understand why bash is preferable for KBUILD_SHELL.
> 
> I'm just speculating, but the reason might have been that if you are
> compiling Linux on some oddball UNIX system, the POSIX shell might not
> be "/bin/sh", but some other path, who knows which. But if $BASH is
> defined or if there is /bin/bash, then it's very likely the familiar GNU
> Bash. Hence the preference. Of course, the side effect is that it makes
> it easy to introduce bash-only constructs into the scripts :-/.

It has been like this forever...
The reasons for having CONFIG_SHELL are:
- with a distribution where /bin/sh does not work with the shells provided
  by the kernel - the user can override this to select another shell.
- avoid hardcoding /bin/sh in all the places where we run a script

I recall we had problems with bash only stuff when ubuntu changed to dash.
But back then the fix was always to remove the bashism from the scripts.

IMO we should document that CONFG_SHELL/KBUILD_SHELL exists.
But that the user needs to modify the top-level Makefiel to change it
is IMO OK as this is seldomly if ever required.

	Sam
