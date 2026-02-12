Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901762EBB8C
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903370; cv=none; b=uo+j1tHe0SEXM3wsPhjIxad2R9FzvPLeWbnq2hCkYU6c0eLt3P25iHTP4qLq3BVd343q8PSqpt45y2tf58gYkXZMVTTBmJV/yQtc+1dKuLhJ6J2FyVcZqz5wfwL/xlvySh0lB9bMQZDvXhRKZ+yKrvvmAYpKFZvll33yGLRmTP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903370; c=relaxed/simple;
	bh=8TPMJycoHl+oBPNXwCoiW6EddB5LmvNhJXZy2Logh0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Amd0nyS1IfEmLwidWjSqRSjZidBWFOJo5rRafyovtvn5TIWQ7Q2gwp73EtZcZVe/gAUGB/PMf5aSL03D6T/P4kWpl0+r8auSp4dXWCrksJCfQ4zZFpaJuol1+Xhk4akvJE1vp5TLLatEaB/j8Gmp0SjgUUhoW9NDtYpRQwXCqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=liNNDiTX; arc=none smtp.client-ip=185.125.25.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="liNNDiTX"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fBbsq40m6zhFr;
	Thu, 12 Feb 2026 14:35:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1770903359;
	bh=xEyAvA0ZbsWEuMtKRmEo1JvZwxg/DQJkx+6k06T3DME=;
	h=From:To:Cc:Subject:Date:From;
	b=liNNDiTXnPwx9FhtwNA/ajVywOyoHP4yNYosdARL/mSxCFzInCbThT03hDVDqZehK
	 +mfdBuvDJU0GcH87yvvMVa7MsG7BkMz+MqL1FNPqdZgxnaMv0eMMF+B1QkhOhZjz2A
	 OwL+aRTMeHHo7Br4F8rtgcK1VD5ycaxm8ObdSi9E=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fBbsq01TpzTmJ;
	Thu, 12 Feb 2026 14:35:58 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: linux-kbuild@vger.kernel.org
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH v1] kbuild: Fix CC_CAN_LINK detection
Date: Thu, 12 Feb 2026 14:35:43 +0100
Message-ID: <20260212133544.1331437-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Most samples cannot be build on some environments because they depend
on CC_CAN_LINK, which is set according to the result of
scripts/cc-can-link.sh called by cc_can_link_user.

Because cc-can-link.sh must now build without warning, it may fail
because it is calling printf() with an empty string:

  + cat
  + gcc -m32 -Werror -Wl,--fatal-warnings -x c - -o /dev/null
  <stdin>: In function ‘main’:
  <stdin>:4:9: error: zero-length gnu_printf format string [-Werror=format-zero-length]
  cc1: all warnings being treated as errors

Fix this warning and the samples build by actually printing something.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Cc: stable@vger.kernel.org
Fixes: d81d9d389b9b ("kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 scripts/cc-can-link.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
index e67fd8d7b684..58dc7dd6d556 100755
--- a/scripts/cc-can-link.sh
+++ b/scripts/cc-can-link.sh
@@ -5,7 +5,7 @@ cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>
 #include <stdio.h>
 int main(void)
 {
-	printf("");
+	printf("\n");
 	return 0;
 }
 END
-- 
2.53.0

