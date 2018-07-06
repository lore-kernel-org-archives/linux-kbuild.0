Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:49625 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932709AbeGFMcr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 08:32:47 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH v3 05/12] kconfig: make syncconfig update .config regardless of sym_change_count
In-Reply-To: <1530758389-30862-6-git-send-email-yamada.masahiro@socionext.com>
        (Masahiro Yamada's message of "Thu, 5 Jul 2018 11:39:42 +0900")
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
        <1530758389-30862-6-git-send-email-yamada.masahiro@socionext.com>
Date: Fri, 06 Jul 2018 14:23:58 +0200
Message-ID: <ghva9simch.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> syncconfig updates the .config only when sym_change_count > 0, i.e.
> any change in config symbols has been detected.
>
> Not only symbols but also comments are contained in the .config file.
> If only comments are updated, they are not fed back to the .config,
> then the stale comments are left-over.  Of course, this is just a
> matter of comments, but why not fix it.

Hello Masahiro,

I am currently looking at and testing this series.

First: For this patch I would suggest to also edit the syncconfig
       section of "conf --help".

Further, on a slow laptop, I was suspecting, this patch to cause full
rebuilds of everything, each time I ran "make syncconfig" followed by
"make" but could not verify this on another machine, so perhaps I am
just (for testing purposes) removing the wrong files (modules.builtin
for example) -- I am still testing.

But, what irritates me with testing is that (also without your
patches) two consecutive "make" produce different output, one of them
always shows a warning and this is reproducable.  I just want to make
sure there is no other problem that influences my testing:

$ make
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CHK     include/generated/compile.h
  DATAREL arch/x86/boot/compressed/vmlinux
Kernel: arch/x86/boot/bzImage is ready  (#15)
  Building modules, stage 2.
  MODPOST 211 modules

$ make
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CHK     include/generated/compile.h
  LD      arch/x86/boot/compressed/vmlinux
ld: arch/x86/boot/compressed/head_64.o: warning: relocation in read-only section `.head.text'
ld: warning: creating a DT_TEXTREL in object.
  ZOFFSET arch/x86/boot/zoffset.h
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  OBJCOPY arch/x86/boot/vmlinux.bin
  BUILD   arch/x86/boot/bzImage
Setup is 15580 bytes (padded to 15872 bytes).
System is 8069 kB
CRC e01d75ec
Kernel: arch/x86/boot/bzImage is ready  (#15)
  Building modules, stage 2.
  MODPOST 211 modules

Dirk

> I see some scenarios where this happens.
>
> Scenario A:
>
>  1. You have a source tree that has already been configured.
>
>  2. Linus increments the version number in the top-level Makefile
>     (i.e. he commits a new release)
>
>  3. You pull it, and run 'make'
>
>  4. syncconfig is invoked because the environment variable,
>     KERNELVERSION is updated, but the .config is not updated since
>     no config symbol is changed.
>
>  5. The .config file contains a kernel version in the top line:
>
>     # Automatically generated file; DO NOT EDIT.
>     # Linux/arm64 4.18.0-rc2 Kernel Configuration
>
>     ... which points to a previous version.
>
> Scenario B:
>
>  1. You have a source tree that has already been configured.
>
>  2. You upgrade the compiler, but it still has the same version number.
>     This may happen if you regularly build the latest compiler from
>     the source code.
>
>  3. You run 'make'
>
>  4. syncconfig is invoked because the environment variable,
>     CC_VERSION_TEXT is updated, but the .config is not updated since
>     no config symbol is changed.
>
>  5. The .config file contains the version string of the compiler:
>
>     #
>     # Compiler: aarch64-linux-gcc (GCC) 9.0.0 20180628 (experimental)
>     #
>
>     ... which carries the information of the old compiler.
>
> If KCONFIG_NOSILENTUPDATE is set, syncconfig is not allowed to update
> the .config file.  Otherwise, it is fine to update it regardless of
> sym_change_count.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/conf.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 671ff53..5af8991 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -496,6 +496,7 @@ int main(int ac, char **av)
>  	int opt;
>  	const char *name, *defconfig_file = NULL /* gcc uninit */;
>  	struct stat tmpstat;
> +	int no_conf_write = 0;
>  
>  	tty_stdio = isatty(0) && isatty(1);
>  
> @@ -633,13 +634,14 @@ int main(int ac, char **av)
>  	}
>  
>  	if (sync_kconfig) {
> -		if (conf_get_changed()) {
> -			name = getenv("KCONFIG_NOSILENTUPDATE");
> -			if (name && *name) {
> +		name = getenv("KCONFIG_NOSILENTUPDATE");
> +		if (name && *name) {
> +			if (conf_get_changed()) {
>  				fprintf(stderr,
>  					"\n*** The configuration requires explicit update.\n\n");
>  				return 1;
>  			}
> +			no_conf_write = 1;
>  		}
>  	}
>  
> @@ -688,7 +690,7 @@ int main(int ac, char **av)
>  		/* syncconfig is used during the build so we shall update autoconf.
>  		 * All other commands are only used to generate a config.
>  		 */
> -		if (conf_get_changed() && conf_write(NULL)) {
> +		if (!no_conf_write && conf_write(NULL)) {
>  			fprintf(stderr, "\n*** Error during writing of the configuration.\n\n");
>  			exit(1);
>  		}
