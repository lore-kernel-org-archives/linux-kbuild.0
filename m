Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810E3F1ACE
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Oct 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296642; cv=none; b=FC9YHfj52tMq4fqwYOlg/0TtJ/SaYvkiWoWnQjw9IrGALNzeZ4SJba7nR1E1JbdSx+e/+eA+FyIPYjXW+FtLdbzbsOX9atW7zK+gTXV4qlja7vjw1UOV0FntTfAs3YlFbxwixKr5SeWVvvx/smf55cBWkXtNE2FbvgoPe1TEk1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296642; c=relaxed/simple;
	bh=An+MCDhgc3sfLbMAePUDyErCiH8tMghywbVBAwvS8qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1XPsaLJXgOFHiu4ungx/A1ljlxWXAYl1lMRgjkdWYMhT5TbDR2zmXBVrU5m2CftDmv/qUxgoTDSMIvxk8VfjwszwjPnAWaFM5CHGseFrATj1bqyvsSUdNj+F7r8gnAXqzzfhQQv8mdUpgtzzFYWI4RiqeLd6mutDnOZKPI+LdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUWYGicH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUWYGicH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so8441395e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Oct 2026 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791296639; x=1791901439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwCJGLidE7F0BvbzMmwayW0fAmkGxcdA0QvtRqy2mgk=;
        b=VUWYGicH8Nu9gpueMNfwGwfUF7JReaUyIUpvel4OKuoINAmKmEt7qrjU7qbB2jY44Z
         agHYJ4iei+GzBTn/zgsP4u3iWRaooYiF6lh2J67fhw3KYJ1Kb2ztoC17owSEQMBJelJ8
         E6AYBAqQwM0H+dOxV5H24TvDme1uMJ0Xi2kKuD4xaEJfL9IrJ0LqgXYlePPK8vWko5XI
         iLNfic7WnDRDXuU4y0M93ahbH2jFx7sPWl2lXcFiobOnjUgNQ5RYCgDw8ssbRDHsUnZf
         UoZmr3svlnogVfh2sI0GKrzqmpv/8mqnjjLENt8Yx0vpKjP/+lGK6Wl5omFU/MQBNePO
         hTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296639; x=1791901439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwCJGLidE7F0BvbzMmwayW0fAmkGxcdA0QvtRqy2mgk=;
        b=MRjThJeIAEoS2huGx9EKRo/gMt+SKi1F29GNloKMv6oiZE4V2tFdDC+L40IjWaIFwl
         fHH19nlDsudwipskz/0Jx0dqAueOymh7RjnLFfNN5GhfgIjz2n1wfAVnuzPDxCpotbrA
         AgaPMTC8v9B3SbejnFLedG+i4VPfDmOp4vbwJhabLEzwypJrJk630Uh9TzHqAV6Ge81c
         nWHkcdADIzjjv12U9ljA32gSeKLPBNQ6vYysyyYysZ5a6zaSc0uqPP+AJ66yMMgLCaM5
         8sPayfC9Ju8SCrKv/j8VjFkho8nmNj+jhhrdrktDyuvJ2D5vxtLl7BZF0aTCjsHWjK1T
         wFQA==
X-Forwarded-Encrypted: i=1; AKwUvBzN5NoeB2HG2qyUJp/UPmYk6LSeeSdp3A5YfwJsT/aURHZrtbvSXt2kM4FEmC5goKz8oD6StHvDiME0Tp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvhADieYF+hZqJXXvqfNfqiILVR7QFa0dDhBeoyTvHEa0FUCGO
	OmfCtapODw32FgRg7hkommDDM96h+lQIrW/PstV440tlhKSZk1T9gxUp
X-Gm-Gg: AYBFou2QygHhbQnYDshLp+kL1WFIKGmV5mSg1kg16YXBnE3v3AoasAjq8m0gqHAnW0M
	9yX28rfwJRNBPuN1xrSCphK/T2vx7NuyMAfn+5gLO4uLXVd7UeI9CKXDykiIKfgui9zdHFPXDN6
	FBpML1c4Yiyj+bD/GzaW2hkDF892EIYnnTGJFFNugHpEMo9WwTy0DA2bPsaoKS9oGPLNfRgUPjp
	ln4G+VbOoRQcWATs99Gq+MnfR4wgLcwCnpPkK0xu+XquhSOeKN0rPLhbBhgu71lgO1b1IRLqEld
	L40A3zFHmD+C5w5yUJy8XauUJ7Iv0A5BAmNJbyE8ULtvTT/i5BIq32AGxfukQtY7ws+HwsBGTDs
	2VTfwCuuQL4ao15l/vGFKh8bFOP1TNKB3SmBLMv2J8/NW8uq8ZpEnagbM1TcKpbiDXNaLO1KKE0
	RIBzfBwAYM5UOUPxOSOcjbmqKx9lLag13EuzmlRrjfGRz4FrpHJGsxVIis4Zd6mfdtJI00h++5K
	MEtGpR6eZWlKxwNB7nFqdfR/xnjv0u1gQjIFqgLA8T8WT0/jr3ai0vSd1wQCZfIq+oi+Aw=
