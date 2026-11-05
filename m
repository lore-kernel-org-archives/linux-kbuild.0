Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862000;
	b=uUYfHrL6uzdyGF8hBE5c5mDYrUINhlDFLh6oqNpbylq6JRf17CWKFvCZ9CNWnBv1OKJq
	 mxcXyC6LEm1jO78SsWfc7ZLhe0UXTqKVjfeGIIxesHUtPLQst+bfj+RN9a8dhIpfSslaJ
	 HljQ7HTdT1hugnIlu2bpB3LOPQN2FSC9l0z6e6cLqdMle99L8ZkKGxH6JIbYGHVqdxOQr
	 ZxSCn9OzLlPrtCeF71cCNTvB7Md5oCEXxgNB5ajWw4DH7GGt+hXm+HgmcfsnXO4IuUFfn
	 1F7QZuQgjD0XpXKtexnI1SMCz/CsLrm7/H/7sL/IMpiLDBRS3Ggm1TY/2TgZRKMpnWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862000;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=r2qtzyy761sLiU5KHA76CZlvTDcDPHslg+OCTxEOUQw=;
	b=udefJeDdFlzjPkGjJXqaYPaFMxyCJ3NYGc+oHMpDGffbvwXDfSCAOF8Lmot4EnwfMBWn
	 aVqmoUA5T+ynB6QEYEqtrCDb8jMzBsVDv1bcwMf+5o9L9ohLPMjsAIzYlUIRHFaKz5QaB
	 k8zUGVyTaqINNjzcS5B/KIAWkcg1mXfRmUOmVPHnCj4PueDZVI3wXaH4WMyWF+5t3L24H
	 b+gkoJ6PC/MVir97kkvB9DNZFTqf5YQ6pkhRwc+u/ZUgfhcX9aidClMzAk8uOcp4SAIWJ
	 a09Po+Ga3k3Wqrr2xm2pwaBOlSGVdE2ii40jWoiXtWEQoyPlM4Zh8TFXLyyABDmgkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hf2JXnlY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8E606A32D;
	Thu,  5 Nov 2026 07:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hf2JXnlY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6441F00919;
	Thu,  5 Nov 2026 06:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793862000;
	bh=r2qtzyy761sLiU5KHA76CZlvTDcDPHslg+OCTxEOUQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hf2JXnlYMWPJiRzSistAqfF+8ednVhu3haTR0bU19rkAAURGjh8eO1hnMTTxO+ZLi
	 Q62U638Did8BRrxaYS1ZicBrVANh2OCWyABNp9OqAwSWxyU55Bjj2uM1sd6EEyQiXG
	 cwh1XkjiEbW8XSJC3K1glzcaYX2WCKHhVDohVxnEZW0oNghlHEmjKRCwv6Zg4Y6fES
	 uIrCaZmLG8V81uS6OSbhKkINz7AHn4GcMtz/48AqXntoNzY0ccRHYdjmbD0aUdI8dQ
	 MHKHeUFZnfUfiE0QaafyzdQ008Jladefy08iwRDvwwHebTZyvRS4Z/gpeN3+u5gKI3
	 y7Rjs0OrcE3iQ==
Date: Thu, 5 Nov 2026 07:58:45 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Matthew Weber <matthew.l.weber@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH 2/4] scripts: Add kernel-sloc helper script
Message-ID: <auwpJUhQ6VSz7y65@derry.ads.avm.de>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Matthew Weber <matthew.l.weber@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com
References: <20261103150845.13008-1-matthew.l.weber@gmail.com>
 <20261103150845.13008-3-matthew.l.weber@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103150845.13008-3-matthew.l.weber@gmail.com>

On Tue, Nov 03, 2026 at 09:08:43AM -0600, Matthew Weber wrote:
> Add a helper script scripts/kernel-sloc to count source lines of code
> (SLOC) for a configured Linux kernel build. It supports counting whole
> compiled sources from compile_commands.json as well as estimating
> distinct source lines represented in a vmlinux ELF using DWARF
> line-table addresses.
> 
> It is intended for system integrators and application developers who
> analyze a trimmed kernel, for example for safety critical applications,
> and need to report how much kernel code a given configuration builds
> and links. Add a MAINTAINERS entry for the script.
> 
> Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
> ---
>  MAINTAINERS         |   6 +
>  scripts/kernel-sloc | 299 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 305 insertions(+)
>  create mode 100755 scripts/kernel-sloc
> 

Thanks for your patches.

Disclaimer: I did not really look into your patch set yet, but let me
note some major formal things ahead:

Something got heavily wrong with the patch set mails: while it looks
like this patch is number 2 from a series of 4 patches, the other
patches sent in the series are not numbered correctly.  Patch management
tooling (b4) even recognises this patch set as three different versions
of a patch set, thus reviewers/maintainers cannot use that here.
Usually, 'git send-email' takes care of that in a very proper way.  Did
you sent your patches one-by-one in some manual way?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d009e2da2..d83f37c3a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13762,6 +13762,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
>  F:	Documentation/dev-tools/kselftest*
>  F:	tools/testing/selftests/
>  
> +KERNEL SLOC HELPER
> +M:	Matthew Weber <matthew.l.weber@gmail.com>
> +L:	linux-kbuild@vger.kernel.org
> +S:	Maintained
> +F:	scripts/kernel-sloc

