Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE793A83B1
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Oct 2026 22:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979763; cv=none; b=UnVN5g3fKRjT9coPYWN/oBsBeEgn5IZRyjXRPnLgGT09jJWfej+PS69vIEnJ6s8xmgArk81yzKgtxaPp+MIGGg5Gf+uKZuzH+zq+8IRoZcse0Z644oGwmOd1Ep7czHUADGPe7PoEsNcfdR9jd70j7Br7puy2gFnaiHCtme8o9qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979763; c=relaxed/simple;
	bh=ScfvD79sgs2Vat+cL4e4CEoajY40pfZY49jjBwP9WrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giO149WlrK/9OnfFNoSSR26bsIuHz4YjjP5ac7QLUULMjC6tYjNfZ9CBtjFnlBfM+2W9VnqLQcCUPAk4AUFPfY2JNS5kAmzWUJs1MtQ+iswxkCTpvzxPPS98pA33VnJcAmTdZ+VBMK8uBVHEk+qOPijB5XedUEPkpcAnCOktGnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzVn+FXd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzVn+FXd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afe75f055so530259f8f.2
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2026 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790979760; x=1791584560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1p+8K3ZAE2Wd9BveZGzLca0KXy8ZklAi1ODYJChFqOQ=;
        b=PzVn+FXdbVxG8OdfmyHRfFLS/Q/rgVU3NcXvNI89qfsh8RZ6X8xlYKEHHfeuZEd5ET
         AjexCYrrP/LOzh7pkwblvYhippeRxqy6wflQlRIrwuM0D8BlnXqwotkQXSZZq2vKdHKi
         3ODdlV0D8ArsmOAYjwPJbZH6jCbKRldaeaFhYAcsgMOuuGYUqRfqQSkUhZUeSiZ/pVO6
         KdH0cBOcYhy/jtlqjx1rwZARHWOk2iyWlkUe00VT0pyQU/l7hghrVxfMc8r2jkG5kN1O
         ctETsjl64v4/36+ms1OYpXUesX9gcaS6FIuOSyYNb2em/1XpfXVrh4yAdSY5mXoQ61Ru
         BTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790979760; x=1791584560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1p+8K3ZAE2Wd9BveZGzLca0KXy8ZklAi1ODYJChFqOQ=;
        b=Sbx4VwAEK+c9PacAmHWg5wTJVNS2Zw+1eD2h9ZJBCKDvOymXsqj0swZGfGCXbG+xbK
         PnAFVh5BPSm59eooHOwtOz74WFJ8Vjq86HGL0fllb491mtpJPIIXwsq/G3eocrlF0s3z
         bBmIv3Wv1HXBxCN2Hyi0anuIF/xOZRgeiESdJyr10MH5lwigo/k01JjdRzi1zXxADHLQ
         kLtFBMoiHJRs4LnBdWAroxtDXjV5fKdy3jViNLBrmM5LpEI0WvX10WLD9AVm87aLoOcv
         B2aENENuueDU8E3wAkgRTtjSfZmdB2ySiTCazm46Mc/9z4colJvnqsnfLCPnycLF6yD9
         0zdw==
X-Forwarded-Encrypted: i=1; AKwUvByzZUmuZ2b09VrutwwfUz/sE3yflTk47wchqVX5D6t+Owh/IUISLEzjpNvjujz2msWARx7ZIU7SDWfEbCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVDxlsyWrx6K5F7TOWUrbVWKgwcMzHUBlZ5xo7NysCSzuf4eVx
	n9QveT6OMApFVJ79Sctz4xJfe5i09v7wCD7qlJxOOvN8f9nyrxq2QeBI
