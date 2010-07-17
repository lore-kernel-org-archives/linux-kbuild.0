Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:1794 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217Ab0GQUEk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 17 Jul 2010 16:04:40 -0400
Date: Sat, 17 Jul 2010 13:04:27 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
Subject: Re: I did a git pull and a plus appeared
In-Reply-To: <20100716121802.65fdfa24@lembas.zaitcev.lan>
Message-ID: <alpine.DEB.2.00.1007171302350.15334@chino.kir.corp.google.com>
References: <20100716121802.65fdfa24@lembas.zaitcev.lan>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pete Zaitcev <zaitcev@redhat.com>
Cc: linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org, linux-kernel@vger.kernel.org

On Fri, 16 Jul 2010, Pete Zaitcev wrote:

> Dear All:
> 
> I have a tree that existed for a few years (a clone of Linus' tree).
> Today I did a git pull in it, and a plus appeared in the built version.
> E.g. after "make modules_install":
> 
> [root@niphredil linux-2.6-tip]# ls /lib/modules/
> 2.6.33.1-19.fc13.x86_64  2.6.34-rc6-tip                    2.6.35-rc1-tip
> 2.6.34-43.fc14.x86_64    2.6.35-0.36.rc4.git5.fc14.x86_64  2.6.35-rc5-tip+
> [root@niphredil linux-2.6-tip]# 
> 
> How do I get rid of the plus? I have (had for a long time):
> 
> [zaitcev@niphredil linux-2.6-tip]$ grep LOCAL .config
> CONFIG_LOCALVERSION="-tip"
> # CONFIG_LOCALVERSION_AUTO is not set
> CONFIG_X86_LOCAL_APIC=y
> [zaitcev@niphredil linux-2.6-tip]$ 
> 

I initially added the `+' to the version string in 85a256d8 during this 
release cycle.  As the changelog indicates, it means that your tree is 
beyond a tagged commit and LOCALVERSION= was not passed on the command 
line so the tree must be described as a modified 2.6.35-rc5 kernel, for 
example, instead of vanilla.  That's the semantics that the `+' indicates.
