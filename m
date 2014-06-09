Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45244 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932246AbaFIWIR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 18:08:17 -0400
Message-ID: <5396304F.5000107@suse.cz>
Date: Tue, 10 Jun 2014 00:08:15 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: trivial - remove trailing empty lines
References: <1401340349-15575-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1401340349-15575-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

Dne 29.5.2014 07:12, Masahiro Yamada napsal(a):
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  scripts/Makefile.asm-generic        | 1 -
>  scripts/Makefile.host               | 1 -
>  scripts/checkstack.pl               | 1 -
>  scripts/config                      | 1 -
>  scripts/dtc/.gitignore              | 1 -
>  scripts/dtc/fstree.c                | 1 -
>  scripts/dtc/libfdt/fdt_empty_tree.c | 1 -
>  scripts/dtc/treesource.c            | 1 -
>  scripts/headers.sh                  | 2 --
>  scripts/kconfig/Makefile            | 1 -
>  scripts/kconfig/check.sh            | 1 -
>  scripts/kconfig/mconf.c             | 1 -
>  scripts/kconfig/nconf.c             | 1 -
>  scripts/kconfig/util.c              | 2 --
>  scripts/markup_oops.pl              | 1 -
>  scripts/mksysmap                    | 1 -
>  scripts/mod/.gitignore              | 1 -
>  scripts/mod/mk_elfconfig.c          | 1 -
>  scripts/package/Makefile            | 1 -
>  scripts/package/buildtar            | 1 -
>  scripts/pnmtologo.c                 | 1 -
>  scripts/recordmcount.c              | 2 --
>  scripts/rt-tester/check-all.sh      | 1 -
>  scripts/rt-tester/rt-tester.py      | 2 --
>  scripts/selinux/install_policy.sh   | 1 -
>  scripts/show_delta                  | 1 -
>  26 files changed, 30 deletions(-)

Applied to kbuild.git#misc, thanks.

Michal

