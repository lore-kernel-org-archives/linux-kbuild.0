Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46975 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753504Ab0IQV66 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Sep 2010 17:58:58 -0400
Message-ID: <4C93E4D7.4090200@suse.cz>
Date: Fri, 17 Sep 2010 23:59:51 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 04/15] kconfig: rephrase help texts/comments not to include
 the package name
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com> <1284220282-3500-5-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-5-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 11.9.2010 17:51, Arnaud Lacombe napsal(a):
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index da5e45d..6cc3a6e 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
[...]
> +				  "End of the configuration.\n":
                                   You have a stray colon here ^

> +				  "Execute 'make' to start the build or try"
>  				  " 'make help'."), filename);

Michal