X-Received: by 2002:a05:6000:430d:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48c6d19be9amr3340549f8f.41.1791296638649;
        Tue, 06 Oct 2026 07:23:58 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd51:6800:c199:bb10:b06d:d65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6fa42d99sm1890987f8f.46.2026.10.06.07.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:23:58 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v6] scripts/config: honor $KBUILD_OUTPUT by default
Date: Tue,  6 Oct 2026 16:23:37 +0200
Message-ID: <20261006142337.821859-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If $KBUILD_OUTPUT is set, use it by default if --file is not passed.

Fix the issue when the script silently updates a stale .config in
the root directory, while the user expects ${KBUILD_OUTPUT}/.config
to be updated.
Handle properly if the config file is a relative path.

The problem can be worked around with --file, but this is easy to miss,
and is inconsistent with how the Makefile and other tools work
(e.g., scripts/diffconfig).

How to reproduce the issue:
	make mrproper
	export KBUILD_OUTPUT=.out
	make defconfig
	./scripts/config \
	       -e CONFIG_UBSAN
Error reported:
	grep: .config: No such file or directory

How the patch was tested:
	make mrproper
	export KBUILD_OUTPUT=.out
	make defconfig
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config || echo "OK"

Test the basic usage:
	./scripts/config -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --refresh picks up correct config file by using $KBUILD_OUTPUT:
	./scripts/config -d CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "FAIL"
	./scripts/config --refresh -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --file takes precedence over $KBUILD_OUTPUT and a relative
path is handled properly:
	./scripts/config -d CONFIG_UBSAN
	mkdir .out2
	cp .out/.config .out2/.my_config
	grep "CONFIG_UBSAN=y" .out2/.my_config  && echo "FAIL"
	./scripts/config --file .out2/.my_config --refresh \
	       -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" .out2/.my_config && echo "OK"
	ls .out/.out2 && echo "FAIL"
	ls .out/.out && echo "FAIL"

Test --file can accept files with hyphen:
	./scripts/config -d CONFIG_UBSAN
	cp .out/.config -- -my_config
	grep "CONFIG_UBSAN=y" -- -my_config && echo "FAIL"
	./scripts/config  --refresh \
	       -e CONFIG_UBSAN --file -my_config
	grep "CONFIG_UBSAN=y" -- -my_config && echo "OK"

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
v6:
 * Per Nathan Chancellor's suggestions, simplified
 * https://lore.kernel.org/lkml/179121581235.2275809.12565811683284940522.b4-review@b4/
v5:
 * Per Nathan Chancellor's suggestion, improved handling $FN path by
   realpath
 * https://lore.kernel.org/lkml/179097210878.309835.10523307262544578337.b4-review@b4/
 * Documented the new test scenario in the git commit message
v4:
 * Addressed Nicolas Schier's comments - dropped the change how '--refresh'
   is handled
 * Implemented conversion of $FN to the absolute path which helps with
   '--refresh' and relative paths
 * Documented testing steps in the commit message
v3:
 * Added an example in the commit message how to reproduce the issue
v2:
 * Addressed comments by sashiko:
   * https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
   * use basename when --refresh is used
   * remove echo which can be misleading when --file is passed
v1:
 * https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
---
 scripts/config | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..d1d59d5fece6 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,13 +130,23 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+
+if [ -n "$KBUILD_OUTPUT" ]; then
+	if [ ! -d "$KBUILD_OUTPUT" ]; then
+		echo "KBUILD_OUTPUT is set but does not exist or is not a " >&2
+		echo "directory. Create it before running $myname." >&2
+		exit 1
+	fi
+	FN=$(realpath -- "$KBUILD_OUTPUT")/"$FN"
+fi
+
 CMDS=()
 while [[ $# -gt 0 ]]; do
 	if [ "$1" = "--file" ]; then
 		if [ "$2" = "" ]; then
 			usage
 		fi
-		FN="$2"
+		FN=$(realpath -q -- "$2" || printf -- "%s\n" "$2")
 		shift 2
 	else
 		CMDS+=("$1")
@@ -144,6 +154,7 @@ while [[ $# -gt 0 ]]; do
 	fi
 done
 
+
 set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
 	usage
@@ -200,7 +211,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--state|-s)
-		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
+		if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
 			echo n
 		else
 			V="$(grep "^${CONFIG_}$ARG=" $FN)"
@@ -229,7 +240,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--refresh)
-		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		yes "" | make oldconfig KCONFIG_CONFIG="$FN"
 		;;
 
 	*)
-- 
2.55.0

