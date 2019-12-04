Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:40734 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfLDDLP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 22:11:15 -0500
MIME-Version: 1.0
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
In-Reply-To: <20191203094845.610692-1-unixbhaskar@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Dec 2019 12:10:25 +0900
Message-ID: <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> This is new file to show running kernel modules list.One line bash
> script.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/kernel_modules_info.sh | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100755 scripts/kernel_modules_info.sh
>
> diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
> new file mode 100755
> index 000000000000..f005c47a3aa6
> --- /dev/null
> +++ b/scripts/kernel_modules_info.sh
> @@ -0,0 +1,23 @@
> +#!/bin/bash -
> +#SPDX-License-Identifier: GPL-2.0
> +#===============================================================================
> +#
> +#          FILE: kernel_modules_info.sh
> +#
> +#         USAGE: ./kernel_modules_info.sh
> +#
> +#   DESCRIPTION:  Running kernel modules information.
> +#
> +#       OPTIONS: ---
> +#  REQUIREMENTS: awk
> +#          BUGS: ---
> +#         NOTES: ---
> +#        AUTHOR: Bhaskar Chowdhury (https://about.me/unixbhaskar), unixbhaskar@gmail.com
> +#  ORGANIZATION: Independent
> +#       CREATED: 12/03/2019 13:52
> +#      REVISION:  ---
> +#===============================================================================
> +
> +set -o nounset                              # Treat unset variables as an error
> +
> +awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|desc|depends)/'



I want to see a good reason (e.g. useful for other developers) for upstreaming.
This script looks like your custom script, which you can maintain locally.



-- 
Best Regards
Masahiro Yamada
