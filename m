Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A23B52EF
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Oct 2026 21:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891232; cv=none; b=HGPj49pWG2RV9iFyvOG+Vr3+73EmwauuUAh9lZ9TFbLmZoMEiY829YD4bKK3K6nT7WULAskcv+YqIqdnh8Oqvlxunt4LHf2N2OUriHEd1S72/BRwIbHEpYzr7hjHTtgbXiughdyCfttJQHZYq/7LNXS46GvgRVhkCmO6xKjmfCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891232; c=relaxed/simple;
	bh=RZsztg3jkiifg3cVjsihK7n6NEl2FN8zMw/g8/qclO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDCZmebS13w2E4UHvHqiOqPbMtB+F5Wwj1oG0RWTHewjvEkF1Kc4K85Pig9rUHZZY7q38UX5P5oqswfNlYThpeDyhexH76IPBO1g7VraXJJ9tRSe+LK0noQTGWxvBnGVz9jq1CnMjzdgSuCwNUHbH3qmohxuCiw/jgp9QfzOGPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxbgX9b4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxbgX9b4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso43800315e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Oct 2026 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790891229; x=1791496029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0A2nj2lNZUIfwGZPfuk0b4oPVUIthHX4d+jYvMnhfU4=;
        b=sxbgX9b4gOrZ2QQE6GE7F+WM0BsidFX1iUyQG92FhpHiCic0/t3bakmJrixjdStm7a
         2T77fawX7obW2XZIZgK4bGf/z8ZQTh5mvOdeXRz5sozIWNrbuf7wqDpWcyI112xXQr7/
         D793FL2QyZ9+JyvEjjp7a5PyKO3/JV1Xtr6dTMDOg9iIcO/7geiysK2rrnjAg5eSgXYL
         nWK1LkBVFKzLc1AwxHaa500ZXewpUq/FYiF9xbDp+CU4RFsPBPDtkQpu67Ex08EIEF0s
         Tv12iC+mjfsn3Wp7b0pXaVBeoIljSy8u8Arlb8MC04gpgwe/7oil6x2Xgl1At+wPjQt8
         AO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790891229; x=1791496029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0A2nj2lNZUIfwGZPfuk0b4oPVUIthHX4d+jYvMnhfU4=;
        b=wyrnOixN9i9ULtD2xwk1DGzzPKfJZng7YQqjx6GNyaJMF1kULSaxZvnnz3LC9NgHx8
         X0Ym+fcPrGNsBB+2o+QOI0ooZm0giYgnKCwDCJGfJSR1TPqUTrdJ+B9/M+TU3W0WT1iQ
         +eMsjX/LjIatX95REswJVH9A1wuFFYy78nut5nDqASIE07t1FF/WJMvcTaW9xTX+euI+
         TzhRz7AMZAcehtTaiU+UO7vdIeXhU1F38jRGeU1l6+o073nEdBWHvcqmCc5NGciZXT7Z
         OFS4kjz5nmXMq3NQmcO3TTAKjg+X6LduO2+GH5XbROR8VUNWLqWguZZv/IsE7/bEOc+X
         rcSw==
X-Forwarded-Encrypted: i=1; AKwUvBz/B1rMCLgSmKUyf+ERuoh9GFVp5U53Nd4T2hvr+A+Bj8eC/6rqPk6svvJvSVZeBZUtmdrXa4DJEbAk5c8=@vger.kernel.org
X-Gm-Message-State: AFuF++lW3cKRN/36swnTUf8y/UYqRnt9FyYTNY08/yNOA2lgfDpHc8Ep
	OLDCecSax93P6Q0k+OpLIMTyNdILPHasygrhvk04aERofFDAdL3kWrWr
X-Gm-Gg: AYBFou34hHcpxrXvz93RdVOPDqBz4W1mBt96wVkSupXCve1ZJLdO7dCwouhqVroNBAU
	/mngwgC/xuh4sIswwG43SdIdGKpk/MlYpQrZoPOasr7yjLVTkIndkFODkfzgXppWkPfpAk0S+my
	RjbjA6G2ARTUE/eZluVB00PX7qWdsH/0Wo64OrDC7x69taMEe1/euzGQ+y4EbO53IFGIs9MDxDn
	VyOTVGEW+wVy2j3oaT3eTphMK1PLDm3DUjK1LXAImhUdcBFL0a62Sqnp6bXXhmSAl/nXkBPVWEp
	Nj1tXWpv7lOiX5jiRGNBzdhnnvbD3M2aSmMkxH02SemnWHjkz0ukijt12Vb0d1O6+x5hi/z7NBu
	D+GCYjUHGI8j1IH86V6WlP0Ny1NdP4uv+kIHmbjDqiGzuQnxC3bUjAqY/8/ccTr48cfvbbpC4pP
	eHBGVg5fRm+rpWQ0ILtlR8P1jHnxVpCaGRHxf+PLa1ZpQxgUswde2zdDhPoML75KtjkZeDpp9Bp
	sL8mf5Z32+sYhpVHMzehFt2gV4KgWD4Y9mG7b1rb8i7zkAL7x0ci45kNEQzpLY4hD5ANw8gdoZF
	Tfg+bOQ=
X-Received: by 2002:a05:600c:6094:b0:4a0:1efa:c748 with SMTP id 5b1f17b1804b1-4a027559c53mr14153455e9.15.1790891228774;
        Thu, 01 Oct 2026 14:47:08 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd6a:f100:18dc:709a:22af:b78b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027734b49sm21624425e9.10.2026.10.01.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:47:08 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>,
	Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v4] scripts/config: honor $KBUILD_OUTPUT by default
Date: Thu,  1 Oct 2026 23:46:18 +0200
Message-ID: <20261001214618.283635-1-voytikd@gmail.com>
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

Test --refresh picks up correct config file by using $KBUILD_OUTPUT
	./scripts/config -d CONFIG_UBSAN
	./scripts/config --refresh -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --file takes precedence over $KBUILD_OUTPUT and
a relative path is handled properly
	./scripts/config -d CONFIG_UBSAN
	mkdir .out2
	cp .out/.config .out2/.my_config
	grep "CONFIG_UBSAN=y" .out2/.my_config
	./scripts/config --file .out2/.my_config --refresh \
	       -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" .out2/.my_config && echo "OK"
	ls .out/.out2 || echo "OK"
	ls .out/.out || echo "OK"

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
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
index 32428ea909c2..0b28fc498195 100755
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
+FN=$(realpath "$FN")
 
 set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
-- 
2.55.0

