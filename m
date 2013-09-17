Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm15-vm4.access.bullet.mail.gq1.yahoo.com ([216.39.63.103]:20200
	"EHLO nm15-vm4.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753490Ab3IQXPD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Sep 2013 19:15:03 -0400
From: danielfsantos@att.net
Subject: [PATCH 1/5] scripts: Add mkstrerror.sh
Date: Tue, 17 Sep 2013 18:08:33 -0500
Message-Id: <1379459317-13046-2-git-send-email-daniel.santos@pobox.com>
In-Reply-To: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
References: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>
Cc: Daniel Santos <daniel.santos@pobox.com>

This is a simple bash script that parses our errno*.h files and formats
them into the error_strings.h header that our strerror and strerror_name
functions will use later.

First it looks at $ARCH and examines the errno.h files and figures out
which to use. Then, it parses their error definitions into a
pipe-character delimited table with the fields name, number and
descrption from the comments. Finally, it does some consistency checks
and output them as usable C code.

On my Phenom it takes between 1.2 and 2 seconds to run depending upon
the arch. There are a few arch-specific conditions that the script has
to manage however:
* alpha: EAGAIN is redefined as 35 while EDEADLK is defined as 11
* mips: EDQUOT is 1133, which overlaps the internal error range
  (512-529), so I'm just removing it.

This is done in a little case $ARCH statement in parse_errors().

Signed-off-by: Daniel Santos <daniel.santos@pobox.com>
---
 scripts/mkstrerror.sh | 209 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)
 create mode 100755 scripts/mkstrerror.sh

