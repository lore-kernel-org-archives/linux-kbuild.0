Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE51463B87
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Sep 2026 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777488; cv=none; b=jQRhJwbc5EyeumliD0WWqhr9oND4+I1WHWg9ql+NzOHc1asowvUNSx17K1Wm70aRoBWfPhkHHgnJ+lS5iMkiYzJnrHXNrULOMwiBfM4MgPleqMRh3wFel1WoDuo8pUseZWO4yQPoezFV58VnbWNPlrJgVNvWE+ihyvV96MebasE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777488; c=relaxed/simple;
	bh=EXwlhkDOlgB8hEwY0nwbSEzsp6JcpizZji2VCQUb/6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=doHzIU+pEY1N/EP4eIdbETNBtz75Fuigtx0A8XZN0k/KwfawHx6oJLrsFyzbydtc+EJaAFJqxDcQ8Oy8kjQG9u8GZ8BMBFqfvgT2o3Lqj5GuXTCqWcetWar8jrkuhSMKUYHipIUDK5C63hcjtrRUlkzkJT3Nd2rhYJczPsXSEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWUi49/S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWUi49/S"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so48661965e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Sep 2026 03:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777485; x=1789382285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVAzxcdWiFmNG9B2ynD1XwXk5KOxa+JBkIusJfeUZEU=;
        b=UWUi49/SAEX49+5UoKqFSgY31G2KXcWF+XowkcHjnL6eDqBFoWbomTaUrYwT0JOQMd
         5cxjjVoOF49A6F1vIdWpq+EXTuQv6XcvlLthdfGaTQUzxL7Vkkzn7UNfs5gG+zVF85pT
         p4FjJL9fLFY/sBu1XfhKkYV8o5wAeYXeOBerEWZuHUmvrscekMWeLAt/oXFXRltZyuOZ
         WhoXelUr68rXmkSonAm21WumfhgCMahLNy13b+hBuiiaKCNBArppZE0oU5jBOSZEdAa3
         iGYVPutuiCaxHrZbkaikmEChJPvNF0Kl0VJYXld+RKSzynsVfTGa+ccUh0LzycVx7NZC
         yQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777485; x=1789382285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVAzxcdWiFmNG9B2ynD1XwXk5KOxa+JBkIusJfeUZEU=;
        b=NzshhPBxGbrUrWM5etOgoKrkLb/xME/+4EywK2G/6B6o4llo2br01oaOVdf043AQNo
         gNMi632Z7V1mvfd+LF7Qy+R2xHhf1JH0mZGAebN6RLMJ4/ITHAuHVe40WmXRHxtTzFi9
         FOck5GXscNiBsq4xwdAj5ZXQtpjKzPvVviQaEFvrGbr9wHGX662ER1IEHTCCRJ7sFsl3
         XuPdfkUmEDwazG6ShZFeaBnWDVt+o5gnarP3kG6dUG0fKKxKLS9HKGdVdQN0+Mh7ABia
         7X46fS5MKhtrydX79cOuFy+iYW5vKCRphnJ0iqSOCofsuMF+dKaY87o1kC2fY5ZsxdIO
         SORA==
X-Forwarded-Encrypted: i=1; AKwUvBxLbAbKzHdbU7W9VfpIt9pb/POw/MkVUftvBJQbDaLiDxXX6WPFOhTH5tWELeynvZ6NiPXtHkB26f1cq4k=@vger.kernel.org
X-Gm-Message-State: AFuF++nyz+d72RH7BuVroRFIMYItPhEZsT0jWhNSK6OdW8WAEhuICRSM
	v8mXFraQxUcLVddl80Zzp8fmiogbNbRu278Sx5Kc8w9VvUP6FClcybDvuaOo3x9Fo1U=
