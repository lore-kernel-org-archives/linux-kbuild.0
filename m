Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34638 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751344AbaJBNCc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Oct 2014 09:02:32 -0400
Message-ID: <542D4CE4.8080001@suse.cz>
Date: Thu, 02 Oct 2014 15:02:28 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: remove obj-n and lib-n handling
References: <1410258381-7088-1-git-send-email-yamada.m@jp.panasonic.com> <1410258381-7088-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1410258381-7088-4-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

On 2014-09-09 12:26, Masahiro Yamada wrote:
> Kconfig never defines CONFIG_* as 'n'.
> Now obj-n is only used in firmware/Makefile and it can be
> replaced with obj-.  No makefile uses lib-n.

A possible usecase would be overriding CONFIG_ options on the commandline:

make CONFIG_FOOBAR=n

but CONFIG_FOOBAR= works as well.


> Let's rip off obj-n and lib-n.

Agreed, I applied your series to kbuild.git#kbuild now.

Michal
