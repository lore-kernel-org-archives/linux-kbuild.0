Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42900 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755534AbdLOTG1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 14:06:27 -0500
Date: Fri, 15 Dec 2017 20:06:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] kconfig: use bool instead of boolean for type
 definition attributes, again
Message-ID: <20171215190628.GA16565@kroah.com>
References: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, devel@driverdev.osuosl.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Fleming <matt@codeblueprint.co.uk>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

On Sat, Dec 16, 2017 at 12:38:01AM +0900, Masahiro Yamada wrote:
> Commit 6341e62b212a ("kconfig: use bool instead of boolean for type
> definition attributes") did treewide replacement of 'boolean', and
> also mentioned the keyword 'boolean' would be dropped later on.
> 
> Some years have passed, but it has not happened yet.  Meanwhile, some
> new instances have come up.
> 
> I am really going to drop this keyword.  I need to do the replacement
> once again.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/firmware/efi/Kconfig    | 2 +-
>  drivers/staging/rtlwifi/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