X-Gm-Gg: AYBFou2++ghlC3zRW25cONIoFf+Rk8oXkhk0rTwus1Kpm9aIu8wnY6vJ6j6et6X+725
	T9usSLHQIKXDxGUc8qIELG8Q4FFaCtRwYxEb/hvHmZvW5opEEZ9a3wMTFLsAyhyha5RYJxYyGmK
	qR1EQA4pvMcG0qJYPrmk6nhLNp3KdRg3AludCRkpUUaoL/5webPfRGare2FlzrHBWXrIhRt25HO
	IettQOONabjFNDJfex7l/FqgSq0HexosPUde+F1JySShy6FoIg1CFtJYC/GV/4rHfT+RnNxtl6L
	ioLtD7p4lR51EmeMAPSeGztAseX/mqrNLWiRBuMlm5oZwa6AezdsFptS3R19GDeWvXOOYuwX0me
	A6YJC/hKYK61ig1Y4JxvsrNxobWmccDsVAScPqznVMy9NaLrdo6qgKIzF6xo3gLl5QtKETya62C
	lrhzTVP++5wdaJuSHmbuDaSbmYFXMIFFrzNeDPiwk8+hdxtFGUkVBPP+7QSWAi0bqNGkdlUzrTg
	FF55efJsxxZ+ELQOqWmGquS+QFeNfYMC94DD5wTw5o/9g1pi4gAKwxqZXrv/g==
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr249448785e9.5.1788777485104;
        Mon, 07 Sep 2026 03:38:05 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm311944285e9.3.2026.09.07.03.38.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 03:38:03 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Marcovitch <arielmarcovitch@gmail.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] checkkconfigsymbols: resolve revisions before resetting the tree
Date: Mon,  7 Sep 2026 13:37:39 +0300
Message-ID: <20260907103739.23212-3-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit comparison resets the current branch to commit_a before
resolving commit_b. If the second revision is HEAD or the current branch
name, it then resolves to the first revision. For example, --diff
HEAD^..HEAD compares the parent with itself and silently misses newly
undefined symbols. The same problem affects --commit with the current
branch name.

Resolve and verify both revisions as commits before the first reset.
This keeps their meaning stable throughout the comparison and rejects
invalid endpoints before changing the working tree.

Keep lookup diagnostics separate from the resolved hashes. Use the
resolved range for --find too, since resetting also updates ORIG_HEAD.

Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")
Link: https://lore.kernel.org/20210901145212.478066-1-arielmarcovitch@gmail.com/
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

Changes in v2, addressing Julian Braha's review:
- Submit this fix independently of the unrelated Kconfig input fix.
- No code changes from v1.
- Include the original Git-awareness author and contributors to the
  previous HEAD-reference fix in Cc.

v1: https://lore.kernel.org/all/20260905123237.40670-2-hexvalid@gmail.com/

An AI coding assistant found the issue, prepared the fix and changelog,
and ran the original verification. The same assistant prepared this
standalone v2 submission.

Validation:
- The code is unchanged from v1, which passed 15 actual-CLI cases in
  disposable Git repositories, including HEAD-relative ranges, branch
  names, hashes, tags, annotated tags, ambiguous names, --commit,
  --find, ORIG_HEAD and invalid or non-commit endpoints.
- Those checks verified HEAD, current branch, index and tracked file
  contents after every invocation.
- The script in mainline df2908090cda368b01ff43709f51890076c56157 still
  matches the original pre-fix file; this patch applies independently.

 scripts/checkkconfigsymbols.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 36c920e71..e0a1a631b 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -150,6 +150,13 @@ def print_undefined_symbols():
             undefined_a = {}
             undefined_b = {}
 
+        commit_a = execute(["git", "rev-parse", "--verify", commit_a + "^{commit}"],
+                           stderr=None).strip()
+        commit_b = execute(["git", "rev-parse", "--verify", commit_b + "^{commit}"],
+                           stderr=None).strip()
+        if args.diff:
+            args.diff = commit_a + ".." + commit_b
+
         # get undefined items before the commit
         reset(commit_a)
         undefined_a, _ = check_symbols(args.ignore)
@@ -223,10 +230,10 @@ def red(string):
     return "\033[31m%s\033[0m" % string if COLOR else string
 
 
-def execute(cmd):
+def execute(cmd, stderr=subprocess.STDOUT):
     """Execute %cmd and return stdout.  Exit in case of error."""
     try:
-        stdout = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=False)
+        stdout = subprocess.check_output(cmd, stderr=stderr, shell=False)
         stdout = stdout.decode(errors='replace')
     except subprocess.CalledProcessError as fail:
         exit(fail)

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)

