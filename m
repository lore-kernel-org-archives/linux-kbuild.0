Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42252 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753355AbaLAOcp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Dec 2014 09:32:45 -0500
Message-ID: <547C7C08.6000200@suse.cz>
Date: Mon, 01 Dec 2014 15:32:40 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: fix build warning
References: <00000149fc943418-9754cb63-3a60-4a20-be0a-73081913356c-000000@email.amazonses.com>
In-Reply-To: <00000149fc943418-9754cb63-3a60-4a20-be0a-73081913356c-000000@email.amazonses.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luka Perkov <luka.perkov@sartura.hr>, linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr

On 2014-11-29 18:23, Luka Perkov wrote:
> Patch fixes following build warning:
> 
> In file included from scripts/kconfig/zconf.tab.c:2537:0:
> scripts/kconfig/menu.c: In function ‘get_symbol_str’:
> scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>      jump->offset = strlen(r->s);
>                   ^
> scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
>   struct jump_key *jump;
> 
> Signed-off-by: Luka Perkov <luka.perkov@sartura.hr>

Thanks for the patch, but a similar one has already been merged to
kbuild.git and linux-next.git.

Michal

