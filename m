Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEF3B71AE
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890127; cv=none; b=k2O5l/IwjXiXQ4OghRdlZFry7xVwlYCgdg7xWLFZ2kzwiItnxCW3l4Ya9VM2arYck/lHQMMe6RT1BhhKwij0svhCr+iwnPk2DW67bTSNHQAFdwXFTHfr94h0P0dNZnBdsPYaCyQKlZ08gF4H9DMMFfYUhnAAP3Zd6uKOfYwhgxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890127; c=relaxed/simple;
	bh=rR8igBMAONQFWgxQpNWCSbKEmSHIFF7JAQyn8OzbeWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iii0K7gnd2rClXsSaXajy2MhAsuTygY6FXViyYJCw9RgieDONOXx3Pdk5CH5w4h+AE61660AfS+UOIhnxluBuc6psoeDe9I11afj+C+/QQ6nHOQS2Y/9VVULGhydrnQTDr91CpCH3hbUfBXYuLILYWynIkn65o6BFDXDuHaHFgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMGEWhou; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMGEWhou"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso13386655e9.2
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789890122; x=1790494922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/80n/32ltdJ41KKMohbSQctzxjiK+R/dgCUJ2IHiZLA=;
        b=gMGEWhouKOE8UhwGLxCX1Ke5iCvNgFTz+rApskftLbzIZO4g0DZJUo5vIsI1tC9Xk+
         aU3kT2QYexzX325H5kNb3BVNDDmBcFATw5+It3rJQAcv3KjoEYXussBCHDiEUYXE1Jhr
         yInQPWZDBGS08YcrpIw8sAvm/Fv8ckMrVcT1SBpGUE/n7F3XKh5c++rYchrhYTh3isAL
         LJOQ0aRrSa651o27PHCEvPVcY4Vt36lUHEt+t1kw/hf0dvkaZmYXS7NEKCIuOvsHpnMH
         /IFS9jWadFgtD33EIpk2Boy/pmkrauqyXWJg9NIj68PiZi9LttH8B3cyQUcDSKMIqCsO
         A0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789890122; x=1790494922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/80n/32ltdJ41KKMohbSQctzxjiK+R/dgCUJ2IHiZLA=;
        b=V2DsXnpgmdoxs4+TWw41lugDRuIiNS5CK1nQ2+/hbVnq+sGUTNZC4G/VOcT3N3CIuN
         x7E23drUX/d4Ump809YeTKaGGWgntwru4zWqhRprAnkZpYFFt3PM7QXm6nUeBAXF080U
         gl5BSotqCT19em9mve2l6nSovTM7NIioKAnUv5im8/pKALnaua1lA9R4lsxQoxYFZSVv
         HilSDSYfiVfX9lLjqvBi7DFovlX+ODPR0yNM+KluMnEmnx9BjRWqyhQhIPtLbc2vgk8R
         THh0oSm0C4vB+3+G/Och+hl/lXLd+XbisIEavpdqJ6YrGDaDvH63ycLosHomqt0Ze2RA
         2BtA==
X-Forwarded-Encrypted: i=1; AKwUvBxVsnpLtOHDMgo944xNOMGoY+s5F+2eRr9BGy9tSXtQxyYPrhuTH8GyhSOqitmLPrp9udPYaUpD2edDdk4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYbNRf7KoRmGlD/aNR69mHhClSswiCFqyH6E9SoYWCiW6qtOO9
	7UObSsCVTnWvr6VEdi0E97VDfMzzqFgQYsUN5z1ftG9LxckdEogSoACaAla/V5kwmy3lOLZ63pY
	=
X-Gm-Gg: AYBFou3QJSlLWafJG9e51ciZFmpsHbc22oVfCMe2XTNGiKnqfs7X7gTkibXFxJDYmZm
	Za7h8+TlsePKyWaUgQgUf0Kx5gUteykQCJW7YJZL11YiXNlK0PfFwPjVDv91ZaBmRBLEyKgQ75O
	8D8oR6mAD8AXz5JmnJJ0/GVcW/UsFz8jPqsPkisZNCB6L6sfMvsbker111HYYzMJlJL6ja14d/G
	yuUxMazjQAHwQgPqS1asNA57czb7WCEbDmLNUd6Ucqq0eyxeU0hHdLED1Iu6AOJJYwCyKBrR9Nr
	QJj/uxUWjqr59l7KSjWc4VPFQfjaEdFIoG3s1GWPav2YwyDc0BS9G2n/qq6Du9/PvqNmJ8F6B4a
	RivdwFn9Wi2mh/BJc1DFPyK4L+i/4lh6P6EpmS4OQjgnKpAdcWaUqZ+1nXtkehEKi8PRCoCkqKT
	SoNH7XnC6k9yz/A0aWEioebVlLHWjiWeEUzghWLEwQVrAC08VZ98yeeoKZ83tkbh2Ic9Dp7uj1O
	SupRNB1rhJ5xSDfyz3A4Il9/heZVxz3uynH5e8aNRN4mWX/z/N07ZrP
X-Received: by 2002:a05:600c:3b29:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49fc56aab12mr100245185e9.10.1789890122462;
        Sun, 20 Sep 2026 00:42:02 -0700 (PDT)
Received: from voyt-laptop-dell ([92.115.55.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm185405135e9.2.2026.09.20.00.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:42:01 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v2] scripts/config: honor $KBUILD_OUTPUT by default
Date: Sun, 20 Sep 2026 09:41:16 +0200
Message-ID: <20260920074116.71926-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920064350.17999-1-voytikd@gmail.com>
References: <20260920064350.17999-1-voytikd@gmail.com>
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
The problem can be worked around with --file, but this is easy to miss,
and is inconsistent with how the Makefile and other tools work
(e.g., scripts/diffconfig).

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
v2:
 - Addressed comments by sashiko:
   - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
   - use basename when --refresh is used
   - remove echo which can be misleading when --file is passed
v1:
 - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
---
 scripts/config | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..cdee67157fe1 100755
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
@@ -229,7 +233,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--refresh)
-		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		yes "" | make oldconfig KCONFIG_CONFIG=$(basename $FN)
 		;;
 
 	*)
-- 
2.55.0

