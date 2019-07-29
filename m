Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42505 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfG2Qpu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 12:45:50 -0400
Received: by mail-pl1-f196.google.com with SMTP id ay6so27766280plb.9
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2019 09:45:50 -0700 (PDT)
Date: Mon, 29 Jul 2019 09:45:45 -0700
From: Tom Roeder <tmroeder@google.com>
Subject: Re: [PATCH] gen_compile_commands: lower the entry count threshold
Message-ID: <20190729164545.GA200478@google.com>
References: <20190727030110.17208-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190727030110.17208-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org

On Sat, Jul 27, 2019 at 12:01:10PM +0900, Masahiro Yamada wrote:
> Running gen_compile_commands.py after building with allnoconfig
> gave this:
> 
> $ ./scripts/gen_compile_commands.py
> WARNING: Found 449 entries. Have you compiled the kernel?

Thanks for catching this! I should have tried with allnoconfig when I
originally did this, but I didn't think of it.

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Tom Roeder <tmroeder@google.com>

> ---
> 
>  scripts/gen_compile_commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 7915823b92a5..c458696ef3a7 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -21,9 +21,9 @@ _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
>  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  
>  # A kernel build generally has over 2000 entries in its compile_commands.json
> -# database. If this code finds 500 or fewer, then warn the user that they might
> +# database. If this code finds 300 or fewer, then warn the user that they might
>  # not have all the .cmd files, and they might need to compile the kernel.
> -_LOW_COUNT_THRESHOLD = 500
> +_LOW_COUNT_THRESHOLD = 300
>  
>  
>  def parse_arguments():
> -- 
> 2.17.1
> 
