Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:42960 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751973AbaGIGye (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 02:54:34 -0400
Date: Wed, 09 Jul 2014 15:54:07 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH v2 0/5] kbuild: Clean-up and bug fixes of scripts/Makefile.host
In-Reply-To: <53970642.7050104@suse.cz>
References: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com> <53970642.7050104@suse.cz>
Message-Id: <20140709155406.B0BC.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi Michal,



On Tue, 10 Jun 2014 15:21:06 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2014-06-09 06:16, Masahiro Yamada wrote:
> > Masahiro Yamada (5):
> >   kbuild: fix a typo in scripts/Makefile.host
> >   kbuild: fix a bug of C++ host program handling
> >   kbuild: drop shared library support from Makefile.host
> >   kbuild: clean up scripts/Makefile.host
> >   kbuild: clean-up and bug fix of scripts/Makefile.host
> 
> 
> Thanks for the cleanup, but I'll postpone it for the next merge window.
> Thanks for your understanding.
> 
> Michal


This is just for reminder. (Sorry if I am bothering you..)

If you are planing to apply this series for the next merge window,
isn't it better to apply it onto kbuild.git#kbuild earlier
so it is widely tested in linux-next?


Best Regards
Masahiro Yamada

