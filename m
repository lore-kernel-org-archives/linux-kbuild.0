Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948933711D
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058530; cv=none; b=IRqHZpq/3cX9o8/ZLk7RdT3XMstpmd566r+eQEwzsNglmTYxxXAIezEDtEgqAnrDRmetpa6bDOJUz9ykZEwwow0OCctw7inEBdqSCU5/ITmqSKXcNYsz9eAEdWbXn8Tr3bLJTsjTME9tLstD2iebPrf3DmdEr50A93wm90YjPPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058530; c=relaxed/simple;
	bh=BLoEzWNbzqwfRbXQCJX1pVUosc1nM1wen3zjf1HWs8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ANsl8KsXv6dvr64Q65vgH9DmkU6Lj6TnwdvNDSa9LyihE0iyV0RnyCOsao9W7VPWNgfUW1/1SeZvTYSY0Ad3NgTt66uzNWBGhrjWFxzMnsjLUrbRDqyPT8mnCmhGKbon/5OigH1HaaGJPXfBfcc68Gt4RDG5pDD/rnBwzBenxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzALJnYV; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzALJnYV"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c737d3a51bdso1997795a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773058528; x=1773663328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO9vO2bAntDHLDWiMd4LjZvMU0oibR6aRqIfcL03Hd0=;
        b=HzALJnYVU98R9Au9yZO1SMp1BRaC746FfdZJY2hBrlmAxbV10GSYnzBmUR1VjkvEBl
         lrNkwZ86CYNC+RZm6ZW5iYV16Zr0RJlKvPM3jpbTGmvqEx6S2Na0csKn19Kp7usPh2RY
         4HV5zqTzS8tZGvd5JCBlGpGzLJZ69/08q4e1griEkhUDC5YiqPVgwOEi4BtvV8LkZaJF
         qYomq3w1NEpdpc5Vt+WMrvAH+At1e3+P2k9umT23agRbzMBB2CF78BWs51dxx74qkd2y
         g2MWPBJmCGenUqkPZnDSRO/7r/r6k1zYXUqEoxZ/jNi6Iyf8I3wcDBMG/nSXlG2/4y9d
         qm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058528; x=1773663328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO9vO2bAntDHLDWiMd4LjZvMU0oibR6aRqIfcL03Hd0=;
        b=ndo0rM1GASfUA/kI78xahBWNfl567NvusVYMOW8BqaDnlrL+w2al2kJlcNjnI7u8NT
         uJp42XKF5ZuM2Zx3cQbuvitKCbWyovdaoBKxEwkWN3PmMPovIpJz3VPMe7btaUzRTnbk
         GaHFUlgEcX3kJRpxPRWozhdYwndPJRL04ReR0Rp0ymF+KlW2tHHLiJgnSWcpsMtCnPKA
         WGBY72KiPoPH3KxcHgAZhCdanx4lL4zooc6q3teMjyncikVvAVN4mH/sViwxdJE8xv/K
         4N7sWpnj9lRoKMftfK9Pni5SSSyU6mCXATPlWkgHlcK1dIDV2yAVxf/qa74mBzfUGVhq
         k8dw==
X-Gm-Message-State: AOJu0Yzgt4A2OxnKWTD0zuD52lMgRSPmgnaszTv/e0t+OO8J0MwfN2pq
	PhlJ07iyqnIjZOfSVq0DMJvTfAZSW1TrHnnQmHugtd3R9HZJPUGC+n0x4ti5dY6zNCo=
X-Gm-Gg: ATEYQzyLONaj+RXYx45ANaEaTUnItLKOfO3V4zcLBqgmlwbk44o62aaGbfR/hFYUfLJ
	E3bGq9G8777UguIH1wURzu7DnFWCiPt3Wa4VYq0OiX/5lm79Ns8tLbsIZXhXnkcdWj54hd7PB/O
	YvvGeGK51nEAzmtnBXRit8x6fFKPv/3Pi6Xv44KrSvJ1pkFfrWtEDWlhRX2vQi+XVfAjJ+XPtU6
	uTW8drJw6ROXsORsi0GyWwASflbX+Kvmh3onCFmJCmezPfdL38Bw2BwZocQQJJ5UMAlmaHK4Trw
	h7E7hu7nYq7OD3db31wqPYt3k/wYxWAvr39kH4ept7tgcjPG/+Z4CTXdurPjWkZFWumKpFkYuZ3
	TjXPQaYfNPr3cxBVMRTHuAtnVHOpx9sNdQ9PUVy1L/LWIkm4oVIxvJXLwsc0r+ywSI3RjfsaYYL
	WSXuRdWDQ1AjY7gZ/wr+emnrcxcNuM+opo5JXPnUE=
X-Received: by 2002:a17:902:ec87:b0:2ae:5a70:4786 with SMTP id d9443c01a7336-2ae823a958fmr111232635ad.25.1773058528402;
        Mon, 09 Mar 2026 05:15:28 -0700 (PDT)
Received: from ownia.localdomain ([45.8.186.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e584aesm111582755ad.3.2026.03.09.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:15:27 -0700 (PDT)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weizhao Ouyang <o451686892@gmail.com>
Subject: [PATCH] scripts: kconfig: merge_config.sh: fix unexpected operator warning
Date: Mon,  9 Mar 2026 20:15:05 +0800
Message-ID: <20260309121505.40454-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a warning for:

$ ./scripts/kconfig/merge_config.sh .config extra.config
Using .config as base
Merging extra.config
./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator

The shellcheck report is also attached:

if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
               ^-- SC3014 (warning): In POSIX sh, == in place of = is undefined.
                                                        ^-- SC3014 (warning): In POSIX sh, == in place of = is undefined.

Fixes: dfc97e1c5da5 ("scripts: kconfig: merge_config.sh: use awk in checks too")
Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 735e1de450c6..073c6bec5245 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -381,7 +381,7 @@ END {
 	STRICT_MODE_VIOLATED=true
 fi
 
-if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
+if [ "$STRICT" = "true" ] && [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "Requested and effective config differ"
 	exit 1
 fi
-- 
2.48.1

