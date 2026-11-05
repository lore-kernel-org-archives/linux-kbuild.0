Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842718;
	b=nQU4rWacuJqWFTmtQWNqG+x4mHSWwv+Q8FqgNZxok1nZkYbKvtvBTPZSr9+WbHV++TJM
	 KrAOamSN4rL4VZUvmYw8Yu3PhLhVKNIJ9p+RRpjCXYR0NmApEQsu4nzF2leAv0+fkM5IC
	 T+o9deFh33hdlzhxz0m6SWQ5yRwCdExl6xLDbBCIQOYcuANVtzlspITIgFn4VcvHk08z/
	 dqZUG5cNKQLjAkn0lgOxdC1A41mxKr6jcOB99oTZ9gkacl+e1ph32P1ds3MhvTTVQsc0L
	 Y4FCjBYOL2a+Jh/x3QBn3PDROhmP1JS0ZdHSzJbi5jdC2qVkhFYLd+26uNvfPv9YhxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dp6aJNGB8lo0vS7oBSbCWY8gtENxx6aHpIo+LlsAank=;
	b=OUr6EVeahmiioJDnOxiqEh4hmuluui30Fcgr7ESo0i3EO8rsuqgYM/VV4JskQblGIt69
	 vHN1BQZlEVwnAb2FJWqiViPeXi9burFjYsfFbh8do5V69nbWkFMNv5qeTPz13wj/IpauF
	 Q8rE8hsExZvwNFPKZFMzhvOFoXCr93yNvwg0ELnFJEE0gTS27BPybxPSxtyQ7Ujbmf3CW
	 uzU7znANGjmbPhB4Bc5SfJrpvvQxKureHq/wu67HO1sXkmkk6jeH6wHUkxVEY/aNl7JEj
	 xvimdyNm2M3jbPJC/uD8uzJLHwdLrMTTNgjFlPdWdFdcUsU6EkIj5QqiVX6zB3dFhyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efi82Ty+;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C8606A326
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efi82Ty+
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so710839a91.3
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 17:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842717; x=1794447517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dp6aJNGB8lo0vS7oBSbCWY8gtENxx6aHpIo+LlsAank=;
        b=efi82Ty+2V3AH5prugaxhjchZUon7LbqZjNbja8Xd0vYUGgqBqZkUz3DyAVuEK8c0b
         rghecLUpP01I8Uw14Z/VckQ7V0QhQgrOaMShKYfY5yynzZ1K4vpnZrlZk7SV69hL0sqY
         xzDmOkMo6b15m1asjOPMIdkapUfpgRqXNYf+LkILk7xX0hv/+eq6WsZR7u9nGho7dQfu
         ohiPWv+YxhgYzrmArP8jJldR1yYs0rwdbwTz3bepjyiUyMK3OgSIrROFiDdEtU90bK0E
         FRpBkO84PxITfUSTM0oscvVdDW/Mw33yleALy+tD2gy32AQEygxEsQItwcEFUclOUYsx
         cVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842717; x=1794447517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dp6aJNGB8lo0vS7oBSbCWY8gtENxx6aHpIo+LlsAank=;
        b=VNTj/dMxPDSHlAx9Xys4DJtjCvcwaimvzCgYpKAZ4m2j38c06l/03h+UgaMmbj2V8r
         eGtojW+0H+J3Ch0VYRiGY1kMASNdRUtlisgc+oOU6HWKcNk5NQxgyGGLeEpjREUo2vNC
         XyoVgfnNmjZKGc905ml1eEnlalmlht7DppMvh6pzK6HaLn/e5We2mRA/vMSLP6/C3PiQ
         eiLjDlH8rh6e3LFoXfgLA4+wRf/WgsSEjxoUndUySSj7BCgbLHvr3kDiJVkEFRVg+ClT
         oAOoR/Qus3Aev9lYVcEbPob54kdeArVabcZOJA3EH1t7GVyXQhTp6LSHSWKDFvzw7EBU
         s3DQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ+PHYMmr2JfJqcGVors86jt/E28EnKm1X/jnIKuW0Lhx7O43T+6aDbMZFwiXxCPkvGWwiyin/UAuUwiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qb4NecSbDlbQ10O/Ois5qhQlP5bepLwT0Iv1buHGRszWLG5xb
	9MkAfAFZ+REH7Mkt6lVhITkqWUctxBR/F5kzFcFCtur5h/ZPAyNwiAN2
