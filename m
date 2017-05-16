Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36061 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750713AbdEPFDM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 May 2017 01:03:12 -0400
Received: by mail-oi0-f47.google.com with SMTP id h4so11862964oib.3
        for <linux-kbuild@vger.kernel.org>; Mon, 15 May 2017 22:03:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1494909330-24127-1-git-send-email-yamada.masahiro@socionext.com>
References: <1494909330-24127-1-git-send-email-yamada.masahiro@socionext.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 15 May 2017 22:03:11 -0700
Message-ID: <CAPcyv4j_zRJvTkqCgaG9+dEsvvitsz_TZB=bS8eWS+=2mGysXQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: skip header install/check for right under uapi directories
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Michal Marek <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 15, 2017 at 9:35 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Since commit 61562f981e92 ("uapi: export all arch specifics
> directories"), "make INSTALL_HDR_PATH=${root}/usr headers_install"
> deletes standard glibc headers and others in ${root}/usr/include.
>
> The cause of the issue is that headers_install now starts descending
> from arch/$(hdr-arch)/include/uapi with ${root}/usr/include for its
> destination when installing asm headers.  So, headers already there
> are assumed to be unwanted.
>
> When headers_install starts descending from include/uapi with
> ${root}/usr/include for its destination, it works around the problem
> by creating an dummy destination ${root}/usr/include/uapi, but this
> is tricky.
>
> To fix the problem in a clean way is to skip header install/check in
> include/uapi or arch/$(hdr-arch)/include/uapi.  A good side-effect
> is the empty destination ${root}/usr/include/uapi will go away.
>
> Fixes: 61562f981e92 ("uapi: export all arch specifics directories")
> Reported-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Works for me.

Tested-by: Dan Williams <dan.j.williams@intel.com>
