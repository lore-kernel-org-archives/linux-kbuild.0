Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A42377A86
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Aug 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909312; cv=none; b=nGYko3PuiCgWQoKYMEXw5CccOTAFrROzOaln/Dn56vjR7LtEjJTPLDhsENXo2W45LPLvd62b3slVOViUYpJBceBMC2Mjo51fwXZeRaJ5aNRsseHwWLJCfSgD71QM8xBuA5fHxC8/2o2e2MNh71odUWthHkUyDmjoN5C/3cPLsps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909312; c=relaxed/simple;
	bh=hNu5OzkiiKB1hod0eLP3Mcrxrl4RJaAjWg0Akk7RKOs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=T01OcQw2hcGWeslHH5enG8PDHVqQm4ghPbkuo5rqVzPJyo9Dbdvv4iCNCaOUw/M0uwAUN6JjgxHyFvX5n44gI6zEKS2E9lyct11cB7lwziMECfbvaDOJZYHMsPFot0VoXUrAz6ogM6eJF5NyYKjFU9i8YRG/u4AGW5CLWj3VEoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctk5dKbK; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctk5dKbK"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e65e18969so53477785a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Aug 2026 22:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785909310; x=1786514110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdkA4cKJBsXoZIn8gr/e/FUgv7zUR1X9l5opTMXg4NQ=;
        b=ctk5dKbKoTkNGD6xFvdINrLIcxTXv58mjUigXZ2elBPj631BWOXthHUbPwFClpcZAS
         rXzTUjvjYUEWfum1WHiM2Emo4BvnWhx/9AfWk9XJYviQ5LyPHP4eqOOOyM0fXoi9HF7T
         f50c6b0vygRVebR1ewJkFEl81VjCy8umfKk4gwF4LOF3Cd4E1mnfgEWjjX3Z7RoRIFqS
         TlcHGN3l27pQFLtdsqAJHgxucbY4slgVavfRp+pfn07OYcfhVK6xaNFqotdCTcQutbSW
         w8E6bLd1oJ8mvHGgJYnZtePnc8EN7a4vr2pZEgiTD8qw/tuNQR3YCGSIlcyOkpAcJWtL
         smTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909310; x=1786514110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jdkA4cKJBsXoZIn8gr/e/FUgv7zUR1X9l5opTMXg4NQ=;
        b=ncwxmHazYMzxwxM/OduhrmbhT1qv4LIFa13mXZ5AbaZ3d9gHSDQVshq0hNJpfHHppi
         QJ4M1ie+BCprLdI4suTKiKBWYhHRUA72lvdbV3bvw5Gwkq5w81C4GqfVCq0FFDxc77B1
         CbtkFZaoYEa2XrifgicZoQIWmu0sWfWkGEoZ/mpwNnfwpeOe4MQWYCGZ4eFCsLXQHGf5
         lgWYyQrNy7N0rZnWwarT/hsCbiHkzvLPF6/o0M7RIEw59j97yKnnXFswzgPX1VyBzRq7
         S+qN61oS20Gzf7rJC7+U/2kukDAgRInNKqmWp83tgvFp4k8OY7UH72I34CQPp8C495f8
         ZXnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrORnOd0US/Bcs71QqDcAlOmuI37BVQfjveqv0xUKqaXorjuFawP7DgNoXpOvn4fb34X7iO5FCxd3sbzrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydDyTCqp5AmvHUjxizc2vUX5aQEb7UyI+4psp191pw90yO48lf
	tyeOqDvELLn/r+pbfpCV1cQXcO09olk3Djc//japApeQLBWHckKl08YqfYvSyQ==
