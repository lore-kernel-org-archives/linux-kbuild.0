Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C76286A4
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Oct 2026 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303154; cv=none; b=ppo8DAtad/593bxLYYGF/UAZX5lCPv6/BUyDR357VdZ9oRLqlhTaX4fAhPbi3l3rvcxmrnFm+QuB6suCUPrLkdqFbmovRbcL6oUbbveA4GQOvg+NsYI1etByfnilU/HIzdAjBLdegvNV3uLrzHbFu/M9D73uqbDK4PT/ZQZ4rK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303154; c=relaxed/simple;
	bh=pzKjQW/5wv5ZV9V2mhGX3XNvxdEG4JnLPbjh3QDWwuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0Y8eFLsHBE1Gakm3z6UFhPwzQnqI7t8kbdKblSK3LApw2Zuq+I7lgPzRNeiUm1m3rbl2b0Dk/JjCBGZIpA06R9+om3UvOT5Rz4GBdGTC1AOXznCg5Q78aS4KWbOY2LoIsN/m2m9TMaBjPqLr1cQn5vgeJS3scudMsreISJBzVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMte3Lvf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMte3Lvf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso5438365e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Oct 2026 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791303151; x=1791907951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YK1JCuzca0AjqMNfZi2xFLLH8cZvTcTPq46uhTC4eYw=;
        b=tMte3LvfXkONe7Dlmj11co8kzKVEOBEqgw0gR6Jo/EQJ6Gow9gUuwAMTk0Lj/a+juW
         e3EBNNibrYX68bJYsBEcOgiFTnxoEBy5jjpCdfzgnohdZS1FLscwQAhi4lSAFBZBU2Fc
         oAodKGiJaKmvIlMvh/yTs7XOkoSa0Hyse2waC/xEzyecx2LD7/a8t+LkVU93MxEdHE5a
         YG/qw2669HWuUIrcwRYPSSqbcTMZFIsV7GaCFjCKrkUnkKbQqK5R+j79+H6MdStY2v8d
         SRQwbgVafnZrNoURlD5zTE8YyoHs/kAJY2R+4CatUEzbZza3o24w98hVmWrwrk1P5kgf
         CO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303151; x=1791907951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK1JCuzca0AjqMNfZi2xFLLH8cZvTcTPq46uhTC4eYw=;
        b=cjmILQv6i1qE1m4LTcSB2sDqURVytolwWmKUxVCqtUQrMppbmE6QYWFwz5e621tOHE
         0S1r8rILYG/UGxw3rqDlPCMW26Jn9KqX8sKXINR9bXEo9tZvtSQvh5Nq/4Sw/jslJdLM
         EdwggOiC61OWelaVEmflMHtFnoTSukzVA2iF9U4ksEshfE6oNN++kjQme95V4/TRqi/6
         rpdoHuc03UtzvnaZs3oHQLUfQQBVFsf1I/UtxtOXFtOX/dspuYcJ/Wr6CogSs+vhjWg6
         C9QYDYYnfJqdrw/Pvt/6VN2F9UIYs9v2ceW3lYLkETOTUhjRFV64ywIdXgvi8C1/EoBg
         9jfw==
X-Forwarded-Encrypted: i=1; AKwUvBxtWNTY1ZmigLDz8b1vaq3c5sCMZ2POYzBtAtZcjxOnwwY18opK8sF10Z4J+N/InZD1hdMtaRSYfyjg1Ig=@vger.kernel.org
X-Gm-Message-State: AFuF++l5OZtPAGw3ZXCMTmB933O2UFYw+Whp0PiRS9/gsv4lHer41pQ/
	AsgUtpofqPAy0wfb3xWwbPwLUejjg9SwpTgYj9h5SPuwQdvvL7bWZdKr
X-Gm-Gg: AYBFou3odezy7yF9Znp7PP3oACAaao+pSffXQ72i4KwjCIszsSe9oG61S7LTf0jsNzd
	bZMApimW9bM8B0D8b3ifRshCYIgCiE5nm0zzyHJ2I40dQDEXSfl4PGogpkVgHzKQbuKeE8DkHzJ
	xpKAIQBDk0R16AFhQvkp3HxaPa8vGLf6WxUTapaPDHWmx3ESEhcIfdTCkwy7IJM89QtG/VOPufU
	2nr/dx2uWtdK8WutC7Uty5O89XxIhSGa9WZHKUyjV+qxyin5w3j1S9BkZQNB9/CAP44cuGdXV7X
	BGMYqBzz1UKc7IlCZU+CoUiSVUooYtDYnSMoWPXQE+MGPugkZNC5EsBojjSj0gDyFgB4VGL+S5d
	8HqiG/QEz38uXNXSa8dJe0r4I+vwGf8CFGlxTw9Fe67XyQIodJVc2N4lc0jznSdcfq0lndbU36z
	eW9/cEVhyusBOFTcZ7jm6WcXkRTxAZZ/ohAtKS/LC3Wn3+ygHnPdgfoPy0Gaxk/SoM3GxGkPPRj
	4sX32/lsFaPqyvI7nmb4wNrIvB3a5WTanis/leCExn8GsYRybbwYwyIOBuRIL534Zs4EPJ0hUwY
	ATqZpQ==
X-Received: by 2002:a05:600c:468d:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a17b52d29fmr33481165e9.11.1791303151037;
        Tue, 06 Oct 2026 09:12:31 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd51:6800:c199:bb10:b06d:d65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c49c35sm89242555e9.9.2026.10.06.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:12:29 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v7] scripts/config: honor $KBUILD_OUTPUT by default
Date: Tue,  6 Oct 2026 18:11:55 +0200
Message-ID: <20261006161155.862736-1-voytikd@gmail.com>
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
v7:
 * Adressed https://sashiko.dev/#/patchset/20261006142337.821859-1-voytikd%40gmail.com
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
 scripts/config | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..1e29e449077c 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,13 +130,15 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+
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
@@ -144,6 +146,16 @@ while [[ $# -gt 0 ]]; do
 	fi
 done
 
+# ignore $KBUILD_OUTPUT if "--file" option is present
+if [[ "$FN" == ".config" && -n "$KBUILD_OUTPUT" ]]; then
+	if [[ ! -d "$KBUILD_OUTPUT" ]]; then
+		echo "KBUILD_OUTPUT is set but does not exist or is not a " >&2
+		echo "directory. Create it before running $myname." >&2
+		exit 1
+	fi
+	FN=$(realpath -- "$KBUILD_OUTPUT")/"$FN"
+fi
+
 set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
 	usage
@@ -200,7 +212,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--state|-s)
-		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
+		if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
 			echo n
 		else
 			V="$(grep "^${CONFIG_}$ARG=" $FN)"
@@ -229,7 +241,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--refresh)
-		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		yes "" | make oldconfig KCONFIG_CONFIG="$FN"
 		;;
 
 	*)
-- 
2.55.0

