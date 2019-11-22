Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39068 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfKVRjd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Nov 2019 12:39:33 -0500
Received: by mail-pj1-f66.google.com with SMTP id v93so60952pjb.6
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2019 09:39:32 -0800 (PST)
Date: Fri, 22 Nov 2019 09:39:29 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] kbuild: check MODULE_* macros in non-modular code
Message-ID: <201911220934.1CB0F1D9AF@keescook>
References: <20191122081100.27695-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122081100.27695-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Paul Gortmaker <paul.gortmaker@windriver.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org

On Fri, Nov 22, 2019 at 05:11:00PM +0900, Masahiro Yamada wrote:
> Paul Gortmaker sent a lot of patches to remove orphan modular code.
> You can see his contributions by:
> 
>   $ git log --grep='make.* explicitly non-modular'
> 
> To help this work, this commit adds simple shell-script to detect
> MODULE_ tags used in non-modular code.
> 
> It displays suspicious use of MODULE_LICENSE, MODULE_AUTHOR,
> MODULE_DESCRIPTION, etc.
> 
> I was not sure about module_param() or MODULE_PARM_DESC(). A lot of
> non-modular code uses module_param() to prefix the kernel parameter
> with the file name it resides in. If we changed module_param() to
> core_param(), the interface would be broken. MODULE_PARM_DESC() in
> non-modular code could be turned into comments or something, but I
> am not sure. I did not check them.

Right -- this is a very useful mechanism to get "namespace scoped"
boot params and runtime tunables. If we want to separate that from
module code, that's fine, but I'd agree that we should not move users to
core_param().

> 
> I built x86_64_defconfig of v5.4-rc8, and this script detected
> the following:
> 
> [...]
> notice: binfmt_elf: MODULE macros found in non-modular code
> [...]
> notice: compat_binfmt_elf: MODULE macros found in non-modular code

IIUC, looking at binfmt_elf, the fix is the removal of:

- function exit_elf_binfmt()
- use of module_exit()
- use of MODULE_LICENSE

however, module.h needs to remain because of THIS_MODULE usage in
struct linux_binfmt (other binfmts may be modular).

This that a correct evaluation?

> [...]
>  To fix above, check MODULE_LICENSE(), MODULE_AUTHOR(), etc.
>  Please check #include <linux/module.h>, THIS_MODULE, too.
> 
> I confirmed they are all valid.
> 
> Maybe the 'debugfs' is unclear because there are tons of debugfs
> stuff in the source tree. It is talking about MODULE_ALIAS_FS()
> in fs/debugfs/inode.c because fs/debugfs/debugfs.o never becomes
> a module.
> [...]
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This patch looks good but lets clean up what it detects first so we
don't make the build noisy...

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> 
> Changes in v2:
>   - Remove redundant back-slashes after the pipe operator '|'
> 
>  scripts/modules-check.sh | 54 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> index f51f446707b8..7975aa61ddb8 100755
> --- a/scripts/modules-check.sh
> +++ b/scripts/modules-check.sh
> @@ -13,4 +13,58 @@ check_same_name_modules()
>  	done
>  }
>  
> +# Check MODULE_ macros in non-modular code
> +check_orphan_module_macros()
> +{
> +	# modules.builtin.modinfo is created while linking vmlinux.
> +	# It may not exist when you do 'make modules'.
> +	if [ ! -r modules.builtin.modinfo ]; then
> +		return
> +	fi
> +
> +	# modules.builtin lists *real* built-in modules, i.e. controlled by
> +	# tristate CONFIG options, but currently built with =y.
> +	#
> +	# modules.builtin.modinfo is the list of MODULE_ macros compiled
> +	# into vmlinux.
> +	#
> +	# By diff'ing them, users of bogus MODULE_* macros will show up.
> +
> +	# Kbuild replaces ',' and '-' in file names with '_' for use in C.
> +	real_builtin_modules=$(sed -e 's:.*/::' -e 's/\.ko$//' -e 's/,/_/g' \
> +			       -e 's/-/_/g' modules.builtin | sort | uniq)
> +
> +	show_hint=
> +
> +	# Exclude '.paramtype=' and '.param=' to skip checking module_param()
> +	# and MODULE_PARM_DESC().
> +	module_macro_users=$(tr '\0' '\n' < modules.builtin.modinfo |
> +			     sed -e '/\.parmtype=/d' -e '/\.parm=/d' |
> +			     sed -n 's/\..*//p' | sort | uniq)
> +
> +	for m in $module_macro_users
> +	do
> +		warn=1
> +
> +		for n in $real_builtin_modules
> +		do
> +			if [ "$m" = "$n" ]; then
> +				warn=
> +				break
> +			fi
> +		done
> +
> +		if [ -n "$warn" ]; then
> +			echo "notice: $m: MODULE macros found in non-modular code"
> +			show_hint=1
> +		fi
> +	done
> +
> +	if [ -n "$show_hint" ]; then
> +		echo " To fix above, check MODULE_LICENSE(), MODULE_AUTHOR(), etc."
> +		echo " Please check #include <linux/module.h>, THIS_MODULE, too."
> +	fi
> +}
> +
>  check_same_name_modules
> +check_orphan_module_macros
> -- 
> 2.17.1
> 

-- 
Kees Cook
