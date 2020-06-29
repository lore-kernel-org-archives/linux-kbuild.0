Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48236 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730698AbgF2TZO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:25:14 -0400
Message-ID: <649f4c040c2f6dd2d83e984a88343917d498b4ad.camel@redhat.com>
Subject: Re: [PATCH v2 0/5] Fix split view search and debug info navigation
From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Mon, 29 Jun 2020 15:23:49 +0300
In-Reply-To: <cover.1593423060.git.mchehab+huawei@kernel.org>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

On Mon, 2020-06-29 at 11:35 +0200, Mauro Carvalho Chehab wrote:
> This series fixes some issues with search while on split view and fix the
> broken hyperlink navigation.
> 
> The first patches restore the pre-Qt5 conversion behavior. The last
> one implements navigation on a different way. I opted to keep this one
> in separate, as this one is a new feature.
> 
> Mauro Carvalho Chehab (5):
>   kconfig: qconf: cleanup includes
>   kconfig: qconf: ensure that only one item will be highlighted
>   kconfig: qconf: make search fully work again on split mode
>   kconfig: qconf: make debug links work again
>   kconfig: qconf: navigate menus on hyperlinks
> 
>  scripts/kconfig/qconf.cc | 120 +++++++++++++++++++++++++++++----------
>  scripts/kconfig/qconf.h  |  15 ++---
>  2 files changed, 98 insertions(+), 37 deletions(-)
> 
I tested the series, and it works really well here.
Thanks a lot for the patch 5, I indeed noted that 
I am not sure it ever worked like that but it does now, 
and it is a very good improvement in terms of usability.

There is still a tiny issue in patch 5 - sometimes already
selected items remain selected like it was in the search (now fixed).

Also I found another bug - clicking on '..' menu doesn't work:

For example select 'input device support', then 'keyboards' on the right,
then you can't get back. It also might be something that never worked,
and it doesn't bother me, I just note this for reference.

Thanks a lot for these fixes!
Best regards,
	Maxim Levitsky
