Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0181B371048
	for <linux-kbuild@vger.kernel.org>; Sun, 12 Jul 2026 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783837744; cv=none; b=K7TRljqGNI2rdrctb2gOdivYYpYP+jWE0TyLi4YHtTlcoVvxiH753y2ivijfAMom8oUFyc2LRqZ70XwXuHTL1/MKzQ1KGVMoOa8ybj6rkVwyDWstL7/yJVoei2s+B/oMLaEjbMEXt+yGTGnt8kwRJDCKFJs6JjAoe6z9uA5agTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783837744; c=relaxed/simple;
	bh=SzNSH/ApV+5phKmZ8GLch+beFTGjzpYgLQ2wZGt3BG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjpYmqYBu7l9iDfOjPe9ltLC+1GPhU6MZF3211bd4Df7tFk3zVLx9ruJ+AuKGOSFx6Xpmohk7Th7NejCn2exUhlOMUnOUBhgQ/VWkMrBEwcZNXh47JadKn9pKMBVobLrDskw6GXzZshPrpdHDq1CTC/ZFleNVAgr7Rb8GR/R8rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N79kYKMp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N79kYKMp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacb8416a1so18555185ad.1
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Jul 2026 23:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783837742; x=1784442542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjwSzWHZkBaieWrPz4xe331bsRxr/TLAJPfCcfEtcQk=;
        b=N79kYKMpIcepykGnkITD30WpDHT5YyUMSGv4NtU3vGtPQ9Xt28J9mYTx3LjDXJmvLV
         v34jrZJY3mtvQgexxUHW8CBd2ZUcGMESXYmntZA//M9ZiqfwA0X//YLNeJntqqsX39W0
         /rWg2K/NBZpnwUKcCBj1+piK55iJfTLNdEogUOOoBEsZGSekMcCv6vFtH6AhwjO0tMc/
         LZVk0mfRXeOTM3xk8/kb7KhtoUFuffMbT3Euj/42+3sB5J0B4Z9KS4C/iLWcGlckPJtU
         Hs7jDQ5LExXw+6DgDHsd51ZkoEvBNQMrFe9CGEd7QdAwg2YnAYnnMQv4ZGu2ZunpcihP
         pjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783837742; x=1784442542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjwSzWHZkBaieWrPz4xe331bsRxr/TLAJPfCcfEtcQk=;
        b=I12RGUmwlKpQBi1hDTM0bVGY+T1u1fYtmlM8K+NTP8RSXXqRRyMFIM7rWuQL1SWjKz
         Dak2oMMN8xp6i7dP7TjZIyQF2yMuMsJug3I/jOMxJAs73nugbne8og7MFJzIGQ3Jn7FD
         qNoGqMlgo5JMRWxNYOec/qjQhReOFWEtuaAf7NXdHQ4TPyQlTFLwLIWY6ZQDMutCJrmR
         4LpRiDIBOzEOEi8LPosyhJNAn0Mi41eYaO3Ca9VuGWVDjUi5hnff4+EZRl/n0PwIP0HY
         ttoJwq9DNTvBFsrLBkyJYRUv2M10UNT8f3n5dXVFWTZOaGx83iOCSJGCh7lIaxbL3mpm
         ORew==
X-Gm-Message-State: AOJu0Yxf1oXnNCEX4b4qRCnFxPeWg3vRb5m986/ak3WCa6KSjGvWWCGo
	9MC7LThIo088VD3DIR02eadKqG2Gg8Y7NceqqVUYUaBOcFjzFwJCWpQe
X-Gm-Gg: AfdE7cn69Wr+UkbpekAfBDddrxg3QSIgT/QBYcR6JClhItr5g18Ui5yTBom3coXdiJ9
	sJGuLpOIChN/cP785NNyildRKOY0kEJnO7grfQxvLNSygzpH1sc6KgZkGKsb+dqYH8/6vnK7sMV
	bnYUowDNJEUzYfCiK2TVY12rm6ez5LwKgAX5dg69tP8Ah9EBOvL2+OquPfSRmKF0eBKeEaTsgHt
	4nhcSqo0M5ybrbvj7yk152qwSxebmb17bKr58wp7NEnnOglinXI35AjDHLkLqBdKYJx+7HLzs/A
	JWsqmaCnfgTgSiUTcUgVeAjoA1SzL0xBplqKJc9MnBpCilvOZx+0hwl42++Eagz+oTuFbypBK2m
	Fzc05Ek7/7Y8BhLX5GdKGdYtXfoUryASUtpE8iT28G++rYpVGGdpMTNWVozvIgvv2nb7PV+J6Rr
	gJZH0LRQdahgzN5MWXwZ/SGjRJEJ9npuIaojNQG6d8dgecTx1fPPNyyHLIfAQu+eFgRlOxZ3dZQ
	wiDql1a
X-Received: by 2002:a17:903:b4f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ce9eae29c0mr52294255ad.9.1783837742311;
        Sat, 11 Jul 2026 23:29:02 -0700 (PDT)
Received: from localhost.localdomain ([240e:46c:a300:12ed:a5f4:d452:8dd:52e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8f26sm83270835ad.27.2026.07.11.23.28.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 23:29:02 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH] kbuild: rpm-pkg: append %{?dist} macro to Release tag
Date: Sun, 12 Jul 2026 14:28:34 +0800
Message-ID: <20260712062834.77872-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260712062834.77872-1-laoar.shao@gmail.com>
References: <20260712062834.77872-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the %{?dist} macro in the kernel.spec file. This enables
building and releasing kernel RPMs with a custom distribution suffix
(e.g., via rpmbuild's --define option) to better match production
environment tracking.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 scripts/package/kernel.spec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index b3c956205af0..c732415662ef 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -6,7 +6,7 @@
 Name: kernel
 Summary: The Linux Kernel
 Version: %(echo %{KERNELRELEASE} | sed -e 's/-/_/g')
-Release: %{pkg_release}
+Release: %{pkg_release}%{?dist}
 License: GPL
 Group: System Environment/Kernel
 Vendor: The Linux Community
-- 
2.47.3

