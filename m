Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55855 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388AbaFJLgu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 07:36:50 -0400
Message-ID: <5396EDD0.8030406@suse.cz>
Date: Tue, 10 Jun 2014 13:36:48 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
References: <20140610095016.GA5528@ravnborg.org> <5396E55D.8000202@suse.cz> <20140610201706.9614.AA925319@jp.panasonic.com>
In-Reply-To: <20140610201706.9614.AA925319@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On 2014-06-10 13:17, Masahiro Yamada wrote:
> IMHO:
> If all shell scripts invoked by $KBUILD_SHELL should be sh-compatible,
>  "KBUILD_SHELL" should always be set to "/bin/sh" and
> users should not change it.
> 
> I still don't understand why bash is preferable for KBUILD_SHELL.

I'm just speculating, but the reason might have been that if you are
compiling Linux on some oddball UNIX system, the POSIX shell might not
be "/bin/sh", but some other path, who knows which. But if $BASH is
defined or if there is /bin/bash, then it's very likely the familiar GNU
Bash. Hence the preference. Of course, the side effect is that it makes
it easy to introduce bash-only constructs into the scripts :-/.

Michal
