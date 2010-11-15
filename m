Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:53852 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932705Ab0KOQ60 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Nov 2010 11:58:26 -0500
Received: by qyk12 with SMTP id 12so3914973qyk.19
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Nov 2010 08:58:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1288844168-21539-1-git-send-email-lacombar@gmail.com>
References: <1288844168-21539-1-git-send-email-lacombar@gmail.com>
Date: Mon, 15 Nov 2010 11:58:25 -0500
Message-ID: <AANLkTinYCfhSKWPER6sbXHL0RDnjCd1MDUduNHDSL_g+@mail.gmail.com>
Subject: Re: [PATCH] kconfig: the day kconfig warns about "select"-abuse has come
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>, catalin.marinas@arm.com

Hi,

On Thu, Nov 4, 2010 at 12:16 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> CC: catalin.marinas@arm.com
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  Documentation/kbuild/kconfig-language.txt |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> index 2fe93ca..5b9b1be 100644
> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -112,7 +112,6 @@ applicable everywhere (see syntax).
>        (no prompts anywhere) and for symbols with no dependencies.
>        That will limit the usefulness but on the other hand avoid
>        the illegal configurations all over.
> -       kconfig should one day warn about such things.
>
>  - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
>   This allows to limit the range of possible input values for int
> --
> 1.7.2.30.gc37d7.dirty
>
>
Ping ?
