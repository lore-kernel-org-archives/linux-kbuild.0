Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42769 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932394Ab3EGON3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 10:13:29 -0400
Message-ID: <51890BFC.3020001@suse.cz>
Date: Tue, 07 May 2013 16:13:16 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] menuconfig: fix NULL pointer dereference when searching
 a symbol
References: <518869BB.2020808@huawei.com> <20130507132159.GA15137@free.fr> <518905E6.5050502@suse.cz> <20130507140639.GB15137@free.fr>
In-Reply-To: <20130507140639.GB15137@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Li Zefan <lizefan@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, Weng Meiling <wengmeiling.weng@huawei.com>, Libo Chen <clbchenlibo.chen@huawei.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Borislav Petkov <bp@alien8.de>

Dne 7.5.2013 16:06, Yann E. MORIN napsal(a):
> It's strange that a kconfig-related change did not land in your tree
> before getting mainline...

It's quite simple. I wanted to look at the patch, but Andrew beat me to
it. I am not saying that I would have spotted the null pointer deref
myself :-).

Michal
