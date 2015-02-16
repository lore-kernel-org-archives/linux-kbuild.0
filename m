Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:43814 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751756AbbBPEgT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Feb 2015 23:36:19 -0500
MIME-Version: 1.0
In-Reply-To: <1423479528-27027-1-git-send-email-kumarsharma.r@gmail.com>
References: <1423479528-27027-1-git-send-email-kumarsharma.r@gmail.com>
Date: Mon, 16 Feb 2015 10:06:17 +0530
Message-ID: <CAKXpmjz5bSOV-HHGPnxXF23wOCEbEZpXWVwnUpyk+q6otiSsZw@mail.gmail.com>
Subject: Re: [RFC] kbuild: make it possible to specify the module output dir
From: Kiran Kumar <kumarsharma.r@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Rom Lemarchand <romlem@android.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Android Kernel Team <kernel-team@android.com>, Kiran Raparthy <kumarsharma.r@gmail.com>

On Mon, Feb 9, 2015 at 4:28 PM, Kiran Raparthy <kumarsharma.r@gmail.com> wrote:
> From: Rom Lemarchand <romlem@android.com>
>
> kbuild: make it possible to specify the module output dir
>
> Make modinst_dir user-defined on the command line.
>
> This allows to do things like:
> make MODLIB=output/ modinst_dir=. modules_install
>
> to ensure all the .ko are in the output/ directory.
>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Android Kernel Team <kernel-team@android.com>
> Signed-off-by: Rom Lemarchand <romlem@android.com>
> [Kiran: Added context to commit message]
> Signed-off-by: Kiran Raparthy <kumarsharma.r@gmail.com>
> ---
> This is one of the number of patches from the Android AOSP common.git tree,
> which is used on Android devices. I wanted to submit it for review
> to see if it should go upstream.
Just a gentle reminder.
Regards,
Kiran
>
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index e48a4e9..9b7b280 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -29,7 +29,7 @@ quiet_cmd_modules_install = INSTALL $@
>  INSTALL_MOD_DIR ?= extra
>  ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst %/,%,$(KBUILD_EXTMOD)),,$(@D))
>
> -modinst_dir = $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
> +modinst_dir ?= $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
>
>  $(modules):
>         $(call cmd,modules_install,$(MODLIB)/$(modinst_dir))
> --
> 1.8.2.1
>
