Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44852 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab0LOGWm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:22:42 -0500
Received: by iyi12 with SMTP id 12so710451iyi.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:22:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
References: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:22:42 -0500
Message-ID: <AANLkTikGTke732aQAqXRxr7UCQJFqdrMfx30Kvs2Xabt@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: make hexadecimal prefix mandatory for S_HEX
 default value
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:29 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/symbol.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>
ping ?

[I do not really care about that one, but still... The next patch does
not address ~100 other warnings potentially triggered in arch/
Kconfig.]

 - Arnaud


> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index af6e9f3..ad7dbe7 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -548,8 +548,10 @@ bool sym_string_valid(struct symbol *sym, const char *str)
>                }
>                return true;
>        case S_HEX:
> -               if (str[0] == '0' && (str[1] == 'x' || str[1] == 'X'))
> -                       str += 2;
> +               if (str[0] != '\0' &&
> +                   !(str[0] == '0' && (str[1] == 'x' || str[1] == 'X')))
> +                       return false;
> +               str += 2;
>                ch = *str++;
>                do {
>                        if (!isxdigit(ch))
> --
> 1.7.2.30.gc37d7.dirty
>
>
