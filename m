Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405074AbgFSPl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 11:41:56 -0400
Date: Fri, 19 Jun 2020 08:41:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] Revert "Makefile: install modules.builtin even if
 CONFIG_MODULES=n"
Message-ID: <20200619154154.GA210604@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Douglas Anderson <dianders@chromium.org>, Jonas Karlman <jonas@kwiboo.se>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Sat, Jun 20, 2020 at 12:09:55AM +0900, Masahiro Yamada wrote:
> This reverts commit e0b250b57dcf403529081e5898a9de717f96b76b,
> which broke build systems that need to install files to a certain
> path, but do not set INSTALL_MOD_PATH when invoking 'make install'.
> 
>   $ make INSTALL_PATH=/tmp/destdir install
>   mkdir: cannot create directory ‘/lib/modules/5.8.0-rc1+/’: Permission denied
>   Makefile:1342: recipe for target '_builtin_inst_' failed
>   make: *** [_builtin_inst_] Error 1
> 
> While modules.builtin is useful also for CONFIG_MODULES=n, this change
> in the behavior is quite unexpected. Maybe "make modules_install"
> can install modules.builtin irrespective of CONFIG_MODULES as Jonas
> originally suggested.
> 
> Anyway, that commit should be reverted ASAP.
> 
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v2:
>   - add more commit description
> 
>  Makefile | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 29abe44ada91..9880e911afe3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1336,16 +1336,6 @@ dt_binding_check: scripts_dtc
>  # ---------------------------------------------------------------------------
>  # Modules
>  
> -# install modules.builtin regardless of CONFIG_MODULES
> -PHONY += _builtin_inst_
> -_builtin_inst_:
> -	@mkdir -p $(MODLIB)/
> -	@cp -f modules.builtin $(MODLIB)/
> -	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
> -
> -PHONY += install
> -install: _builtin_inst_
> -
>  ifdef CONFIG_MODULES
>  
>  # By default, build modules as well
> @@ -1389,7 +1379,7 @@ PHONY += modules_install
>  modules_install: _modinst_ _modinst_post
>  
>  PHONY += _modinst_
> -_modinst_: _builtin_inst_
> +_modinst_:
>  	@rm -rf $(MODLIB)/kernel
>  	@rm -f $(MODLIB)/source
>  	@mkdir -p $(MODLIB)/kernel
> @@ -1399,6 +1389,8 @@ _modinst_: _builtin_inst_
>  		ln -s $(CURDIR) $(MODLIB)/build ; \
>  	fi
>  	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
> +	@cp -f modules.builtin $(MODLIB)/
> +	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
>  
>  # This depmod is only for convenience to give the initial
> -- 
> 2.25.1
> 