X-Gm-Gg: AYBFou2WwwrRiObm4pU5F6TZsagDMrRKSDiovWFTcfY3Jjr1nqYdzPSCZKR4t5Z8Ss2
	PXjra+QNhA1Hwdlyd9TOZGpPAj8BNsx5rJuLnpm+9OPXsYTRp1wgLyOSmIu/n4Tq8rtdI70anNI
	LG5PVup5QZEiZU6YlUlWKjEW+rEVV8eYLtAKGS0+ZE5n6SV0LehVcLwDXQ7wP5uUZI1054dxscK
	aLW/6Nqd6twOFrbhXqVlA+OpovnGVhykyn0ruGuo/W6KhMKAnV+jG7tLQHgek6Y9HMILCXlj/Jw
	gwYNLG6l77JDvu+HAy65vKBRYT/YJJPifeas6fK8UQ6MNqFcv3qaHTcyUFyB37byPnWurC9tU6Z
	Jjsn4mx4VOJYJ9f0YO4nXtQo7c1P3zHoNnx3LXvHP5X4Hou/ahZiJUYNOISbJ3w0DG/khDaqS3l
	iLp8LTwG4p+6zvf2pjctMfid0IqYMlUQhlGc8B2Eck+LyP/en1s1EYLZBZ695cEuhO9audmALCf
	CCndOMwMshjCR1F8LjWgP4YhHUTa9u93HqVLiAQ147cs1lnBb7wP/sc8d22AfZeQbmBBHVWZA==
X-Received: by 2002:a05:6000:471d:b0:488:654b:54d4 with SMTP id ffacd0b85a97d-48c4800c54fmr789838f8f.50.1790979759701;
        Fri, 02 Oct 2026 15:22:39 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd72:9d00:f921:4d9f:368c:5042])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8ab4sm7961657f8f.35.2026.10.02.15.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 15:22:39 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>,
	Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v5] scripts/config: honor $KBUILD_OUTPUT by default
Date: Sat,  3 Oct 2026 00:21:19 +0200
Message-ID: <20261002222119.393508-1-voytikd@gmail.com>
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
	rm .config
	export KBUILD_OUTPUT=.out
	make defconfig
	./scripts/config \
	       -e CONFIG_UBSAN
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
	./scripts/config --refresh -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --file takes precedence over $KBUILD_OUTPUT and a relative
path is handled properly:
	./scripts/config -d CONFIG_UBSAN
	mkdir .out2
	cp .out/.config .out2/.my_config
	grep "CONFIG_UBSAN=y" .out2/.my_config
	./scripts/config --file .out2/.my_config --refresh \
	       -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" .out2/.my_config && echo "OK"
	ls .out/.out2 || echo "OK"
	ls .out/.out || echo "OK"

Test --file can accept files with hyphen:
	./scripts/config -d CONFIG_UBSAN
	cp .out/.config -- -my_config
	grep "CONFIG_UBSAN=y" -- -my_config || echo "OK"
	./scripts/config  --refresh \
	       -e CONFIG_UBSAN --file -my_config
	grep "CONFIG_UBSAN=y" -- -my_config && echo "OK"

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
v5:
 - Per Nathan Chancellor's suggestion, improved handling $FN path by
   realpath
 - https://lore.kernel.org/lkml/179097210878.309835.10523307262544578337.b4-review@b4/
 - Documented the new test scenario in the git commit message
v4:
 - Addressed Nicolas Schier's comments - dropped the change how '--refresh'
   is handled
 - Implemented conversion of $FN to the absolute path which helps with
   '--refresh' and relative paths
 - Documented testing steps in the commit message
v3:
 - Added an example in the commit message how to reproduce the issue
v2:
 - Addressed comments by sashiko:
   - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
   - use basename when --refresh is used
   - remove echo which can be misleading when --file is passed
v1:
 - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
---
 scripts/config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..7e84c3d4e621 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,6 +130,10 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+if [ -n "${KBUILD_OUTPUT}" ]; then
+	FN=${KBUILD_OUTPUT}/${FN}
+fi
+
 CMDS=()
 while [[ $# -gt 0 ]]; do
 	if [ "$1" = "--file" ]; then
@@ -143,6 +147,7 @@ while [[ $# -gt 0 ]]; do
 		shift
 	fi
 done
+FN=$(realpath -q -- "$FN" || echo "$FN")
 
 set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
-- 
2.55.0