If 'kernel-sloc' is accepted, we will have to put it to scripts/contrib/,
as 'kernel-sloc' is not part of the Linux build.  'scripts/contrib/'
does not exist yet, but we are urged to stop mixing build-related
scripts with non-build-related ones in scripts/.


> +
>  KERNEL SMB3 SERVER (KSMBD)
>  M:	Namjae Jeon <linkinjeon@kernel.org>
>  M:	Namjae Jeon <linkinjeon@samba.org>
> diff --git a/scripts/kernel-sloc b/scripts/kernel-sloc
> new file mode 100755
> index 000000000..ed8b787e5
> --- /dev/null
> +++ b/scripts/kernel-sloc
> @@ -0,0 +1,299 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: BSD-3-Clause

Almost all files below scripts/ are licensed under GPL.  Please consider
to switch to some GPL licensing or dual-license for consistency.

> +#
> +# kernel-sloc - Count source lines of code for a configured kernel build.
> +#
> +# Adapted from the Unikraft build-time SLOC reporting approach
> +# (https://github.com/orgs/unikraft/discussions/1849#discussioncomment-19352529),
> +# which counts compiled sources rather than the whole source tree.
> +#
> +# The kernel mode counts whole compiled files, including inactive #if branches,
> +# but not the headers they include. The dwarf mode estimates source lines
> +# represented by debug information in a linked ELF; it does not measure runtime
> +# coverage. Neither count is a certification or structural-coverage result.
> +
> +set -eu
> +
> +die() {
> +	echo "ERROR: $*" >&2
> +	exit 1
> +}
> +
> +need_command() {
> +	command -v "$1" >/dev/null 2>&1 || die "required command not found: $1"
> +}
> +
> +need_cloc() {
> +	command -v cloc >/dev/null 2>&1 ||
> +		die "required command not found: cloc (install cloc to use kernel, tree, or files mode)"
> +}
> +
> +usage() {
> +	printf 'Usage: %s [--report JSON_FILE] MODE TARGET...\n' "$0"
> +	printf '%s\n' \
> +		'  kernel BUILD_DIR  Count whole compiled sources from compile_commands.json.' \
> +		'                    Requires cloc and python3. Generate the database after' \
> +		'                    a clean build of the configuration being measured.' \
> +		'  dwarf ELF         Estimate distinct source lines using DWARF addresses.' \
> +		'                    Requires GNU objdump, addr2line, and python3, plus' \
> +		'                    an ELF built with debug information (CONFIG_DEBUG_INFO).' \
> +		'                    Set OBJDUMP and ADDR2LINE for cross builds, or set' \
> +		'                    CROSS_COMPILE to the toolchain prefix.' \
> +		'  tree DIR          Count all C, C++, and header sources; requires cloc.' \
> +		'  files FILE...     Count individual source files; requires cloc.' \
> +		'  --report FILE     JSON inventory for kernel or dwarf; parent must exist.' \
> +		'                    Lists compiled files, or DWARF source_lines and functions.' \
> +		'                    Does not measure execution or list every linked symbol.' \
> +		'  -h, --help        Show this help and exit successfully.' \
> +		'' \
> +		'Success prints one integer on stdout and a summary on stderr.' \
> +		'Errors exit non-zero without printing a count.' \
> +		'Counts depend on the tool versions and build options; record both.' \
> +		'' \
> +		'Examples:'
> +	printf '  %s --report compiled.json kernel .\n' "$0"
> +	printf '  %s --report linked.json dwarf vmlinux\n' "$0"
> +	printf '  %s files foo.c\n' "$0"
> +	printf '  %s tree /path/to/files\n' "$0"
> +	printf '%s\n' \
> +		'files omits linked libc; tree includes unused C/C++/headers, not other' \
> +		'languages. Neither is a deployed-footprint total.'

bike-shedding:

cat <<-eof
...
eof

might be valuable alternative to all those 'printf' calls.

> +}
> +
> +# Extract the code total from cloc CSV, including the empty-tree case.
> +cloc_sum() {
> +	awk -F',' '$2 == "SUM" {total = $5} END {print total + 0}'
> +}
> +
> +cloc_sum_from_list() {
> +	cloc --list-file="$1" --skip-uniqueness --csv --quiet >"$2" ||
> +		die "cloc failed while counting source files"
> +	cloc_sum <"$2"
> +}
> +
> +# Write the report before printing the count; failed writes are not success.
> +write_report() {
> +	[ -n "$report" ] || return 0
> +	python3 - "$report" "$mode" "$target" "$1" "$2" <<'PYREPORT'

Please do not embedd more than a handful of Python code lines in a shell
script.  Common Python linting is simplier in a pure Python script.  And
if Python is needed for the task, why is it wrapped in shell instead of
implementing the whole thing in Python?

I'd like to read your reply before reviewing this any further.

Kind regards,
Nicolas
