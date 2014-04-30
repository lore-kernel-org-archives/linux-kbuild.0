Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47976 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758922AbaD3PgU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Apr 2014 11:36:20 -0400
Date: Wed, 30 Apr 2014 17:36:19 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: trivial - remove trailing spaces
Message-ID: <20140430153619.GB31256@sepie.suse.cz>
References: <1398669978-30261-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398669978-30261-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Apr 28, 2014 at 04:26:18PM +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  Makefile                             |  8 ++++----
>  scripts/Makefile.build               |  4 ++--
>  scripts/Makefile.fwinst              |  2 +-
>  scripts/Makefile.host                |  2 +-
>  scripts/Makefile.lib                 | 10 +++++-----
>  scripts/conmakehash.c                | 12 ++++++------
>  scripts/kconfig/streamline_config.pl |  2 +-
>  scripts/mkcompile_h                  |  4 ++--
>  scripts/package/builddeb             |  2 +-
>  scripts/patch-kernel                 |  4 ++--
>  10 files changed, 25 insertions(+), 25 deletions(-)

Applied to kbuild.git#kbuild, thanks.

Michal
