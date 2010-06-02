Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59475 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751759Ab0FBMoh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Jun 2010 08:44:37 -0400
Message-ID: <4C065232.7000501@suse.cz>
Date: Wed, 02 Jun 2010 14:44:34 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: introduce nonint_oldconfig and	loose_nonint_oldconfig
 (v3)
References: <20100413194747.GX31193@redhat.com> <20100413130031.d4dec19b.randy.dunlap@oracle.com> <20100413201759.GY31193@redhat.com> <4BC4D310.6060705@oracle.com> <20100413210352.GA31193@redhat.com> <4BC5C190.3020501@suse.cz> <20100506164834.GL20778@redhat.com>
In-Reply-To: <20100506164834.GL20778@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Aristeu Rozanski <aris@redhat.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, davej@redhat.com, kyle@redhat.com, vgoyal@redhat.com, arjan@linux.intel.com

On 6.5.2010 18:48, Aristeu Rozanski wrote:
> This patch has been around for a long time in Fedora and Red Hat Enterprise
> Linux kernels and it may be useful for others. The nonint_oldconfig target
> will fail and print the unset config options while loose_nonint_oldconfig will
> simply let the config option unset. They're useful in distro kernel packages
> where the config files are built using a combination of smaller config files.
> 
> Arjan van de Ven wrote the initial nonint_config and Roland McGrath added the
> loose_nonint_oldconfig.
> 
> v2:
> - when -B and -b are used, return "2" so the reason can be distinguished from
>   other errors
> v3:
> - help updated
> - nonint_oldconfig won't update the config file if options are missing
> 
> Signed-off-by: Arjan van de Ven <arjan@redhat.com> [defunct email]
> Whatevered-by: Kyle McMartin <kyle@redhat.com>
> Acked-by: Arjan van de Ven <arjan@linux.intel.com>
> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
> Signed-off-by: Aristeu Rozanski <aris@redhat.com>

Sorry for the delay. Applied now.

Michal
