Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49178 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757148Ab0HQJES (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 05:04:18 -0400
Message-ID: <4C6A4FEB.3020405@suse.cz>
Date: Tue, 17 Aug 2010 11:01:31 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] kbuild: don't include `check-lxdialog' ldflags in
 global HOST_LOADLIBES
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com> <1281932346-19067-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281932346-19067-2-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 16.8.2010 06:19, Arnaud Lacombe wrote:
> On BSD systems, `check-lxdialog' would select -lcurses as the default
> curses library which would conflict with -lncurses at runtime: curses'
> compatible symbols are getting handled by the system's curses library while the
> ncurses-specific symbols are getting handled by the ports' ncurses.
> 
> This fixes `nconf' segmentation fault on these systems.
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/Makefile |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)

I applied this and the typo fix.

Thanks,
Michal
