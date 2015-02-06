Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:52126 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754314AbbBFPk3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Feb 2015 10:40:29 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
Date: Fri, 6 Feb 2015 16:40:28 +0100
Message-ID: <CA+icZUWoPxGgzgjiMEJ1PPXjRp_oa8_C0tceTyK4Ao6_Hco+Gw@mail.gmail.com>
Subject: =?UTF-8?B?bGludXgtMy4xOC55OiBBZGQgImtjb25maWc6IEZpeCB3YXJuaW5nICLigJhqdW1w4oCZIA==?=
	=?UTF-8?B?bWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCIi?=
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Peter_K=C3=BCmmel?= <syntheticpp@gmx.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi,

I see the following...

$ yes "" | make oldconfig && make silentoldconfig </dev/null
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
In file included from scripts/kconfig/zconf.tab.c:2537:0:
scripts/kconfig/menu.c: In function ‘get_symbol_str’:
scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used
uninitialized in this function [-Wmaybe-uninitialized]
     jump->offset = strlen(r->s);
                  ^
scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
  struct jump_key *jump;
                   ^
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --oldconfig Kconfig
#
# configuration written to .config
#
scripts/kconfig/conf --silentoldconfig Kconfig

The fix is "kconfig: Fix warning "‘jump’ may be used uninitialized"" upstream.

Greg can you take it for next -stable cycle?

Thanks.

Regards,
- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=2d560306096739e2251329ab5c16059311a151b0
