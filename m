Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50446 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754051AbbFOMzt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Jun 2015 08:55:49 -0400
Message-ID: <557ECB52.2060402@suse.cz>
Date: Mon, 15 Jun 2015 14:55:46 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC] kconfig: a new command line tool to set configs
References: <20150512103128.GA25706@mwanda>
In-Reply-To: <20150512103128.GA25706@mwanda>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2015-05-12 12:31, Dan Carpenter wrote:
> This is an ugly hack job I made last night and it barely works.  It
> does two things:
> 
> 1)  Sometimes I want to search for a config so I have to load
>     menuconfig, then search for the config entry, then exit.  With
>     this script I simply run:
> 
> 	./scripts/kconfig/kconfig search COMEDI
> 
> 2)  I quite often try to enable something by doing:
> 
> 	echo CONFIG_FOO=y >> .config
> 	make oldconfig
> 	grep CONFIG_FOO .config
> 
>     The grep is to see if the setting worked.  Now I can do:
> 
> 	./scripts/kconfig/kconfig set CONFIG_FOO=y

The second use-case is provided by scripts/config already. It's is a lot
simpler shell script, but it's maybe good enough for such task.

Michal
