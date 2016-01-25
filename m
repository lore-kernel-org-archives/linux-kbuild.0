Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1050.oracle.com ([156.151.31.82]:24188 "EHLO
	userp1050.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932586AbcAZSHe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jan 2016 13:07:34 -0500
Date: Mon, 25 Jan 2016 11:57:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [RFC] kconfig: a new command line tool to set configs
Message-ID: <20160125085720.GB5273@mwanda>
References: <20150512103128.GA25706@mwanda>
 <557ECB52.2060402@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <557ECB52.2060402@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 15, 2015 at 02:55:46PM +0200, Michal Marek wrote:
> On 2015-05-12 12:31, Dan Carpenter wrote:
> > This is an ugly hack job I made last night and it barely works.  It
> > does two things:
> > 
> > 1)  Sometimes I want to search for a config so I have to load
> >     menuconfig, then search for the config entry, then exit.  With
> >     this script I simply run:
> > 
> > 	./scripts/kconfig/kconfig search COMEDI
> > 
> > 2)  I quite often try to enable something by doing:
> > 
> > 	echo CONFIG_FOO=y >> .config
> > 	make oldconfig
> > 	grep CONFIG_FOO .config
> > 
> >     The grep is to see if the setting worked.  Now I can do:
> > 
> > 	./scripts/kconfig/kconfig set CONFIG_FOO=y
> 
> The second use-case is provided by scripts/config already. It's is a lot
> simpler shell script, but it's maybe good enough for such task.

The scripts/config file doesn't check that the config is valid.  It's
the same as doing "echo CONFIG_FOO=y >> .config" which I was trying to
fix.

regards,
dan carpenter

