Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:45897 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750844Ab0IQWBh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Sep 2010 18:01:37 -0400
Message-ID: <4C93E577.5080707@suse.cz>
Date: Sat, 18 Sep 2010 00:02:31 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 09/15] kconfig: replace KERNELVERSION usage by the mainmenu's
 prompt
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com> <1284220282-3500-10-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-10-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 11.9.2010 17:51, Arnaud Lacombe napsal(a):
>  	QDesktopWidget *d = configApp->desktop();
> -	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration%s"),
> -		getenv("KERNELVERSION"),
> +	snprintf(title, sizeof(title), "%s%s"),
                                             ^
The closing paren should not be there.

Michal
