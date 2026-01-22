Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496483BE492
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769116959; cv=none; b=Mmw5n/Ev5JPIn8yKLDYZuAnBSwkjoMLxbMO9f84lOhsKRpNMxa29/zSj+SrFtrfqDQNMBjTCRhm2W4U5UgSdXXqkVY0E3B7Tt5LzjSo0Z/a7do3JyFlp9GSNaD0BFlNuxFlzz8FvIRBgVziLK2A5sdrxHGBVbq5OEvBuWphM4gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769116959; c=relaxed/simple;
	bh=PM0WWCPe+aMzCcU6jV60qN5uWi+uKmCMZ1COBSTDUc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AaD2x+jTXLAFBwqjl/r68iNaol+Lg5QvnmofsgCBOY65ealIgIX0Zgc8kPvQSYY4GkW+gcQRaThC5OAJhc764DgSCO6oL6RBTYqCSoDdT3dLHNc853Voq72Vz4/CIo+p8YkrerHLA9ZNiKtbjY2QOrPitipa0X0LaJCZHcL2oeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+eAkhsy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+eAkhsy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8220bd582ddso748610b3a.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 13:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769116949; x=1769721749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OKB15hfiF/VmXnlSKVJXMo5lBvtkbyidI36e8ktlSI=;
        b=f+eAkhsyQtdIqpsgwSSumbDEBewppCGhTBdF16ZVnQ8lB/YOdp0QJUbOSxZ1P8yHls
         PmEYsP9FhDSyqe2FC3bzZZK0nyDpJPM0rJpZAOGknfMu1CjEdKfUh5KIhjd2DXLsA1E0
         8fuc3nHwkFUXzoC9Hy4jsldluda9Y/ErtvIwyv0tRwIIOWmLcPWC+WF2mc3IcVR2bY7G
         KZlhoH+paVK7qtxtuHX6BefVUIf59KTmIyH3nC1+xDV5EY2pFHXCv4euAGmL9DoruCV3
         JLlX0YdkQPMb1Qoyd1QoJgoEKQMzEgkBNG/kkirRI79K9muOEPhCbs5VruCJs7e1RMx1
         kuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769116949; x=1769721749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OKB15hfiF/VmXnlSKVJXMo5lBvtkbyidI36e8ktlSI=;
        b=ehGhUVGChGdd4IhQ8h5eN8rg+JKgJebB+9TqDOI6lh/bAlNel6T2op5hMhCDO93jI8
         uFTCixBa1yO+rd6K8da2t9xnom5piDb2xKUFER+fYTkAVhXxMBHPYBCTTz4v9nidjg4a
         5ZAlXkcXXUZYbwq0VuCs3xCu0keFCwbwCEjptUSHPvBo0oWF63/labEweFq88jVWMhQM
         aYTju1ioll0raKZKAWl6A36fI1NSGU++wchPJZoYStixTa1r+VU/5e9k6JbWiw5PV6F5
         FXb6pIYLpbN4QiD5aAg/dyT8MGuYGhB4aWwaQaWxOJyTZjJKAv8wJLQ/l6FYtIIkjy1D
         yOVw==
X-Forwarded-Encrypted: i=1; AJvYcCW/vnc4G4/SW74iKzXltrcQ4sRYNruJ6wkJgkul2Ja8CCrZndZ/HWYnmutf494yufW9zoQSHOWH+Pgi2SU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym6/oY2MoVKEgpS1u7Fb2PtJwk0N//nfdm18gFXbUOzPcwU9KF
	/Km3Q4bGDT6OmTGyk7uACmzEieW3UZypUOCtR0DsSmtAbBREGqNZ3TUMJTjDnw==
X-Gm-Gg: AZuq6aKGkyp3Dp9i5xnqYhuAktUDaQPC70mpSLy4W5RzqdMzOYLMVJs6bvo3iMtD0Ic
	G++BsrPhJ2RHd7piK5AkAcBFxyDOgpL+3maoD5bgDomSPn7oDc9l1CIeeKNt8uJwbTPHX7inZ0Y
	PtPhotAb6Ux8vu7Qt+u8Sn2kPm2rUF03q7YEyTTC9o5buOPMHPWmKcrhuLbNoBAmqGPm1XxYhni
	vWj1EWTHeEMg/2EbEZDsjsPxPledXLYpazNQA14ugL+x8vXSz8Ircjp1bYDmtCV5vd1umvd6v0l
	tMjkI62gQvftFktUn7IKSjpLOANorTzJwLDkR2NbHBGflUn/ax3UAZ7LzpTE6Hr7KAQAV/T7ipn
	DEaZ0Sdj6CU909ax8dXlbpDIyONjYKY96qOybJGBAy7hiWKPvVX3Vfn8McGOvl9HXHgncDa6KkQ
	xX7NEphFPPUoN2cMTLJDUTSmEkba9/FI4gTP7mNSKa0yPcXZe8CHj0JiwUl28+axa7+taFnpQek
	4rxh/ZXZy/2QTY5Ue7udzoQf+YA8wm9Gsw0/BZSXg==
X-Received: by 2002:a05:6a20:b7a7:b0:366:14af:9bda with SMTP id adf61e73a8af0-38e6f829fb8mr741126637.80.1769116948811;
        Thu, 22 Jan 2026 13:22:28 -0800 (PST)
Received: from arch.localdomain ([2401:4900:ad2f:b6fa:8cb2:5884:b62f:4e7e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2ddcsm209505a12.17.2026.01.22.13.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 13:22:28 -0800 (PST)
From: krishgulati7@gmail.com
To: reach.krishgulati@gmail.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krish Gulati <krishgulati7@gmail.com>
Subject: [PATCH] kbuild: add custom extraversion to Makefile
Date: Fri, 23 Jan 2026 02:51:49 +0530
Message-ID: <20260122212221.11177-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krish Gulati <krishgulati7@gmail.com>

Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d208066bcbb6..32df45e55685 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 18
 SUBLEVEL = 0
-EXTRAVERSION = -rc7
+EXTRAVERSION = -krish-mentorship-application-task2
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.52.0

