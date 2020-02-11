Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36006 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgBKFpm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:45:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so1926111wma.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:45:39 -0800 (PST)
Date: Tue, 11 Feb 2020 05:45:34 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v3 2/3] kbuild: split adjust_autoksyms.sh in two parts
Message-ID: <20200211054534.GC72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-3-qperret@google.com>
 <CAK7LNARaEjo7g4=3o-F29Extru8+mYCDqY1i_Gzvra=JB-eZhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARaEjo7g4=3o-F29Extru8+mYCDqY1i_Gzvra=JB-eZhw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Maennich <maennich@google.com>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@infradead.org>

On Saturday 08 Feb 2020 at 06:08:08 (+0100), Masahiro Yamada wrote:
> In 3/3, you will call this script with $(CONFIG_SHELL) from Makefile.
> 
> For consistency,
> 
> $CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
> 
> is better.

Agreed, I'll fix this in v4.

Thanks,
Quentin
