Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C3332637
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2026 20:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086119; cv=none; b=a53St/ldP5mjMDlMvssNR8E3oRTRZEgFpPg32iuOQ7wcW0JScmMkl383yfwFQG28CYJdljzkfBhY3ZP+/hO/7nuQdxJ4+pUygDCKE4f89UX8gbwCxPFuB5ujw1UYLarijGgt/2ZlGtPt7hh78hwaY8yptbPbGchk/4FH1Jhly+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086119; c=relaxed/simple;
	bh=kVN3d8qIv10jFijt/POszNowLILH9M3irsne6VJx1Io=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cDDuveuO/8tLrrWHw+4de9IXVDPX2RRJAP39kglo4R+OwgGlOuZLnUcuGKlgCiXZPV+LIly866OmxC/CqtVKw8Z8N3wJqyzZ3rtqhBxGwyKbnKQ1pxRjo7w47Vy+L2nxE4xm7+gOn9gPkm7Wzp9wVKvvcY2pG/qJgATcOSlitSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKtrZbik; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKtrZbik"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-836cbcd0a48so5694227b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2026 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787086117; x=1787690917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9hfSrWZILtZj0hw0NR5UTof9FBjiQaqwexuFtwhTi/A=;
        b=MKtrZbikDzK2u6Z3h6YKk2H8aqk/ws0jHjnJ4MylDrmVN0WtspQbNv4MQe9D6YJVWz
         Mfdr6iefsBJb6ElUZSbNFuFfm3MRofRmamI5xBPGmiOKgl97lwZn5aybWnV+0CY+Ua+6
         jR42alizIKwH0rzLILwPFkEPaoRXvG491yn3oNtbT8DY/qpkwNdLw5CSwUeC2DRA9iOI
         TFhCQ/+8mi6TfYF5OkVv2m7pc93BfPGlmNZdbjZltRPiu/Ql+875IWdcnJbHVgG+6rF4
         JDj+3mrzV1uxDwjlSu3rDWmKVYVHmtifqeFRfdUnxs2ns2o3CM/RyuDQJAAejFMzxRtL
         IlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787086117; x=1787690917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9hfSrWZILtZj0hw0NR5UTof9FBjiQaqwexuFtwhTi/A=;
        b=SxOJBUJ7+Hx2uMblX2KbJlyTmrpdtu+VXW9EKxf3TgzDcfyXwSuT3KB4DfqL4UUYPp
         NEacXhJaISe6wwDUxQvxmEsl4b2xALg+8xx2dWAYIr3RMaM54uGYyZVc51JzP2soO7J4
         K2415/KmVkzzRXJ9mFe1H7giKf1NBjHQZ6YXTIOeHRqElhB1e4gkx3X+9AUqhxrWiBX1
         HpIV2DVjFjvhB3cfRSMVdMDQWz2cr2hJ6CMbouT1vgn10A/Nk7VFmIOk21hYPQyBcb+a
         gMcAhWYvz9SgjM703YgK7qntxWqnXFnweAf0RV/7sMV5Ux0fTs4OkFZdlQa/G5TQCDK6
         hGhg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6CMCvJmXYzr7Q1PoW0sw35QikSRC2Zg+TNssD/6Xzo8rByllIhXIeqxl0B/pmJY/fQCeoFmkui9n4Ep0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIu5LtQaHxYdgt0R23E5+9DcFfi8pWbZrhej2jaxq6eL4H5rz
	e5jgeiXfYltL7IVskkv7dfFC/CorFQZZ2RAca1OJuouwoOVrlPTnhjYZAaQBZ79PTEs=
X-Gm-Gg: AR+sD11hUB53y0UBkRf1OqGEFuguocsQfPnEU1T9LJVjh6C8UEtY676IvBDnRMJA2jE
	oRyYcQP6aMq7AKi/O1EQ6XPwIiNw6heC/W2XS6x3FZ3TiiqIwl6YKrZSBlz8fQQpBpwsHr7o2yI
	qeIBVH37kyGoxfOMKKz83CVboO4O0+9rDJLfYDjMCcNwrLY/wtc9Q63s5k25/m1P/VkxjnZjJm1
	9MVXlLv0ZUMne/T1wr/6C5dwR3TtV9EI/SIrdA3UhP6gZVR/SKsM2fiso7xpHr02CtGLPe7wfQQ
	1iW7G0kQhmaTcD702nsF0PAbAz0RWLebn8z98eNLI9P5Cd61gK9aG3SK2/cgyN75V2qVdroTXxx
	JnCCkbhs4FpEUvVQVWz0j0NRagGNMLUQHEtPOqVDYvPXez2IN5YaiCZg8uVS0hvS9ebB5Zm38VN
	k+PSdEQHgiV01fn+6MskVu2cWGubireKb7Xv+Ua8VKUhdI2dkYHJEJucV5pxdP7JMOkSIv
X-Received: by 2002:a05:690c:e3ef:b0:81e:5b65:c4be with SMTP id 00721157ae682-844dcf4d4a9mr835777b3.2.1787086117498;
        Tue, 18 Aug 2026 13:48:37 -0700 (PDT)
Received: from Gentoo ([151.240.205.157])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8421ef77f60sm16503047b3.34.2026.08.18.13.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 13:48:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	unixbhaskar@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] scripts/mkcompile_h: Update LINUX_COMPILE_HOST command substitution syntax
Date: Wed, 19 Aug 2026 02:13:51 +0530
Message-ID: <20260818204804.2985008-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The assignment of LINUX_COMPILE_HOST uses the classic backtick style
for its command substitution but the rest of the script uses the more
common '$()'. Update LINUX_COMPILE_HOST to match for consistency.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1:
 Nathan suggested explicit statement should be given as commit log. Hence,the
 changes incorporated.
 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 2596f78e52ef..bf0d5669d9bc 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -11,7 +11,7 @@ else
 	LINUX_COMPILE_BY=$KBUILD_BUILD_USER
 fi
 if test -z "$KBUILD_BUILD_HOST"; then
-	LINUX_COMPILE_HOST=`uname -n`
+	LINUX_COMPILE_HOST=$(uname -n)
 else
 	LINUX_COMPILE_HOST=$KBUILD_BUILD_HOST
 fi
--
2.54.0

