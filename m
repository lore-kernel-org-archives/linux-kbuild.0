Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1653AEF3E
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477662; cv=none; b=qaIuo9yc2/Mqxi4ekJX3WXgOrOzCXNNbiOhLOOgGEm5wJEu1Nh+k0Wu3gMetO8peiydQTHP4fBsmhFx1mXAuTvAqGMlz2FInR3ocC7lK31I6wXIZgCADt2lJpWTLFOwxknL+xe1EackrEIuiFCXy8biPR6vtT3fCVefc6dK0RSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477662; c=relaxed/simple;
	bh=oyynTkKGGfztLCMBCVphxnjC+mB7kXtAI1n/IIGHN74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QpGb4yR1TpOVOMevEiv/f0m5TnIpNkb46ZHzV4U98kaEWwJ0InIBvqVi/7/II4V8Jq18iIMAZTj3jZSFBa3jc4bIx95OqGJyN0bwLcphZ4shtfb7enMjnxGZHds+Bzx3+GjfdNeSteRo3jKW5X2ctFjMT8MpkWYBWFlV9LcnCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N95EiCjs; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N95EiCjs"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6c1983dfaffso4468694eaf.2
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477656; x=1792082456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVgGWa7vQ+w9ty39UYmv4KKUyLnAT3ReRFp2PoOTaIw=;
        b=N95EiCjs6cq4TPgBY55ERiOXnQJaiQxUaA6VbXhOTK6s6Q2wdEd6grHE4Eo+mW+++I
         zP/weO8UpaD+Bzt3crlEDFlzGP2K79pdUtwnpmZHwVGCEK3UoT5TUXqXME0iQZSaPnPZ
         jFodMa4n5U5xe8V/sIqoUgHyFqDB/3PXXp81Auny+Xs8Eh7a2Rg945hqWqDcsZkxXrey
         HJX+w1tRuVm+GR2SDZ9UIHJCgPsp7hhU4nx8wHiDDLqT6j1SWFCMs25W34ipXQYuth7S
         5Ch/oObFy/AYsucqLF8BQaobnqvTK1EWQiTzANgfTthFLbeilrgm6gAgpe0+iTcZB5hS
         28CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477656; x=1792082456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVgGWa7vQ+w9ty39UYmv4KKUyLnAT3ReRFp2PoOTaIw=;
        b=22KArQ/hCSQIawsnS3JqqVmLgas2PHfIAGbmEL9lIElNq85IBFPYNXWMMUUKZlXrXo
         LZJZmqHZOfDjcTMlok39zPmT7ys5Ix30I78KqAC4hqGtJm64/N72966+yp5xSDYe4xAL
         pQ6A1xoYKIgIL9+UtnWRU58oEFEzTHordnWYA9JoTIk1UOLS9sRb4XI24lkLjiMrL92y
         jZnchzHekAeKl4LwELFjSfF+knHTkuy7UlbxEc7l4VAo05lnruvG2ielPXg4ksxPFegd
         6KABvdJ9bCju7ZcAazfB4a8zxn9kF5Eph9A3Lg/Ok594hbmZB+xgMW1D1r76YFOCkBg/
         NRUw==
X-Forwarded-Encrypted: i=1; AKwUvByMafYq2IAcLONribVzRcbZsjLt17I63jT+fXEydmyyWLD3YQlvlE8/S67RPHaNkLk25ZpuaT7DJrYWKCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nZP6zy10yA9OQ4gJVmUtWyQ0XYfRE/5P/BDuoJvJP1GYBb1/Xw
	cQBGUgvokf5JfllpdAjWj7WvVSXRss0TE/LUWY5N0lH7EiB14ddPY42T
X-Gm-Gg: AYBFou06tOjaNDb0wD0BmiSjXmQmpbhk/DePGRJMfTW9oOm7BvJP+l37AJKVvDdnRNf
	6ix5AXeWr5y3iI3SJHzdc94xdhdHeOATmRTnFCTXdaAfC6GJvhkQO8FarzFxoiws+5aV63geYZ/
	24xjKbC26CG+IqGYbXSMzcPqq31EclwTG87oDIO0Gcimen5rPeRim5VIxzxlJyFdybp/NQ+1MKw
	4+KOLdWYxDqrOhQwqdRyAErOikP/dSWnbjDSi8aGQDPHfPboh1Ql+aoNOkHEPG5s0WzERH0sW4L
	u3Ko1/zdmAA0MPgylAABc5kDvJPJhQSYyzhNgODAJdRDL82LaR3oRS75NV1RIXCX1KasI6SpuIZ
	KuENrlkIUd35y9/ZHQhG97S5KrNL0UZaQ4tIGy+2hBl+h/7jQSl1YfMQsqBd8KLEFo/wS61qH7v
	zawLvs98XdlxGm7eMO4RjKYQBYJIp/iXYsJqpg3o71HBPVHUnC2gkzsZQny/cCBTxIVk9tlw8Ie
	aePCAp42XKV
X-Received: by 2002:a05:6820:201c:b0:6e0:39ad:4c75 with SMTP id 006d021491bc7-6e7a65d548dmr5573097eaf.15.1791477656508;
        Thu, 08 Oct 2026 09:40:56 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:56 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] modpost: fix handling of short reads in read_text_file()
Date: Thu,  8 Oct 2026 11:40:32 -0500
Message-Id: <20261008164035.3668885-6-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-7-lzsx618@gmail.com

 scripts/mod/modpost.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8..1772068dc6 100644
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

