Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45793 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751633AbaHSI6K (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 04:58:10 -0400
Message-ID: <53F311A0.4050302@suse.cz>
Date: Tue, 19 Aug 2014 10:58:08 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] kbuild: Fix the dependency handling of multi-objs
 targets
References: <1408433663-17435-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1408433663-17435-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

On 2014-08-19 09:34, Masahiro Yamada wrote:
> 1/4 and 2/4 fix the core scripts.
> 
> 3/4 and 4/4 refactors scripts/kconfig/Makefile based on 2/4.
> 
> 
> 
> Masahiro Yamada (4):
>   kbuild: handle multi-objs dependency appropriately
>   kbuild: handle the dependency of multi-objs hostprogs appropriately
>   kbuild: refactor script/kconfig/Makefile
>   kbuild: remove redundant clean-files from scripts/kconfig/Makefile

Applied to kbuild.git#kbuild, thanks!

Michal

