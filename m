Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50364 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754349Ab3HPONr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Aug 2013 10:13:47 -0400
Message-ID: <520E3394.7020906@suse.cz>
Date: Fri, 16 Aug 2013 16:13:40 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] KConf: Move flavours into their own subdirectories.
References: <kconfig-port-gtk-qt> <1375612711-17140-1-git-send-email-david.graeff@web.de> <1375612711-17140-2-git-send-email-david.graeff@web.de>
In-Reply-To: <1375612711-17140-2-git-send-email-david.graeff@web.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, sam@ravnborg.org

On 4.8.2013 12:38, David Graeff wrote:
> diff --git a/scripts/kconfig/gconfig/Makefile b/scripts/kconfig/gconfig/Makefile
> new file mode 100644
> index 0000000..335ee5e
> --- /dev/null
> +++ b/scripts/kconfig/gconfig/Makefile
> [...]
> +
> +HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
> +HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
> +                          -Wno-missing-prototypes
> +                          

This blank line contains unwanted space characters (and they were not in
scripts/kconfig/Makefile).

Michal
