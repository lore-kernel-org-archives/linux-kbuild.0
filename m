Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from h1446028.stratoserver.net ([85.214.92.142]:42565 "EHLO
	mail.ahsoftware.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751988AbbGRV5K (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Jul 2015 17:57:10 -0400
Message-ID: <55AACBA5.6060602@ahsoftware.de>
Date: Sat, 18 Jul 2015 23:56:53 +0200
From: Alexander Holler <holler@ahsoftware.de>
MIME-Version: 1.0
Subject: Re: [PATCH] modsign: provide option to automatically delete the key
 after modules were installed
References: <1421976009-9819-1-git-send-email-holler@ahsoftware.de>
In-Reply-To: <1421976009-9819-1-git-send-email-holler@ahsoftware.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>

Hello,

besides that calling rm on Linux is just snake oil, the patch below 
still automatically hides the key used to sign modules and offers a 
statistically good chance that the key sometimes might physically 
disappear from the storage used to compile a kernel. So many people 
still might consider it useful. As mentioned below, at least one well 
known person seems to might find it useful too.

Should I rewrite the commit message (e.g. to nothing as the subject 
already describes it perfectly) or is the chance to get such stuff from 
someone outside the holy circles included already zero?

Sorry for asking (that way), but I'm curious if there is really zero 
interest in it.

Regards,

Alexander Holler

Am 23.01.2015 um 02:20 schrieb Alexander Holler:
> I usually throw away (delete) the key used to sign modules after having
> called make -jN (b)zImage modules && make -jN modules_install. Because I've
> got bored to always have to type rm signing_key.* afterwards, I've build
> this patch some time ago.
> As I'm not eager anymore to publish kernel patches, it rested in my private
> chest of patches until I've seen the keynote of Linux.conf.au 2015. It made
> me aware that this patch might have a chance to become included. ;)
>
> Signed-off-by: Alexander Holler <holler@ahsoftware.de>
> ---
>   Makefile     |  7 +++++++
>   init/Kconfig | 12 ++++++++++++
>   2 files changed, 19 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index fb93350..95e07ca 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1129,6 +1129,13 @@ _modinst_:
>   	@cp -f $(objtree)/modules.order $(MODLIB)/
>   	@cp -f $(objtree)/modules.builtin $(MODLIB)/
>   	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
> +ifeq ($(CONFIG_MODULE_SIG_THROW_AWAY), y)
> +	@echo "###"
> +	@echo "### Deleting key used to sign modules."
> +	@echo "###"
> +	@rm ./signing_key.priv
> +	@rm ./signing_key.x509
> +endif
>
>   # This depmod is only for convenience to give the initial
>   # boot a modules.dep even before / is mounted read-write.  However the
> diff --git a/init/Kconfig b/init/Kconfig
> index 9afb971..f29304e 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1884,6 +1884,18 @@ config MODULE_SIG_ALL
>   	  Sign all modules during make modules_install. Without this option,
>   	  modules must be signed manually, using the scripts/sign-file tool.
>
> +config MODULE_SIG_THROW_AWAY
> +	bool "Automatically delete the key after modules were installed"
> +	default n
> +	depends on MODULE_SIG_ALL
> +	help
> +	  Delete the key used to sign modules after modules were installed.
> +	  Be aware of the consequences. The downside is that you  won't be
> +	  able to build any module for a (maybe running) kernel, but will
> +	  have to rebuild the kernel and all modules in order to add or modify
> +	  a module. The upside is that you don't have to secure the key in
> +	  order to keep a running kernel safe from unwanted modules.
> +
>   comment "Do not forget to sign required modules with scripts/sign-file"
>   	depends on MODULE_SIG_FORCE && !MODULE_SIG_ALL
>
>

