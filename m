Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075C93D9520
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886865; cv=none; b=Wi7PaNDyRrvGFYO5wb0V9rnAuaen2OEpnGQQr8m/L+37biiNW6lOYairmaNGL4+Ud4ZJ0ZPPKRbAhv4MRKroH7CD5GNjcP4JLvfxlWGqSpdA37ousMz188l+Jhao0jZfn4Wxx+q3CxF8S7NIIvdkf/rY6lgqZt7BWYIRyoB0+eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886865; c=relaxed/simple;
	bh=gTmgzrtRTNi0pnoGcGCYY2OCjhKa0mHfPxUgmpCGYoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVMTdkduEsfnTl1emE0tu8vXbraxuDGWlZ/5N0ggX9IUQ3pujEqu1TS3lk20z1L9uZcQOXMGIqxl03WVxc6Hp42l7FsVT9RKR0btaPsVWv3uqQ/EI68aStzX/Ltaufbkoym7yIcITA7riVYmsR3v8Ch0wiCZK1ySMwvi1vMmqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfFE2SU+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfFE2SU+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so9936935e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Sep 2026 23:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789886862; x=1790491662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUx2kd5N+hlzcFFuusyp2pQWQI+Tq5GjSNNKvVMy28w=;
        b=OfFE2SU+SLj4d3hv89jWrTN5o1kT1PEGR7GXY0X86n+d8IE+voYQdZgNAsAZmCJZGh
         BHRuXQeziHlZvZ5snDnNqrPuCg8Sg/+TlCGjwt2x0ewmthEv7E8uzKwwajyDJAjfI247
         re8zONmxfEoequSfBI1WQjnWThsVbcnhJa944babLZRBD/1A6EdAJO9+RMoN96H1WSoo
         Cne1zw1w1bKS/grVwyXnhTYZcsArP5Py1BzJ/nA+WYmjVwmjb8CYxlmFnDD62kCPmvui
         HvmrWXEBsAHao8OUp8gKN8NOTkybgun+MoQExeZIyWu9oe7kxqeboK09MeTe+GRc5Ktx
         Jf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886862; x=1790491662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUx2kd5N+hlzcFFuusyp2pQWQI+Tq5GjSNNKvVMy28w=;
        b=teh0a/hKZ3wK9vnAPOyg5mlSW5S+f6HqQAlAeO4BK3kBsvCxBNJkSAn6U1CsHB+u+m
         oigTY22/mx2F2Aww1A2DsRkif2PuhNxq4QxRljEZrb3LtEvdpw3UAqu9BbTKEzUj9ZNk
         yg+7cYX0aow3d74+fIJuWSb0T9/WSJyee7apFnTOR35cZ68hPwlCWcX3THkx1ROia8Zo
         eZraclw2EHfHo/nqk8en+LEyjKMQl6gg9I4lwPJfMi5LDK1DGDK+T6kegDENIavlospr
         b2EN2GsXfwi3DbjUm3KDJ8FSssx9rn7BuAXA3J3jijj/VHyFhUV7bL0vYdJeHwYntlfD
         186Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjBf2WM0fQuE8FOqs74Y5u8wsWsgnEtH0fwvJZGJ5ygi03Te88N2AjEqXXtLU6fAPEhnkIVMRgOcCJso0=@vger.kernel.org
X-Gm-Message-State: AFuF++mUC3Jt0KWlu0mIE99tOVjGIIPd4N0/pmAQt0sqkW//obiKzgQY
	aazhcRkTHspYjODTBZseqO/4Di2kiw+wlixKyFqgc/MFWNAM1I/paESV
X-Gm-Gg: AYBFou00AYh9DRp+ya3EhyKFGY///SuCarCsD2/yU56cOrGDSY7Zj5f9PFhtAYVj8rk
	emzZUO6ZpLIcMUyycmwQh6+9VHjZd0o2//9gPu0tDqBawf9JFjbbF6xa5R/xtpreY7YzVUEYqHH
	3W+UkolI3YR5fXT7zz7kA3A4iqOk/6iLGw3goWX0aXiw/h0rs742A/maqM6sfWNmnJSGIjbiDeH
	6uc2zeZH0a2iX6vYK+fjINoDrN7M+Nn36mlXoE3VPAiSyPSJcq0bzFCJg9uSTArAbuJZbqhmmlf
	HiV9EH3Ap4zjYxzQnQus5mox9ePl1QsBa1yL5YVuymbgccLBdvDzoHzM8HiJWc0UCTHAxsanbJY
	V77OBL+k0yoqwJMru7k1BwltLYInnJmE7uOrnI5ZRGEJE+cVUdVLDlI7DEQajA0r9hQswFOCHIz
	D55Rl/SNEX6d0pcxA7ipP0jMwi2fk3ZRjNb5edJFC/S1nx+zYJQmtGcCREHmfWhnqtHhR9JIjI6
	xbcJjd5rjrIqKbUnN2wkE/5zYEk+jJMXxsqMcRs/1crhNJs5FQCx5YB
X-Received: by 2002:a05:600c:35c9:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-49fc5736229mr113604215e9.24.1789886862139;
        Sat, 19 Sep 2026 23:47:42 -0700 (PDT)
Received: from voyt-laptop-dell ([92.115.55.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm141442235e9.2.2026.09.19.23.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:47:41 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH] scripts/config: honor $KBUILD_OUTPUT by default
Date: Sun, 20 Sep 2026 08:43:50 +0200
Message-ID: <20260920064350.17999-1-voytikd@gmail.com>
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
The problem can be worked around with --file, but this is easy to miss,
and is inconsistent with how the Makefile and other tools work
(e.g., scripts/diffconfig).

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 scripts/config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..f52ba5e6e27e 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,6 +130,11 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+if [ -n "${KBUILD_OUTPUT}" ]; then
+	FN=${KBUILD_OUTPUT}/${FN}
+	echo "Using ${FN}"
+fi
+
 CMDS=()
 while [[ $# -gt 0 ]]; do
 	if [ "$1" = "--file" ]; then
-- 
2.55.0

