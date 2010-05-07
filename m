Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f204.google.com ([209.85.222.204]:47746 "EHLO
	mail-pz0-f204.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753245Ab0EGG7H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 May 2010 02:59:07 -0400
Date: Fri, 7 May 2010 15:02:57 +0800
From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] kconfig: introduce nonint_oldconfig and
 loose_nonint_oldconfig (v3)
Message-ID: <20100507070257.GD5921@cr0.nay.redhat.com>
References: <20100413194747.GX31193@redhat.com>
 <20100413130031.d4dec19b.randy.dunlap@oracle.com>
 <20100413201759.GY31193@redhat.com>
 <4BC4D310.6060705@oracle.com>
 <20100413210352.GA31193@redhat.com>
 <4BC5C190.3020501@suse.cz>
 <20100506164834.GL20778@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100506164834.GL20778@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Aristeu Rozanski <aris@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, davej@redhat.com, kyle@redhat.com, vgoyal@redhat.com, arjan@linux.intel.com

On Thu, May 06, 2010 at 12:48:34PM -0400, Aristeu Rozanski wrote:
>This patch has been around for a long time in Fedora and Red Hat Enterprise
>Linux kernels and it may be useful for others. The nonint_oldconfig target
>will fail and print the unset config options while loose_nonint_oldconfig will
>simply let the config option unset. They're useful in distro kernel packages
>where the config files are built using a combination of smaller config files.
>
>Arjan van de Ven wrote the initial nonint_config and Roland McGrath added the
>loose_nonint_oldconfig.
>
>v2:
>- when -B and -b are used, return "2" so the reason can be distinguished from
>  other errors
>v3:
>- help updated
>- nonint_oldconfig won't update the config file if options are missing

The patch looks fine, but, why the name 'nonint_oldconfig'?
My English is not good enough to see what 'nonint' standards for...

Thanks.
