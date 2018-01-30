Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:44817 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751594AbeA3IDC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 03:03:02 -0500
Received: by mail-oi0-f65.google.com with SMTP id b3so4208253oib.11
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2018 00:03:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180128225651.1134-1-mforney@mforney.org>
References: <20180128225651.1134-1-mforney@mforney.org>
From: Michael Forney <mforney@mforney.org>
Date: Tue, 30 Jan 2018 00:03:01 -0800
Message-ID: <CAGw6cBujSTJC+78JFC=pQXoGQQv2wu7jxdGf9bY7A2sN+WubAQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Improve portability of some sed invocations
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

On 2018-01-28, Michael Forney <mforney@mforney.org> wrote:
> From: Michael Forney <forney@google.com>
>
> * Use BREs where EREs aren't necessary.
> * Pass -E instead of -r to use EREs. This will be standardized in the
>   next POSIX revision[0]. GNU sed supports this since 4.2 (May 2009),
>   and busybox since 1.22.0 (Jan 2014).
> * Use a literal <tab> instead of \t in bracket expressions. In bracket
>   expressions, POSIX says that <backslash> loses its special meaning, so
>   a conforming implementation cannot expand \t to <tab>[1].
> * In BREs, use interval expressions (\{n,m\}) instead of non-standard
>   features like \+ and \?.
> * Use a loop instead of -s flag.
>
> There are still plenty of other cases of non-standard sed invocations
> (use of ERE features in BREs, in-place editing), but this fixes some
> core ones.
>
> [0] http://austingroupbugs.net/view.php?id=528
> [1]
> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html#tag_09_03_05

Forgot to add

Signed-off-by: Michael Forney <forney@google.com>

> ---
>  scripts/Kbuild.include        |  2 +-
>  scripts/Makefile.build        |  2 +-
>  scripts/adjust_autoksyms.sh   |  4 +++-
>  scripts/gen_initramfs_list.sh |  2 +-
>  scripts/headers_install.sh    | 10 +++++-----
>  5 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 065324a8046f..34cbd81024b0 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -368,7 +368,7 @@ ksym_dep_filter =
>                     \
>  	    $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;        \
>  	  boot*|build*|cpp_its_S|*cpp_lds_S|dtc|host*|vdso*) : ;;            \
>  	  *) echo "Don't know how to preprocess $(1)" >&2; false ;;          \
> -	esac | tr ";" "\n" | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
> +	esac | tr ";" "\n" | sed -n 's/^.*=== __KSYM_\(.*\) ===.*$$/KSYM_\1/p'
>
>  cmd_and_fixdep =
>  \
>  	$(echo-cmd) $(cmd_$(1));                                             \
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index cb8997ed0149..524000a4ccda 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -300,7 +300,7 @@ endef
>
>  # List module undefined symbols (or empty line if not enabled)
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> -cmd_undef_syms = $(NM) $@ | sed -n 's/^ \+U //p' | xargs echo
> +cmd_undef_syms = $(NM) $@ | sed -n 's/^  *U //p' | xargs echo
>  else
>  cmd_undef_syms = echo
>  endif
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 513da1a4a2da..a162258ab606 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -60,7 +60,9 @@ cat > "$new_ksyms_file" << EOT
>
>  EOT
>  [ "$(ls -A "$MODVERDIR")" ] &&
> -sed -ns -e '3{s/ /\n/g;/^$/!p;}' "$MODVERDIR"/*.mod | sort -u |
> +for mod in "$MODVERDIR"/*.mod; do
> +	sed -n -e '3{s/ /\n/g;/^$/!p;}' "$mod"
> +done | sort -u |
>  while read sym; do
>  	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
>  		sym="${sym#_}"
> diff --git a/scripts/gen_initramfs_list.sh b/scripts/gen_initramfs_list.sh
> index 86a3c0e5cfbc..10e528b3a08f 100755
> --- a/scripts/gen_initramfs_list.sh
> +++ b/scripts/gen_initramfs_list.sh
> @@ -194,7 +194,7 @@ input_file() {
>  	source="$1"
>  	if [ -f "$1" ]; then
>  		${dep_list}header "$1"
> -		is_cpio="$(echo "$1" | sed 's/^.*\.cpio\(\..*\)\?/cpio/')"
> +		is_cpio="$(echo "$1" | sed 's/^.*\.cpio\(\..*\)\{0,1\}/cpio/')"
>  		if [ $2 -eq 0 -a ${is_cpio} = "cpio" ]; then
>  			cpio_file=$1
>  			echo "$1" | grep -q '^.*\.cpio\..*' && is_cpio_compressed="compressed"
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index a18bca720995..7328394cf9e8 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -31,13 +31,13 @@ trap 'rm -f "$OUTDIR/$FILE" "$OUTDIR/$FILE.sed"' EXIT
>  for i in "$@"
>  do
>  	FILE="$(basename "$i")"
> -	sed -r \
> -		-e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
> -		-e 's/__attribute_const__([ \t]|$)/\1/g' \
> +	sed -E \
> +		-e 's/([ 	(])(__user|__force|__iomem)[ 	]/\1/g' \
> +		-e 's/__attribute_const__([ 	]|$)/\1/g' \
>  		-e 's@^#include <linux/compiler(|_types).h>@@' \
>  		-e
> 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g'
> \
> -		-e 's/(^|[ \t(])(inline|asm|volatile)([ \t(]|$)/\1__\2__\3/g' \
> -		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @' \
> +		-e 's/(^|[ 	(])(inline|asm|volatile)([ 	(]|$)/\1__\2__\3/g' \
> +		-e 's@#(ifndef|define|endif[ 	]*/[*])[ 	]*_UAPI@#\1 @' \
>  		"$SRCDIR/$i" > "$OUTDIR/$FILE.sed" || exit 1
>  	scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ "$OUTDIR/$FILE.sed" \
>  		> "$OUTDIR/$FILE"
> --
> 2.15.1
>
>
