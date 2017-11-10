Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:38303 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752405AbdKJK6Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 05:58:24 -0500
Subject: Re: [PATCH 4/4] kbuild: optimize object directory creation for
 incremental build
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-5-git-send-email-yamada.masahiro@socionext.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <83744f82-8800-7c67-df58-e8925c8d50a3@cn.fujitsu.com>
Date: Fri, 10 Nov 2017 18:58:26 +0800
MIME-Version: 1.0
In-Reply-To: <1510242077-8122-5-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>

Masahiro-san

On 11/09/2017 11:41 PM, Masahiro Yamada wrote:
> The previous commit largely optimized the object directory creation.
> We can optimize it more for incremental build.
> 
> There are already *.cmd files in the output directory.  The existing
> *.cmd files have been picked up by $(wildcard ...).  Obviously,
> directories containing them exist too, so we can skip "mkdir -p".
> 
> With this, Kbuild runs almost zero "mkdir -p" in incremental building.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/Makefile.build | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 89ac180..90ea7a5 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -583,8 +583,13 @@ endif
>  ifneq ($(KBUILD_SRC),)
>  # Create directories for object files if directory does not exist
>  obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
> +# If cmd_files exist, their directories apparently exist.  Skip mkdir.
> +exist-dirs := $(sort $(patsubst %/,%, $(dir $(cmd_files))))
> +obj-dirs := $(strip $(filter-out . $(exist-dirs), $(obj-dirs)))

First I am not sure if the dot "." here is necessary, because I guess
kbuild always descend into subdir do recursive make, so, very
$(cmd_files) should have at least 1 level dir.

Second, Assuming that "." probably exists, would it be "./"? because it
is what "dir" function returns.

-- 
Sincerely,
Cao jin

> +ifneq ($(obj-dirs),)
>  $(shell mkdir -p $(obj-dirs))
>  endif
> +endif
>  




