Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51757 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751603AbcAEKUP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Jan 2016 05:20:15 -0500
Subject: Re: [PATCH] kconfig: return 'false' instead of 'no' in bool function
References: <1451666045-12198-1-git-send-email-vegard.nossum@oracle.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <568B98DC.9000806@suse.com>
Date: Tue, 5 Jan 2016 11:20:12 +0100
MIME-Version: 1.0
In-Reply-To: <1451666045-12198-1-git-send-email-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>, Mauro Carvalho Chehab <mchehab@redhat.com>

On 2016-01-01 17:34, Vegard Nossum wrote:
> menu_is_visible() is a bool function and should use boolean return
> values. "no" is a tristate value which happens to also have a value
> of 0, but we should nevertheless use the right symbol for it.
> 
> This is a very minor cleanup with no semantic change.
> 
> Fixes: 86e187ff9 ("kconfig: add an option to determine a menu's visibility")
> Cc: Arnaud Lacombe <lacombar@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@redhat.com>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Thanks, applied to kbuild.git#kconfig.

Michal

