Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56323 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750883AbaFJMDG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 08:03:06 -0400
Message-ID: <5396F3F8.4050803@suse.cz>
Date: Tue, 10 Jun 2014 14:03:04 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kbuild: trivial - use tabs for code indent where possible
References: <1402394893-28486-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402394893-28486-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

On 2014-06-10 12:08, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
> 
> Changes in v2:
>   - Update zconf.lex.c_shipped and zconf.tab.c_shipped by hand
> 
> 
> 
> 
>  scripts/basic/fixdep.c               |  8 +++---
>  scripts/docproc.c                    | 56 ++++++++++++++++++------------------
>  scripts/kallsyms.c                   |  2 +-
>  scripts/kconfig/conf.c               |  2 +-
>  scripts/kconfig/gconf.c              |  2 +-
>  scripts/kconfig/lxdialog/checklist.c |  4 +--
>  scripts/kconfig/lxdialog/inputbox.c  |  2 +-
>  scripts/kconfig/lxdialog/menubox.c   |  4 +--
>  scripts/kconfig/lxdialog/util.c      |  2 +-
>  scripts/kconfig/mconf.c              |  2 +-
>  scripts/kconfig/menu.c               |  6 ++--
>  scripts/kconfig/zconf.l              |  4 +--
>  scripts/kconfig/zconf.lex.c_shipped  |  4 +--
>  scripts/kconfig/zconf.tab.c_shipped  |  2 +-
>  scripts/kconfig/zconf.y              |  2 +-
>  scripts/mod/file2alias.c             | 42 +++++++++++++--------------
>  scripts/mod/modpost.c                | 30 +++++++++----------
>  scripts/mod/sumversion.c             |  4 +--
>  scripts/tags.sh                      |  2 +-
>  19 files changed, 89 insertions(+), 91 deletions(-)

Applied to kbuild.git#misc, thanks.

Michal

