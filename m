Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:37198 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750883AbaFJMDD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 08:03:03 -0400
Date: Tue, 10 Jun 2014 21:02:50 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
In-Reply-To: <5396EDD0.8030406@suse.cz>
References: <20140610201706.9614.AA925319@jp.panasonic.com> <5396EDD0.8030406@suse.cz>
Message-Id: <20140610210249.961B.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

Hi Michal,

On Tue, 10 Jun 2014 13:36:48 +0200
Michal Marek <mmarek@suse.cz> wrote:

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

Hmm, 
We set the default value to /bin/sh  (KBUILD_SHELL ?= /bin/sh)
but allowing oddball system users to override it like,
export  KBUILD_SHELL=/bin/bash; make

Does this sounds reasonable?

I am not sure how much impact it is...

Best Regards
Masahiro Yamada

