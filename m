Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:32853 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753087AbaGDWCC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Jul 2014 18:02:02 -0400
Message-ID: <53B72456.5050000@suse.cz>
Date: Sat, 05 Jul 2014 00:01:58 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
References: <20140610210249.961B.AA925319@jp.panasonic.com> <5396F868.1090609@suse.cz> <20140626110242.79E5.AA925319@jp.panasonic.com>
In-Reply-To: <20140626110242.79E5.AA925319@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Dne 26.6.2014 04:02, Masahiro Yamada napsal(a):
> On Mon, 9 Jun 2014 13:40:10 +0200
> Sam Ravnborg <sam@ravnborg.org> wrote:
>> All shell scripts that are invoked with $(CONFIG_SHELL) must be sh-compatible,
>> or in practice dash compatible as well as bash compatible.
>> The preference is bash as expressed with the above code.
> 
> 
> I notice at least two files (scripts/coccicheck and scripts/mkuboot.sh)
> have shebang "#!/bin/bash" even though they are invoked with $(CONFIG_SHELL).
> 
> Should we change them to "#!/bin/sh" ?

Sorry for the late reply.

If we are going to change the CONFIG_SHELL (KBUILD_SHELL) variable to
/bin/sh, then yes, please change them to /bin/sh and make them dash
compatible.


> In that case, we also have to modify some lines where bash-extension
> is used.
> 
> COCCIINCLUDE=${LINUXINCLUDE//-I/-I }
> COCCIINCLUDE=${COCCIINCLUDE//-include/-I}
> 
> I think fixing them is not difficult.

Right, nothing a simple sed call wouldn't fix.

Thanks,
Michal

