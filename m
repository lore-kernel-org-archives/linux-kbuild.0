Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753099AbeBSSRn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Feb 2018 13:17:43 -0500
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com [209.85.220.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F4E521785
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Feb 2018 18:17:43 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n198so13336109qke.7
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Feb 2018 10:17:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5A8AF3B602000078001A920C@prv-mh.provo.novell.com>
References: <5A8AF3B602000078001A920C@prv-mh.provo.novell.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Feb 2018 12:17:22 -0600
Message-ID: <CAL_Jsq+eN2-=6afWDWJ6BtQ+u2qUdCx5OeXp9LXi2-aD7ShRDw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: really drop GENERIC_IO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Richard Weinberger <richard@nod.at>

On Mon, Feb 19, 2018 at 8:56 AM, Jan Beulich <JBeulich@suse.com> wrote:
> Commit 9de8da4774 ("kconfig: kill off GENERIC_IO option") dropped the
> option, but left a "select" of it in place.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>  lib/Kconfig |    1 -
>  1 file changed, 1 deletion(-)

This is the 4th such patch to fix this. I'll send it to Linus I guess
if Richard is not going to.

Rob
