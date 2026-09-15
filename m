Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9D42E42C
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453592; cv=none; b=Afc/RDboGEa6c5TCMGzI/LpDyWJ/u2S0vbdaCJWHaP4o5zfGoerwovL1y5Z/vRKwOd9Jg5StrH4AeptzgV7gH47BXCemfeVRG+vdIsCNo26/ZHYc0dvSSKrDl412DYc1OesphGk7D0JOmfZiieWJ6jUpiX3Y+I3GEHZuXnNIeC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453592; c=relaxed/simple;
	bh=SKkv80ZA96qi/FuGqfs3SVEcrAzc/ZEJGBgZ1fEwV9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTeAxEo28qCWs+ZKgGp9Q32Ak61rExA/MofL5onXVp4+0zl8c1caBo6aySCxyW/1cOFaeTsonhvsz2grbIAsAJBUZJ4yT4YkHONSzDIHh9/aU6AZggVnVd3M0fL04+ihYNHoVZvxb90VXwXaQtBwF0H7DXylA5xKiBzIdLMjAeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1ejAIOq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1ejAIOq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-869d181419bso3883543b3a.2
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453590; x=1790058390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3c12DWMhGwiCLWNDvwB0sFp19akobAYWnpYzYqkItc=;
        b=F1ejAIOqkAOFNFLbH+WweuEmyQjjnerIn808OQxwSzX6xQ1lxlRY65iQX9pXrMdmXW
         tsjTTL4SrQVaGJoEoKpROg08V90cHKKKDfnwfxUwVTMNRDJ4XtWEFoE9FPAbElQ9tLAs
         hI/8PPOe/ZX+TpfeOlJlY3I+JVIbLciBzLdufQV/KwMu5/474EM5rZqH6rQYbTyLPSnl
         UNG0liaKxb89J+RvoQ5e2Tf2F9nIBW3eMtw1gDKSu51V+bQerq6TMbri+FWPBIRjrvUL
         chNB86pJGfw9DOAtrk/YdnqjYPvcQxPgaF9skhC4CcghLP+XvjaiSrIBnANLdF9tnanX
         8PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453590; x=1790058390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3c12DWMhGwiCLWNDvwB0sFp19akobAYWnpYzYqkItc=;
        b=qgeddZDDopDJHZCvwigjpBmhFIIS35SLyWIxMiD77B58PA/Yf4ExGzdj5imNGrgDxw
         2DBJ7cJK2yV7qQJNB9WlwQiQUHH6vR2jUo+KU5RIIgPkt7hl3OWG3n/91bG5HizF+eXf
         F4oWgoa/C/RStDA7jJXfWbPkLk0dMU9cwWYB79JY/5JlwmWo2osBUrS8JDo/r7S46eSA
         3elHjA/tl7vzQIX94W+VGCwxZUrOv3/fcQhQ4Z4zsQNAvJFz1RyeZLoAtsZ9Vri0pbcG
         x/8gBGRTMBcTsv5Oe5FAj1NHXv6hSe4z88dYd3eGSK4CNWZKcjL21f8sEALVhO1aH+2h
         iyVA==
X-Gm-Message-State: AFuF++k46Q5FAcbboMwQyPWD6DSro+f4fe3BVLEEakdAmFb+rhyxLXDa
	XbM1HWf8m9pmgP3a2KS+IlqQswO2vnmQjYLNC43N1eq6GnkoT+q2IFBBiO4YqA==
X-Gm-Gg: AYBFou2LNf7govxYDNWcSFSWrJ0wPxBdB+HHBZxEy1VHH58mTg9rKV0f+uPtsdmb7pu
	EbYLl2HdE5IjdIbNi5rKus1HOp1kor7xtnswOdjTNN9n3pEp3STcLZf/Uv5pFy9vWz3/FSXBWgL
	YT5YN1i1EAw8LI9xACnM87B5aeziFZrttD+2PDRXYuM6OaljlmpkufT04rPqKPKCho6Cm3tEJoQ
	KTxA96+/+rIs6B+7RNQTSiCXi/mMImcmadIzEv/aR8yt4QY04Azx7wBoChGKNec5vEFKbvyolQP
	rGdSpEimL199QxAz/KXHgjUZx5KZhF63bd45Snc1gx4dwPAj/6Sx/PpkfRIKoihdoNyViPc8Nh2
	IbstZNurKWEqyTirY/gF/5UB/n6F43UTbe47FmY9gQ72Mp+d/XASc1csrSyjM0mrm9D1/5aL0bV
	JnzGafzqhJvJDCuzO7MDdzwSIfKOURor3a6Ws2JLtQ1TLsxb3kn+GhMVho4OEWitm+
X-Received: by 2002:a05:6a00:3386:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-86f833446e5mr12648954b3a.3.1789453590195;
        Mon, 14 Sep 2026 23:26:30 -0700 (PDT)
Received: from 92 ([122.161.76.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29dc0b1esm5683875b3a.48.2026.09.14.23.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:26:29 -0700 (PDT)
From: Aayansh Ranjan <computergod47@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayansh Ranjan <computergod47@gmail.com>
Subject: [PATCH] kbuild: fix grammar in output Makefile .gitignore generation comment
Date: Tue, 15 Sep 2026 11:56:13 +0530
Message-ID: <20260915062613.13761-1-computergod47@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the grammar in the comment describing the generation of the
output Makefile .gitignore file.

Signed-off-by: Aayansh Ranjan <computergod47@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4ad67b737..ffc8732c7 100644
--- a/Makefile
+++ b/Makefile
@@ -681,8 +681,8 @@ ifdef building_out_of_srctree
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
-# At the same time when output Makefile generated, generate .gitignore to
-# ignore whole output directory
+# At the same time as when output Makefile is generated, generate .gitignore to
+# ignore the whole output directory
 
 ifdef KBUILD_EXTMOD
 print_env_for_makefile = \
-- 
2.55.0

