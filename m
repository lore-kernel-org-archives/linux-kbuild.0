Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:46149 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752125Ab0IQWJ3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Sep 2010 18:09:29 -0400
Message-ID: <4C93E74F.7080200@suse.cz>
Date: Sat, 18 Sep 2010 00:10:23 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 14/15] kconfig: regen parser
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com> <1284220282-3500-15-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-15-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 11.9.2010 17:51, Arnaud Lacombe napsal(a):
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/lex.zconf.c_shipped |    5 +-
>  scripts/kconfig/zconf.tab.c_shipped |  547 ++++++++++++++++++-----------------
>  2 files changed, 286 insertions(+), 266 deletions(-)

The grammar was changed in "[PATCH 06/15] kconfig: implement the
`mainmenu' directive", so it would be easier to understand the history
if the update was done right after that patch. The later changes do not
change any of the flex/bison tables, so I would simply fold them into
the respective patches.

Michal
