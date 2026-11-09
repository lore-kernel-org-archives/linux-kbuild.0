Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258989;
	b=AMcN897oNLYq4+7SKpbIuNsFTdQTkiKdCLYp3jD0Z6DSPwUaW1yFbh5aMqhuL+Si7vQa
	 LmTK41L/3KlYZcmiqycVToVm7edRU7ix5tsZjnfXx+oJfJJdCrN78t7ESzVsCaj4A6V3L
	 uXKbwxXNOC5EQIWh5ULdNi1qTIYDjWI1HTXxmwF8DotWA1LPa9cj1PfpDj8u2inhQvdl/
	 GOXiZqLCktecAR8uD09wDNXxH6QFqzXRLTToleBMHH9AcaPi32CQE94T8K6qCsfq4GWIn
	 ojaLolAG6ULE3NVog6GlejHXJ8WqUe54y12lQOCaDvn4u4cbXJcduhg42b9vjcDTjgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
	b=KJHrdGYHPAPK8Q1lqeqp2LzqSTXLvEosPbZdB7fjWSBlHwZ1+NLcWK4629D9+kou08+w
	 Smm5F0oBFEetDf1UG8nDpcBdQKGdq6NSiwEHz0BFiXDWm+bcgOObWupcM8yL7+vD0+2dl
	 foIvG7lkC4XZvO5ENF7FVocU6X+yX3snoZ2q8gamhVCAeiH1Qn0Mk3LgBhy2w7ElAdUJq
	 R8YhdM09ffOCFE58e3qlyKPj4+ysqgengEUrAKDfEv8lGPE3fABEcBSqSgZD9MlYBVecX
	 wugmL66V+gbIpl8pVASHjD8kOplzRon1Y9vtR6dBdH6L1QYv04WLskuBaNuxyTBeBAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgmtA6b2;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951D0606A321
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Nov 2026 21:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 951D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgmtA6b2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so14522475e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 13:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794258988; x=1794863788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
        b=MgmtA6b2fe2WIcS70GTp+kgCwjUwkfW2fyiPRqoacbm1QAOB12xEdROeA42cB2H5sT
         73eCYA/Fa4go87r+TbcL/qlITF7hJSdH5dOjFBeBYUAxOSu0VPbKDrRzZfnFzOeS2XXo
         o2Uh6ZQM+SEfnwEYWyFlivd3D6zUak+h+aTUsePbAHVVyHIB4jpCGfbMbwf7OxyayXzk
         0K79nXEozl4JrV5y1QAh2vgzvVEvzu90WaVJaHEGQvfqXaUAwtWkAd6ztm7VOobzlBmL
         3+zT4c4y/hktKpwsCM+zI50yWWxNBSPG73fGdKw5aQ3Als/DryewE89974Ftv+oDDBK1
         tdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258988; x=1794863788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
        b=RNXn7HD4q/6w2QcrUNMBvjrciEHmFfji8+YzYIRclfr6cljU4D6BPgZcRwtm+GZkIv
         ezU7NAa9hWX08ST3otVyQWY4JJLVAQyOb1lknu4V2nBPZ36FDqCiU50ucwemAOn9Izf1
         S8bZj8Ql+K+UKCNcpq5zmfExcgXrhuchHLiKLTpHSiq1eWyxTHmYh8AMLbRSsQAj+ncC
         j2Hkd8YFFcYE8Je+gKEWld6aB07AO8dx6FOwokr1LLY31W5zDCcjXwKdoUCr5WTa0lPz
         ymqPoYOlD1fi6L8N/XJSEGEPBlzYOfrCQD+K/fd2vNY0yoWDZ11igXaHz+srLGNmf9je
         XDgQ==
X-Gm-Message-State: APuU4Z8uWLK/NEjaogEJNwtCID3Hy4du2iO+KycQwEKhq5yMzxpKqFT2
	WvTwRwz3gG+XLIxSf63I3lvb39TEXqae4Bi92l7BJ1ybj7p9sBJd1Zb0DRI2mosM
