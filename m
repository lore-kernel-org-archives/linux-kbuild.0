Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39946 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgBKFrF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:47:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id t3so10648791wru.7
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:47:03 -0800 (PST)
Date: Tue, 11 Feb 2020 05:46:59 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200211054659.GD72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-4-qperret@google.com>
 <CAK7LNAT+Xw8ntYcrcMtLrekkgziaHU+7nvzdh5tqD0cbe8pJhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAT+Xw8ntYcrcMtLrekkgziaHU+7nvzdh5tqD0cbe8pJhw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Maennich <maennich@google.com>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@infradead.org>

On Saturday 08 Feb 2020 at 06:09:06 (+0100), Masahiro Yamada wrote:
> Now that this line is doing a non-trivial task,
> it might be a good idea to show a short log, like this:
> 
>   GEN     include/generated/autoksyms.h

Sounds good.

> You can do it like this:
> 
> 
> quiet_cmd_autoksyms_h = GEN     $@
>       cmd_autoksyms_h = mkdir -p $(dir $@); $(BASH)
> $(srctree)/scripts/gen_autoksyms.sh $@
> 
> $(autoksyms_h):
>         $(call cmd,autoksyms_h)

Nice, thanks for sharing!
Quentin