X-Gm-Gg: AYBFou0G2RekG+UWnJ5Ch17RowpRG4/9k9fPbYCOWr3ya34fyB08XSKYZBLZENPvL43
	Aaor4Pq6PQgEy2miVlZBhdoha9rUeopUcwLeEQfGLYi0NzfaH2e1m8L9kFDAqeOKs0KJoreUCRW
	pVR/iq/jWiefNpVLzwM1a0MY0acHffBvK0AyE4yuqWw3J7nO2qhR8MW5mIjunxQcLJXYQq6YRQ8
	NYcQjsMf2Q8hjbtlwsj+zap4nd6swe+nKQCyqBcGqLcKy6kGEpGwuxEjJqg1o407uXx/+1hWXhk
	4wnRZ0fq89XmycvLsPNXBv4/R58bZhltNv5wQ/GYOw6suu3G1+7IvfBQg68wo5ULeMlAgrsOcJy
	r+bHyqmyH3yRnFighj/sMsZkNMUwR5lwJorub6m4hqEhKM/cT6hE8hov37BOU/W/zkkXtYfeUhN
	z8EveWoYjCtKvixxMJegwth/DiElFo0deRnPRtf1hUI5Y8XxfGa8ffOLBf+zFaptkG0ymnI4GZj
	pzqbhG0IFQz+9QQ/aOwXXgS0zdm71ywWJkz+kkNk6A9FqghcfXcj5ZYB06RNeVvyHVxlOapuSmX
	GhKi3/+IvVQQWLYTjRPuMEodwlKmsGQd75ll
X-Received: by 2002:a17:90b:33c5:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ae89574cf7mr14210936a91.2.1793842717063;
        Wed, 04 Nov 2026 17:38:37 -0800 (PST)
