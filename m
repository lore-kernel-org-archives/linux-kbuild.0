Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41658 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756256Ab3HOPpI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Aug 2013 11:45:08 -0400
Message-ID: <520CF77F.4040802@suse.cz>
Date: Thu, 15 Aug 2013 17:45:03 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Gracefully exit if the default config files
 are not present
References: <6523722.tcSzR9xRoc@comanche>
In-Reply-To: <6523722.tcSzR9xRoc@comanche>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

Hi Mike,

On 13.8.2013 23:29, Mike Pagano wrote:
> Gracefully exit if the default config files are not present. (.config and 
> .config.old)

Two minor nitpicks about the changelog: The subject line would be more
to the point if it mentioned the name of the utility you are fixing.
Otherwise, people might get the impression that you are fixing a tool
from scripts/kconnfig, like 'make oldconfig' or 'make menuconfig'. Just
change it to

diffconfig: Gracefully exit if the default config files are not present


> Diffconfig is a utility script for comparing kernel configuration files.

This is superfluous information. Just describe the change you made and
that's it.


> -    a = readconfig(file(configa_filename))
> -    b = readconfig(file(configb_filename))
> +    try:
> +        a = readconfig(file(configa_filename))
> +        b = readconfig(file(configb_filename))
> +    except IOError,(errno, strerror):
> +       print "I/O error(%s: %s)\n" % (errno, strerror)
> +       usage()

The second block is missing one column of indentation.

Michal
