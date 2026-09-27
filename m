Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BD20C029
	for <linux-kbuild@vger.kernel.org>; Sun, 27 Sep 2026 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790523690; cv=none; b=rsFDlxX/3J5Pv8ttu1yd3BnEMr7UKIYeBk/fyUJOZJIBMJnGbJ1p7UAUU2ezmtxRJfNSsL/+qTOoP9xLgPp8luZboxRk3iQP2qes7PVz/gARBGPnZrW32/7UaPvw3HuikfOLbMC9P9uPlXv5ShIvBZFtJwYk/xFzLX8420UQnpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790523690; c=relaxed/simple;
	bh=Ug0lsmzx8JosCF3uQ74JaK5eJJUKJx9gIV6G8vs0Wi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vi8kRk8gbqdPfJHdz8Uf/lGof6q75qbZV6fh/oYxfdVwCwsS30o71OixDGiI+FU78zLJRyNt43byw+6/2gWztKN0C1nlSoXKC6iEEmsBK5wGzpg8R1lpdPmOMsrS8purY983KOODp2cZuFk/fZbWA8oV9d2tavPOf3rYUcE1a7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfZdZ4SM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfZdZ4SM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-488885c3844so673135f8f.0
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Sep 2026 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790523688; x=1791128488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LuIBHu0Q/3cU7Cn5h1eukGyE0nOVMByA1RWbGWMchB0=;
        b=GfZdZ4SMpRmd1QtQpVOsTJSjXHeDgBOtF0/mgHvuEHq9cQZGar1ccTCx4nHhclp6Rp
         jocO3bH2t3W8bapxS5jUZVmdWKDWJdtcqCR2ZvZ0aELVnpdkwmFbuhIoB/+ImvLi9mQS
         hBjoo0Y687S9mIOuAfkE/eizzyEv79X5E7f7F3N/T+AbDCmq5XfDb5e/8HTv2SE5ZxEZ
         7SCRHhi6IeAclKxqiRG4yOH69lIKYbGmS5i2DdDFODFtFR9ziS9pQovMYWUreO8iLXtU
         AOgdkxVh7ETQ6KuxKoW9pX4FYI7X92bjb8mvqcFiph1jdYJp1NOdyICjyiwU+nTDumM/
         uovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790523688; x=1791128488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuIBHu0Q/3cU7Cn5h1eukGyE0nOVMByA1RWbGWMchB0=;
        b=HsiTaF59NobrcY5EqxHCwh+k09YZDBeocW4fyKkuldD8wqJnKnxBVxDdJkd7FJ1n06
         rPrYT0y75X8orLVIupt5E4rBhNhRc/Xt6gZGvgozJcmgCxyFJvbFYViEUqlmktmnmx9r
         YBiXl82NlszLMF90yt4ar00MGASy+dSfCs+mYNyohFEFb538/xbUSKmZoro3Ur6LAe+s
         S8ttTC3ZYrHx0p27vHaIvA9mqo0g7j4NYQYnioq8EZBx18ciz/uiWDeCHjsL7vQHd0ZY
         m7S5FHk8j6JbQhn8axGt4u9i44Fh+KZeCjmcVYIDUfRF9H7G6i6psvZxUYiShzLv9A76
         UdAg==
X-Forwarded-Encrypted: i=1; AKwUvBxivHvkoE9WgIaI4r6B5n88sgW9YnI81Wcmt6u6V2+bqvG03NsDTee68FuSkMfUlxgX+re8w3K0OOFHUqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr3CSrQwMUtaNT9VRs2OtzUft7BQPKdQBuS4tr8LaSlugGIFto
	Z1sLBqvw6iDAVz27mtuppWSF9M0milz62ZCKomJqxwrtYsywSyArrLmO
X-Gm-Gg: AYBFou3lbFyYxnVqW0t470cVkXWxeXN67+oS0M2jvZ7TLpk7kEC2l74o6TydSJLI449
	cNJ1A9do8MB0jmJEWIj5Hvk1l0dS9z3RKr6Kh0MqyVYrR43m596Uv8IMU2BDdkQlIjKKiYNcstL
	CW9URKdC8tjvbBrdgq+icQU8G5+DDz+4r2j2g0+p/+AWwJwhekrr71EfnU61Fp9p7N68e1PLHU3
	gliwCywYpz7gC/R4RGKSwnLepikcDq/TecAw3q7v1C3QJHSKGHBQpFjtxRKcNa2EEF+Gcu3Qk6G
	vnehR4nMe33/Hc8zuzJX5IgtpD19jEu1fZklJQfrS23YHrWpsJJPmJMZpZhFfzTjzT3zgHBFmYi
	4CxIN7lBhKgjINagQ7tr8Q3cYBqm24zA6P136bHrotlQABl8PsPk9ZZubKqpCRGvWRm6/mvMVqE
	3qUBD4XM+LHHuOQ2Np2BstgzHEosrxm1GLp1E6A4ZWgQ7OOn3pNcBFA9thlPUk97Wq4Vxf1gJXN
	teDNpBOiH9MsWCNQdDQg/2a/TgPJwkoELUOb1NjVz5iKZQ+k2//KEXyszhdRiqpWlzMonvhxkh5
	4G1mLdQ=
X-Received: by 2002:a05:6000:3c9:b0:487:fb2:1a0f with SMTP id ffacd0b85a97d-488716a2f18mr23612038f8f.6.1790523687585;
        Sun, 27 Sep 2026 08:41:27 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd4a:1d00:5bb0:3aaa:2b21:4603])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a640df9sm20340566f8f.24.2026.09.27.08.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:41:26 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <n.schier@fritz.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v3] scripts/config: honor $KBUILD_OUTPUT by default
Date: Sun, 27 Sep 2026 17:41:01 +0200
Message-ID: <20260927154101.122633-1-voytikd@gmail.com>
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

How to reproduce the issue:
	rm .config
	export KBUILD_OUTPUT=.out
	make defconfig
	./scripts/config \
	       -e CONFIG_UBSAN
	grep: .config: No such file or directory

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
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