diff --git a/scripts/mkstrerror.sh b/scripts/mkstrerror.sh
new file mode 100755
index 0000000..e7842fc
--- /dev/null
+++ b/scripts/mkstrerror.sh
@@ -0,0 +1,209 @@
+#!/bin/bash
+
+# Generate lib/error_names.h by parsing errno*.h files
+
+typeset -i first=0
+typeset -i last=0
+typeset -i count=0
+
+die() {
+	echo "ERROR: $*" >&2
+	exit 1
+}
+
+parse_errors() {
+	egrep -h '^#define\s+\w+\s+[0-9]+' "$@" | # Extract error definitions
+	case "${ARCH}" in			  # Apply per-arch fixups
+		alpha)	egrep -v 'EAGAIN\s+11';;
+		mips)	egrep -v 'EDQUOT\s+1133';;
+		*)	cat;;
+	esac |
+	perl -pe '
+		# Replace missing comments with "/* \0 */"
+		s:(\d+)\s*$:$1 /\* \\0 \*/\n:g;
+
+		# Parse into pipe-delimited table
+		s:^#define\s+(\w+)\s+(\w+)\s+/\*\s+(.*?)\s+\*/:$1|$2|$3:g;
+
+		# Since we will be feeding this to printf later, double any
+		# occurrence of %
+		s:%:%%:g;
+	' |
+	sort '-t|' -nk2				  # Sort by error number
+}
+
+tab_align() {
+	typeset -i tabs=$1
+	typeset -i next=0
+	typeset -i i
+	typeset -i len
+	local s
+	shift
+
+	while (($#)); do
+		for (( i = 0; i < next; ++i)); do
+			printf "\t"
+		done
+
+		printf "$1"
+
+		# Get un-escaped string size
+		s=$(printf "$1")
+		(( next = tabs - (${#s} ) / 8 ))
+		shift
+	done
+}
+
+print_errors() {
+	typeset -i next_err=$1
+	typeset -i tabs=$2
+	typeset -i errnum
+	local errname
+	while read; do
+		errnum=${REPLY/*|/}
+		errname=${REPLY/|*/}
+
+		(( next_err <= errnum )) || die "errors out of order :("
+
+		# Fill in any gaps with empty names
+		while (( next_err < errnum )); do
+			printf "\t%s\n" "$(tab_align ${tabs} '"\\0"' "/* ${next_err} */\n")"
+			(( ++next_err ))
+		done
+
+		printf "\t%s\n" "$(tab_align ${tabs} "\"${errname}"'\\0"' "/* ${errnum} */\n")"
+		(( ++next_err ))
+	done
+
+}
+
+count_and_validate() {
+	local names="$1"
+	typeset -i expected_count
+
+	first=$(echo "${names}" | head -1 | awk '{print $3}')
+	last=$(echo "${names}" | tail -1 | awk '{print $3}')
+	count=$(echo "${names}" | wc -l)
+	expected_count=$((last - first + 1))
+
+	if (( count != expected_count )); then
+		echo "ERROR: count = ${count}, expected ${expected_count}"
+		return 1;
+	fi
+	return 0;
+}
+
+find_arch_errno() {
+	for d in $(find arch/${ARCH}/include -name errno.h); do
+		# If it just includes asm-generic/errno.h then skip it
+		if ! grep '#include <asm-generic/errno.h>' $d > /dev/null; then
+			arch_errno="$d"
+			return;
+		fi
+	done
+
+	# Otherwise, no arch-specific errno
+	arch_errno=include/uapi/asm-generic/errno.h
+}
+
+find_arch_errno
+
+base_err_table=$(
+	parse_errors include/uapi/asm-generic/errno-base.h ${arch_errno}
+) || die
+
+internal_err_table=$(
+	parse_errors include/linux/errno.h
+) || die
+
+base_err_names=$(
+	echo "${base_err_table}" |
+	perl -pe 's:(\d+)\|.*:$1:g;'|
+	print_errors 0 4
+) || die
+
+count_and_validate "${base_err_names}" || die
+typeset -i base_err_first=${first}
+typeset -i base_err_last=${last}
+typeset -i base_err_count=${count}
+
+int_err_names=$(
+	echo "${internal_err_table}" |
+	perl -pe 's:(\d+)\|.*:$1:g;'|
+	print_errors 512 4
+) || die
+
+count_and_validate "${int_err_names}" || die
+typeset -i int_err_first=${first}
+typeset -i int_err_last=${last}
+typeset -i int_err_count=${count}
+
+
+cat << asdf
+/* DO NOT EDIT!
+ *
+ * This file is automatically generated by scripts/mkstrerror.sh
+ */
+
+#ifndef _KERNEL_STRERROR_H
+#define _KERNEL_STRERROR_H
+
+#if defined(CONFIG_STRERROR) || defined(CONFIG_STRERROR_NAME)
+
+static const struct error_strings {
+	const unsigned first;
+	const unsigned last;
+	const unsigned count;
+	const char * const desc[2];
+} error_strings[2] = {
+	{
+		.first = ${base_err_first},
+		.last  = ${base_err_last},
+		.count = ${base_err_count},
+		.desc  = {
+#ifdef CONFIG_STRERROR_NAME
+${base_err_names},
+#else
+	NULL,
+#endif /* CONFIG_STRERROR_NAME */
+
+#ifdef CONFIG_STRERROR
+$(
+	echo "${base_err_table}" |
+	perl -pe 's:.*?(\d+)\|(.*):$2|$1:g;'|
+	print_errors 0 7
+),
+#else
+	NULL,
+#endif /* CONFIG_STRERROR */
+		},
+	}, {
+		.first = ${int_err_first},
+		.last  = ${int_err_last},
+		.count = ${int_err_count},
+		.desc  = {
+#ifdef CONFIG_STRERROR_NAME
+${int_err_names},
+#else
+	NULL,
+#endif /* CONFIG_STRERROR_NAME */
+
+
+#ifdef CONFIG_STRERROR
+$(
+	echo "${internal_err_table}" |
+	perl -pe 's:.*?(\d+)\|(.*):$2|$1:g;'|
+	print_errors 512 7
+),
+#else
+	NULL,
+#endif /* CONFIG_STRERROR */
+		},
+	}
+};
+
+#endif /* defined(CONFIG_STRERROR) || defined(CONFIG_STRERROR_NAME) */
+
+#endif /* _KERNEL_STRERROR_H */
+asdf
+
-- 
1.8.1.5

