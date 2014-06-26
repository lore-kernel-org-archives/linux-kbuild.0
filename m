Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:57223 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754810AbaFZCDU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Jun 2014 22:03:20 -0400
Date: Thu, 26 Jun 2014 11:02:43 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
In-Reply-To: <5396F868.1090609@suse.cz>
References: <20140610210249.961B.AA925319@jp.panasonic.com> <5396F868.1090609@suse.cz>
Message-Id: <20140626110242.79E5.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Hi Michal, Sam,


On Tue, 10 Jun 2014 14:22:00 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2014-06-10 14:02, Masahiro Yamada wrote:
> > Hi Michal,
> > 
> > On Tue, 10 Jun 2014 13:36:48 +0200
> > Michal Marek <mmarek@suse.cz> wrote:
> > 
> >> On 2014-06-10 13:17, Masahiro Yamada wrote:
> >>> IMHO:
> >>> If all shell scripts invoked by $KBUILD_SHELL should be sh-compatible,
> >>>  "KBUILD_SHELL" should always be set to "/bin/sh" and
> >>> users should not change it.
> >>>
> >>> I still don't understand why bash is preferable for KBUILD_SHELL.
> >>
> >> I'm just speculating, but the reason might have been that if you are
> >> compiling Linux on some oddball UNIX system, the POSIX shell might not
> >> be "/bin/sh", but some other path, who knows which. But if $BASH is
> >> defined or if there is /bin/bash, then it's very likely the familiar GNU
> >> Bash. Hence the preference. Of course, the side effect is that it makes
> >> it easy to introduce bash-only constructs into the scripts :-/.
> > 
> > Hmm, 
> > We set the default value to /bin/sh  (KBUILD_SHELL ?= /bin/sh)
> > but allowing oddball system users to override it like,
> > export  KBUILD_SHELL=/bin/bash; make
> > 
> > Does this sounds reasonable?
> 
> I'm not against it in principle, but it will have to wait for the next
> merge window, so that it sees more testing in linux-next. I'd like to
> push the current set of changes to Linus and time is getting tight.
> 
> Michal


Now the merge window is closed, so I'd like to resume this topic.

Before that, I have a question.
Sam mentioned as follows:

On Mon, 9 Jun 2014 13:40:10 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:
> All shell scripts that are invoked with $(CONFIG_SHELL) must be sh-compatible,
> or in practice dash compatible as well as bash compatible.
> The preference is bash as expressed with the above code.


I notice at least two files (scripts/coccicheck and scripts/mkuboot.sh)
have shebang "#!/bin/bash" even though they are invoked with $(CONFIG_SHELL).

Should we change them to "#!/bin/sh" ?

In that case, we also have to modify some lines where bash-extension
is used.

COCCIINCLUDE=${LINUXINCLUDE//-I/-I }
COCCIINCLUDE=${COCCIINCLUDE//-include/-I}

I think fixing them is not difficult.



Best Regards
Masahiro Yamada

