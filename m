Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-sn1nam01on0062.outbound.protection.outlook.com ([104.47.32.62]:20992
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750761AbdAWORQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 09:17:16 -0500
Date: Mon, 23 Jan 2017 06:17:09 -0800
From: Vadim Lomovtsev <Vadim.Lomovtsev@caviumnetworks.com>
Subject: Re: [PATCH] scripts: rpm: build: add INSTALL_MOD_STRIP=1 to install
 modules
Message-ID: <20170123141709.GA31673@localhost.localdomain>
References: <1484921558-26181-1-git-send-email-Vadim.Lomovtsev@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1484921558-26181-1-git-send-email-Vadim.Lomovtsev@caviumnetworks.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

On Fri, Jan 20, 2017 at 06:12:38AM -0800, Vadim Lomovtsev wrote:
Please ignore this accordingly to mysypo
> Having kernel modules with debug sections consumes a lot of
> hdd space, increases size of kernel rpm, initrd image grows
> and in some cases kernel even can't be installed due to
> insufficinet hdd space for modules.
first one 'insifficinet'
> 
> Set INSTALL_MOD_STRIP=1 to enable debug info strip at rpm modules
> install phase.
> 
> Signed-off-by: Vadim Lomovtsev <Vadim.Lomovtsev@caviumnetworks.com>
> ---
>  scripts/package/mkspec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index bb43f15..176d8dd 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -90,7 +90,7 @@ echo 'mkdir -p $RPM_BUILD_ROOT/boot $RPM_BUILD_ROOT/lib/modules'
>  echo "%endif"
>  echo 'mkdir -p $RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
>  
> -echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= mod-fw= modules_install'
> +echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} INSTALL_MOD_STRIP=1 BUILD_SRC= mod-fw= modules_install'
occasionally remove 'K' from KBUILD_SRC
>  echo 'INSTALL_FW_PATH=$RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
>  echo 'make INSTALL_FW_PATH=$INSTALL_FW_PATH' firmware_install
>  echo "%ifarch ia64"
> -- 
> 2.5.5
> 

Vadim
