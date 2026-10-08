Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DB63AE707
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477927; cv=none; b=UOT5fqtN87OGp2fhKkfXIDJrK7f0+ywUx0tVN249rPoo08RqMRzRjr8d/9re3n73Al/miBhV5G72IMSw3JY/cdMpxGAGrM8xbBk0DgzRFhS1rXRtf/OdA8pW9mOp7UadcvmsDC06VrfHtr/2B/ZvxoL2NcC/K+ccWKxaxrcW+zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477927; c=relaxed/simple;
	bh=6vHugKiEKGcwnRO8JqioN3GgMgDjgFR2oYBYqnuobxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PPGUeBQy97lDkPyiUYxs8tN9Zx+bkZ5ZKhZb10DPvGMk/wEnAWvfomia3F4hEYBrXIvXe1tkLYrQ/iQH3vnJRfvl+5tzi77eP6+k30w0YvkdkdDTfkdF0mhLtKVbRmW5Y3VqzvvUF/oPYFBRF3F4SxQ99XBClniixnu9GEI+eEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnMopyZZ; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnMopyZZ"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-49e5f85ce89so1318170fac.0
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477925; x=1792082725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4HNamgC8b7ssWnbv8gI67ZFZzOI8WJzyoF80mMtg9o=;
        b=mnMopyZZdTrvPc7NBs4hmEOKpJy4/e1Aj5kEbVWkHgWTFN72QnIN9WfUzNE1Rz0T+r
         dHB29DHbKVAVhyK6auVCjeAJ4bggmSk3NRU8wd0QT/90PgZdKnuEaBpJDjFq0jKiBFEJ
         JAEFYXzGVhAC9l5zQwvafyhUiZ7+oSgBaIyja5h8BpL46/Qg1w7MKIrCTmz7xWdRFCWd
         JDL35XrAFkl+ep2ra7pDyIDECHmu1nAb2chqdVXBYQKSJa1nm5FprQmPd/NM49CdQ7e7
         O475o8oax3SAtUdD7+X5zTy51wfzuwkaRUXL2Zdo1Rwx79XFSMip8f5UGSnK8xQJIhTa
         OvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477925; x=1792082725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4HNamgC8b7ssWnbv8gI67ZFZzOI8WJzyoF80mMtg9o=;
        b=IILfbJN+wQ/ysUvT1K3pkF8Qy7EOyisahteZzmmM3ARVACkBtnZd1z5qX9rTkP+c0S
         2gVG4/08RQ0L+SCeNO5EKcu8NaYTF+y+eOAJ14nKf7p/rxsJCQYx1jJ1vBEkheBt6bo1
         R2301kUL38DinzF4GV6FJ8PwXCowRde3WYvkjYjdvS729340NYAfGiRjsQgO8+VVrRFq
         em9fs3EwRKj3K/uYV8fe5Jk2rzJCfPLSw/pVXt9bej/irefoFcbAJKNTcaahoX4JovhL
         M04q6g8+GYp6suz8Pe0haO1k5lZ4/k7MZFblf/mdvEBb+d3RRljYAPAM5KNZk+oPlxQR
         wBqg==
X-Forwarded-Encrypted: i=1; AKwUvBzHYApzgXeSzQozYPK0jthpS/O5Z/txLh8JqPMwu1L5spmd66ip+pFD0vmytra5wBRNRKhZmMPKxHuo1gQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWpYXfUkX6eiNA+vv684PxbYed4IsXr+cUofFQR3hdq3leOQd3
	xiNX3eMCrvPGeph98ebcrrisRp4ty0kPRJSVFBUoarMXgyCYdgeii3nR
X-Gm-Gg: AYBFou0Cm6dwLr1UsjMtY4WWK+IwXrUmdk1iIzbSLwKEr5eCgUUhWPt+p/TlZhQHaO9
	xiqGHbrGEXmBx0Job9HOyPrQq4D2mukACG0n8acJxBHzIrWR8IsNcBYLOvCyu7N1Z9BuK5euFPO
	/t9a7chcoHevzn4ngsh4hBoB/KPjJcciDBRycc0l1KEXxdHD9SkPWUA6cg8tTT82ke/J2L+HUML
	ey8UX6UHCOLaUjpxALT6VdGwKLdmrleBH05w9K9Zp4FydGVVWCPm4T7wZzYTgTNPejFyWi0ehtW
	g/txsIEkVCHFKHjH6afcowU0IKbbFZNND+U3gBa2n+yvwYh6JzhYyo9dwQQx+fYT14AbUn5PS8/
	RuXiIjwdX6NL5Kk8ZpB69KUUvbGHqyTryKW8XHevz8/cV+ECelRI3P+LsjH9IB6F+3BGUuxis7u
	3hpjUmlmFa21doTioQQelIw0piNN7Vojd0tjNpenTZFxhj33DqecqH2BEoTE3ljlvWhLiIo7MZn
	MDAy/afYdh/
X-Received: by 2002:a05:6870:d60a:b0:493:186e:b51 with SMTP id 586e51a60fabf-4a25946b44cmr5252971fac.20.1791477924946;
        Thu, 08 Oct 2026 09:45:24 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a274af62c9sm3037754fac.4.2026.10.08.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:24 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: fix infinite loop in conf_choice() when no choice value is visible
Date: Thu,  8 Oct 2026 11:45:21 -0500
Message-Id: <20261008164521.3684735-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a choice is visible but none of its choice values is, conf_choice()
counts cnt == 0 visible values and finds no default. When the choice has
to be asked, e.g. because a new symbol was added to the same menu
(oldconfig, syncconfig) or because stdin is at EOF (oldaskconfig), the
loop that maps the answer to a menu entry never finds one and the
while (1) loop repeats forever, printing "choice[1-0?]: 0" each time.

This happens in the tree for s390 when the compiler supports none of the
-march=z* options (e.g. a non-s390 host compiler), so that all values of
the "Processor type" choice are invisible:

  $ make ARCH=s390 defconfig
  $ sed -i '/^CONFIG_NR_CPUS=/d' .config
  $ make ARCH=s390 oldconfig     # hangs

Before the removal of tristate choice support, conf_choice() returned
early in this case. Do the same when there is no visible choice value.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: fde192511bdb ("kconfig: remove tristate choice support")
Assisted-by: Claude:claude-opus-5-5 libFuzzer
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202451.3461265-1-lzsx618@gmail.com

 scripts/kconfig/conf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index ca6d9d7359..31c6fd25e6 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -483,6 +483,9 @@ static void conf_choice(struct menu *menu)
 			}
 			printf("\n");
 		}
+		/* Nothing to ask if none of the choice values is visible. */
+		if (!cnt)
+			return;
 		printf("%*schoice", indent - 1, "");
 		if (cnt == 1) {
 			printf("[1]: 1\n");
-- 
2.34.1

