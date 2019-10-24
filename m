Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43878 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJXRTv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 13:19:51 -0400
MIME-Version: 1.0
References: <20191008120556.4263-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191008120556.4263-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Oct 2019 02:19:00 +0900
Message-ID: <CAK7LNASzbrE=QZiOqQnV8EpyGpfRhqmGOkCAqdAahdM66crqXA@mail.gmail.com>
Subject: Re: [PATCH 1/5] kheaders: remove unneeded 'cat' command piped to
 'head' / 'tail'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 8, 2019 at 9:06 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The 'head' and 'tail' commands can take a file path directly.
> So, you do not need to run 'cat'.
>
>   cat kernel/kheaders.md5 | head -1
>
> ... is equivalent to:
>
>   head -1 kernel/kheaders.md5
>
> and the latter saves forking one process.
>
> While I was here, I replaced 'head -1' with 'head -n 1'.
>
> I also replaced '==' with '=' since we do not have a good reason to
> use the bashism.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>
>  kernel/gen_kheaders.sh | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index aff79e461fc9..8aa6d3c37ba7 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -41,10 +41,10 @@ obj_files_md5="$(find $dir_list -name "*.h"                    |
>  this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
>  if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
>  if [ -f kernel/kheaders.md5 ] &&
> -       [ "$(cat kernel/kheaders.md5|head -1)" == "$src_files_md5" ] &&
> -       [ "$(cat kernel/kheaders.md5|head -2|tail -1)" == "$obj_files_md5" ] &&
> -       [ "$(cat kernel/kheaders.md5|head -3|tail -1)" == "$this_file_md5" ] &&
> -       [ "$(cat kernel/kheaders.md5|tail -1)" == "$tarfile_md5" ]; then
> +       [ "$(head -n 1 kernel/kheaders.md5)" = "$src_files_md5" ] &&
> +       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$obj_files_md5" ] &&
> +       [ "$(head -n 3 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
> +       [ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
>                 exit
>  fi
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
