Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FA478E39
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196879; cv=none; b=Wdoo2r8B8tEEYu7MsV34sdTmvdTK3DqoxHroJnKu3avDp9reLpE2XWzoq2OKUByam2MygjdevwOZmFHGhZsk9KADgZc++uPDQ3hesM4nh93xr2mvA7IMcR6UkxXxeGahp445PjTFsvyrgmCAd4Picr1HuK3AUIwsyMuwmO7dVyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196879; c=relaxed/simple;
	bh=BoHSRgQUQXCllKByP1AmPyfc8Ozed0EDclglO3qKZgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SPVpobf1Dwo3S0XRj8jXpE8TNh3WADU5kMYZ2453uQ0+jhB1NSnxdcBm+N+MvtthMdtuwSqyPEVFWiQipw1Ch1v6+PE23SdU1zAmCEFlw8dDErxBZAOErKtc5Eq9RIuJc/gR/3E/n083MqiiZD8HFoJ8SNYWvq5LtLM7NzF2+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuEdQmZ2; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuEdQmZ2"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4911df1e196so668087fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196875; x=1791801675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1FtFpNk5R+wIzEPowvWYpW9JlGY9UNol4KXyc9/Oyo=;
        b=AuEdQmZ2ud+avbiOEMgwFUevjLumFNT8Xu7YOh3vjFkjA78HEmScIwTU1wbBucZnEq
         34NG0Sq9CAQ/m+s7xCnhccX/axA6jflaU88lOSXy0R9Ih70SnR4Zova+4sfBYSXpOKp1
         oVMcDG9uYlUYPu+/3CR4ltyLMdy4tgy6FESeL+XRWgk1Qm+VAKT8kf4BjgRjk3FtLbjt
         W4pBweKBCtVFGPR+Y4HeIztwL2HkrxfMMckI27QOg+2BMfDQ9cmJeDJevUY4iO/QPeCO
         yJ7ZBHD4JeiichUyNNBG5ArGx75dQSPkHxeZ5G1VCwfMvhZQSgCIKrHk2VhuncHwh7pv
         opRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196875; x=1791801675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1FtFpNk5R+wIzEPowvWYpW9JlGY9UNol4KXyc9/Oyo=;
        b=KKee7FlNeYt0FB6oqG2rm0LFCVCOEvoXwwya95YmtzHBHkA52BqhRmuSKnDvgU0lwN
         kq7RVnnFjEyYGYGb8rbufq3ZZqQcjvGza4tFWjW25NjgYUPaXskXa4qGO2OpRWXxDYrp
         amqHy2MZP1EVvNwi4HHv7RzXIyqXy8Eh3niN5k2Uk6E6ECK80Z74BbEGW9tMZ3CV/PIA
         2dG9dQTOoYBI+nrBm6yAsABsUbY9RIcdLG5L2bOk2EipIBJi+1AZSt3K4xzVyny+o959
         uf/KH1Ku2FYo0TKoQiVAeNcTWj3i7eLvraOqU8o8YhGvVZyMrspvAdG6gam3GmpFCA35
         mO/w==
X-Forwarded-Encrypted: i=1; AKwUvBwbapQpRKh07/l5stze9GrsPBsU4FtDrQcJv9Gd8J1Ypfc2C+B4V8eESW3aou+7QSceNYEySuwcnB47QbI=@vger.kernel.org
X-Gm-Message-State: AFuF++mWAH/hszWsDdJ0Negh4lnGAE1r+GQhskwcKUivTvB8RBfg1fKt
	Uu9qZPp/CQX2a958oTu1nv3fclfcp0L5nnUhoKHJGYIgMGlXvf9vWxP/
X-Gm-Gg: AYBFou3MLRfalPFJrbiCyjGtyjMnsxO7FmLG+QvJBqzLzCJbQcY65BqzJpL355miAAe
	LJqmSBOLULAePOkRkTryU+fLQasmRX0u/qFCiAgL2gdUP5CMv1HpcM5SaeRUsRmrcwodaPI4Rwg
	YegiDjjL0WK/zvf8K7kETxl1C15cDmrsQAP7YHvHw+CUYRETvS2+Cs4vrfz/4jZtFiTX0lVQgr/
	i/84LwTMEhk0wEpshHq1tE9Cb5iU3hYXqxhboHgOk7RLt6kVPy3hTvxIX6Zgs8gDeA5q3knazdZ
	hYjqEX+B8opC2ItX21NXMwOBy/BVWHfLl3GCd/AuZNMrSQutKPd4MZsZn77zVa0XIpJjlwInivV
	TB7DM/CRCWp8gxzAMpJJhD+R6x2rdeYEw6WVUlru4ZZgkXc3/dIHMJLYCWtTI5JZocWeYDaBogn
	Mm+/OshEq0FKu5SiEA12MrzYPbW6rZZbIY8gVaOLRNvDzvtMYj+EFdYObbqvz/LcGKsirppyt2g
	wWqTwcEIohF
X-Received: by 2002:a05:6871:726:b0:494:a2cf:8dce with SMTP id 586e51a60fabf-49e3a5f9b50mr5972447fac.4.1791196875538;
        Mon, 05 Oct 2026 03:41:15 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:14 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] modpost: fix handling of short reads in read_text_file()
Date: Mon,  5 Oct 2026 05:40:47 -0500
Message-Id: <20261005104050.1786222-7-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

read_text_file() loops until the whole file has been read, but every
read() call writes to the start of the buffer, so after a short read the
data already read is overwritten and the end of the buffer is left
uninitialized. If read() returns 0 before the expected size has been
read, the loop never terminates.

Read into the correct offset of the buffer, and treat an unexpected end
of file as an error.

This was confirmed by limiting read() to 64 bytes per call with an
LD_PRELOAD shim, which makes modpost fail with a parse error on a valid
Module.symvers.

Fixes: ac5100f54329 ("modpost: add read_text_file() and get_line() helpers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/mod/modpost.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b..1772068dc 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -143,11 +143,15 @@ char *read_text_file(const char *filename)
 	while (nbytes) {
 		ssize_t bytes_read;
 
-		bytes_read = read(fd, buf, nbytes);
+		bytes_read = read(fd, buf + st.st_size - nbytes, nbytes);
 		if (bytes_read < 0) {
 			perror(filename);
 			exit(1);
 		}
+		if (bytes_read == 0) {
+			fprintf(stderr, "%s: unexpected end of file\n", filename);
+			exit(1);
+		}
 
 		nbytes -= bytes_read;
 	}
-- 
2.34.1

