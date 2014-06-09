Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:52426 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753748AbaFISPo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 14:15:44 -0400
Date: Mon, 9 Jun 2014 20:15:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: rename CONFIG_SHELL to KBUILD_SHELL
Message-ID: <20140609181526.GA1414@ravnborg.org>
References: <1402317082-21184-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402317082-21184-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Mon, Jun 09, 2014 at 09:31:22PM +0900, Masahiro Yamada wrote:
> All the macros with CONFIG_ prefix are supposed to be defined
> in Kconfig. But CONFIG_SHELL is defined in the top Makefile,
> violating the namespace rule.
> 
> Is is impossible to move CONFIG_SHELL definition to Kconfig.
> Configuration rules depend on "outputmakefile" rule where
> CONFIG_SHELL is already used.
> (Kbuild has to know which shell to use before invoking "make config".)
> 
> So, it seems better to rename CONFIG_SHELL.
> Because "SHELL" is a special variable for GNU make, we should not
> use it. It looks like "KBUILD_SHELL" is a good choice.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Marek <mmarek@suse.cz>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Please do a follow-up path that adds this variable to the list
in Documentation/kbuild/kbuild.txt

And please cc: the x86 people - thay have some patches that
uses CONFIG_SHELL IIRC.

The original (CONFIG_SHELL) was missing which is why you did not catch this.

	Sam
