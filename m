Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47689 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753875Ab0IQWPN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Sep 2010 18:15:13 -0400
Message-ID: <4C93E8A6.60207@suse.cz>
Date: Sat, 18 Sep 2010 00:16:06 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 00/15] Kconfig generalization
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 11.9.2010 17:51, Arnaud Lacombe napsal(a):
> Hi Sam, Michal,
> 
> You'll find hereafter the series for kconfig generalization and interfaces
> changes with the rest of the kernel.
> 
> A quick summary of the serie is:
>  - patch 1 -> 3: handles the CONFIG_ prefix, its build time definition and its
> mention in help text.
>  - patch 4: handles the reference to the 'kernel' keyword in various strings.
>  - patch 5: takes care of the "linux" domain name used to get translation
>    informations.
>  - patch 6 -> 15 handles the mainmenu syntax changes and related.
> 
> This series is available in the git repository at:
> 
>  git://github.com/lacombar/linux-2.6.git kbuild-generic-v5

Hi Arnaud,

sorry for the delay, I have the bad habit of shifting more complex
things away :(. Except the comments I sent as replies to the three
patches, I have only one thing: Publishing the git branch makes it much
more convenient for me to review it, but could you please base the next
version on either the kconfig branch of kbuild-2.6.git or on some tagged
release of Linus' tree? That way I can directly merge it into the
kconfig branch, which I can't if you base on the for-next branch (see
http://git.kernel.org/?p=linux/kernel/git/mmarek/kbuild-2.6.git;a=blob;h=refs/tags/README-KBUILD
for explanaton).

Thanks,
Michal
