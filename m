Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:45580 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753169AbdJQRy4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 13:54:56 -0400
Subject: Re: [PATCH] Makefile: add targets for config-help and pkg-help
References: <20171017151848.3087-1-shuahkh@osg.samsung.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d531c247-4181-8397-4bd7-a07304aabc26@infradead.org>
Date: Tue, 17 Oct 2017 10:54:51 -0700
MIME-Version: 1.0
In-Reply-To: <20171017151848.3087-1-shuahkh@osg.samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, yamada.masahiro@socionext.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

On 10/17/17 08:18, Shuah Khan wrote:
> Change to enable config help and package help from the main make level
> to make it easier to use. It has become difficult to find config help
> and pkg help specific output from the "help" information.
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 46bfb0ed2257..1d6f86df1b6c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1441,6 +1441,13 @@ help:
>  	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
>  	@echo  'For further info see the ./README file'
>  
> +PHONY += config-help
> +config-help:
> +	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
> +
> +PHONY += pkg-help
> +pkg-help:
> +	@$(MAKE) $(build)=$(package-dir) help
>  
>  help-board-dirs := $(addprefix help-,$(board-dirs))
>  
> 

Hi,

It now looks like we need these help sub-options listed somewhere,
like the patch below.



Also, it would be very nice if we could use 'make <some>help' without
running 'make silentoldconfig' and/or expecting a .config file to be present.
As it is, we get all of this noise before seeing the config-help:
(but this is a separate issue IMO)


rdunlap@midway:lnx-414-rc5> make ARCH=um O=UM64 config-help
make[1]: Entering directory '/local/lnx/kernel/lnx-414-rc5/UM64'
  GEN     ./Makefile
scripts/kconfig/conf  --silentoldconfig arch/x86/um/Kconfig
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
../scripts/kconfig/Makefile:37: recipe for target 'silentoldconfig' failed
make[3]: *** [silentoldconfig] Error 1
../Makefile:547: recipe for target 'silentoldconfig' failed
make[2]: *** [silentoldconfig] Error 2
  config	  - Update current config utilising a line-oriented program
  nconfig         - Update current config utilising a ncurses menu based
                    program



For your patch:
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

If you want to, you can fold the patch below into your patch.

---
From: Randy Dunlap <rdunlap@infradead.org>

Add info on "make help" sub-targets "make config-help" and
"make pkg-help".

References to "make dochelp" and "make kselftest-help" etc. can also
be added.

Or a few lines could be added to the end of the "make help" output,
but I think that it is too long already.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Makefile |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-414-rc5.orig/Makefile
+++ lnx-414-rc5/Makefile
@@ -1359,7 +1359,7 @@ help:
 	@echo  '  mrproper	  - Remove all generated files + config + various backup files'
 	@echo  '  distclean	  - mrproper + remove editor backup and patch files'
 	@echo  ''
-	@echo  'Configuration targets:'
+	@echo  'Configuration targets:  (or use "make config-help")'
 	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
 	@echo  ''
 	@echo  'Other generic targets:'
@@ -1406,7 +1406,7 @@ help:
 	@echo '  use "make tools/help"'
 	@echo '  or  "cd tools; make help"'
 	@echo  ''
-	@echo  'Kernel packaging:'
+	@echo  'Kernel packaging:  (or use "make pkg-help")'
 	@$(MAKE) $(build)=$(package-dir) help
 	@echo  ''
 	@echo  'Documentation targets:'