X-Gm-Gg: AYBFou31VPoivuBTMn5YpkBLurVNRXkmkDdtvX2ZNkjqQOuptvfX/vKznrPxh8OyHuX
	FQ/JkrddK/10Jx+bmzdRF1Tao1WyFHPsZrkbfPmUuPhL2Fhd/ZIXx3ODK4MNxawdhdypIpea10u
	3Tau23SvQ7yH4VzVQwpgFsdCWcBWxA9qveCixmqyiRf7oc72GnpdKM0S1o+PKy6HOnvy1FGGR3P
	eibdmTPiX8nqqbW2Zfpl+bMlRrKD9C3R+vui+t4owEtOUz4s/pMEFgQsootLSTQdwVtfbwjjP8F
	GS54xY8NTrw99SpSQLazYBjksHoDWMhEMvBuMpFYPX7akLgyrewFhSvy/85Fs31qtRrEIuMjgqh
	lCj3a/Wlp82v38rLQyirzUCPS2Q43/5yo9HuaM8UrtA2FfBiI7MPJmAH9zLRrvPLnzyqUZRmNFr
	8orCV15MKo8JUmTpTms3U7tKjZ0nT53HDrlaiBsGZ1rU9RxM4vewQFgwVOibvjeSB6yM1jUaTK0
	GN6XjJ6idt1iOo28qBI4HGVrouwaG1xo+GvLouChyGIL1cBHDqqsCZKz9Y41lz8y5Y5Tp4Qy3Do
	faJx6H/RZcbyIKnTMoheajQ3PvSTXmlfEwtN9DHFWEnfJtldris1X8dBo+3g9E1E+i7zhB80uCi
	8S0u2nEurmaips1/74wQ1a0IohtmJKyAgeOBqEKYY/BvG
X-Received: by 2002:a05:600c:6291:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0234ead8mr7663955e9.22.1794258987873;
        Mon, 09 Nov 2026 13:16:27 -0800 (PST)
Received: from PC-DE-MARCUS (host-149-154-244-77.dynamic.voo.be. [149.154.244.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm17550795e9.4.2026.11.09.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:16:27 -0800 (PST)
From: Marcus <baronmarcus2005@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] run-clang-tools: Resolve the compilation database before changing directory
Date: Mon,  9 Nov 2026 22:16:18 +0100
Message-ID: <20261109211618.1496-1-baronmarcus2005@gmail.com>
X-Mailer: git-send-email 2.51.2.windows.1
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script reads the compilation database relative to its working
directory, but passes the same path to clang-tidy after switching to each
entry's directory. When the database is outside the build directory, a
relative path can therefore point to a nonexistent location. clang-tidy
then runs without the recorded compilation flags or finds an unrelated
database in a parent directory.

For example, invoking the script with database/compile_commands.json from
the parent of database/ and build/ fails to load the database when its
entries use build/ as their directory.

After reading the JSON file, resolve its containing directory to an
absolute path for clang-tidy's -p option. This preserves the caller's path
resolution when the subprocess changes directory.

The issue, fix, and reproducer were developed with OpenAI Codex assistance.
Verified with Python 3.13 and clang-tidy 23.1.4 using a C file requiring a
definition from the database, with relative and absolute database paths
outside the build directory and a database in the working directory.

Fixes: 6ad7cbc01527 ("Makefile: Add clang-tidy and static analyzer support to makefile")
Signed-off-by: Marcus <baronmarcus2005@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 79d58b34..cc19f8bb 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -86,6 +86,8 @@ def main():
     with open(args.path) as f:
         datastore = json.load(f)
 
+    args.path = os.path.dirname(os.path.abspath(args.path))
+
     lock = multiprocessing.Lock()
     try:
         with multiprocessing.Pool(initializer=init, initargs=(lock, args)) as pool:

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.2.windows.1

