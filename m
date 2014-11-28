Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57654 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750976AbaK1Nmu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Nov 2014 08:42:50 -0500
Message-ID: <54787BD8.7050102@suse.cz>
Date: Fri, 28 Nov 2014 14:42:48 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kconfig: Fix warning =?UTF-8?B?IuKAmGp1bXDigJkgbWE=?=
 =?UTF-8?B?eSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQi?=
References: <1415098919-21836-1-git-send-email-syntheticpp@gmx.net>
In-Reply-To: <1415098919-21836-1-git-send-email-syntheticpp@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On 2014-11-04 12:01, Peter Kümmel wrote:
> Warning:
> In file included from scripts/kconfig/zconf.tab.c:2537:0:
> scripts/kconfig/menu.c: In function ‘get_symbol_str’:
> scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>      jump->offset = strlen(r->s);
> 
> Simplifies the test logic because (head && local) means (jump != 0)
> and makes GCC happy when checking if the jump pointer was initialized.

The warning is bogus, but since this has been reported by several people
now, let's shut it up this way. Applied to kbuild.git#kbuild.

Michal
