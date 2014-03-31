Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57963 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750987AbaCaUiy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 31 Mar 2014 16:38:54 -0400
Message-ID: <5339D25C.6060804@suse.cz>
Date: Mon, 31 Mar 2014 22:38:52 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: remove redundant '.*.cmd' pattern from make distclean
References: <1395992172-12950-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1395992172-12950-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

Dne 28.3.2014 08:36, Masahiro Yamada napsal(a):
> '.*.cmd' files are cleaned-up by "make clean".
> The same pattern in "make distclean" is unnecessary.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Applied to kbuild.git#kbuild, thanks.

Michal

