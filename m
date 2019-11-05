Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34824 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388615AbfKENrq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 08:47:46 -0500
Received: by mail-wm1-f67.google.com with SMTP id 8so13186452wmo.0
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Nov 2019 05:47:44 -0800 (PST)
Date: Tue, 5 Nov 2019 13:47:42 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH 4/4] mospost: remove unneeded local variable in
 contains_namespace()
Message-ID: <20191105134742.GC65671@google.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-5-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-5-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Hi!

On Tue, Oct 29, 2019 at 09:38:09PM +0900, Masahiro Yamada wrote:
>The local variable, ns_entry, is unneeded.
>
>While I was here, I also cleaned up the comparison with NULL or 0.
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---

This was not directly sent to me, hence I missed it.
Nevertheless, please feel free to add

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias
>
> scripts/mod/modpost.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index f7425f5d4ab0..f70b924f379f 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -239,10 +239,8 @@ static struct symbol *find_symbol(const char *name)
> static bool contains_namespace(struct namespace_list *list,
> 			       const char *namespace)
> {
>-	struct namespace_list *ns_entry;
>-
>-	for (ns_entry = list; ns_entry != NULL; ns_entry = ns_entry->next)
>-		if (strcmp(ns_entry->namespace, namespace) == 0)
>+	for (; list; list = list->next)
>+		if (!strcmp(list->namespace, namespace))
> 			return true;
>
> 	return false;
>-- 
>2.17.1
>
