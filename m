Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33676 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751192AbdFEX6P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jun 2017 19:58:15 -0400
MIME-Version: 1.0
In-Reply-To: <1496663955-8499-1-git-send-email-robert.jarzmik@free.fr>
References: <1496663955-8499-1-git-send-email-robert.jarzmik@free.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Jun 2017 08:58:05 +0900
Message-ID: <CAK7LNASUowYYh16-PuWdqxq1U30hCZZF4_kQeud2VnF3xsiE1Q@mail.gmail.com>
Subject: Re: [PATCH v3] tags: honor COMPILED_SOURCE with apart output directory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Robert,

I wanted you to update the log.

2017-06-05 20:59 GMT+09:00 Robert Jarzmik <robert.jarzmik@free.fr>:
> When the kernel is compiled with an "O=" argument, the object files are
> not necessarily in the source tree, and more probably in another tree.

Always in another tree.

> In this situation, the current used check doesn't work, and
> COMPILED_SOURCE tags is broken with O= builds.
>
> This patch fixes it by looking for object files both in source tree and
> potential destination tree.

only in the destination tree.


> It was verified that in the case of O= usage, the current directory is
> the build tree, ie. the tree referenced by O=xxx, and j is the source
> tree path concatenated with relative path of the object to the source
> tree root, hence the simple expression to compute "k" as the built
> object.

"k" is no longer used in v3.


> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>



I fixed up the git description and applied to linux-kbuild/fixes.
If you see something wrong, please let me know.



-- 
Best Regards
Masahiro Yamada
