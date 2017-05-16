Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38091 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751591AbdEPHko (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 May 2017 03:40:44 -0400
Received: by mail-wm0-f51.google.com with SMTP id v15so80480036wmv.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 May 2017 00:40:43 -0700 (PDT)
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v2] kbuild: skip install/check of headers right under uapi
 directories
References: <1494911703-16619-1-git-send-email-yamada.masahiro@socionext.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Message-ID: <05860fa0-2186-8e02-5733-0f7528d9262f@6wind.com>
Date: Tue, 16 May 2017 09:40:40 +0200
MIME-Version: 1.0
In-Reply-To: <1494911703-16619-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Le 16/05/2017 à 07:15, Masahiro Yamada a écrit :
> Since commit 61562f981e92 ("uapi: export all arch specifics
> directories"), "make INSTALL_HDR_PATH=$root/usr headers_install"
> deletes standard glibc headers and others in $root/usr/include.
> 
> The cause of the issue is that headers_install now starts descending
> from arch/$(hdr-arch)/include/uapi with $root/usr/include for its
> destination when installing asm headers.  So, headers already there
> are assumed to be unwanted.
> 
> When headers_install starts descending from include/uapi with
> $root/usr/include for its destination, it works around the problem
> by creating an dummy destination $root/usr/include/uapi, but this
> is tricky.
> 
> To fix the problem in a clean way is to skip headers install/check
> in include/uapi or arch/$(hdr-arch)/include/uapi because we know
> there are only sub-directories in uapi directories.  A good side
> effect is the empty destination $root/usr/include/uapi will go
> away.
> 
> I am also removing the trailing slash in the headers_check target to
> skip checking in arch/$(hdr-arch)/include/uapi.
> 
> Fixes: 61562f981e92 ("uapi: export all arch specifics directories")
> Reported-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Thank you for the patch.

Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