X-Gm-Gg: AR+sD10Y0rbQSPernDqFgubfVhgCaAuxhdozQWqMbgn6NLzMKaWDf98eB2L0UISLToS
	0w54mZ/AXWV374F2JfOoqcihyakHrO5gDFjEmbfYuEX2BoK3Y1yfvi2ZU41YMu7yZ9JsGHnaDKu
	LmhLXCKUqVmELjlOACYYNDtuTEFEDc+k05v5JjEU2xqyiJrF5t84y/pgk9XQ3IywqMTuTJmirkp
	A538b3py1Ir1EiYnFnEi9HvPGaWhNR4kTUUYqt3UC3WguO9ll1l3bKKLq0Qy4BO8lMB0ZvVsjPi
	lSfnBvYqnHJY/qcWe/1upLyMNfRsVSTIkbKrHYRm6wRNGRL0/GxvvqIRJo3dygwUdvId5L59P2k
	H2NKUZEpL/xM09Ql/BhriLScQw1dNv63W4cVj5WV93FqaMo/77USUba20ma7xcS+iHk70lyrhgI
	z86/fAkUHHK86fXD8MHxAjo+/bh3XAdbojeawlQxHef4+f6gqIixEf0x7fFnQtYlDaBTHhsMuDP
	EH565MwLP5NvBHRLo7fb4Wtv32wQH0=
X-Received: by 2002:a05:620a:8aca:b0:932:db03:4da3 with SMTP id af79cd13be357-9363192efebmr784775785a.19.1785909309977;
        Tue, 04 Aug 2026 22:55:09 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a566d28sm85981685a.32.2026.08.04.22.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:55:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Gang Yan <yangang@kylinos.cn>,
	David Disseldorp <ddiss@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org (open list:KERNEL BUILD + files below scripts/ (unless mai...),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] kbuild: let the environment set HOSTPKG_CONFIG
Date: Wed,  5 Aug 2026 01:54:35 -0400
Message-ID: <20260805055438.3482019-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HOSTPKG_CONFIG was added so that "tooling that builds the kernel" could
choose which pkg-config the host tools ask about their dependencies, but
it is assigned with '=', so only a make command line assignment takes
effect. Exporting it does nothing, silently.

That is surprising, because the other inputs to host program builds do
honour the environment: HOSTCFLAGS, HOSTCXXFLAGS, HOSTLDFLAGS and
HOSTLDLIBS are all read from it and documented in kbuild.rst as such.

It also matters. A cross development environment sets
PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_PATH so that pkg-config answers
for the target rather than the build machine. Those settings are correct
for everything that will run on the target and wrong for a program that
has to run on the build machine. objtool asks pkg-config where libelf is,
gets the target's include directory, and compiles a host tool against
the target's C library headers. Because the directory arrives as -I it
is not treated as a system header directory, -Wno-system-headers no
longer covers it, and the build stops on warnings that would otherwise
be suppressed:

  usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined [-Werror]
  tools/include/linux/compiler.h:123: note: previous definition
  usr/include/stdio.h:449: error: redundant redeclaration of 'fscanf'

An environment that knows it is cross building can then say

  export HOSTPKG_CONFIG="env -u PKG_CONFIG_SYSROOT_DIR \
                             -u PKG_CONFIG_PATH pkg-config"

once, in the shell it hands to the user, instead of every make command
line growing an override. Build systems that already pass it on the
command line are unaffected.

Assisted-by: Codex:claude-opus-5
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 Documentation/kbuild/kbuild.rst | 5 +++++
 Makefile                        | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 5a9013bacfb7..6d7de86764be 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -110,6 +110,11 @@ HOSTLDLIBS
 ----------
 Additional libraries to link against when building host programs.
 
+HOSTPKG_CONFIG
+--------------
+The pkg-config to use when building host programs. Set this when cross
+building, where the default would otherwise answer for the target.
+
 .. _userkbuildflags:
 
 USERCFLAGS
diff --git a/Makefile b/Makefile
index 902f3f3d54b7..ba64518d5309 100644
--- a/Makefile
+++ b/Makefile
@@ -461,7 +461,7 @@ HOSTCC	= gcc
 HOSTCXX	= g++
 endif
 HOSTRUSTC = rustc
-HOSTPKG_CONFIG	= pkg-config
+HOSTPKG_CONFIG	?= pkg-config
 
 # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
 # has a logic to call it
-- 
2.51.0