Received: from penguin.lxd ([67.223.127.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm1164975a91.15.2026.11.04.17.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:38:36 -0800 (PST)
From: Matthew Weber <matthew.l.weber@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com,
	Matthew Weber <matthew.l.weber@gmail.com>
Subject: [PATCH v2 2/4] scripts: Add kernel-sloc helper script
Date: Wed,  4 Nov 2026 19:38:21 -0600
Message-Id: <20261105013823.29741-3-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261105013823.29741-1-matthew.l.weber@gmail.com>
References: <20261105013823.29741-1-matthew.l.weber@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper script scripts/kernel-sloc to count source lines of code
(SLOC) for a configured Linux kernel build. It supports counting whole
compiled sources from compile_commands.json as well as estimating
distinct source lines represented in a vmlinux ELF using DWARF
line-table addresses.

It is intended for system integrators and application developers who
analyze a trimmed kernel, for example for safety critical applications,
and need to report how much kernel code a given configuration builds
and links. Add a MAINTAINERS entry for the script.

Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
---
 MAINTAINERS         |   6 +
 scripts/kernel-sloc | 299 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 305 insertions(+)
 create mode 100755 scripts/kernel-sloc

diff --git a/MAINTAINERS b/MAINTAINERS
index d009e2da2..d83f37c3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13762,6 +13762,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
 F:	Documentation/dev-tools/kselftest*
 F:	tools/testing/selftests/
 
+KERNEL SLOC HELPER
+M:	Matthew Weber <matthew.l.weber@gmail.com>
+L:	linux-kbuild@vger.kernel.org
+S:	Maintained
+F:	scripts/kernel-sloc
+
 KERNEL SMB3 SERVER (KSMBD)
 M:	Namjae Jeon <linkinjeon@kernel.org>
 M:	Namjae Jeon <linkinjeon@samba.org>
diff --git a/scripts/kernel-sloc b/scripts/kernel-sloc
new file mode 100755
index 000000000..ed8b787e5
--- /dev/null
+++ b/scripts/kernel-sloc
@@ -0,0 +1,299 @@
+#!/bin/sh
+# SPDX-License-Identifier: BSD-3-Clause
+#
+# kernel-sloc - Count source lines of code for a configured kernel build.
+#
+# Adapted from the Unikraft build-time SLOC reporting approach
+# (https://github.com/orgs/unikraft/discussions/1849#discussioncomment-19352529),
+# which counts compiled sources rather than the whole source tree.
+#
+# The kernel mode counts whole compiled files, including inactive #if branches,
+# but not the headers they include. The dwarf mode estimates source lines
+# represented by debug information in a linked ELF; it does not measure runtime
+# coverage. Neither count is a certification or structural-coverage result.
+
+set -eu
+
+die() {
+	echo "ERROR: $*" >&2
+	exit 1
+}
+
+need_command() {
+	command -v "$1" >/dev/null 2>&1 || die "required command not found: $1"
+}
+
+need_cloc() {
+	command -v cloc >/dev/null 2>&1 ||
+		die "required command not found: cloc (install cloc to use kernel, tree, or files mode)"
+}
+
+usage() {
+	printf 'Usage: %s [--report JSON_FILE] MODE TARGET...\n' "$0"
+	printf '%s\n' \
+		'  kernel BUILD_DIR  Count whole compiled sources from compile_commands.json.' \
+		'                    Requires cloc and python3. Generate the database after' \
+		'                    a clean build of the configuration being measured.' \
+		'  dwarf ELF         Estimate distinct source lines using DWARF addresses.' \
+		'                    Requires GNU objdump, addr2line, and python3, plus' \
+		'                    an ELF built with debug information (CONFIG_DEBUG_INFO).' \
+		'                    Set OBJDUMP and ADDR2LINE for cross builds, or set' \
+		'                    CROSS_COMPILE to the toolchain prefix.' \
+		'  tree DIR          Count all C, C++, and header sources; requires cloc.' \
+		'  files FILE...     Count individual source files; requires cloc.' \
+		'  --report FILE     JSON inventory for kernel or dwarf; parent must exist.' \
+		'                    Lists compiled files, or DWARF source_lines and functions.' \
+		'                    Does not measure execution or list every linked symbol.' \
+		'  -h, --help        Show this help and exit successfully.' \
+		'' \
+		'Success prints one integer on stdout and a summary on stderr.' \
+		'Errors exit non-zero without printing a count.' \
+		'Counts depend on the tool versions and build options; record both.' \
+		'' \
+		'Examples:'
+	printf '  %s --report compiled.json kernel .\n' "$0"
+	printf '  %s --report linked.json dwarf vmlinux\n' "$0"
+	printf '  %s files foo.c\n' "$0"
+	printf '  %s tree /path/to/files\n' "$0"
+	printf '%s\n' \
+		'files omits linked libc; tree includes unused C/C++/headers, not other' \
+		'languages. Neither is a deployed-footprint total.'
+}
+
+# Extract the code total from cloc CSV, including the empty-tree case.
+cloc_sum() {
+	awk -F',' '$2 == "SUM" {total = $5} END {print total + 0}'
+}
+
+cloc_sum_from_list() {
+	cloc --list-file="$1" --skip-uniqueness --csv --quiet >"$2" ||
+		die "cloc failed while counting source files"
+	cloc_sum <"$2"
+}
+
+# Write the report before printing the count; failed writes are not success.
+write_report() {
+	[ -n "$report" ] || return 0
+	python3 - "$report" "$mode" "$target" "$1" "$2" <<'PYREPORT'
+import json
+import os
+import sys
+import tempfile
+
+path, mode, target, count, inventory = sys.argv[1:]
+with open(inventory, encoding="utf-8") as stream:
+    data = ({"files": sorted(stream.read().splitlines())} if mode == "kernel"
+            else json.load(stream))
+data.update(mode=mode, target=os.path.abspath(target), sloc=int(count))
+protected = [target] + data["files"]
+if mode == "kernel":
+    protected.append(os.path.join(target, "compile_commands.json"))
+if os.path.realpath(path) in {os.path.realpath(p) for p in protected}:
+    sys.exit("ERROR: report must not overwrite a measured input")
+if os.path.exists(path) and any(os.path.exists(p) and os.path.samefile(path, p)
+                                for p in protected):
+    sys.exit("ERROR: report must not overwrite a measured input")
+temporary = None
+try:
+    with tempfile.NamedTemporaryFile(mode="w", encoding="utf-8",
+                                     dir=os.path.dirname(os.path.abspath(path)),
+                                     delete=False) as output:
+        temporary = output.name
+        json.dump(data, output, indent=2, sort_keys=True)
+        output.write("\n")
+    os.replace(temporary, path)
+except OSError as error:
+    sys.exit(f"ERROR: cannot write report {path}: {error}")
+finally:
+    if temporary and os.path.exists(temporary):
+        os.unlink(temporary)
+PYREPORT
+}
+
+report=""
+if [ "${1:-}" = --report ]; then
+	if [ "$#" -lt 4 ] || [ -z "$2" ]; then
+		usage >&2
+		exit 2
+	fi
+	case "$2" in
+	-*) usage >&2; exit 2 ;;
+	esac
+	report="$2"
+	shift 2
+fi
+case "${1:-}" in
+-h|--help)
+	[ "$#" -eq 1 ] && [ -z "$report" ] || { usage >&2; exit 2; }
+	usage
+	exit 0
+	;;
+kernel|dwarf|tree)
+	[ "$#" -eq 2 ] || { usage >&2; exit 2; }
+	;;
+files)
+	[ "$#" -ge 2 ] || { usage >&2; exit 2; }
+	;;
+*)
+	usage >&2
+	exit 2
+	;;
+esac
+
+mode="$1"
+target="$2"
+if [ -n "$report" ] && [ "$mode" != kernel ] && [ "$mode" != dwarf ]; then
+	die "--report supports only kernel and dwarf modes"
+fi
+
+case "$mode" in
+kernel)
+	need_cloc
+	need_command python3
+	[ -d "$target" ] || die "kernel build dir not found: $target"
+	ccj="$target/compile_commands.json"
+	if [ ! -f "$ccj" ]; then
+		# Use the source-tree generator even for an out-of-tree build.
+		script_dir="$(cd "$(dirname "$0")" && pwd)"
+		gen="$script_dir/clang-tools/gen_compile_commands.py"
+		[ -f "$gen" ] || die "no compile_commands.json or generator (build the kernel first)"
+		echo "generating compile_commands.json ..." >&2
+		python3 "$gen" -d "$target" -o "$ccj" ||
+			die "gen_compile_commands.py failed"
+	fi
+	tmpdir="$(mktemp -d)" || die "cannot create temporary directory"
+	trap 'rm -rf "$tmpdir"' 0
+	trap 'exit 1' HUP INT TERM
+	list="$tmpdir/sources"
+	python3 - "$ccj" >"$list" <<'PY'
+import json
+import os
+import sys
+
+with open(sys.argv[1], encoding="utf-8") as database:
+    commands = json.load(database)
+base = os.path.dirname(os.path.abspath(sys.argv[1]))
+seen = set()
+for entry in commands:
+    source = entry.get("file")
+    if not source:
+        continue
+    directory = os.path.join(base, entry.get("directory", ""))
+    path = os.path.realpath(os.path.join(directory, source))
+    if not os.path.isfile(path):
+        sys.exit(f"ERROR: compiled source not found: {path}")
+    if "\n" in path or "\r" in path:
+        sys.exit("ERROR: source paths must not contain newlines")
+    if path not in seen:
+        seen.add(path)
+        print(path)
+PY
+	[ -s "$list" ] || die "no compiled sources found (build the kernel first)"
+	n="$(cloc_sum_from_list "$list" "$tmpdir/cloc.csv")"
+	write_report "$n" "$list"
+	echo "kernel compiled sources: $(wc -l <"$list") files, ${n} SLOC" >&2
+	echo "$n"
+	;;
+dwarf)
+	[ -f "$target" ] || die "ELF not found: $target (build with debug information)"
+	OBJDUMP="${OBJDUMP:-${CROSS_COMPILE:-}objdump}"
+	# Preserve the prefix when only a conventional OBJDUMP name is overridden.
+	case "$OBJDUMP" in
+	*objdump)
+		ADDR2LINE="${ADDR2LINE:-${OBJDUMP%objdump}addr2line}"
+		;;
+	*)
+		ADDR2LINE="${ADDR2LINE:-${CROSS_COMPILE:-}addr2line}"
+		;;
+	esac
+	need_command "$OBJDUMP"
+	need_command "$ADDR2LINE"
+	need_command python3
+	tmpdir="$(mktemp -d)" || die "cannot create temporary directory"
+	trap 'rm -rf "$tmpdir"' 0
+	trap 'exit 1' HUP INT TERM
+	inventory="$tmpdir/inventory.json"
+	# Resolve full paths before deduplicating line-table addresses.
+	LC_ALL=C "$OBJDUMP" --dwarf=decodedline "$target" >"$tmpdir/decodedline"
+	awk 'NF >= 3 && $2 ~ /^[0-9]+$/ {print $3}' "$tmpdir/decodedline" \
+		>"$tmpdir/addresses"
+	sort -u "$tmpdir/addresses" >"$tmpdir/sorted-addresses"
+	if [ -n "$report" ]; then
+		LC_ALL=C "$ADDR2LINE" -f -e "$target" <"$tmpdir/sorted-addresses" >"$tmpdir/locations"
+	else
+		LC_ALL=C "$ADDR2LINE" -e "$target" <"$tmpdir/sorted-addresses" >"$tmpdir/locations"
+	fi
+	python3 -c '
+import json
+import os
+import re
+import sys
+
+seen = set()
+functions = set()
+rows = iter(sys.stdin)
+for row in rows:
+    function = None
+    if sys.argv[1]:
+        function = row.strip()
+        row = next(rows, None)
+        if row is None:
+            sys.exit("ERROR: incomplete addr2line function/location pair")
+    match = re.fullmatch(r"(.*):([0-9]+)(?: \(discriminator [0-9]+\))?", row.strip())
+    if match and match[1] != "??" and int(match[2]) > 0:
+        file = os.path.normpath(match[1])
+        seen.add((file, int(match[2])))
+        if function and function != "??":
+            functions.add((function, file))
+if sys.argv[1]:
+    with open(sys.argv[2], "w", encoding="utf-8") as output:
+        json.dump({"files": sorted({file for file, line in seen}),
+                   "source_lines": [{"file": file, "line": line}
+                                    for file, line in sorted(seen)],
+                   "functions": [{"name": name, "file": file}
+                                 for name, file in sorted(functions)]}, output)
+print(len(seen))
+' "$report" "$inventory" <"$tmpdir/locations" >"$tmpdir/count"
+	n="$(cat "$tmpdir/count")"
+	[ "$n" -gt 0 ] || die "no DWARF source lines found (build with CONFIG_DEBUG_INFO)"
+	write_report "$n" "$inventory"
+	echo "dwarf distinct source lines (debug-info estimate): ${n}" >&2
+	echo "$n"
+	;;
+tree)
+	need_cloc
+	[ -d "$target" ] || die "source dir not found: $target"
+	tmpfile="$(mktemp)" || die "cannot create temporary file"
+	trap 'rm -f "$tmpfile"' 0
+	trap 'exit 1' HUP INT TERM
+	cloc --include-lang=C,C++,'C/C++ Header' --skip-uniqueness \
+		--csv --quiet "$target" >"$tmpfile" ||
+		die "cloc failed while counting source tree"
+	n="$(cloc_sum <"$tmpfile")"
+	echo "source tree $target (C/C++ and headers): ${n} SLOC" >&2
+	echo "$n"
+	;;
+files)
+	need_cloc
+	shift
+	newline='
+'
+	carriage_return="$(printf '\r')"
+	for source in "$@"; do
+		[ -f "$source" ] || die "source file not found: $source"
+		case "$source" in
+		*"$newline"*|*"$carriage_return"*)
+			die "source paths must not contain newlines"
+			;;
+		esac
+	done
+	tmpdir="$(mktemp -d)" || die "cannot create temporary directory"
+	trap 'rm -rf "$tmpdir"' 0
+	trap 'exit 1' HUP INT TERM
+	list="$tmpdir/sources"
+	printf '%s\n' "$@" >"$list"
+	n="$(cloc_sum_from_list "$list" "$tmpdir/cloc.csv")"
+	echo "files: $# path(s), ${n} SLOC" >&2
+	echo "$n"
+	;;
+esac
-- 
2.39.5

