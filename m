Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:42994 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752117Ab0CQDYP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Mar 2010 23:24:15 -0400
Message-ID: <4BA04B59.6090804@example.com>
Date: Wed, 17 Mar 2010 04:24:09 +0100
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com> <4B9FDAF3.9010804@xenotime.net>
In-Reply-To: <4B9FDAF3.9010804@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:

> You are welcome to do the same or test mainline (with daily
> builds) and/or Andrew Morton's mmotm patchset.

I think that if Andrew's git repo is up to date usually I will be 
testing his work. Is this somethink what used to be suffixed -mm?

> However, boot testing is probably even more helpful, such as you
> have already tried.  The /dev/sda2 root problem is probably just a
> configuration problem.  Would you like to try to diagnose it?

Previously I wrote that I do not have the config - I forgot that I had 
built DEB package, so the config is there, I even have the source 
package, so I think we can diagnose it. Shall I send you the .config 
file off-list (there is some size limit as far as I know).

-- 
Z cyklu "Uroki demokracji", czyli pytania i odpowiedzi w teledurniejach:
- Jak± walutê maj± Indie?
- Ramadan.
NP: Miles Davis, John Coltrane - Bye Bye Blackbird
