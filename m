Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45700 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgF1CRW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 22:17:22 -0400
MIME-Version: 1.0
References: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
In-Reply-To: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jun 2020 11:16:13 +0900
Message-ID: <CAK7LNASD4ha4AGSPY4=mALo4JY0WfSLTrmJBUPeiH8yWjSsO=Q@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: fix ReST formatting
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dov Murik <dovmurik@linux.vnet.ibm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Jun 22, 2020 at 9:44 PM Dov Murik <dovmurik@linux.vnet.ibm.com> wrote:
>
> Commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename to
> *.rst") missed a ReST header and a verbatim file content area.
>
> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> ---

Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/modules.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index a45cccff467d..85ccc878895e 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -182,7 +182,8 @@ module 8123.ko, which is built from the following files::
>         8123_pci.c
>         8123_bin.o_shipped      <= Binary blob
>
> ---- 3.1 Shared Makefile
> +3.1 Shared Makefile
> +-------------------
>
>         An external module always includes a wrapper makefile that
>         supports building the module using "make" with no arguments.
> @@ -470,9 +471,9 @@ build.
>
>         The syntax of the Module.symvers file is::
>
> -       <CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
> +               <CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
>
> -       0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
> +               0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
>
>         The fields are separated by tabs and values may be empty (e.g.
>         if no namespace is defined for an exported symbol).
>
> base-commit: b103c607654e55dcb1da40557628a2044b72c936
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
